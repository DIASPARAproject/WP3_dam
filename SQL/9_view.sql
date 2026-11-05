
SELECT * 
   FROM dam_de.obstruction_place
   JOIN dam_de.obstruction ON obstruction.ob_op_id = obstruction_place.op_id
   LEFT JOIN nomenclature.obstruction_type ON obstruction_type.no_id=obstruction.ob_obstruction_type_no_id
   LEFT JOIN nomenclature.downstream_mitigation_measure ON downstream_mitigation_measure.no_id= obstruction.ob_mitigation_measure_no_id
   JOIN dam_de.data_provider ON op_dp_id = dp_id




DROP MATERIALIZED VIEW IF EXISTS  dam_de.view_obstruction CASCADE;
CREATE MATERIALIZED VIEW dam_de.view_obstruction AS (
 SELECT 
    op_id, 
    op_placename, 
    op_op_id, 
    op_dp_id,
    op_id_original, 
    op_country,
    geom,
    ob_id, 
    ob_starting_date,
    ob_ending_date,
    ob_op_id, 
    ob_obstruction_type_no_id,
    ob_fishway_type_no_id, 
    ob_mitigation_measure_no_id,
    ob_height,
    ob_height_date,
    ob_downs_water_depth,
    ob_date_last_update, 
    ob_event_change_no_id,
    downstream_mitigation_measure.no_name AS downstream_mitigation_measure_name,
    obstruction_type.no_name
    FROM dam_de.obstruction_place
   JOIN dam_de.obstruction ON obstruction.ob_op_id = obstruction_place.op_id
   LEFT JOIN nomenclature.obstruction_type ON obstruction_type.no_id=obstruction.ob_obstruction_type_no_id
   LEFT JOIN nomenclature.downstream_mitigation_measure ON downstream_mitigation_measure.no_id= obstruction.ob_mitigation_measure_no_id
   JOIN dam_de.data_provider ON op_dp_id = dp_id); --130897
   
   
   
   

   --REINDEX TABLE dam_de.rn;
DROP TABLE IF EXISTS dam_de.join_obstruction_rn;


REINDEX TABLE h_nseasouth.riversegments;
REINDEX TABLE h_baltic22to26.riversegments;

DROP TABLE IF EXITST
CREATE TABLE dam_de.join_obstruction_river as(
     WITH r AS (
     SELECT hyriv_id, st_transform(geom,3035) AS geom FROM h_nseasouth.riversegments
     UNION
     SELECT hyriv_id, st_transform(geom,3035) geom  FROM h_baltic22to26.riversegments
     ),
     d AS (
     SELECT op_id, geom AS geom
     FROM 
     dam_de.obstruction_place),
   projection as ( 
    SELECT r.hyriv_id, 
          d.op_id,                          
          d.geom,
          st_distance(r.geom, d.geom) as distancem,
          1-ST_LineLocatePoint(ST_GeometryN(r.geom,1),ST_ClosestPoint(r.geom,d. geom)) AS position_dam_segment
    FROM r
    JOIN d 
    ON st_dwithin(r.geom, d.geom,300)
    order by hyriv_id, distancem desc)
SELECT distinct on (op_id) op_id, hyriv_id, position_dam_segment, geom from projection
);
create index idx_montepomi_join_obstruction_rn_idsegment ON montepomi.join_obstruction_rn using btree(idsegment); --183msec

SELECT * FROM montepomi.join_obstruction_rn LIMIT 10;

