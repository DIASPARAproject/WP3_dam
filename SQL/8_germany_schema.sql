-- ***************************************************
-- Creating schema Germany (with diaspara_admin right)
-- ***************************************************

CREATE SCHEMA dam_de;
ALTER SCHEMA dam_de OWNER TO diaspara_admin;
GRANT USAGE ON SCHEMA dam_de TO diaspara_admin;
COMMENT ON SCHEMA dam_de is 'Data from Germany';

--OBSTRUCTION_PLACE

-- Name: obstruction_place; Type: TABLE; Schema: dam_de; Owner: diaspara_admin
DROP TABLE IF EXISTS dam_de.obstruction_place; 
CREATE TABLE dam_de.obstruction_place (
op_x NUMERIC,
op_y NUMERIC, 
op_state TEXT,
op_sourcelayer TEXT,
op_idnational BIGINT,
op_watername TEXT,
op_watercode BIGINT,
op_wfdwaterbody TEXT,
op_status TEXT,
CONSTRAINT pk_obstruction_place PRIMARY KEY (op_id),
CONSTRAINT uk_op_id_original UNIQUE (op_id_original),
CONSTRAINT fk_op_country FOREIGN KEY (op_country) 
	REFERENCES ref.tr_country_cou(cou_code) ON UPDATE CASCADE ON DELETE restrict
)
INHERITS (dam.obstruction_place);

-- Name: obstruction_place_the_geom_idx; Type: INDEX; Schema: dam_de; Owner: diaspara_admin
CREATE INDEX obstruction_place_the_geom_idx 
    ON dam_de.obstruction_place USING gist (geom);

-- Name: obstruction_place op_id; Type: DEFAULT; Schema: dam_de; Owner: diaspara_admin
ALTER TABLE ONLY dam_de.obstruction_place ALTER COLUMN op_id SET DEFAULT public.uuid_generate_v4();

-- add a comment for status that it is exclusive to sh from the data we have so far
COMMENT ON COLUMN dam_de.obstruction_place.op_status IS 'so far only from sh' ;

-- set owner/read rigths
ALTER TABLE dam_de.obstruction_place OWNER TO diaspara_admin;
GRANT SELECT ON TABLE dam_de.obstruction_place TO diaspara_read;






--OBSTRUCTION

