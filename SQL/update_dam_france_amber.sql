-- add basin Vilaine France (mail sent to Andrew)
-- this is run on wgtrutta database

UPDATE sde.amber_h1_catchments_3857
  SET sea_trout=1, 
  last_edited_user='Cedric Briand', 
  last_edited_date='2026-10-22', 
  pres_strout=1, pres_asalmon=1, 
  pres_eueel=1, pres_lamprey=1
WHERE river_name = 'vilaine_3543';




-- dump table from localhost_wgtrutta
see bash wgtrutta.ps1

DROP TABLE IF EXISTS wgtrutta.barriers_import;
CREATE TABLE wgtrutta.barriers_import (
    "Request_Number" text,
    "Requester Organisation" text,
    "Requester Name" text,
    "Existing or New Barrier?" text,
    "New Barrier Lat-Long" text,
    "Barrier Code (GlobalID_1) - existing barriers only" text,
    "Delete or Move Barrier?" text,
    "Unmapped side-channel?" boolean,
    "Barrier height (m)" numeric(10,2),
    "natural_or_artifical_barrier" text,
    "Barrier Type" text,
    "Is it the First Barrier" text,
    "Is barrier passable by Sea Trout (mature)" text,
    "barrier removed/eased (Sea Trout only)" text,
    "Removed/eased date (for Sea Trout only) (mm/dd/yyyy)" date,
    "Is barrier passable by Salmon (mature)" text,
    "barrier removed/eased (Salmon only)" text,
    "Removed/eased date (for Salmon only) (mm/dd/yyyy)" date,
    "Is barrier passable by Eel (glass)" text,
    "barrier removed/eased (Eel only)" text,
    "Removed/eased date (for Eel only) (mm/dd/yyyy)" date,
    "Is barrier passable by Lamprey spp (mature)" text,
    "barrier removed/eased (Lamprey spp (mature) only)" text,
    "Removed/eased date (for Lamprey spp (mature) only) (mm/dd/yyyy)" date,
    "Dam_name" text,
    "Comment" text
);
ALTER TABLE wgtrutta.barriers_import OWNER TO diaspara_admin;


ALTER INDEX sde.a5_ix1 RENAME TO barrier_raw_geom_idx;

SELECT st_srid(geom) FROM dam_france.obstruction_place; --3035
SELECT st_srid(geom)  FROM sde.barriers_raw_05_07_2025_3857; --3857



-- lets do it by type


SELECT distinct "type" FROM sde.barriers_raw_05_07_2025_3857 WHERE country = 'France'
/*
dam 
waterfall
lock
ford
ramp
sluice
other
culvert
weir
*/

SELECT DISTINCT no_name  FROM dam_france.obstruction_place 
  JOIN dam_france.obstruction ON op_id = ob_op_id 
  JOIN nomenclature.obstruction_type ON ob_obstruction_type_no_id = obstruction_type.no_id
/*
Dam
-w
-l
Ford
-sluice
-other
Culvert
Weir
+Rock ramp
+Bridge
*/

-- Notes barriers_spatially_aggregated_3857 :
/*
* id is unique because of the UNIQUE index
* globalid_1 IS UNIQUE because of the UNIQUE INDEX
* The relation between raw and aggregated is set in   
*/
  
-- Notes  sde.barriers_raw_05_07_2025_3857 :
/*
* id is unique because of the UNIQUE INDEX
* 
*/

-- Remove duplicates in France :

  /*
   * In France there are duplicates mostly with osm, these are always different types dam and weir
   * There is a lot of confusion between weir and dam in French so the distinction
   * is kept among specialists. Below I'm finding duplicates but it's not always working.
   * 
   */
  
  WITH dwf AS ( -- dams and weir in France
  SELECT *
        FROM sde.barriers_spatially_aggregated_3857
        WHERE country = 'France'
        AND TYPE IN ('dam', 'weir')  
  ), --26931
  cc AS (
    SELECT
        unnest(ST_ClusterWithin(geom, 50)) AS cluster_geom -- this is a collection of points
    FROM dwf
), 
  cc1 AS ( -- cc1 just extracts the row counts
    SELECT
        row_number() OVER () AS cluster_id,
        cluster_geom
    FROM cc
    WHERE st_numgeometries(cluster_geom) >1)
SELECT
    count(dwf.id) OVER (PARTITION BY cc1.cluster_id) AS number,
    cc1.cluster_id,
    dwf.id
