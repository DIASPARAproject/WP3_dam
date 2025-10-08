-- see migdb echange_with_server for inital import.


-- we start with a structure collected from SLIME and SUDOANG with empy tables
-- We will populate those tables and modify them


-- we will separate the dam and the electrofishing db even if they use the same nomenclature as the source.
ALTER TABLE nomenclature.nomenclature 
	ALTER COLUMN no_code TYPE varchar(3);

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
DROP TABLE IF EXISTS nomenclature.control_type;
--downstream_mitigation_measure OK
--ecological_productivity REMOVE
DROP TABLE IF EXISTS nomenclature.ecological_productivity;
--ecological_status_clas REMOVE
DROP TABLE IF EXISTS nomenclature.ecological_status_class;
--effort_type REMOVE
DROP TABLE IF EXISTS nomenclature.effort_type;

--fisher_type REMOVE
DROP TABLE IF EXISTS nomenclature.fisher_type;
--fishway_type TODO
--Adapt with descriptions and definitions
--gear_characteristic_type REMOVE
DROP TABLE IF EXISTS nomenclature.gear_characteristic_type;
--gear_type OK
--habitat_loss_type REMOVE
DROP TABLE IF EXISTS nomenclature.habitat_loss_type;
--individual_status REMOVE
DROP TABLE IF EXISTS nomenclature.individual_status;
--migration_direction TODO
--Add to bypass
--Add to fishway
--mortality_type REMOVE
DROP TABLE IF EXISTS nomenclature.mortality_type;
--nomenclature OK
--observation_origin REMOVE
DROP TABLE IF EXISTS nomenclature.observation_origin;
--observation_place_type REMOVE
DROP TABLE IF EXISTS nomenclature.observation_place_type;
--observation_type REMOVE
DROP TABLE IF EXISTS nomenclature.observation_type;
--keep obstruction for dam
--remove rest
--obstruction_impact REMOVE
DROP TABLE IF EXISTS nomenclature.obstruction_impact;
--obstruction_type TODO
--remove chemical obstruction
--obstruction_place TODO
--remove op_gis_systemname
--remove op_gis_layername
--remove op_gis_location
--remove op_no_observationplacetype
DROP TABLE IF EXISTS dam.obstruction_place;
CREATE TABLE dam.obstruction_place (
	op_id uuid DEFAULT uuid_generate_v4() NOT NULL,
	op_placename TEXT NULL,
	op_op_id uuid NULL,
	op_dp_id int4 NULL,
	op_id_original TEXT NOT NULL,
	op_country varchar(2) NULL,
	geom geometry NULL,
	CONSTRAINT uk_op_id_original UNIQUE (op_id_original),
	CONSTRAINT obstruction_place_pkey PRIMARY KEY (op_id),
	CONSTRAINT fk_op_op_id FOREIGN KEY (op_op_id) REFERENCES dam.obstruction_place(op_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_op_dp_id FOREIGN KEY (op_dp_id) REFERENCES dam.data_provider(dp_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX obstruction_place_geom_gist ON dam.obstruction_place USING gist (geom);
ALTER TABLE dam.obstruction_place OWNER TO diaspara_admin;
GRANT SELECT ON dam.obstruction_place TO diaspara_read;


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

-- dbmig.observations definition
CREATE OR REPLACE FUNCTION nomenclature.nomenclature_id_insert()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
  PERFORM no_id FROM "nomenclature".nomenclature WHERE no_id = NEW.no_id;
  IF FOUND THEN
	RAISE EXCEPTION '1- Invalid no_id (%)', NEW.no_id;
  ELSE
	RETURN NEW;
  END IF;
END
$function$
;

CREATE OR REPLACE FUNCTION nomenclature.nomenclature_id_update()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
  PERFORM no_id FROM "nomenclature".nomenclature WHERE no_id = NEW.no_id;
  IF FOUND THEN
	RETURN NEW;
  ELSE
	RAISE EXCEPTION '1- Invalid no_id (%)', NEW.no_id;
  END IF;
END
$function$
;
-- Drop table

-- DROP TABLE dbmig.observations CASCADE;
INSERT INTO nomenclature.species SELECT * FROM nomenclature_eda.fishway_type;
CREATE TRIGGER tr_fishway_type_insert BEFORE
INSERT
    ON
    nomenclature.fishway_type FOR EACH ROW EXECUTE FUNCTION nomenclature.nomenclature_id_insert();
CREATE TRIGGER tr_fishway_type_update BEFORE
UPDATE
    ON
    nomenclature.fishway_type FOR EACH ROW EXECUTE FUNCTION nomenclature.nomenclature_id_update();
   
ALTER TABLE nomenclature.fishway_type OWNER TO diaspara_admin;
GRANT SELECT ON nomenclature.fishway_type TO diaspara_read;

INSERT INTO nomenclature.downstream_mitigation_measure SELECT * FROM nomenclature_eda.downstream_mitigation_measure;
CREATE TRIGGER tr_downstream_mitigation_measure_insert BEFORE
INSERT
    ON
    nomenclature.downstream_mitigation_measure FOR EACH ROW EXECUTE FUNCTION nomenclature.nomenclature_id_insert();
CREATE TRIGGER tr_downstream_mitigation_measure_update BEFORE
UPDATE
    ON
    nomenclature.downstream_mitigation_measure FOR EACH ROW EXECUTE FUNCTION nomenclature.nomenclature_id_update();
   
ALTER TABLE nomenclature.downstream_mitigation_measure OWNER TO diaspara_admin;
GRANT SELECT ON nomenclature.downstream_mitigation_measure TO diaspara_read;

INSERT INTO nomenclature.obstruction_type SELECT * FROM nomenclature_eda.obstruction_type;
INSERT INTO nomenclature.obstruction_type (no_code, no_type, no_name)
	VALUES ('WA',
			'Obstruction type',
			'Waterfall, Natural obstruction'
			);
		
-- Remove physical and chemical obstruction
DELETE FROM nomenclature.obstruction_type
	WHERE no_id=220;
DELETE FROM nomenclature.obstruction_type
	WHERE no_id=219;

CREATE TRIGGER tr_obstruction_type_insert BEFORE
INSERT
    ON
    nomenclature.obstruction_type FOR EACH ROW EXECUTE FUNCTION nomenclature.nomenclature_id_insert();
CREATE TRIGGER tr_obstruction_type_update BEFORE
UPDATE
    ON
    nomenclature.obstruction_type FOR EACH ROW EXECUTE FUNCTION nomenclature.nomenclature_id_update();
   
ALTER TABLE nomenclature.obstruction_type OWNER TO diaspara_admin;
GRANT SELECT ON nomenclature.obstruction_type TO diaspara_read;

CREATE TABLE nomenclature.event_change (
	CONSTRAINT event_change_id PRIMARY KEY (no_id)
)
INHERITS (nomenclature.nomenclature);

INSERT INTO nomenclature.event_change (no_code, no_type, no_name)
	VALUES (
		'ST',
		'Event change',
		'Start (Default)');
INSERT INTO nomenclature.event_change (no_code, no_type, no_name)
	VALUES (
		'CO',
		'Event change',
		'Construction');
INSERT INTO nomenclature.event_change (no_code, no_type, no_name)
	VALUES (
		'SU',
		'Event change',
		'Start usage');
INSERT INTO nomenclature.event_change (no_code, no_type, no_name)
	VALUES (
		'ER',
		'Event change',
		'Erasement');
INSERT INTO nomenclature.event_change (no_code, no_type, no_name)
	VALUES (
		'EU',
		'Event change',
		'End usage');
INSERT INTO nomenclature.event_change (no_code, no_type, no_name)
	VALUES (
		'HC',
		'Event change',
		'Height change');
INSERT INTO nomenclature.event_change (no_code, no_type, no_name)
	VALUES (
		'PE',
		'Event change',
		'Partial erasement');

-- Table Triggers

CREATE TRIGGER tr_event_change_insert BEFORE
INSERT
    ON
    nomenclature.event_change FOR EACH ROW EXECUTE FUNCTION nomenclature.nomenclature_id_insert();
CREATE TRIGGER tr_event_change_update BEFORE
UPDATE
    ON
    nomenclature.event_change FOR EACH ROW EXECUTE FUNCTION nomenclature.nomenclature_id_update();

CREATE TABLE dam.obstruction (
	ob_id uuid DEFAULT uuid_generate_v4() NOT NULL,
	ob_starting_date date NULL,
	ob_ending_date date NULL,
	ob_op_id uuid NOT NULL,
	ob_obstruction_type_no_id int4 NULL,
	ob_fishway_type_no_id int4 NULL,
	ob_mitigation_measure_no_id int4 NULL,
	ob_height float4 NULL,
	ob_height_date date NULL,
	ob_downs_water_depth numeric NULL,
	ob_date_last_update date NULL,
	ob_event_change_no_id int4 NULL,
	CONSTRAINT obstruction_pkey PRIMARY KEY (ob_id),
	CONSTRAINT fk_ob_fishway_type_no_id FOREIGN KEY (ob_fishway_type_no_id) REFERENCES nomenclature.fishway_type(no_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_ob_mitigation_measure_no_id FOREIGN KEY (ob_mitigation_measure_no_id) REFERENCES nomenclature.downstream_mitigation_measure(no_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_ob_op_id FOREIGN KEY (ob_op_id) REFERENCES dam.obstruction_place(op_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_ob_obstruction_type_no_id FOREIGN KEY (ob_obstruction_type_no_id) REFERENCES nomenclature.obstruction_type(no_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_event_change_no_id FOREIGN KEY (ob_event_change_no_id) REFERENCES nomenclature.event_change(no_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT uk_obstruction UNIQUE (ob_op_id, ob_starting_date)
);


-- Table Triggers

CREATE TRIGGER tr_obstruction_insert BEFORE
INSERT
    ON
    dam.obstruction FOR EACH ROW EXECUTE FUNCTION dam.observations_id_insert();
CREATE TRIGGER tr_obstruction_update BEFORE
UPDATE
    ON
    dam.obstruction FOR EACH ROW EXECUTE FUNCTION dam.observations_id_update();

ALTER TABLE dam.obstruction OWNER TO diaspara_admin;
GRANT SELECT ON dam.obstruction TO diaspara_read;
   
--decide what to do with po_date_presence_eel_pass
--move ob_dp_id to obstruction_place
--add natural obstruction to ot_no_obstruction_type

--species TODO
--Use tr_species_spe

INSERT INTO nomenclature.species
	SELECT * FROM nomenclature_eda.species;

INSERT INTO nomenclature.species (no_code,no_type,no_name,sp_vernacular_name)
	VALUES ('SAL','Species','Salmo salar','Atlantic salmon');
INSERT INTO nomenclature.species (no_code,no_type,no_name,sp_vernacular_name)
	VALUES ('TRT','Species','Salmo trutta','Sea trout');
INSERT INTO nomenclature.species (no_code,no_type,no_name,sp_vernacular_name)
	VALUES ('ALA','Species','Alosa alosa','Twait shad');
INSERT INTO nomenclature.species (no_code,no_type,no_name,sp_vernacular_name)
	VALUES ('ALF','Species','Alosa fallax','Allis shad');
INSERT INTO nomenclature.species (no_code,no_type,no_name,sp_vernacular_name)
	VALUES ('SLP','Species','Petromyzon marinus','Sea lamprey');
INSERT INTO nomenclature.species (no_code,no_type,no_name,sp_vernacular_name)
	VALUES ('RLP','Species','Lampretra fluviatilis','European river lamprey');
UPDATE nomenclature.species
	SET sp_vernacular_name='European eel',no_code='ANG'
	WHERE no_id=30;

ALTER TABLE nomenclature.species OWNER TO diaspara_admin;
GRANT SELECT ON nomenclature.species TO diaspara_read;

--Create a fishway table TODO
--id
--expertise on weither species can cross the dam
--when was it built
--DELETE FROM nomenclature.fishway_type;
INSERT INTO nomenclature.fishway_type (no_id,no_code,no_type,no_name)
	SELECT no_id,no_code,no_type,no_name FROM nomenclature_eda.fishway_type;
ALTER TABLE nomenclature.fishway_type OWNER TO diaspara_admin;
GRANT SELECT ON nomenclature.fishway_type TO diaspara_read;

-- DROP TABLE montepomi.dbeel_physical_obstruction_pass_species;

CREATE TABLE dam.fishway (
	fi_ob_id uuid NULL,
	fi_op_id uuid NULL,
	fi_id_original varchar(10) NULL,
	fi_species_id int4 NULL,
	fi_fishway_id int4 NULL,
	fi_presence_pass bool NULL,
	fi_date date NULL,
	CONSTRAINT fishway_pkey PRIMARY KEY (fi_ob_id, fi_species_id),
	CONSTRAINT fk_fi_species_id FOREIGN KEY (fi_species_id) REFERENCES nomenclature.species(no_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_fi_fishway_id FOREIGN KEY (fi_fishway_id) REFERENCES nomenclature.fishway_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

ALTER TABLE dam.fishway OWNER TO diaspara_admin;
GRANT SELECT ON dam.fishway TO diaspara_read;

--physical_obstruction_score_species OK
--orient_flow OK
--period_type REMOVE
DROP TABLE IF EXISTS nomenclature.period_type;
--predation_type REMOVE
DROP TABLE IF EXISTS nomenclature.predation_type;
--predator_subtype REMOVE
DROP TABLE IF EXISTS nomenclature.predator_subtype;

--sex OK

--stage OK
--turbine_type OK
--type_of_unit REMOVE
DROP TABLE IF EXISTS nomenclature.type_of_unit;
--value_type REMOVE
DROP TABLE IF EXISTS nomenclature.value_type;
--dbeel_hpp TODO
--remove hpp_main_grid_or_production
--see if we keep hpp_presence_of_bar_rack or go for more specific
--add turbine_type
DROP TABLE IF EXISTS dam.hpp CASCADE;
CREATE TABLE dam.hpp (
	hpp_id uuid NOT NULL,
	hpp_ob_id uuid NULL,
	hpp_name text NULL,
	hpp_presence_bypass bool NULL,
	hpp_total_flow_bypass numeric NULL,
	hpp_orient_flow_no_id int4 NULL,
	hpp_presence_of_bar_rack bool NULL,
	hpp_bar_rack_space numeric NULL,
	hpp_surface_bar_rack numeric NULL,
	hpp_inclination_bar_rack numeric NULL,
	hpp_presence_bypass_trashrack bool NULL,
	hpp_nb_trashrack_bypass int4 NULL,
	hpp_turb_max_flow numeric NULL,
	hpp_reserved_flow numeric NULL,
	hpp_flow_trashrack_bypass numeric NULL,
	hpp_max_power numeric NULL,
	hpp_nb_turbines int4 NULL,
	hpp_turbine_type int4 NULL,
	hpp_orientation_bar_rack numeric NULL,
	hpp_id_original text NULL,
	hpp_source text NULL,
	CONSTRAINT hpp_pkey PRIMARY KEY (hpp_id),
	CONSTRAINT fk_hpp_ob_id FOREIGN KEY (hpp_ob_id) REFERENCES dam.obstruction(ob_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_hpp_orient_flow_no_id FOREIGN KEY (hpp_orient_flow_no_id) REFERENCES nomenclature.orient_flow(no_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_hpp_turbine_type FOREIGN KEY (hpp_turbine_type) REFERENCES nomenclature.turbine_type(no_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--dbeel_turbine OK

-- DROP TABLE IF EXISTS dam.turbine;

CREATE TABLE dam.turbine (
	turb_id uuid NOT NULL,
	turb_hpp_id uuid NULL,
	turb_turbine_type_no_id int4 NULL,
	turb_in_service bool NULL,
	turb_max_power numeric NULL,
	turb_min_working_flow numeric NULL,
	turb_hpp_height numeric NULL,
	turb_diameter numeric NULL,
	turb_rotation_speed numeric NULL,
	turb_nb_blades int4 NULL,
	turb_max_turbine_flow numeric NULL,
	turb_description text NULL,
	CONSTRAINT turbine_pkey PRIMARY KEY (turb_id),
	CONSTRAINT fk_turb_turbine_type_no_id FOREIGN KEY (turb_turbine_type_no_id) REFERENCES nomenclature.turbine_type(no_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_turb_hpp_id FOREIGN KEY (turb_hpp_id) REFERENCES dam.hpp(hpp_id) ON DELETE CASCADE ON UPDATE CASCADE
);



  
  
  
  
 -- Electrofishing

--Create age table TODO
--Create maturity table TODO
--Use tr_maturity_mat
--electrofishing_mean OK
--scientific_observation_method TODO
--remove migration monitoring
--remove NA
--WH needs to be changed by Standard by foot (and then checked how many pass is done)
--Add electrofishing types for other species if needed
