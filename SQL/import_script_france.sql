-- SCRIPT TO ADD AND CORRECT SOME DAMS IN FRANCE

-- the zip file france_update.zip contains a plain dump of the table sde.barrier_import
-- unzip the file and run the following command to restore the file
-- psql --dbname=postgresql://${env:userlocal}:${env:passlocal}@${env:hostlocal}/wgtrutta -f "france_update.sql"

 SET search_path to sde, public;
 
 ALTER TABLE barriers_import RENAME TO temp_france;
 
 
 
 SELECT count(*) FROM temp_france WHERE "Existing or New Barrier?" = 'Existing'; --2091
 
 -- I would suggest to add the barrier name
 
 ALTER TABLE sde.barriers_spatially_aggregated_3857 ADD COLUMN dam_name TEXT;
 
 -------------------------------------------------------------------------------
 -- updating passability and type
 -------------------------------------------------------------------------------
 
 -- for the first 2091 barriers I have an indication in the national database that there is a functional pass or that it is accessible for salmonids.
 
 -- DELETE FROM sde.barriers_spatially_aggregated_3857 WHERE last_edited_user = 'Cédric Briand';
 
 WITH dam_with_pass AS (
  SELECT * 
  FROM temp_france 
  WHERE "Existing or New Barrier?" = 'Existing'
  )
  UPDATE sde.barriers_spatially_aggregated_3857 bsa
  SET height_m = d."Barrier height (m)",
  passable_t_f = 1, 
  "type" = d."Barrier Type", 
   original_heights = CASE WHEN original_heights = 'NA' THEN d."Barrier height (m)"::text
                     ELSE original_heights || d."Barrier height (m)"::text END,
   last_edited_user = 'Cédric Briand', 
   last_edited_date = CURRENT_DATE, 
   passable_strout = 1,
   passable_asalmon = 1,
   dam_name = "Dam_name"
   FROM dam_with_pass d
   WHERE bsa.globalid_1 = "Barrier Code (GlobalID_1) - existing barriers only"; --1898
   
   
   -----------------------------------------------------------------------------------
    -- Adding missing barriers
   -----------------------------------------------------------------------------------
   
-- The origin of amber_atlas for dam in France was the ROE (french referential for dams) as it was 10-15 ? years ago.
-- I have used amber_atlas to join all dams with the roe within 100 m matchin the types and location
-- As a second step I have used all remaining dams not matched to create the joining.
-- I have seen some existing duplicates but I tried to remove them and I was not very good, sometimes it worked sometimes not, I let it be
-- In the future we should use the ROE as the French reference. There are many many people working with this DB, maintaining it locally, upading it ...
-- But currently, all non matching dams could be added to the reference.
  
 
-- STEP 1 First adding to barriers_raw_05_07_2025_3857, using the long lat format, recreating an ID as there is no autoincement in sequence.
   
CREATE TEMPORARY SEQUENCE seq_ba;
SELECT setval(
    'seq_ba',
    COALESCE((SELECT max(id) FROM sde.barriers_raw_05_07_2025_3857), 0) + 1,
    false
); -- 556611


ALTER TABLE sde.barriers_raw_05_07_2025_3857 ADD COLUMN "dam_name" TEXT;


-- DELETE FROM sde.barriers_raw_05_07_2025_3857 WHERE data_origin = 'french_roe';

INSERT INTO sde.barriers_raw_05_07_2025_3857
(id, 
amber_atlas_guid, 
height_m, 
"type", 
data_origin,
natural_or_artifical_barrier,
country,
geom,
dam_name)
SELECT 
DISTINCT ON ("Barrier Code (GlobalID_1) - existing barriers only") 
nextval('seq_ba') AS id,
NULL AS amber_atlas_guid,
"Barrier height (m)" AS height_m,
"Barrier Type" AS "type",
'french_roe' AS data_origin, -- ROE is the national referential of dams, here I'm adding a new type
'artifical' AS natural_or_artifical_barrier, 
'France' AS country,
ST_Transform(
         ST_SetSRID(
           ST_MakePoint(
             split_part(trim(both '()' from "New Barrier Lat-Long"), ',', 2)::double precision,
             split_part(trim(both '()' from "New Barrier Lat-Long"), ',', 1)::double precision
           ),
           4326
         ),
         3857
       ) AS geom,
"Dam_name" AS dam_name
FROM temp_france 
WHERE "Existing or New Barrier?" = 'New'; --76969


-- STEP 2 Same for barriers_spatially_aggregated_3857.

SELECT setval(
    'seq_ba',
    COALESCE((SELECT max(id) FROM sde.barriers_spatially_aggregated_3857), 0) + 1,
    false
); -- 379150


-- DELETE FROM sde.barriers_spatially_aggregated_3857 WHERE  data_origin = 'french_roe';

INSERT INTO sde.barriers_spatially_aggregated_3857
(  id,
   height_m, 
   "type", 
   data_origin,
   natural_or_artifical_barrier,
   globalid_1,
   created_user,
   created_date,
   last_edited_user,
   last_edited_date,
   passable_strout,
   passable_asalmon,
   dam_name,
   country,
   geom
    )
SELECT 
DISTINCT ON ("Barrier Code (GlobalID_1) - existing barriers only") -- I think I created some duplicates :-(
nextval('seq_ba') AS id,
"Barrier height (m)" AS height_m,
"Barrier Type" AS "type",
 'french_roe' AS data_origin,
 'artifical' AS natural_or_artifical_barrier,   
 '{' || upper("Barrier Code (GlobalID_1) - existing barriers only") || '}'  AS globalid_1, -- I'm trying to convert to a similar format !
 'Cédric Briand' AS  created_user,
 CURRENT_DATE AS created_date,
  'Cédric Briand' AS  last_edited_user,
  CURRENT_DATE AS last_edited_date,
 "Is barrier passable by Sea Trout (mature)"::int AS passable_strout,
 "Is barrier passable by Salmon (mature)"::int AS passable_asalmon,
 "Dam_name" AS dam_name,
  'France' AS country,
  ST_Transform(
         ST_SetSRID(
           ST_MakePoint(
             split_part(trim(both '()' from "New Barrier Lat-Long"), ',', 2)::double precision,
             split_part(trim(both '()' from "New Barrier Lat-Long"), ',', 1)::double precision
           ),
           4326
         ),
         3857
       ) AS geom
FROM temp_france 
WHERE "Existing or New Barrier?" = 'New'; --76969


-- clean up
DROP TABLE IF EXISTS sde.temp_france;






 