FROM cc1
JOIN dwf 
  ON ST_Within(dwf.geom, cc1.cluster_geom)
ORDER BY number DESC,cc1.cluster_id, dwf.id;


DROP VIEW IF EXISTS dam_france.view_ob_recent;
CREATE VIEW dam_france.view_ob_recent AS (
SELECT
        op_id,
        op_placename,
        op_id_original,    
        no_name AS dam_type,
        obstruction.*,
        geom
      FROM dam_france.obstruction_place op
      JOIN dam_france.obstruction ON op_id = ob_op_id 
      JOIN nomenclature.obstruction_type ON ob_obstruction_type_no_id = obstruction_type.no_id
      WHERE ob_starting_date < '2005-01-01'
      AND ob_ending_date >= '2005-01-01');


  
--- (1) JOIN DAMS LESS THAN 100 m AWAY WITH THE SAME TYPE
-- only from amber_atlas -probably ROE was at the origin of amber_atlas
DROP TABLE IF EXISTS temp_matching_france;
CREATE TABLE temp_matching_france AS(
  WITH sss AS (
    WITH op AS(
    SELECT
        op_id,
        op_placename,
        op_id_original,    
        dam_type,
        geom AS op_geom
    FROM dam_france.view_ob_recent) -- there might be several dam structures over time
    SELECT op.*,
           br.*,
           ST_Distance(st_transform(op.op_geom, 3857), br.geom) AS dist
    FROM op
    LEFT JOIN LATERAL (
        SELECT *
        FROM sde.barriers_spatially_aggregated_3857 br
        WHERE ST_DWithin(
            ST_Transform(op.op_geom, 3857),
            br.geom,
            100   
        )
        AND initcap(br.type) = dam_type
        AND data_origin = 'amber_atlas'
        ORDER BY st_transform(op.op_geom, 3857) <-> br.geom
        LIMIT 1
    ) br ON TRUE
  )
  SELECT op_id, op_id_original, id, 1 AS step, dist, geom   
  FROM sss 
  WHERE op_id IS NOT NULL 
  AND id IS NOT NULL  
); -- 21322

SELECT count(*) FROM sde.barriers_spatially_aggregated_3857 WHERE country = 'France' -- 39244
SELECT count(*), type 
FROM sde.barriers_spatially_aggregated_3857
WHERE country = 'France' 
GROUP BY type;
/*
22267 weir
4664  dam
2054  culvert
2758 high gradient
3114  lock
2505  other
2539  ramp
1151 sluice
611 waterfall
220 ford
2 bridge

1     NULL
1     floodgate
*/
SELECT 250+3114+2857+2775+121+705 = 9822 other dams
SELECT 30688+2297+5830-34147  -- 4668 not identified


--- (2) JOIN DAMS NOT ALREADY JOINED, all data_origin, allow any types
-- even if not fits with the db....

  
INSERT INTO temp_matching_france (op_id, op_id_original, id, step, dist, geom)
WITH sss AS (
    WITH op AS(
    SELECT
        op_id,
        op_placename,
        op_id_original,    
        dam_type,
        geom AS op_geom
    FROM dam_france.view_ob_recent
      WHERE op_id NOT IN (SELECT op_id FROM temp_matching_france)) -- there might be several dam structures over ti
      SELECT op.*,
           br.*,
           ST_Distance(st_transform(op.op_geom, 3857), br.geom) AS dist
    FROM op
    LEFT JOIN LATERAL (
        SELECT *
        FROM sde.barriers_spatially_aggregated_3857 br
        WHERE ST_DWithin(
            ST_Transform(op.op_geom, 3857),
            br.geom,
            100   
        )
        AND id NOT IN (SELECT id FROM temp_matching_france)
        AND TYPE NOT IN ('high gradient', 'waterfall')        
        ORDER BY st_transform(op.op_geom, 3857) <-> br.geom
        LIMIT 1
    ) br ON TRUE
  ) 
  SELECT op_id, op_id_original, id, 2 AS step, dist, geom     
  FROM sss
 WHERE op_id IS NOT NULL 
  AND id IS NOT NULL; --9475

  
SELECT * FROM  sde.barriers_spatially_aggregated_3857 br
JOIN temp_matching_france tm ON br.id = tm.id
JOIN dam_france.obstruction as ob ON ob.ob_op_id = tm.op_id
LEFT JOIN dam_france.fishway as fi ON fi.fi_ob_id = ob.ob_id
WHERE fi.fi_species_id = 316; -- no values for sea trout
 


