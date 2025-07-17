-------------------------------------------------------------
-- Authour Cédric Briand Maria Mateo
-- this script contains all the modifications to dbeel 
-- Initial dbeel schema was built during the POSE project
--------------------------------------------------------------


---------------------------------------------------------------
-- dbeel.physical_obstruction MODIFICATION
---------------------------------------------------------------

---- Regarding our template to collect data, some informtaion must be add:
-- Expertise problem for downstream migration:
ALTER TABLE dbeel.physical_obstruction add column po_downs_pb boolean;
COMMENT ON COLUMN dbeel.physical_obstruction.po_downs_pb is '¿Existe un problema para la migración aguas abajo? (Opinión de experto):
- Si el agua cae en una profundidad menor a un metro cerca de la presa, quiere decir que existe impacto (TRUE).
- Si el agua cae río abajo desde una presa con un salto de agua menor a cuatro metros, y que la profundidad del agua cerca de la presa es de un metro (sin rocas, ni otros obstáculos), entonces el impacto es nulo (FALSE); en caso contrario, existe impacto (TRUE).
- Si el salto de agua es mayor a cuatro metros, la profundidad del agua cerca de la presa debería ser ¼ parte del salto de agua. Esto debe ser medido en condiciones de fuerte caudal (que corresponde con la mayor parte de migración ríos abajo de las anguilas plateadas). Si la profundidad es menor de la indicada, entonces existe impacto (TRUE).'

-- Water depth close to the dam:
ALTER TABLE dbeel.physical_obstruction add column po_downs_water_depth numeric;
COMMENT ON COLUMN dbeel.physical_obstruction.po_downs_water_depth is 'Water depth close to the dam';

-- Presence of an eel pass:
ALTER TABLE dbeel.physical_obstruction add column po_presence_eel_pass boolean;
COMMENT ON COLUMN dbeel.physical_obstruction.po_presence_eel_pass is 'Presence of an eel pass';

-- Permeability/ Impact evaluation method:
ALTER TABLE dbeel.physical_obstruction add column po_method_perm_ev text;
COMMENT ON COLUMN dbeel.physical_obstruction.po_method_perm_ev is 'Permeability/ Impact evaluation method';


-- Date of construction of an eel pass:
--	This parameter is required to konw the passability of the obstacle.
--	The date of a operation in electrofishing is indicated. Depending on whether there is a fish pass at that time, 
--	the probability of passing will not be the same.
ALTER TABLE dbeel.physical_obstruction add column po_date_presence_eel_pass date;
COMMENT ON COLUMN dbeel.physical_obstruction.po_date_presence_eel_pass is 'Date of construction of an eel pass';


---------------------------------------------------------------
-- dbeel_nomenclature MODIFICATION
---------------------------------------------------------------

---- Table creation: dbeel_nomenclature.turbine_type

-- DROP TABLE dbeel_nomenclature.turbine_type;
CREATE TABLE dbeel_nomenclature.turbine_type
(
-- Heredado from table dbeel_nomenclature.nomenclature:  no_id integer NOT NULL DEFAULT nextval('dbeel_nomenclature.nomenclature_no_id_seq'::regclass),
-- Heredado from table dbeel_nomenclature.nomenclature:  no_code character varying(2),
-- Heredado from table dbeel_nomenclature.nomenclature:  no_type character varying(60),
-- Heredado from table dbeel_nomenclature.nomenclature:  no_name character varying(80),
  CONSTRAINT turbine_type_id PRIMARY KEY (no_id)
)
INHERITS (dbeel_nomenclature.nomenclature)
WITH (
  OIDS=FALSE
);
ALTER TABLE dbeel_nomenclature.turbine_type
  OWNER TO postgres;

-- Trigger: tr_turbine_type_insert on dbeel_nomenclature.turbine_type

-- DROP TRIGGER tr_turbine_type_insert ON dbeel_nomenclature.turbine_type;

CREATE TRIGGER tr_turbine_type_insert
  BEFORE INSERT
  ON dbeel_nomenclature.turbine_type
  FOR EACH ROW
  EXECUTE PROCEDURE dbeel_nomenclature.nomenclature_id_insert();

-- Trigger: tr_turbine_type_update on dbeel_nomenclature.turbine_type

-- DROP TRIGGER tr_turbine_type_update ON dbeel_nomenclature.turbine_type;

CREATE TRIGGER tr_turbine_type_update
  BEFORE UPDATE
  ON dbeel_nomenclature.turbine_type
  FOR EACH ROW
  EXECUTE PROCEDURE dbeel_nomenclature.nomenclature_id_update();

INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Horizontal axis Kaplan (bulb)';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Other (please specify)';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Double Francis (spiral case)';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Francis unspecified';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Turbine with fixed blade propeller and vertical axis';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Kaplan not specified';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Pelton';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Reversible';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Kaplan (model of S-turbine)';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Turbine with fixed blade propeller and horizontal axis';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Unknown';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Vertical axis Kaplan';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Francis without volute';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Francis (spiral case)';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Banki-Michell (cross-flow)';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'VLH';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Archimedean screw turbine';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Water wheel turbine (aqualienne)';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Water wheel turbine (others)';
INSERT INTO dbeel_nomenclature.turbine_type(no_name) SELECT 'Propeller unspecified';

UPDATE dbeel_nomenclature.turbine_type SET no_type = 'Turbine type';


-----------------------------------------------------------------------------------------------
---- Table creation: dbeel_nomenclature.orient_flow (Orientation of dam with respect to flow)
------------------------------------------------------------------------------------------------

