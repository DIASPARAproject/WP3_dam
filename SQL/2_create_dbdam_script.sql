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
  
  
--control_type REMOVE
--downstream_mitigation_measure OK
--ecological_productivity REMOVE
--ecological_status_clas REMOVE
--effort_type REMOVE
--control_type REMOVE
--downstream_mitigation_measure OK
--ecological_productivity REMOVE
--ecological_status_clas REMOVE
--effort_type REMOVE
--electrofishing_mean OK
--fisher_type REMOVE
--fishway_type TODO
--Adapt with descriptions and definitions
--gear_characteristic_type REMOVE
--gear_type OK
--habitat_loss_type REMOVE
--individual_status REMOVE
--migration_direction TODO
--Add to bypass
--Add to fishway
--mortality_type REMOVE
--nomenclature OK
--observation_origin REMOVE
--observation_place_type REMOVE
--observation_type REMOVE
--keep obstruction for dam
--remove rest
--obstruction_impact REMOVE
--obstruction_type TODO
--remove chemical obstruction
--obstruction_place TODO
--remove op_gis_systemname
--remove op_gis_layername
--remove op_gis_location
--remove op_no_observationplacetype
--physical_obstruction TODO
--remove ob_no_origin
--remove ob_no_type
--remove ob_no_period
--remove ot_obstruction_number
--remove ot_no_mortality_type
--remove ot_no_mortality
--remove po_no_obstruction_passability (because it's a score)
--remove po_presence_eel_pass
--remove po_method_perm_ev
--decide what to do with po_date_presence_eel_pass
--move ob_dp_id to obstruction_place
--add natural obstruction to ot_no_obstruction_type
--physical_obstruction_pass_species TODO
--remove fpi_id
--change op_id name
--translate species
--physical_obstruction_score_species REMOVE
--orient_flow OK
--period_type REMOVE
--predation_type REMOVE
--predator_subtype REMOVE
--scientific_observation_method TODO
--remove migration monitoring
--remove NA
--WH needs to be changed by Standard by foot (and then checked how many pass is done)
--Add electrofishing types for other species if needed
--sex OK
--species TODO
--Use tr_species_spe
--stage OK
--turbine_type OK
--type_of_unit REMOVE
--value_type REMOVE
--dbeel_hpp TODO
--remove hpp_main_grid_or_production
--see if we keep hpp_presence_of_bar_rack or go for more specific
--add turbine_type
--dbeel_turbine OK
--Create age table TODO
--Create maturity table TODO
--Use tr_maturity_mat
--Create a fishway table TODO
--id
--expertise on weither species can cross the dam
--type of fishwat
--when cas it builtelectrofishing_mean OK
--fisher_type REMOVE
--fishway_type TODO
--Adapt with descriptions and definitions
--gear_characteristic_type REMOVE
--gear_type OK
--habitat_loss_type REMOVE
--individual_status REMOVE
--migration_direction TODO
--Add to bypass
--Add to fishway
--mortality_type REMOVE
--nomenclature OK
--observation_origin REMOVE
--observation_place_type REMOVE
--observation_type REMOVE
--keep obstruction for dam
--remove rest
--obstruction_impact REMOVE
--obstruction_type TODO
--remove chemical obstruction
--obstruction_place TODO
--remove op_gis_systemname
--remove op_gis_layername
--remove op_gis_location
--remove op_no_observationplacetype
--physical_obstruction TODO
--remove ob_no_origin
--remove ob_no_type
--remove ob_no_period
--remove ot_obstruction_number
--remove ot_no_mortality_type
--remove ot_no_mortality
--remove po_no_obstruction_passability (because it's a score)
--remove po_presence_eel_pass
--remove po_method_perm_ev
--decide what to do with po_date_presence_eel_pass
--move ob_dp_id to obstruction_place
--add natural obstruction to ot_no_obstruction_type
--physical_obstruction_pass_species TODO
--remove fpi_id
--change op_id name
--translate species
--physical_obstruction_score_species REMOVE
--orient_flow OK
--period_type REMOVE
--predation_type REMOVE
--predator_subtype REMOVE
--scientific_observation_method TODO
--remove migration monitoring
--remove NA
--WH needs to be changed by Standard by foot (and then checked how many pass is done)
--Add electrofishing types for other species if needed
--sex OK
--species TODO
--Use tr_species_spe
--stage OK
--turbine_type OK
--type_of_unit REMOVE
--value_type REMOVE
--dbeel_hpp TODO
--remove hpp_main_grid_or_production
--see if we keep hpp_presence_of_bar_rack or go for more specific
--add turbine_type
--dbeel_turbine OK
--Create age table TODO
--Create maturity table TODO
--Use tr_maturity_mat
--Create a fishway table TODO
--id
--expertise on weither species can cross the dam
--type of fishway
--when was it built ?
  
  
  
  
  -- 