-- those dams have a functional pass
DROP SEQUENCE seqtemp;
CREATE  SEQUENCE seqtemp ;
SELECT nextval('seqtemp')

-- this is the missing barriers 
DELETE FROM wgtrutta.barriers_import;
INSERT INTO wgtrutta.barriers_import
("Request_Number",
"Requester Organisation",
"Requester Name",
"Existing or New Barrier?",
"New Barrier Lat-Long",
"Barrier Code (GlobalID_1) - existing barriers only",
"Delete or Move Barrier?", 
"Unmapped side-channel?", 
"Barrier height (m)", 
 "natural_or_artifical_barrier", 
"Barrier Type", 
"Is it the First Barrier",
"Is barrier passable by Sea Trout (mature)",
"barrier removed/eased (Sea Trout only)",
"Removed/eased date (for Sea Trout only) (mm/dd/yyyy)",
"Is barrier passable by Salmon (mature)",
"barrier removed/eased (Salmon only)", 
"Removed/eased date (for Salmon only) (mm/dd/yyyy)",
"Is barrier passable by Eel (glass)",
"barrier removed/eased (Eel only)", 
"Removed/eased date (for Eel only) (mm/dd/yyyy)",
"Is barrier passable by Lamprey spp (mature)", 
"barrier removed/eased (Lamprey spp (mature) only)",
"Removed/eased date (for Lamprey spp (mature) only) (mm/dd/yyyy)",
"Dam_name",
"Comment")
SELECT
nextval('seqtemp') AS "Request_Number",
'Eaux & Vilaine' AS "Requester Organisation",
'Cédric Briand' AS "Requester Name",
'Existing' AS "Existing or New Barrier?",NULL AS "New Barrier Lat-Long",globalid_1 AS "Barrier Code (GlobalID_1) - existing barriers only",NULL AS "Delete or Move Barrier?",NULL AS "Unmapped side-channel?",ob_height AS "Barrier height (m)",
'artificial' AS natural_or_artifical_barrier,CASE WHEN lower(no_name) = 'rock ramp' THEN 'ramp' 
  ELSE lower(no_name) 
  END AS  "Barrier Type",is_first_barrier_strout AS "Is it the First Barrier",1 AS "Is barrier passable by Sea Trout (mature)",0 AS "barrier removed/eased (Sea Trout only)",NULL AS "Removed/eased date (for Sea Trout only) (mm/dd/yyyy)",1 AS "Is barrier passable by Salmon (mature)",NULL AS "barrier removed/eased (Salmon only)",NULL AS "Removed/eased date (for Salmon only) (mm/dd/yyyy)",NULL AS "Is barrier passable by Eel (glass)",NULL AS "barrier removed/eased (Eel only)",NULL AS "Removed/eased date (for Eel only) (mm/dd/yyyy)",NULL AS "Is barrier passable by Lamprey spp (mature)",NULL AS "barrier removed/eased (Lamprey spp (mature) only)",NULL AS "Removed/eased date (for Lamprey spp (mature) only) (mm/dd/yyyy)",
op_placename AS dam_name,
'Barriers that I was able to join spatially that have a functional pass' AS comment
FROM  sde.barriers_spatially_aggregated_3857 br
JOIN temp_matching_france tm ON br.id = tm.id
JOIN dam_france.obstruction_place op ON op.op_id = tm.op_id
JOIN dam_france.obstruction as ob ON ob.ob_op_id = tm.op_id
JOIN nomenclature.obstruction_type ON ob_obstruction_type_no_id = obstruction_type.no_id
LEFT JOIN dam_france.fishway as fi ON fi.fi_ob_id = ob.ob_id
WHERE fi.fi_species_id = 315
AND fi_presence_pass
; --2091

-- insert missing barriers