-- DROP TABLE dbeel_nomenclature.orient_flow;
CREATE TABLE dbeel_nomenclature.orient_flow
(
-- Heredado from table dbeel_nomenclature.nomenclature:  no_id integer NOT NULL DEFAULT nextval('dbeel_nomenclature.nomenclature_no_id_seq'::regclass),
-- Heredado from table dbeel_nomenclature.nomenclature:  no_code character varying(2),
-- Heredado from table dbeel_nomenclature.nomenclature:  no_type character varying(60),
-- Heredado from table dbeel_nomenclature.nomenclature:  no_name character varying(80),
  CONSTRAINT orient_flow_id PRIMARY KEY (no_id)
)
INHERITS (dbeel_nomenclature.nomenclature)
WITH (
  OIDS=FALSE
);
ALTER TABLE dbeel_nomenclature.orient_flow
  OWNER TO postgres;

-- Trigger: tr_orient_flow_insert on dbeel_nomenclature.orient_flow

-- DROP TRIGGER tr_orient_flow_insert ON dbeel_nomenclature.orient_flow;

CREATE TRIGGER tr_orient_flow_insert
  BEFORE INSERT
  ON dbeel_nomenclature.orient_flow
  FOR EACH ROW
  EXECUTE PROCEDURE dbeel_nomenclature.nomenclature_id_insert();

-- Trigger: tr_orient_flow_update on dbeel_nomenclature.orient_flow

-- DROP TRIGGER tr_orient_flow_update ON dbeel_nomenclature.orient_flow;

CREATE TRIGGER tr_orient_flow_update
  BEFORE UPDATE
  ON dbeel_nomenclature.orient_flow
  FOR EACH ROW
  EXECUTE PROCEDURE dbeel_nomenclature.nomenclature_id_update();

INSERT INTO dbeel_nomenclature.orient_flow(no_type, no_code, no_name) SELECT 'orient_flow', '1', '[70-90°]';
INSERT INTO dbeel_nomenclature.orient_flow(no_type, no_code, no_name) SELECT 'orient_flow', '2', '[50-70°[';
INSERT INTO dbeel_nomenclature.orient_flow(no_type, no_code, no_name) SELECT 'orient_flow', '3', '[30-50°[';
INSERT INTO dbeel_nomenclature.orient_flow(no_type, no_code, no_name) SELECT 'orient_flow', '4', '<30°';


---------------------------------------------------------------
-- dbeel.hpp CREATION
---------------------------------------------------------------

-- DELETE po_turbine_number from dbeel.physical_obstruction (since a turbine table is also created)
ALTER TABLE dbeel.physical_obstruction DROP COLUMN po_turbine_number cascade;

--ALTER TABLE dbeel.physical_obstruction ADD COLUMN po_turbine_number INTEGER;

---- HPP creation (same parameters as in the template)
CREATE TABLE dbeel.hpp (
	hpp_id uuid PRIMARY KEY,
	hpp_ob_id uuid,
	hpp_name text,
	hpp_main_grid_or_production integer,
	hpp_presence_bypass boolean,	
	hpp_total_flow_bypass numeric,
	hpp_orient_flow_no_id integer,
	hpp_presence_of_bar_rack boolean,	
	hpp_bar_rack_space numeric,
	hpp_surface_bar_rack numeric,
	hpp_inclination_bar_rack numeric,
	hpp_presence_bypass_trashrack boolean,
	hpp_nb_trashrack_bypass	integer,
	hpp_turb_max_flow numeric,
	hpp_reserved_flow numeric,
	hpp_flow_trashrack numeric,
	hpp_max_power numeric,
	hpp_nb_turbines	integer);

-- TO DO: add contraints in daugther tables (sudoang)
ALTER TABLE dbeel.hpp ADD CONSTRAINT c_fk_hpp_ob_id FOREIGN KEY (hpp_ob_id) REFERENCES dbeel.physical_obstruction (ob_id) ON UPDATE CASCADE ON DELETE CASCADE; 
ALTER TABLE dbeel.hpp ADD CONSTRAINT c_fk_hpp_orient_flow_no_id FOREIGN KEY (hpp_orient_flow_no_id) REFERENCES dbeel_nomenclature.orient_flow (no_id) ON UPDATE CASCADE ON DELETE CASCADE; 


---------------------------------------------------------------
-- dbeel.bypass CREATION
---------------------------------------------------------------

CREATE TABLE dbeel.bypass (
	bypass_id uuid PRIMARY KEY,
	bypass_hpp_id uuid,
	bypass_water_depth numeric,
	bypass_width numeric,
	bypass_is_flowing boolean);

-- TO DO: add contraints in daugther tables (sudoang)
ALTER TABLE dbeel.bypass ADD CONSTRAINT c_fk_bypass_hpp_id FOREIGN KEY (bypass_hpp_id) REFERENCES dbeel.hpp (hpp_id) ON UPDATE CASCADE ON DELETE CASCADE; 


---------------------------------------------------------------
-- dbeel.turbine CREATION
---------------------------------------------------------------

CREATE TABLE dbeel.turbine(
	turb_id uuid PRIMARY KEY,
	turb_hpp_id uuid,
	turb_turbine_type_no_id integer,	
	turb_in_service	boolean,
	turb_max_power numeric,
	turb_min_working_flow numeric,	
	turb_hpp_height	numeric,
	turb_diameter numeric,
	turb_rotation_speed numeric,
	turb_nb_blades integer,	
	turb_max_turbine_flow numeric,
	turb_description text);

