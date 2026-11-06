


INSERT INTO dam_de.obstruction(
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
ob_typecode,
ob_typeoriginal1,
ob_typeoriginal2,
ob_typeoriginal3,
ob_heightsource,
ob_passabilityuporiginal,
ob_passabilitydownoriginal,
ob_severityup,
ob_severitydown,
ob_potentialbarrier,
ob_hydropower,
ob_lengthm,
ob_widthm,
ob_culvertwidthm,
ob_culvertheigthm,
ob_culvertdiameterm,
ob_nsteps,
ob_backwater,
ob_impoundmentlengthm,
ob_velocityincreased,
ob_substrateimpaired,
ob_fishwayarrangement,
ob_migratoryfishwater,
ob_wfdrelevantwater,
ob_fishregion,
ob_function,
ob_material,
ob_remarks,
ob_daterecorded,
ob_id_original)

WITH temp_cor AS (
SELECT op_id, op_id_original FROM 
dam_de.obstruction_place as op )
SELECT 
'1800-01-01' AS ob_starting_date, 
'2035-01-01' ob_ending_date, 
op_id, 
ob_obstruction_type_no_id, 
ob_fishway_type_no_id, 
ob_mitigation_measure_no_id::integer,
ob_height, 
ob_height_date, 
ob_downs_water_depth::integer::numeric,
CURRENT_DATE AS ob_date_last_update, 
ob_event_change_no_id,
ob_type_code,
ob_type_original_1,
ob_type_original_2,
ob_type_original_3,
ob_height_source,
ob_passability_up_original,
ob_passability_down_original,
ob_severity_up, 
ob_severity_down,
ob_potential_barrier,
ob_hydropower, 
ob_length_m, 
ob_width_m, 
ob_culvert_width_m,
ob_culvert_height_m,
ob_culvert_diameter_m,
ob_n_steps,
ob_backwater,
ob_impoundment_length_m,
CASE WHEN ob_velocity_increased = 'Ja' THEN TRUE
     WHEN ob_velocity_increased = 'Nein' THEN FALSE
     WHEN ob_velocity_increased IS NULL THEN NULL
     END AS ob_velocity_increased,
CASE WHEN ob_substrate_impaired = 'Ja' THEN TRUE
     WHEN ob_substrate_impaired = 'Nein' THEN FALSE
     WHEN ob_substrate_impaired IS NULL THEN NULL
     END AS ob_substrate_impaired,     
ob_fishway_arrangement,
ob_migratory_fish_water,
CASE WHEN ob_wfd_relevant_water = 'Ja' THEN TRUE
     WHEN ob_wfd_relevant_water = 'Nein' THEN FALSE
     WHEN ob_wfd_relevant_water IS NULL THEN NULL
     END AS ob_wfd_relevant_water,
ob_fish_region, 
ob_function, 
ob_material,
ob_remarks, 
ob_date_recorded,
ob_op_id
FROM dam_de.temp_obstruction
JOIN temp_cor ON op_id_original = ob_op_id; -- 130897


INSERT INTO dam_de.data_provider (
dp_id,
dp_name,
dp_edmo_key,
dp_establishment_name)
SELECT 
dp_id,
dp_name, 
dp_edmo_key:: INTEGER,
dp_establishment_name
FROM dam_de.temp_data_provider; --3




ALTER TABLE dam_de.temp_obstruction_place OWNER TO diaspara_admin;
GRANT ALL ON TABLE dam_de.temp_obstruction_place TO diaspara_admin;
ALTER TABLE dam_de.temp_obstruction OWNER TO diaspara_admin;
GRANT ALL ON TABLE dam_de.temp_obstruction TO diaspara_admin;
GRANT diaspara_admin TO benedikt