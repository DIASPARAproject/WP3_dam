-- see migdb echange_with_server for inital import.


-- we start with a structure collected from SLIME and SUDOANG with empy tables
-- We will populate those tables and modify them


-- we will separate the dam and the electrofishing db even if they use the same nomenclature as the source.


ALTER SCHEMA dbmig RENAME TO electrofishing;
--ALTER SCHEMA dbmig RENAME TO dam; (with manual dump)
DROP TABLE dam.electrofishing;
DROP TABLE dam.fishery;
DROP TABLE dam.gear_fishing;
DROP TABLE dam.predation;
DROP TABLE dam.differentiation;
DROP TABLE dam.biological_characteristic;
DROP TABLE dam.batch;

DROP TABLE electrofishing.bypass;
DROP TABLE electrofishing.hpp;
DROP TABLE electrofishing.physical_obstruction;
DROP TABLE electrofishing.obstruction;
DROP TABLE electrofishing.turbine; 


GRANT ALL PRIVILEGES ON SCHEMA dam TO diaspara_admin;
GRANT ALL PRIVILEGES ON SCHEMA electrofishing TO diaspara_admin;
GRANT USAGE ON SCHEMA dam TO diaspara_read;
GRANT USAGE ON SCHEMA electrofishing TO diaspara_read;

CREATE SERVER eda_data_wrapper
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (host 'localhost', port '5432', dbname 'eda2.3');

CREATE USER MAPPING FOR USER
  SERVER wgeel_data_wrapper
  OPTIONS (user 'postgres', password 'postgres', updatable 'false');

CREATE SERVER wgnas_data_wrapper
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (host 'localhost', port '5432', dbname 'salmoglob');

CREATE USER MAPPING FOR USER
  SERVER wgeel_data_wrapper
  OPTIONS (user 'postgres', password 'postgres', updatable 'false');
  
CREATE USER MAPPING FOR USER
  SERVER wgnas_data_wrapper
  OPTIONS (user 'postgres', password 'postgres');


-- TODO put back these functions when done
DROP FUNCTION nomenclature.nomenclature_id_update() CASCADE;
DROP FUNCTION  nomenclature.nomenclature_id_insert()CASCADE;


ALTER SEQUENCE nomenclature.nomenclature_no_id_seq
  START 1
  RESTART 307;



-- biological_characteristic_type => Align with other vocab for name and code

INSERT INTO nomenclature.biological_characteristic_type SELECT * FROM nomenclature_eda.biological_characteristic_type; --22

INSERT INTO nomenclature.biological_characteristic_type (no_id,no_type,no_name,bc_label,bc_unit,bc_data_type)
  VALUES (307,'Biological characteristic type','eye_diam_mean_mm','Mean eye diameter','mm','real');
UPDATE nomenclature.biological_characteristic_type
  SET no_name='Weightg',bc_label='Weight in g'
  WHERE no_id=42;
UPDATE nomenclature.biological_characteristic_type
  SET no_name='Lengthmm'
  WHERE no_id=39;
UPDATE nomenclature.biological_characteristic_type
  SET no_name='Ageyear',bc_label='Age in year'
  WHERE no_id=43;
UPDATE nomenclature.biological_characteristic_type
  SET no_name='Eye_diam_vert_mm'
  WHERE no_id=262;
UPDATE nomenclature.biological_characteristic_type
  SET no_name='Eye_diam_horiz_mm'
  WHERE no_id=263;
UPDATE nomenclature.biological_characteristic_type
  SET no_name='Pectoral_lengthmm'
  WHERE no_id=264;
UPDATE nomenclature.biological_characteristic_type
  SET bc_unit='Dimensionless'
  WHERE no_id=46; -- percentage was there an it was wrong
  
  