INSERT INTO wgtrutta.barriers_import
("Request_Number",
"Requester Organisation",
"Requester Name",
"Existing or New Barrier?",
"New Barrier Lat-Long",
"Barrier Code (GlobalID_1) - existing barriers only",
"Delete or Move Barrier?", 
"Unmapped side-channel?", 
"Barrier height (m)", 
 "natural_or_artifical_barrier", 
"Barrier Type", 
"Is it the First Barrier",
"Is barrier passable by Sea Trout (mature)",
"barrier removed/eased (Sea Trout only)",
"Removed/eased date (for Sea Trout only) (mm/dd/yyyy)",
"Is barrier passable by Salmon (mature)",
"barrier removed/eased (Salmon only)", 
"Removed/eased date (for Salmon only) (mm/dd/yyyy)",
"Is barrier passable by Eel (glass)",
"barrier removed/eased (Eel only)", 
"Removed/eased date (for Eel only) (mm/dd/yyyy)",
"Is barrier passable by Lamprey spp (mature)", 
"barrier removed/eased (Lamprey spp (mature) only)",
"Removed/eased date (for Lamprey spp (mature) only) (mm/dd/yyyy)",
"Dam_name",
"Comment")
SELECT
nextval('seqtemp') AS "Request_Number",
'Eaux & Vilaine' AS "Requester Organisation",
'Cédric Briand' AS "Requester Name",
'New' AS "Existing or New Barrier?",
'('||st_y(st_transform(geom, 4326))||','||st_x(st_transform(geom, 4326))||')' AS "New Barrier Lat-Long",
op_id AS "Barrier Code (GlobalID_1) - existing barriers only",
NULL AS "Delete or Move Barrier?",
NULL AS "Unmapped side-channel?",
ob_height AS "Barrier height (m)",
'artificial' AS natural_or_artifical_barrier,
CASE WHEN lower(no_name) = 'rock ramp' THEN 'ramp' 
  ELSE lower(no_name) 
  END AS  "Barrier Type",
NULL AS "Is it the First Barrier",
CASE WHEN fi_presence_pass THEN 1 ELSE 0 END AS "Is barrier passable by Sea Trout (mature)",
0 AS "barrier removed/eased (Sea Trout only)",
NULL AS "Removed/eased date (for Sea Trout only) (mm/dd/yyyy)",
CASE WHEN fi_presence_pass THEN 1 ELSE 0 END AS "Is barrier passable by Salmon (mature)",
0 AS "barrier removed/eased (Salmon only)",
NULL AS "Removed/eased date (for Salmon only) (mm/dd/yyyy)",
NULL AS "Is barrier passable by Eel (glass)",
NULL AS "barrier removed/eased (Eel only)",
NULL AS "Removed/eased date (for Eel only) (mm/dd/yyyy)",
NULL AS "Is barrier passable by Lamprey spp (mature)",
NULL AS "barrier removed/eased (Lamprey spp (mature) only)",
NULL AS "Removed/eased date (for Lamprey spp (mature) only) (mm/dd/yyyy)",
op_placename AS "Dam_name",
'New barriers you can use the uuid coming from my db' AS comment
FROM dam_france.obstruction_place AS op 
JOIN dam_france.obstruction as ob  ON ob_op_id = op_id
JOIN nomenclature.obstruction_type ON ob_obstruction_type_no_id = obstruction_type.no_id
LEFT JOIN dam_france.fishway as fi ON fi.fi_ob_id = ob.ob_id
WHERE fi.fi_species_id = 315 OR fi.fi_species_id IS NULL
AND op_id NOT IN (SELECT op_id FROM temp_matching_france)
AND ob_starting_date < '2005-01-01'
AND ob_ending_date >= '2005-01-01'
AND lower(no_name) NOT IN ('Bridge','Culvert'); --80202






SELECT 
op_id,
fi_presence_pass,
op_id_original,
ob_height,
st_y(st_transform(geom, 4326))||','||st_x(st_transform(geom, 4326)) AS latlon,
lower(no_name) AS dam_type
FROM dam_france.obstruction_place AS op 
JOIN dam_france.obstruction as ob  ON ob_op_id = op_id
JOIN nomenclature.obstruction_type ON ob_obstruction_type_no_id = obstruction_type.no_id
LEFT JOIN dam_france.fishway as fi ON fi.fi_ob_id = ob.ob_id
WHERE fi.fi_species_id = 315 OR fi.fi_species_id IS NULL
AND op_id NOT IN (SELECT op_id FROM temp_matching_france)
AND ob_starting_date < '2005-01-01'
AND ob_ending_date >= '2005-01-01'
AND lower(no_name) NOT IN ('Bridge','Culvert');




last_edited_user => me
original_heights => original_heights || coalesce(original_heights, height_m)

CREATE VIEW wgtrutta.barriers_import_corrected AS
SELECT bi.*, br.geom  FROM wgtrutta.barriers_import bi 
JOIN sde.barriers_spatially_aggregated_3857 br 
ON br.globalid_1 = bi."Barrier Code (GlobalID_1) - existing barriers only"


  
