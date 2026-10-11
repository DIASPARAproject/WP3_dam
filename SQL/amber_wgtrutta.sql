
-- mercure
-- sudo apt install postgresql-14-ogr-fdw


 -- this gives the code to create the fdw
-- where=1%3D1 means where 1=1
-- outFields=*&f all fields
-- ogr_fdw_info -s "ESRIJSON:https://gis.ices.dk/gis/rest/services/DBTrutta/DBTrutta/FeatureServer/0/query?where=1%3D1&outFields=*&f=json" -l ESRIJSON
-- ogr_fdw_info -s "ESRIJSON:https://gis.ices.dk/gis/rest/services/DBTrutta/DBTrutta/FeatureServer/6/query?where=1%3D1&outFields=*&f=json&returnGeometry=false" -l ESRIJSON

/*
0 Obstacles layer
1 River network layer => from Zenodo
2 Catchments  layer > from Zenodo
3 Subcatchments layer > from Zenodo
4 Regions layer > from Zenodo
5 Countries admin levels 2 and 4  layer  > from Zenodo
6 agg_barrier_ids table
7 amber_drn_3857_countries  table  
*/

SELECT name, default_version, installed_version
FROM pg_available_extensions
WHERE name = 'ogr_fdw';

CREATE EXTENSION ogr_fdw;

SELECT ogr_fdw_version(); --OGR_FDW="1.1" GDAL="3.4.0"

DROP SERVER wgtrutta_obstacles;
CREATE SERVER wgtrutta_obstacles
  FOREIGN DATA WRAPPER ogr_fdw
  OPTIONS (
    datasource 'ESRIJSON:https://gis.ices.dk/gis/rest/services/DBTrutta/DBTrutta/FeatureServer/0/query?where=1%3D1&outFields=*&f=json',
    format 'ESRIJSON');

CREATE SCHEMA IF NOT EXISTS wgtrutta;
ALTER SCHEMA wgtrutta OWNER TO diaspara_admin;
-- wgtrutta_obstacles

-----------------wgtrutta.obstacles------------------------------

DROP FOREIGN TABLE wgtrutta.obstacles;
CREATE FOREIGN TABLE wgtrutta.obstacles (
  fid bigint,
  geom Geometry(Point,3857),
  id integer,
  height_m double precision,
  type varchar,
  data_origin varchar,
  passable_t_f integer,
  region_id varchar,
  year integer,
  spatial_cluster varchar,
  riverid double precision,
  n_barriers_aggregated integer,
  original_heights TEXT,
  natural_or_artifical_barrier varchar,
  is_first_barrier_prehistoric integer,
  is_first_barrier_1840 integer,
  is_first_barrier_1945 integer,
  is_first_barrier_1970 integer,
  is_first_barrier_1985 integer,
  is_first_barrier_contemporary integer,
  is_snapped_to_reach integer,
  region_unique_row_id varchar,
  country varchar,
  river_group double precision,
  river_name varchar,
  created_user text,
  last_edited_user text,
  globalid varchar(38),
  created_date text,
  last_edited_date text,
  globalid_1 varchar(38),
  symbology text,
  passable_strout integer,
  passable_asalmon integer,
  passable_eueel integer,
  passable_lamprey integer,
  removed_strout text,
  removed_asalmon text,
  removed_eueel text,
  removed_lamprey text,
  date_removed_strout text,
  date_removed_asalmon text,
  date_removed_eueel text,
  date_removed_lamprey text,
  is_first_barrier_strout integer,
  is_first_barrier_asalmon integer,
  is_first_barrier_eueel integer,
  is_first_barrier_lamprey integer,
  snapped_reach_id varchar(64)
) SERVER wgtrutta_obstacles
OPTIONS (layer 'ESRIJSON');

ALTER FOREIGN TABLE wgtrutta.obstacles OWNER TO diaspara_admin;


SELECT * FROM wgtrutta.obstacles LIMIT 10;
SELECT to_timestamp(NULLIF(o.created_date, '')::bigint / 1000.0)
 FROM wgtrutta.obstacles o LIMIT 10 ;


-- re-run this when you are done with the server.

CREATE MATERIALIZED VIEW wgtrutta.view_obstacles AS
SELECT
    fid,
    geom,
    id,
    height_m,
    "type",
    data_origin,
    passable_t_f,
    region_id,
    "year",
    spatial_cluster,
    riverid,
    n_barriers_aggregated,
    original_heights,
    natural_or_artifical_barrier,
    is_first_barrier_prehistoric,
    is_first_barrier_1840,
    is_first_barrier_1945,
    is_first_barrier_1970,
    is_first_barrier_1985,
    is_first_barrier_contemporary,
    is_snapped_to_reach,
    region_unique_row_id,
    country,
    river_group,
    river_name,
    created_user,
    last_edited_user,
    globalid,
    to_timestamp(NULLIF(created_date, '')::bigint / 1000.0) AS created_date,
    to_timestamp(NULLIF(last_edited_date, '')::bigint / 1000.0) AS last_edited_date,
    globalid_1,
    symbology,
    passable_strout,
    passable_asalmon,
    passable_eueel,
    passable_lamprey,
    removed_strout,
    removed_asalmon,
    removed_eueel,
    removed_lamprey,
    to_timestamp(NULLIF(date_removed_strout, '')::bigint / 1000.0) AS date_removed_strout,
    to_timestamp(NULLIF(date_removed_asalmon, '')::bigint / 1000.0) AS date_removed_asalmon,
    to_timestamp(NULLIF(date_removed_eueel, '')::bigint / 1000.0) AS date_removed_eueel,
    to_timestamp(NULLIF(date_removed_lamprey, '')::bigint / 1000.0) AS date_removed_lamprey,
    is_first_barrier_strout,
    is_first_barrier_asalmon,
    is_first_barrier_eueel,
    is_first_barrier_lamprey,
    snapped_reach_id
FROM  wgtrutta.obstacles o;

ALTER MATERIALIZED VIEW  wgtrutta.view_obstacles OWNER TO diaspara_admin;

---------------------wgtrutta.agg_barrier_ids-------------------------------------------------------
-- wgtrutta river network
-- attention use the zenodo instead to get the latest data 

DROP FOREIGN TABLE IF EXISTS  wgtrutta.agg_barrier_ids;

CREATE FOREIGN TABLE  wgtrutta.agg_barrier_ids (
  fid bigint,
  agg_barrier_id integer,
  region_unique_row_id text
) SERVER wgtrutta_obstacles 
OPTIONS (layer 'ESRIJSON');

ALTER FOREIGN TABLE  wgtrutta.agg_barrier_ids OWNER TO diaspara_admin;


CREATE MATERIALIZED VIEW wgtrutta.view_agg_barrier_ids AS
SELECT
    fid bigint,
  agg_barrier_id integer,
  region_unique_row_id text
FROM  wgtrutta.agg_barrier_ids bi;

ALTER MATERIALIZED VIEW  wgtrutta.view_agg_barrier_ids OWNER TO diaspara_admin;