-- Name: obstruction; Type: TABLE; Schema: dam_de; Owner: diaspara_admin
CREATE TABLE dam_de.obstruction (
	ob_typecode TEXT,
	ob_typeoriginal1 TEXT,
	ob_typeoriginal2 TEXT,
	ob_typeoriginal3 TEXT,
	ob_heightsource TEXT,
	ob_passabilityuporiginal TEXT,
	ob_passabilitydownoriginal TEXT,
	ob_severityup TEXT,
	ob_severitydown TEXT,
	ob_potentialbarrier BOOLEAN,
	ob_hydropower BOOLEAN,
	ob_lengthm NUMERIC,
	ob_widthm NUMERIC,
	ob_culvertwidthm NUMERIC,
	ob_culvertheigthm NUMERIC,
	ob_culvertdiameterm NUMERIC,
	ob_nsteps INTEGER,
	ob_backwater TEXT,
	ob_impoundmentlengthm INTEGER,
	ob_velocityincreased BOOLEAN,
	ob_substrateimpaired BOOLEAN,
	ob_fishwayarrangement TEXT,
	ob_migratoryfishwater TEXT,
	ob_wfdrelevantwater BOOLEAN,
	ob_fishregion TEXT,
	ob_function TEXT,
	ob_material TEXT,
	ob_remarks TEXT,
	ob_daterecorded DATE,	
    CONSTRAINT nn_ob_ending_date CHECK (ob_ending_date IS NOT NULL),
    CONSTRAINT nn_ob_starting_date CHECK (ob_starting_date IS NOT NULL),
    CONSTRAINT physical_obstruction_pkey PRIMARY KEY (ob_id),
	CONSTRAINT uk_ob_id_date UNIQUE (ob_id, ob_starting_date, ob_ending_date),
	CONSTRAINT fk_ob_event_change_no_id FOREIGN KEY (ob_event_change_no_id) 
		REFERENCES nomenclature.event_change(no_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_ob_fishway_type_no_id FOREIGN KEY (ob_fishway_type_no_id) 
		REFERENCES nomenclature.fishway_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_ob_mitigation_measure_no_id FOREIGN KEY (ob_mitigation_measure_no_id) 
		REFERENCES nomenclature.downstream_mitigation_measure(no_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_ob_op_id FOREIGN KEY (ob_op_id) 
		REFERENCES dam_de.obstruction_place(op_id) ON UPDATE CASCADE ON DELETE RESTRICT
)
INHERITS (dam.obstruction);

-- set owner/read rigths
ALTER TABLE dam_de.obstruction OWNER TO diaspara_admin;
GRANT SELECT ON TABLE dam_de.obstruction TO diaspara_read;




--HPP

-- Name: hpp; Type: TABLE; Schema: dam_de; Owner: diaspara_admin
CREATE TABLE dam_de.hpp (
hpp_typeoriginal TEXT,
CONSTRAINT c_pk_hpp_id PRIMARY KEY (hpp_id),
CONSTRAINT c_fk_hpp_ob_id FOREIGN KEY (hpp_ob_id) 
	REFERENCES dam_de.obstruction(ob_id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT c_fk_hpp_orient_flow_no_id FOREIGN KEY (hpp_orient_flow_no_id) 
	REFERENCES nomenclature.orient_flow(no_id) ON UPDATE CASCADE ON DELETE CASCADE

)
INHERITS (dam.hpp);

-- set owner/read rigths
ALTER TABLE dam_de.hpp OWNER TO diaspara_admin;
GRANT SELECT ON TABLE dam_de.hpp TO diaspara_read;



CREATE TABLE dam_de.bypass (
)
INHERITS (dam.bypass);


ALTER TABLE dam_de.bypass OWNER TO diaspara_admin;
GRANT SELECT ON TABLE dam_de.bypass TO diaspara_read;

--
-- Name: fishway; Type: TABLE; Schema: dam_de; Owner: diaspara_admin
--

CREATE TABLE dam_de.fishway (
)
INHERITS (dam.fishway);


ALTER TABLE dam_de.fishway OWNER TO diaspara_admin;
GRANT SELECT ON TABLE dam_de.fishway TO diaspara_read;









--
-- Name: turbine; Type: TABLE; Schema: dam_de; Owner: diaspara_admin
--

CREATE TABLE dam_de.turbine (
)
INHERITS (dam.turbine);


ALTER TABLE dam_de.turbine OWNER TO diaspara_admin;

--
-- Name: view_ob_recent; Type: VIEW; Schema: dam_de; Owner: cedric
--

CREATE VIEW dam_de.view_ob_recent AS
 SELECT op.op_id,
    op.op_placename,
    op.op_id_original,
    obstruction_type.no_name AS dam_type,
    obstruction.ob_id,
    obstruction.ob_starting_date,
    obstruction.ob_ending_date,
    obstruction.ob_op_id,
    obstruction.ob_obstruction_type_no_id,
    obstruction.ob_fishway_type_no_id,
    obstruction.ob_mitigation_measure_no_id,
    obstruction.ob_height,
    obstruction.ob_height_date,
    obstruction.ob_downs_water_depth,
    obstruction.ob_date_last_update,
    obstruction.ob_event_change_no_id,
    op.geom
   FROM ((dam_de.obstruction_place op
     JOIN dam_de.obstruction ON ((op.op_id = obstruction.ob_op_id)))
     JOIN nomenclature.obstruction_type ON ((obstruction.ob_obstruction_type_no_id = obstruction_type.no_id)))
  WHERE ((obstruction.ob_starting_date < '2005-01-01'::date) AND (obstruction.ob_ending_date >= '2005-01-01'::date));


ALTER TABLE dam_de.view_ob_recent OWNER TO cedric;







--
-- Name: bypass c_pk_bypass_id; Type: CONSTRAINT; Schema: dam_de; Owner: diaspara_admin
--

ALTER TABLE ONLY dam_de.bypass
    ADD CONSTRAINT c_pk_bypass_id PRIMARY KEY (bypass_id);





--
-- Name: turbine c_pk_turb_id; Type: CONSTRAINT; Schema: dam_de; Owner: diaspara_admin
--

ALTER TABLE ONLY dam_de.turbine
    ADD CONSTRAINT c_pk_turb_id PRIMARY KEY (turb_id);


--
-- Name: fishway fishway_pkey; Type: CONSTRAINT; Schema: dam_de; Owner: diaspara_admin
--

ALTER TABLE ONLY dam_de.fishway
    ADD CONSTRAINT fishway_pkey PRIMARY KEY (fi_ob_id, fi_species_id);


--






--








--
-- Name: bypass c_fk_bypass_hpp_id; Type: FK CONSTRAINT; Schema: dam_de; Owner: diaspara_admin
--

ALTER TABLE ONLY dam_de.bypass
    ADD CONSTRAINT c_fk_bypass_hpp_id FOREIGN KEY (bypass_hpp_id) REFERENCES dam_de.hpp(hpp_id) ON UPDATE CASCADE ON DELETE CASCADE;








--
-- Name: turbine c_fk_turb_hpp_id; Type: FK CONSTRAINT; Schema: dam_de; Owner: diaspara_admin
--

ALTER TABLE ONLY dam_de.turbine
    ADD CONSTRAINT c_fk_turb_hpp_id FOREIGN KEY (turb_hpp_id) REFERENCES dam_de.hpp(hpp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: turbine c_fk_turb_turbine_type_no_id; Type: FK CONSTRAINT; Schema: dam_de; Owner: diaspara_admin
--

ALTER TABLE ONLY dam_de.turbine
    ADD CONSTRAINT c_fk_turb_turbine_type_no_id FOREIGN KEY (turb_turbine_type_no_id) REFERENCES nomenclature.turbine_type(no_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fishway fk_fi_fishway_id; Type: FK CONSTRAINT; Schema: dam_de; Owner: diaspara_admin
--

ALTER TABLE ONLY dam_de.fishway
    ADD CONSTRAINT fk_fi_fishway_id FOREIGN KEY (fi_fishway_id) REFERENCES nomenclature.fishway_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fishway fk_fi_species_id; Type: FK CONSTRAINT; Schema: dam_de; Owner: diaspara_admin
--

ALTER TABLE ONLY dam_de.fishway
    ADD CONSTRAINT fk_fi_species_id FOREIGN KEY (fi_species_id) REFERENCES nomenclature.species(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;
















--
-- Name: SCHEMA dam_de; Type: ACL; Schema: -; Owner: diaspara_admin
--

GRANT USAGE ON SCHEMA dam_de TO diaspara_read;


--
-- Name: TABLE bypass; Type: ACL; Schema: dam_de; Owner: diaspara_admin
--

GRANT SELECT ON TABLE dam_de.bypass TO diaspara_read;


--
-- Name: TABLE fishway; Type: ACL; Schema: dam_de; Owner: diaspara_admin
--

GRANT SELECT ON TABLE dam_de.fishway TO diaspara_read;


--
-- Name: TABLE hpp; Type: ACL; Schema: dam_de; Owner: diaspara_admin
--

GRANT SELECT ON TABLE dam_de.hpp TO diaspara_read;







--
-- Name: TABLE turbine; Type: ACL; Schema: dam_de; Owner: diaspara_admin
--

GRANT SELECT ON TABLE dam_de.turbine TO diaspara_read;


--
-- PostgreSQL database dump complete
--

