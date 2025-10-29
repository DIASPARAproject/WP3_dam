
CREATE SCHEMA dam_france;

-- dam_france.physical_obstruction definition

GRANT SELECT ON SCHEMA dam_france TO diaspara_read;
ALTER SCHEMA dam_france OWNER TO diaspara_admin;

INSERT INTO dam.data_provider
(dp_id, dp_name, dp_edmo_key, dp_establishment_name)
VALUES (1, 'Pierre Sagnes', NULL, 'Office français pour la biodiversité');    -- not sure that OFB is in EDMO


-- dam_france.obstruction_place definition

-- Drop table

-- DROP TABLE dam_france.obstruction_place;

CREATE TABLE dam_france.obstruction_place(
  CONSTRAINT uk_op_id_original UNIQUE (op_id_original),
  CONSTRAINT obstruction_place_pkey PRIMARY KEY (op_id),
  --CONSTRAINT fk_op_op_id FOREIGN KEY(op_op_id) 
  --REFERENCES dam_france.obstruction_place(op_id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_op_country FOREIGN KEY (op_country)
  REFERENCES ref.tr_country_cou(cou_code) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_op_dp_id   FOREIGN KEY (op_dp_id) 
  REFERENCES dam.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT
)
INHERITS (dam.obstruction_place);
CREATE INDEX obstruction_place_the_geom_idx ON dam_france.obstruction_place USING gist (geom);


INSERT INTO dam_france.obstruction_place
(op_id, 
op_placename, 
op_op_id, 
op_dp_id, 
op_id_original, 
op_country,
geom)
SELECT 
op_id,
op_placename,
op_op_id,
1 AS op_dp_id,
id_original AS op_id_original,
country,
the_geom AS geom
FROM
montepomi.dbeel_obstruction_place; --93359

GRANT SELECT ON TABLE dam_france.obstruction_place TO diaspara_read;
ALTER TABLE dam_france.obstruction_place OWNER TO diaspara_admin;



-- DROP TABLE dam_france.physical_obstruction;

CREATE TABLE dam_france.obstruction(  
  CONSTRAINT nn_ob_ending_date CHECK ((ob_ending_date IS NOT NULL)),
  CONSTRAINT nn_ob_starting_date CHECK ((ob_starting_date IS NOT NULL)),
  CONSTRAINT uk_ob_id_date UNIQUE (ob_id, ob_starting_date, ob_ending_date),
  CONSTRAINT physical_obstruction_pkey PRIMARY KEY (ob_id),
  CONSTRAINT fk_ob_op_id FOREIGN KEY (ob_op_id) REFERENCES dam_france.obstruction_place(op_id) ON UPDATE CASCADE ON DELETE RESTRICT,  
  CONSTRAINT fk_ob_fishway_type_no_id FOREIGN KEY (ob_fishway_type_no_id) REFERENCES nomenclature.fishway_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_ob_mitigation_measure_no_id FOREIGN KEY (ob_mitigation_measure_no_id) REFERENCES nomenclature.downstream_mitigation_measure(no_id) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_ob_event_change_no_id FOREIGN KEY (ob_event_change_no_id) REFERENCES nomenclature.event_change(no_id) ON UPDATE CASCADE ON DELETE RESTRICT 
)
INHERITS (dam.obstruction);

GRANT SELECT ON TABLE dam_france.obstruction TO diaspara_read;
ALTER TABLE dam_france.obstruction OWNER TO diaspara_admin;
--SELECT DISTINCT ouv_type_evt FROM montepomi.dbeel_physical_obstruction 


INSERT INTO dam_france.obstruction
(ob_id,
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
ob_event_change_no_id)
SELECT
ob_id,
ob_starting_date, 
ob_ending_date, 
ob_op_id, 
ot_no_obstruction_type AS ob_obstruction_type_no_id, 
NULL AS ob_fishway_type_no_id,
mitigation_measure_no_id AS ob_mitigation_measure_no_id,
po_obstruction_height AS ob_height,
h_chute_date_mesure AS ob_height_date,
po_downs_water_depth AS ob_downs_water_depth, 
CURRENT_DATE AS ob_date_last_update,
CASE WHEN ouv_type_evt = 'date construction ouvrage' THEN 308
     WHEN ouv_type_evt = 'fin activité usage' THEN 311
     WHEN ouv_type_evt = 'début activité usage' THEN 309
     WHEN ouv_type_evt = 'derasement' THEN 313
     WHEN ouv_type_evt = 'arasement' THEN 310
     WHEN ouv_type_evt = 'dispositif de franchissement' THEN 332
     WHEN ouv_type_evt =  'date debut (defaut)' THEN 307
     ELSE NULL END AS ob_event_change_no_id
FROM montepomi.dbeel_physical_obstruction ; -- 99224




-- dam_france.hpp 
-- DROP TABLE dam_france.hpp;

CREATE TABLE dam_france.hpp (
  CONSTRAINT c_pk_hpp_id PRIMARY KEY (hpp_id),
  CONSTRAINT c_fk_hpp_ob_id FOREIGN KEY (hpp_ob_id) REFERENCES dam_france.obstruction(ob_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT c_fk_hpp_orient_flow_no_id FOREIGN KEY (hpp_orient_flow_no_id) REFERENCES nomenclature.orient_flow(no_id) ON DELETE CASCADE ON UPDATE CASCADE
)
INHERITS (dam.hpp);

INSERT INTO dam_france.hpp
(hpp_id, 
hpp_ob_id, 
hpp_name, 
hpp_presence_bypass, 
hpp_total_flow_bypass,
hpp_orient_flow_no_id,
hpp_presence_of_bar_rack,
hpp_bar_rack_space, 
hpp_surface_bar_rack,
hpp_inclination_bar_rack,
hpp_presence_bypass_trashrack,
hpp_nb_trashrack_bypass, 
hpp_turb_max_flow,
hpp_reserved_flow,
hpp_flow_trashrack_bypass,
hpp_max_power, 
hpp_nb_turbines, 
hpp_turbine_type, 
hpp_orientation_bar_rack,
hpp_id_original, 
hpp_source)
SELECT
hpp_id, 
hpp_ob_id, 
hpp_name, 
hpp_presence_bypass, 
hpp_total_flow_bypass,
hpp_orient_flow_no_id,
hpp_presence_of_bar_rack,
hpp_bar_rack_space, 
hpp_surface_bar_rack,
hpp_inclination_bar_rack,
hpp_presence_bypass_trashrack,
hpp_nb_trashrack_bypass, 
hpp_turb_max_flow,
hpp_reserved_flow,
hpp_flow_trashrack_bypass,
hpp_max_power, 
NULL AS hpp_nb_turbines, 
NULL AS hpp_turbine_type, 
hpp_orientation_bar_rack,
hpp_id_original, 
hpp_source 
FROM montepomi.dbeel_hpp ; -- 6909

GRANT SELECT ON TABLE dam_france.hpp TO diaspara_read;
ALTER TABLE dam_france.hpp OWNER TO diaspara_admin;
-- DROP TABLE dam_france.physical_obstruction_pass_species;

CREATE TABLE dam_france.fishway (
  CONSTRAINT fishway_pkey PRIMARY KEY (fi_ob_id, fi_species_id),
  CONSTRAINT fk_fi_fishway_id FOREIGN KEY (fi_fishway_id) REFERENCES nomenclature.fishway_type(no_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_fi_species_id FOREIGN KEY (fi_species_id) REFERENCES nomenclature.species(no_id) ON DELETE RESTRICT ON UPDATE CASCADE
) INHERITS (dam.fishway);


-- there are duplicates in the original table (two different fishways), this is wrong we evaluate if there is a functional fishway at the dam level.
INSERT INTO dam_france.fishway
(fi_ob_id, 
fi_op_id, 
fi_id_original, 
fi_species_id, 
fi_fishway_id, 
fi_presence_pass,
fi_date)
SELECT
DISTINCT ON (ob_id,species)
ob_id AS fi_ob_id, 
op_id AS fi_op_id, 
id_original AS fi_id_original, 
CASE WHEN species ='alose' THEN 317
     WHEN species = 'anguille' THEN 30
     WHEN species = 'saumon' THEN 315
     WHEN species = 'civelle' THEN 333
     WHEN species = 'lamproie' THEN 319
     END AS fi_fishway_id,
NULL AS fi_fishway_id, 
po_presence_pass  AS fi_presence_pass,
date_passe AS fi_date
FROM montepomi.dbeel_physical_obstruction_pass_species; --286255



-- dam_france.bypass definition

-- Drop table

-- DROP TABLE dam_france.bypass;

CREATE TABLE dam_france.bypass (
  CONSTRAINT c_pk_bypass_id PRIMARY KEY (bypass_id),
  CONSTRAINT c_fk_bypass_hpp_id FOREIGN KEY (bypass_hpp_id) REFERENCES dam_france.hpp(hpp_id) ON DELETE CASCADE ON UPDATE CASCADE
)
INHERITS (dam.bypass);

GRANT SELECT ON TABLE dam_france.bypass TO diaspara_read;
ALTER TABLE dam_france.bypass OWNER TO diaspara_admin;
-- dam_france.turbine definition

-- Drop table

-- DROP TABLE dam_france.turbine;

CREATE TABLE dam_france.turbine (
  CONSTRAINT c_pk_turb_id PRIMARY KEY (turb_id),
  CONSTRAINT c_fk_turb_hpp_id FOREIGN KEY (turb_hpp_id) REFERENCES dam_france.hpp(hpp_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT c_fk_turb_turbine_type_no_id FOREIGN KEY (turb_turbine_type_no_id) REFERENCES nomenclature.turbine_type(no_id) ON DELETE CASCADE ON UPDATE CASCADE
)
INHERITS (dam.turbine);

INSERT INTO dam_france.turbine(
turb_id,
turb_hpp_id,
turb_turbine_type_no_id, 
turb_in_service, 
turb_max_power, 
turb_min_working_flow, 
turb_hpp_height, 
turb_diameter, 
turb_rotation_speed, 
turb_nb_blades, 
turb_max_turbine_flow, 
turb_description)
SELECT 
turb_id,
turb_hpp_id,
turb_turbine_type_no_id, 
turb_in_service, 
turb_max_power, 
turb_min_working_flow, 
turb_hpp_height, 
turb_diameter, 
turb_rotation_speed, 
turb_nb_blades, 
turb_max_turbine_flow, 
turb_description
FROM montepomi.dbeel_turbine ; --1139


GRANT SELECT ON TABLE dam_france.turbine TO diaspara_read;
ALTER TABLE dam_france.turbine OWNER TO diaspara_admin;