-- TO DO: add contraints in daugther tables (sudoang)
ALTER TABLE dbeel.turbine ADD CONSTRAINT c_fk_turb_hpp_id FOREIGN KEY (turb_hpp_id) REFERENCES dbeel.hpp (hpp_id) ON UPDATE CASCADE ON DELETE CASCADE; 
ALTER TABLE dbeel.turbine ADD CONSTRAINT c_fk_turb_turbine_type_no_id FOREIGN KEY (turb_turbine_type_no_id) REFERENCES dbeel_nomenclature.turbine_type (no_id) ON UPDATE CASCADE ON DELETE CASCADE; 


---------------------------------------------------------------
-- CREATE HPP, BYPASS AND TURBINE TABLES INTO SUDOANG SCHEMA
---------------------------------------------------------------

---- Hydropower plants:
CREATE TABLE sudoang.dbeel_hpp (
        CONSTRAINT c_pk_hpp_id PRIMARY KEY (hpp_id),
        CONSTRAINT c_fk_hpp_orient_flow_no_id FOREIGN KEY (hpp_orient_flow_no_id) REFERENCES dbeel_nomenclature.orient_flow (no_id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT c_fk_hpp_ob_id FOREIGN KEY (hpp_ob_id) REFERENCES dbeel.physical_obstruction (ob_id) ON UPDATE CASCADE ON DELETE CASCADE
) INHERITS (dbeel.hpp);


---- Bypass:
CREATE TABLE sudoang.dbeel_bypass (
        CONSTRAINT c_pk_bypass_id PRIMARY KEY (bypass_id),
	CONSTRAINT c_fk_bypass_hpp_id FOREIGN KEY (bypass_hpp_id) REFERENCES dbeel.hpp (hpp_id) ON UPDATE CASCADE ON DELETE CASCADE
) INHERITS (dbeel.bypass); 


---- Turbine:
CREATE TABLE sudoang.dbeel_turbine (
        CONSTRAINT c_pk_turb_id PRIMARY KEY (turb_id),
	CONSTRAINT c_fk_turb_hpp_id FOREIGN KEY (turb_hpp_id) REFERENCES dbeel.hpp (hpp_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT c_fk_turb_turbine_type_no_id FOREIGN KEY (turb_turbine_type_no_id) REFERENCES dbeel_nomenclature.turbine_type (no_id) ON UPDATE CASCADE ON DELETE CASCADE
) INHERITS (dbeel.turbine); 


---------------------------------------------------------------
-- dbeel_nomenclature MODIFICATION FOR SILVER EEL
---------------------------------------------------------------

select * from sudoang.dbeel_mensurationindiv_biol_charac; --9946

select * from dbeel_nomenclature.biological_characteristic_type
INSERT INTO dbeel_nomenclature.biological_characteristic_type
(  no_type,  no_code,  no_name,  bc_label ,  bc_unit,  bc_data_type)
VALUES ('Biological characteristic type', NULL, 'eye_diam_vert', 'Vertical eye diameter', 'mm','real');

INSERT INTO dbeel_nomenclature.biological_characteristic_type
(  no_type,  no_code,  no_name,  bc_label ,  bc_unit,  bc_data_type)
VALUES ('Biological characteristic type', NULL, 'eye_diam_horiz', 'Horizontal eye diameter', 'mm','real');

INSERT INTO dbeel_nomenclature.biological_characteristic_type
(  no_type,  no_code,  no_name,  bc_label ,  bc_unit,  bc_data_type)
VALUES ('Biological characteristic type', NULL, 'length_pect', 'Length of the pectoral fin', 'mm','real');

INSERT INTO dbeel_nomenclature.biological_characteristic_type
(  no_type,  no_code,  no_name,  bc_label ,  bc_unit,  bc_data_type)
VALUES ('Biological characteristic type', NULL, 'presence_neuromast', 'Presence of neuromasts along the lateral line', 'logical','boolean');

INSERT INTO dbeel_nomenclature.biological_characteristic_type
(  no_type,  no_code,  no_name,  bc_label ,  bc_unit,  bc_data_type)
VALUES ('Biological characteristic type', NULL, 'contrast', 'Contrasted colors between dorsal and ventral', 'logical','boolean');


---------------------------------------------------------------
-- dbeel_nomenclature MODIFICATION FOR OBSTRUCTION IMPACT
---------------------------------------------------------------
-- Obstruction impact can be defined differently in each table
select * from  dbeel_nomenclature.obstruction_impact;
--ALTER sequence dbeel_nomenclature.nomenclature_no_id_seq restart with 267;

begin;
INSERT INTO dbeel_nomenclature.obstruction_impact
(  no_type, no_name)
VALUES ('Obstruction impact', 'Low (scale with three categories)');

INSERT INTO dbeel_nomenclature.obstruction_impact
(  no_type, no_name)
VALUES ('Obstruction impact', 'Medium (scale with three categories)');

INSERT INTO dbeel_nomenclature.obstruction_impact
(  no_type, no_name)
VALUES ('Obstruction impact', 'High (scale with three categories)');
commit;


-----------------------------------------------------
---- Table creation: dbeel_nomenclature.fishway_type
-----------------------------------------------------

/* SELECT distinct fishpasstypelabel FROM sudoang.amber where id is not null;
	'', '8', '2', '4', '5', 'SÃ­', '10', '7', '9', '3', '0', '6', '11', '1'

	'Vertical cutout' = 'Vertical slot fishway', 					-- TRUE presence eel pass 
	'Successive ponds' = Pool type fishway 						-- TRUE presence eel pass
	
	'Decelerators', 'Retarders' = 'Denil pass', 					-- FALSE  presence eel pass 
	'YES', 'UNDEFINED', 'A small pass', 'Ramps', 'Yes', 'Others' = 'Unknown' 	-- FALSE presence eel pass 
	'NONE', 'NO', 'No', 'no', 'Without fishway' = 'No'				-- FALSE presence eel pass 
	
	'Successive troughs',
	'Riprap' = 'Riprap					--  
	'Weir', 'Weir - Undefined' = 'Weir fish ladder' ???

SELECT distinct type_fish_passage FROM sudoang.amber_portugal where id is not null;
	'Eclusas' = 'Sluice', 					-- TRUE presence eel pass
	'Ascensor' = 'Fish lift'				-- FALSE presence eel pass
	'Bacias sucessivas' = 'Pool type fishway' 		-- TRUE presence eel pass 
	Null

SELECT distinct "TIPO_PASO" FROM sudoang.chseg_obstruction_tec where id is not null;
	'RZ' = 'Denil pass', 					-- FALSE  presence eel pass 
	'NA' = 'No',						-- FALSE presence eel pass 
	'DE' = 'Unknown', 					-- FALSE presence eel pass  
	'PR' = 'Pre-dams' ???,
	'ES' = 'Pool type fishway', 
	'RP' = 'Rock ramp', 
	'CL' = 'Lateral canal',
	'OT', ' ', ''

Other fishway type that we can fou
	'Rivières de conteurnement' = 'Artificial river'	-- TRUE presence eel pass 
*/

---- Table creation: dbeel_nomenclature.fishway_type

-- DROP TABLE dbeel_nomenclature.fishway_type;
CREATE TABLE dbeel_nomenclature.fishway_type
(
-- Heredado from table dbeel_nomenclature.nomenclature:  no_id integer NOT NULL DEFAULT nextval('dbeel_nomenclature.nomenclature_no_id_seq'::regclass),
-- Heredado from table dbeel_nomenclature.nomenclature:  no_code character varying(2),
-- Heredado from table dbeel_nomenclature.nomenclature:  no_type character varying(60),
-- Heredado from table dbeel_nomenclature.nomenclature:  no_name character varying(80),
  CONSTRAINT fishway_type_id PRIMARY KEY (no_id)
)
INHERITS (dbeel_nomenclature.nomenclature)
WITH (
  OIDS=FALSE
);
ALTER TABLE dbeel_nomenclature.fishway_type
  OWNER TO postgres;

-- Trigger: tr_fishway_type_insert on dbeel_nomenclature.fishway_type

-- DROP TRIGGER tr_fishway_type_insert ON dbeel_nomenclature.fishway_type;

CREATE TRIGGER tr_fishway_type_insert
  BEFORE INSERT
  ON dbeel_nomenclature.fishway_type
  FOR EACH ROW
  EXECUTE PROCEDURE dbeel_nomenclature.nomenclature_id_insert();

-- Trigger: tr_fishway_type_update on dbeel_nomenclature.fishway_type

-- DROP TRIGGER tr_fishway_type_update ON dbeel_nomenclature.fishway_type;

CREATE TRIGGER tr_fishway_type_update
  BEFORE UPDATE
  ON dbeel_nomenclature.fishway_type
  FOR EACH ROW
  EXECUTE PROCEDURE dbeel_nomenclature.nomenclature_id_update();

INSERT INTO dbeel_nomenclature.fishway_type(no_name) SELECT 'Vertical slot fishway';
INSERT INTO dbeel_nomenclature.fishway_type(no_name) SELECT 'Pool type fishway';
INSERT INTO dbeel_nomenclature.fishway_type(no_name) SELECT 'Fish lock';
INSERT INTO dbeel_nomenclature.fishway_type(no_name) SELECT 'Denil pass';
INSERT INTO dbeel_nomenclature.fishway_type(no_name) SELECT 'Fish lift';
INSERT INTO dbeel_nomenclature.fishway_type(no_name) SELECT 'Rock ramp';
INSERT INTO dbeel_nomenclature.fishway_type(no_name) SELECT 'Eel ramp';
INSERT INTO dbeel_nomenclature.fishway_type(no_name) SELECT 'Lateral canal';
INSERT INTO dbeel_nomenclature.fishway_type(no_name) SELECT 'Artificial river';
INSERT INTO dbeel_nomenclature.fishway_type(no_name) SELECT 'Unknown';
INSERT INTO dbeel_nomenclature.fishway_type(no_name) SELECT 'Sluice';

UPDATE dbeel_nomenclature.fishway_type SET no_type = 'Fishway type';

BEGIN;
UPDATE dbeel_nomenclature.fishway_type SET no_code='VS' where no_name='Vertical slot fishway';
UPDATE dbeel_nomenclature.fishway_type SET no_code='PO' where no_name='Pool type fishway';
UPDATE dbeel_nomenclature.fishway_type SET no_code='FL' where no_name='Fish lock';
UPDATE dbeel_nomenclature.fishway_type SET no_code='D' where no_name='Denil pass';
UPDATE dbeel_nomenclature.fishway_type SET no_code='RR' where no_name='Rock ramp';
UPDATE dbeel_nomenclature.fishway_type SET no_code='ER' where no_name='Eel ramp';
UPDATE dbeel_nomenclature.fishway_type SET no_code='LA' where no_name='Lateral canal';
UPDATE dbeel_nomenclature.fishway_type SET no_code='AR' where no_name='Artificial river';
UPDATE dbeel_nomenclature.fishway_type SET no_code='?' where no_name='Unknown';
UPDATE dbeel_nomenclature.fishway_type SET no_code='S' where no_name='Sluice';
UPDATE dbeel_nomenclature.fishway_type SET no_code='L' where no_name='Fish lift';
COMMIT;

--select * from dbeel_nomenclature.fishway_type

/*

Cédric : corrections

select count(*), no_id from dbeel_nomenclature.nomenclature group by no_id order by count desc -- => 11 is duplicated
select * from dbeel_nomenclature.nomenclature where no_id =11
select * from dbeel_nomenclature.nomenclature order by no_type,no_id
SELECT max(no_id) from dbeel_nomenclature.nomenclature; -- =280
update dbeel_nomenclature.nomenclature set no_id=281 where no_name ='Obstacle location';
select * from dbeel_nomenclature.nomenclature where no_id=11;
select * from sudoang.dbeel_obstruction_place limit 10
select * from dbeel_nomenclature.observation_place_type 
select * from dbeel_nomenclature.nomenclature where no_id =281

update dbeel_nomenclature.nomenclature set no_type='Biological characteristic type' where no_type ='Biological';
update dbeel_nomenclature.nomenclature set no_type='Fishway type' where no_id=280;
-- ci dessous on ne peut pas passer par un update à cause du trigger, donc on rajoute une ligne et on en supprime une
insert into dbeel_nomenclature.nomenclature values (281, NULL, 'Observation place','Obstacle location'); -- probably not good doubles my line but otherwise fails
begin;
UPDATE dbeel_nomenclature.observation_place_type set no_id=281 where no_id=11; -- CASCADE ON sudoang.dbeel_obstruction_place
-- UPDATE already update
COMMIT;
-*/
/* 
AFTER SEVERAL TRIALS HERE IS A CLEAN SOLUTION
*/

ALTER TABLE sudoang.dbeel_obstruction_place drop constraint  fk_so_observation_place_type_id;
DELETE FROM dbeel_nomenclature.observation_place_type where no_id=11 and no_name ='Obstacle location';
INSERT INTO dbeel_nomenclature.observation_place_type values (281, NULL, 'Observation place', 'Obstacle location','Geographic');
-- insert automatically in dbeel_nomenclature this is what we needed to do (in a first attempt I was modifying nomenclature and it didn't work)
UPDATE  sudoang.dbeel_obstruction_place set op_no_observationplacetype=281 where op_no_observationplacetype=11;
ALTER TABLE sudoang.dbeel_obstruction_place
 ADD CONSTRAINT fk_so_observation_place_type_id FOREIGN KEY (op_no_observationplacetype)
      REFERENCES dbeel_nomenclature.observation_place_type (no_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT;

update dbeel_nomenclature.nomenclature set no_type='Biological characteristic type' where no_type ='Biological';
update dbeel_nomenclature.nomenclature set no_type='Fishway type' where no_id=280;


/* UPDATING PHYSICAL OBSTRUCTION FOR MITIGATION MEASURE */

-- Mitigation_measure
ALTER SEQUENCE dbeel_nomenclature.nomenclature_no_id_seq  RESTART WITH 282;
BEGIN;
-- DROP TABLE dbeel_nomenclature.downstream_mitigation_measure;

CREATE TABLE dbeel_nomenclature.downstream_mitigation_measure
(
-- Heredado from table dbeel_nomenclature.nomenclature:  no_id integer NOT NULL DEFAULT nextval('dbeel_nomenclature.nomenclature_no_id_seq'::regclass),
-- Heredado from table dbeel_nomenclature.nomenclature:  no_code character varying(2),
-- Heredado from table dbeel_nomenclature.nomenclature:  no_type character varying(60),
-- Heredado from table dbeel_nomenclature.nomenclature:  no_name character varying(80),
  CONSTRAINT c_pk_downstream_mitigation_measure PRIMARY KEY (no_id)
)
INHERITS (dbeel_nomenclature.nomenclature)
WITH (
  OIDS=FALSE
);
ALTER TABLE dbeel_nomenclature.downstream_mitigation_measure
  OWNER TO postgres;


CREATE TRIGGER downstream_mitigation_measure_insert
  BEFORE INSERT
  ON dbeel_nomenclature.downstream_mitigation_measure
  FOR EACH ROW
  EXECUTE PROCEDURE dbeel_nomenclature.nomenclature_id_insert();


CREATE TRIGGER downstream_mitigation_measure_update
  BEFORE UPDATE
  ON dbeel_nomenclature.downstream_mitigation_measure
  FOR EACH ROW
  EXECUTE PROCEDURE dbeel_nomenclature.nomenclature_id_update();

INSERT INTO dbeel_nomenclature.downstream_mitigation_measure(no_name) SELECT 'Water intake';
INSERT INTO dbeel_nomenclature.downstream_mitigation_measure(no_name) SELECT 'Fish friendly turbine';
INSERT INTO dbeel_nomenclature.downstream_mitigation_measure(no_name) SELECT 'Fish adapted Management';


UPDATE dbeel_nomenclature.downstream_mitigation_measure SET no_type = 'downstream mitigation measure'; --3

COMMIT;

SELECT * from dbeel_nomenclature.downstream_mitigation_measure

/*
no_id;no_code;no_type;no_name
282;;downstream mitigation measure;Water intake
283;;downstream mitigation measure;Fish friendly turbine
284;;downstream mitigation measure;Fish adapted Management
*/

-- mitigation measure for downstream migration



ALTER TABLE dbeel.physical_obstruction add column mitigation_measure_no_id integer;
COMMENT ON COLUMN dbeel.physical_obstruction.mitigation_measure_no_id is 'Type of measure for downtream migration mitigation';
ALTER TABLE dbeel.physical_obstruction ADD CONSTRAINT c_fk_mitigation_measure_no_id FOREIGN KEY (mitigation_measure_no_id) REFERENCES dbeel_nomenclature.downstream_mitigation_measure (no_id) ON UPDATE CASCADE ON DELETE CASCADE; 

ALTER TABLE sudoang.dbeel_physical_obstruction add column mitigationmeasureid ;
COMMENT ON sudoang.dbeel_physical_obstruction.mitigationmeasureid IS 'id of the downstream migration mitigation measure straight from bdoe.devalaison_ouvrage.doe_mcd_id';
ALTER TABLE sudoang.dbeel_physical_obstruction add column bdoemcdlabel ;
COMMENT ON sudoang.dbeel_physical_obstruction.bdoe_doe_mcd_label IS 'label of the downstream migration mitigation measure from bdoe.devalaison_ouvrage.mcd_label';

-- select * from dbeel_nomenclature.obstruction_impact
/*
1;0;Barrière totale
2;0.33;Barrière partielle à impact majeur
3;0.66;Barrière partielle à impact significatif
4;1;Barrière franchissable à impact limité
5;NC;Barrière à impact indéterminé
6;DNA;Dispositif manifestement mal ou non adapté aux espèces cibles dans le contexte hydrologique du pré-diagnostic, un diagnostic plus poussé peut s'avérer nécessaire
7;DA;Dispositif adapté aux espèces cibles dans le contexte hydrologique du pré-diagnostic, sous réserve de l'expertise des conditions hydrauliques dans l'ouvrage et de son attractivité
*/

BEGIN;
insert into dbeel_nomenclature.obstruction_impact (no_code,no_type, no_name) VALUES ('LI','Obstruction impact', 'Barrier passable with Limited Impact (source ICE)');
insert into dbeel_nomenclature.obstruction_impact (no_code,no_type, no_name) VALUES ('SO','Obstruction impact', 'Partial barrier with Some Impact (source ICE)');
insert into dbeel_nomenclature.obstruction_impact (no_code,no_type, no_name) VALUES ('MA','Obstruction impact', 'Partial barrier with Major Impact (source ICE)');
insert into dbeel_nomenclature.obstruction_impact (no_code,no_type, no_name) VALUES ('TO','Obstruction impact', 'Total barrier (source ICE)');
UPDATE dbeel_nomenclature.obstruction_impact set no_code='NA' where no_id=208;
UPDATE dbeel_nomenclature.obstruction_impact set no_code='0' where no_id=209;
UPDATE dbeel_nomenclature.obstruction_impact set no_code='1' where no_id=210;
UPDATE dbeel_nomenclature.obstruction_impact set no_code='2' where no_id=211;
UPDATE dbeel_nomenclature.obstruction_impact set no_code='3' where no_id=212;
UPDATE dbeel_nomenclature.obstruction_impact set no_code='4' where no_id=213;
UPDATE dbeel_nomenclature.obstruction_impact set no_code='5' where no_id=214;
UPDATE dbeel_nomenclature.obstruction_impact set no_code='LO' where no_id=267;
UPDATE dbeel_nomenclature.obstruction_impact set no_code='ME' where no_id=268;
UPDATE dbeel_nomenclature.obstruction_impact set no_code='HI' where no_id=269;
COMMIT;
select * from dbeel_nomenclature.obstruction_impact



---------------------------------------------------------------
-- dbeel_nomenclature MODIFICATION : physical obstruction category
---------------------------------------------------------------

---- SELECT * FROM dbeel_nomenclature.obstruction_type
/*
218		Obstruction type	Unknown
219		Obstruction type	Physical obstruction
220		Obstruction type	Chemical obstruction
*/
BEGIN;
-- first fix an error in trigger firing insert on update
DROP TRIGGER tr_obstruction_type_update ON dbeel_nomenclature.obstruction_type;
CREATE TRIGGER tr_obstruction_type_update
  BEFORE UPDATE
  ON dbeel_nomenclature.obstruction_type
  FOR EACH ROW
  EXECUTE PROCEDURE dbeel_nomenclature.nomenclature_id_update();
COMMIT;

BEGIN;
COMMENT ON TABLE dbeel_nomenclature.obstruction_type IS 'This table used to contain only physical obstruction as type, the types have been extended during sudoang';
UPDATE dbeel_nomenclature.nomenclature SET no_code ='UN' WHERE no_id=218;
INSERT INTO dbeel_nomenclature.obstruction_type(no_id,no_type,no_code,no_name) SELECT 291,'Obstruction_type','DA','Dam';-- Barrage
INSERT INTO dbeel_nomenclature.obstruction_type(no_id,no_type,no_code,no_name) SELECT 292,'Obstruction_type','WE','Weir'; -- this covers both radier and deversoir
INSERT INTO dbeel_nomenclature.obstruction_type(no_id,no_type,no_code,no_name) SELECT 293,'Obstruction_type','RR','Rock ramp'; -- this corresponds to Enrochement
INSERT INTO dbeel_nomenclature.obstruction_type(no_id,no_type,no_code,no_name) SELECT 294,'Obstruction_type','CU','Culvert'; -- Buse
INSERT INTO dbeel_nomenclature.obstruction_type(no_id,no_type,no_code,no_name) VALUES (295,'Obstruction_type','FO','Ford'); -- Passage à Gué
INSERT INTO dbeel_nomenclature.obstruction_type(no_id,no_type,no_code,no_name) VALUES (296,'Obstruction_type','BR','Bridge');-- obstacle induit par un pont
INSERT INTO dbeel_nomenclature.obstruction_type(no_id,no_type,no_code,no_name) VALUES (297,'Obstruction_type','OT','Other'); -- Autre type
ALTER SEQUENCE dbeel_nomenclature.nomenclature_no_id_seq RESTART WITH 297;

INSERT INTO dbeel_nomenclature.obstruction_type(no_id,no_type,no_code,no_name) VALUES (298,'Obstruction_type','DI','Dike'); -- Digue
ALTER SEQUENCE dbeel_nomenclature.nomenclature_no_id_seq RESTART WITH 298;

INSERT INTO dbeel_nomenclature.obstruction_type(no_id,no_type,no_code,no_name) VALUES (299,'Obstruction_type','GR','Grid'); -- Grille de pisciculture
ALTER SEQUENCE dbeel_nomenclature.nomenclature_no_id_seq RESTART WITH 299;


INSERT INTO dbeel_nomenclature.obstruction_type(no_id,no_type,no_code,no_name) VALUES (300,'Obstruction_type','PP','Penstock Pipe'); -- conduite forcée conducción forzada
ALTER SEQUENCE dbeel_nomenclature.nomenclature_no_id_seq RESTART WITH 300;

UPDATE  dbeel_nomenclature.nomenclature SET (no_code,no_name)=('PU','Physical obstruction (Unknown)') WHERE no_name='Physical obstruction';
UPDATE  dbeel_nomenclature.nomenclature SET (no_code)=('CH') WHERE no_name='Chemical obstruction';
COMMIT;

INSERT INTO dbeel_nomenclature.obstruction_type(no_id,no_type,no_code,no_name) VALUES (300,'Obstruction_type','PP','Penstock Pipe'); -- conduite forcée conducción forzada
ALTER SEQUENCE dbeel_nomenclature.nomenclature_no_id_seq RESTART WITH 300; 

SELECT * FROM dbeel_nomenclature.obstruction_type ORDER BY no_id;
/*
|no_id      |no_code|no_type                                                     |no_name                                                                         |
|-----------|-------|------------------------------------------------------------|--------------------------------------------------------------------------------|
|218        |UN     |Obstruction type                                            |Unknown                                                                         |
|219        |PU     |Obstruction type                                            |Physical obstruction (Unknown)                                                  |
|220        |CH     |Obstruction type                                            |Chemical obstruction                                                            |
|291        |DA     |Obstruction_type                                            |Dam                                                                             |
|292        |WE     |Obstruction_type                                            |Weir                                                                            |
|293        |RR     |Obstruction_type                                            |Rock ramp                                                                       |
|294        |CU     |Obstruction_type                                            |Culvert                                                                         |
|295        |FO     |Obstruction_type                                            |Ford                                                                            |
|296        |BR     |Obstruction_type                                            |Bridge                                                                          |
|297        |OT     |Obstruction_type                                            |Other                                                                           |
|298        |DI     |Obstruction_type                                            |Dike                                                                            |
|299        |GR     |Obstruction_type                                            |Grid                                                                            |

*/


--------------------------------------------------------------------------------------------
-- UPDATE TYPE OF METHOD FOR SUDOANG 13/03/2020
--------------------------------------------------------------------------------------------
SELECT * FROM sudoang.dbeel_electrofishing de;
-- even in dbeel_electrofishing the is only one type : 61 = unknown
SELECT count(ef_no_fishingmethod), ef_no_fishingmethod FROM dbeel.electrofishing GROUP BY ef_no_fishingmethod
-- So we can modify the dbeel to suit our needs
SELECT * FROM dbeel_nomenclature.scientific_observation_method
/*
 * 
61		Scientific observation type	Unknown	Electro-fishing	
62		Scientific observation type	Whole	Electro-fishing	
63		Scientific observation type	Partial1bank	Electro-fishing	
64		Scientific observation type	Partial2banks	Electro-fishing	
65		Scientific observation type	Partialrandom	Electro-fishing	
66		Scientific observation type	Partialprop	Electro-fishing	
67		Scientific observation type	Other	Electro-fishing	
*/

/*
* > unique(ers_full_france$methodeprospection)
*  [1] com gm  ber coa iaa
*  Levels: com coa iaa ber gm
* whole com
* Partial1bank ber
* Partialrandom gm
* Partialprop   ...
* Other         ...
* wholeeel      coa    301
* pointeel      iaa    302
*/
-- UPDATE NAMES FOR EXISTING ELECTROFISHING TYPES
UPDATE dbeel_nomenclature.scientific_observation_method set (no_code,sc_definition)=('NA','Unknown scientific observation of unknown category') where no_id=60;
UPDATE dbeel_nomenclature.scientific_observation_method set (no_code,sc_definition)=('UN','Electrofishing, method unknown') where no_id=61;
UPDATE dbeel_nomenclature.scientific_observation_method set (no_code,sc_definition)=('WH','Electrofishing, full two pass by foot') where no_id=62;
UPDATE dbeel_nomenclature.scientific_observation_method set (no_code,sc_definition)=('P1','Electrofishing, partial on one bank') where no_id=63;
UPDATE dbeel_nomenclature.scientific_observation_method set (no_code,sc_definition)=('P2','Electrofishing, partial on two banks') where no_id=64;
UPDATE dbeel_nomenclature.scientific_observation_method set (no_code,sc_definition)=('PR','Electrofishing, partial random') where no_id=65;
UPDATE dbeel_nomenclature.scientific_observation_method set (no_code,sc_definition)=('PR','Electrofishing, partial proportional') where no_id=66;
UPDATE dbeel_nomenclature.scientific_observation_method set (no_code,sc_definition)=('OT','Electrofishing, other method') where no_id=67;
-- ADD NEW CATEGORIES
INSERT INTO dbeel_nomenclature.scientific_observation_method(no_id,no_code,no_type,no_name,sc_observation_category,sc_definition) 
SELECT 301,'DH','Scientific_observation_type','Deep habitat','Electro-fishing','Normalized method for deep habitat (Belliard et al.,2018)';-- Pêche grands milieux
INSERT INTO dbeel_nomenclature.scientific_observation_method(no_id,no_code,no_type,no_name,sc_observation_category,sc_definition) 
SELECT 302,'WE','Scientific_observation_type','Whole eel','Electro-fishing','Electrofishing, whole eel specific';-- COA
INSERT INTO dbeel_nomenclature.scientific_observation_method(no_id,no_code,no_type,no_name,sc_observation_category,sc_definition) 
SELECT 303,'PE','Scientific_observation_type','Point sampling eel','Electro-fishing','Electrofishing, eel specific point sampling (Germis, 2009)';-- point sampling
ALTER SEQUENCE dbeel_nomenclature.nomenclature_no_id_seq RESTART WITH 303;

-- TO BE UPDATED MARIA / DENIS 26/04 (added two electrofishing types from ireland)
--DELETE FROM dbeel_nomenclature.scientific_observation_method WHERE no_id IN (304,305)
INSERT INTO dbeel_nomenclature.scientific_observation_method(no_id,no_code,no_type,no_name,sc_observation_category,sc_definition) 
SELECT 305,'BB','Scientific_observation_type','Boom boat','Electro-fishing','Boom boat (Pulsed)';--1
INSERT INTO dbeel_nomenclature.scientific_observation_method(no_id,no_code,no_type,no_name,sc_observation_category,sc_definition) 
SELECT 304,'TE','Scientific_observation_type','TEF','Electro-fishing','Timed electrofishing, 10 min in Ireland';--1


-- about 300 operations in RSA, can be either with boat or foot ,currently mixed
INSERT INTO dbeel_nomenclature.scientific_observation_method(no_id,no_code,no_type,no_name,sc_observation_category,sc_definition) 
SELECT 306,'EP','Scientific_observation_type','EPA','Electro-fishing','Partial point sampling with density current, protocol Feunteun, Rigaud';--1






--------------------------------------------------------------------------------------------
-- CREATING INDEXES 13/03/2020
--------------------------------------------------------------------------------------------

--ADD an INDEX TO dbeel.electrofishing 

CREATE INDEX dbeel_electrofishing_ix_ob_id 
ON dbeel.electrofishing
USING btree(ob_id);

CREATE INDEX dbeel_electrofishing_ix_ob_op_id 
ON dbeel.electrofishing
USING btree(ob_op_id);

--ADD an INDEX TO dbeel.station 

CREATE INDEX dbeel_observation_place_ix_op_id 
ON dbeel.observation_places 
USING btree(op_id);

--ADD INDEX to dbeel_batch

CREATE INDEX dbeel_batch_ix_ba_id 
ON dbeel.batch 
USING btree(ba_id);

CREATE INDEX dbeel_batch_ix_ba_ob_id 
ON dbeel.batch 
USING btree(ba_ob_id);


--ADD INDEX to dbeel_biological_characteristic
CREATE INDEX dbeel_biological_characteristic_ix_bc_id 
ON dbeel.biological_characteristic 
USING btree(bc_id);

CREATE INDEX dbeel_biological_characteristic_ix_bc_ba_id 
ON dbeel.biological_characteristic 
USING btree(bc_ba_id);

--ADD an INDEX TO sudoang.station


CREATE INDEX sudoang_dbeel_station_op_id 
ON sudoang.dbeel_station
USING btree(op_id);

--ADD an INDEX TO sudoang.electrofishing

CREATE INDEX sudoang_dbeel_electrofishing_ob_id 
ON sudoang.dbeel_electrofishing 
USING btree(ob_id);

CREATE INDEX sudoang_dbeel_electrofishing_ob_op_id 
ON sudoang.dbeel_electrofishing 
USING btree(ob_op_id);

--ADD an INDEX TO sudoang.batch_op


CREATE INDEX sudoang_dbeel_batch_ba_id 
ON sudoang.dbeel_batch_ope 
USING btree(ba_id);

CREATE INDEX sudoang_dbeel_batch_ba_ob_id 
ON sudoang.dbeel_batch_ope 
USING btree(ba_ob_id);

--ADD an INDEX TO sudoang.batch_fish

CREATE INDEX sudoang_dbeel_batch_fish_ba_id 
ON sudoang.dbeel_batch_fish 
USING btree(ba_id);

CREATE INDEX sudoang_dbeel_batch_fish_ba_ob_id 
ON sudoang.dbeel_batch_fish  
USING btree(ba_ob_id);

CREATE INDEX sudoang_dbeel_obstruction_place_country
ON sudoang.dbeel_obstruction_place 
USING btree(country);


