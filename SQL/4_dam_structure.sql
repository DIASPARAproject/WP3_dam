--
-- PostgreSQL database dump
--

-- Dumped from database version 14.20 (Ubuntu 14.20-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: dam; Type: SCHEMA; Schema: -; Owner: diaspara_admin
--

CREATE SCHEMA dam;


ALTER SCHEMA dam OWNER TO diaspara_admin;

--
-- Name: fk_id_batch_insert(); Type: FUNCTION; Schema: dam; Owner: diaspara_admin
--

CREATE FUNCTION dam.fk_id_batch_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM ob_id FROM "dam".observations WHERE ob_id = NEW.ba_ob_id;
  IF FOUND THEN
	RETURN NEW;
  ELSE
	RAISE EXCEPTION '6- Invalid ba_ob_id (%)', NEW.ba_ob_id;
  END IF;
END
$$;


ALTER FUNCTION dam.fk_id_batch_insert() OWNER TO diaspara_admin;

--
-- Name: fk_id_environmental_characteristic_insert(); Type: FUNCTION; Schema: dam; Owner: diaspara_admin
--

CREATE FUNCTION dam.fk_id_environmental_characteristic_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM op_id FROM "dam".observation_places WHERE op_id = NEW.ec_op_id;
  IF FOUND THEN
	RETURN NEW;
  ELSE
	RAISE EXCEPTION '5- Invalid ec_op_id (%)', NEW.ec_op_id;
  END IF;
END
$$;


ALTER FUNCTION dam.fk_id_environmental_characteristic_insert() OWNER TO diaspara_admin;

--
-- Name: fk_id_observations_insert(); Type: FUNCTION; Schema: dam; Owner: diaspara_admin
--

CREATE FUNCTION dam.fk_id_observations_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM op_id FROM "dam".observation_places WHERE op_id = NEW.ob_op_id;
  IF FOUND THEN
	RETURN NEW;
  ELSE
	RAISE EXCEPTION '5- Invalid ob_op_id (%)', NEW.ob_op_id;
  END IF;
END
$$;


ALTER FUNCTION dam.fk_id_observations_insert() OWNER TO diaspara_admin;

--
-- Name: integrity_observation_places_verify(); Type: FUNCTION; Schema: dam; Owner: diaspara_admin
--

CREATE FUNCTION dam.integrity_observation_places_verify() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM ob_op_id FROM "dam".observations WHERE ob_op_id = OLD.op_id;
  IF FOUND THEN
	RAISE EXCEPTION 
	'6- You try to delete an observation places record while there is some records in observations refering to it. op_id: (%)', OLD.op_id;
/*
  ELSE
	PERFORM ec_op_id FROM "dam".environmental_characteristic WHERE ec_op_id = OLD.op_id;
	IF FOUND THEN
		RAISE EXCEPTION '6- You try to delete an observation places record while there is some records in environmental_characteristic refering to it. op_id: (%)', OLD.op_id;
		ELSE
			RETURN OLD;
		END IF;
*/
  END IF;
END
$$;


ALTER FUNCTION dam.integrity_observation_places_verify() OWNER TO diaspara_admin;

--
-- Name: integrity_observations_verify(); Type: FUNCTION; Schema: dam; Owner: diaspara_admin
--

CREATE FUNCTION dam.integrity_observations_verify() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM ba_ob_id FROM "dam".batch WHERE ba_ob_id = OLD.ob_id;
  IF FOUND THEN
	RAISE EXCEPTION 
	'6- You try to delete an observation record while there is some records in batch refering to it. ob_id: (%)', OLD.ob_id;
  ELSE
	RETURN OLD;
  END IF;
END
$$;


ALTER FUNCTION dam.integrity_observations_verify() OWNER TO diaspara_admin;

--
-- Name: observation_id_place_insert(); Type: FUNCTION; Schema: dam; Owner: diaspara_admin
--

CREATE FUNCTION dam.observation_id_place_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM op_id FROM "dam".observation_places WHERE op_id = NEW.op_id;
  IF FOUND THEN
	RAISE EXCEPTION '2- Invalid op_id (%)', NEW.op_id;
  ELSE
	RETURN NEW;
  END IF;
END
$$;


ALTER FUNCTION dam.observation_id_place_insert() OWNER TO diaspara_admin;

--
-- Name: observation_id_place_update(); Type: FUNCTION; Schema: dam; Owner: diaspara_admin
--

CREATE FUNCTION dam.observation_id_place_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.op_id = OLD.op_id THEN
	RETURN NEW;
  ELSE
	RAISE EXCEPTION 'Do not update op_id (%)', OLD.op_id;
  END IF;
END
$$;


ALTER FUNCTION dam.observation_id_place_update() OWNER TO diaspara_admin;

--
-- Name: observations_id_insert(); Type: FUNCTION; Schema: dam; Owner: diaspara_admin
--

CREATE FUNCTION dam.observations_id_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM ob_id FROM "dam".observations WHERE ob_id = NEW.ob_id;
  IF FOUND THEN
	RAISE EXCEPTION '3- Invalid ob_id (%)', NEW.ob_id;
  ELSE
	RETURN NEW;
  END IF;
END
$$;


ALTER FUNCTION dam.observations_id_insert() OWNER TO diaspara_admin;

--
-- Name: observations_id_update(); Type: FUNCTION; Schema: dam; Owner: diaspara_admin
--

CREATE FUNCTION dam.observations_id_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.ob_id = OLD.ob_id THEN
	RETURN NEW;
  ELSE
	RAISE EXCEPTION 'Do not update ob_id (%)', OLD.ob_id;
  END IF;
END
$$;


ALTER FUNCTION dam.observations_id_update() OWNER TO diaspara_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bypass; Type: TABLE; Schema: dam; Owner: diaspara_admin
--

CREATE TABLE dam.bypass (
    bypass_id uuid NOT NULL,
    bypass_hpp_id uuid,
    bypass_water_depth numeric,
    bypass_width numeric,
    bypass_is_flowing boolean
);


ALTER TABLE dam.bypass OWNER TO diaspara_admin;

--
-- Name: data_provider; Type: TABLE; Schema: dam; Owner: postgres
--

CREATE TABLE dam.data_provider (
    dp_id integer NOT NULL,
    dp_name character varying(60),
    dp_edmo_key integer,
    dp_establishment_name text
);


ALTER TABLE dam.data_provider OWNER TO postgres;

--
-- Name: data_provider_dp_id_seq; Type: SEQUENCE; Schema: dam; Owner: postgres
--

CREATE SEQUENCE dam.data_provider_dp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE dam.data_provider_dp_id_seq OWNER TO postgres;

--
-- Name: data_provider_dp_id_seq; Type: SEQUENCE OWNED BY; Schema: dam; Owner: postgres
--

ALTER SEQUENCE dam.data_provider_dp_id_seq OWNED BY dam.data_provider.dp_id;


--
-- Name: fishway; Type: TABLE; Schema: dam; Owner: diaspara_admin
--

CREATE TABLE dam.fishway (
    fi_ob_id uuid NOT NULL,
    fi_op_id uuid,
    fi_id_original character varying(10),
    fi_species_id integer NOT NULL,
    fi_fishway_id integer,
    fi_presence_pass boolean,
    fi_date date
);


ALTER TABLE dam.fishway OWNER TO diaspara_admin;

--
-- Name: hpp; Type: TABLE; Schema: dam; Owner: postgres
--

CREATE TABLE dam.hpp (
    hpp_id uuid NOT NULL,
    hpp_ob_id uuid,
    hpp_name text,
    hpp_presence_bypass boolean,
    hpp_total_flow_bypass numeric,
    hpp_orient_flow_no_id integer,
    hpp_presence_of_bar_rack boolean,
    hpp_bar_rack_space numeric,
    hpp_surface_bar_rack numeric,
    hpp_inclination_bar_rack numeric,
    hpp_presence_bypass_trashrack boolean,
    hpp_nb_trashrack_bypass integer,
    hpp_turb_max_flow numeric,
    hpp_reserved_flow numeric,
    hpp_flow_trashrack_bypass numeric,
    hpp_max_power numeric,
    hpp_nb_turbines integer,
    hpp_turbine_type integer,
    hpp_orientation_bar_rack numeric,
    hpp_id_original text,
    hpp_source text
);


ALTER TABLE dam.hpp OWNER TO postgres;

--
-- Name: obstruction; Type: TABLE; Schema: dam; Owner: diaspara_admin
--

CREATE TABLE dam.obstruction (
    ob_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    ob_starting_date date,
    ob_ending_date date,
    ob_op_id uuid NOT NULL,
    ob_obstruction_type_no_id integer,
    ob_fishway_type_no_id integer,
    ob_mitigation_measure_no_id integer,
    ob_height real,
    ob_height_date date,
    ob_downs_water_depth numeric,
    ob_date_last_update date,
    ob_event_change_no_id integer
);


ALTER TABLE dam.obstruction OWNER TO diaspara_admin;

--
-- Name: obstruction_place; Type: TABLE; Schema: dam; Owner: diaspara_admin
--

CREATE TABLE dam.obstruction_place (
    op_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    op_placename text,
    op_op_id uuid,
    op_dp_id integer,
    op_id_original text NOT NULL,
    op_country character varying(2),
    geom public.geometry
);


ALTER TABLE dam.obstruction_place OWNER TO diaspara_admin;

--
-- Name: turbine; Type: TABLE; Schema: dam; Owner: postgres
--

CREATE TABLE dam.turbine (
    turb_id uuid NOT NULL,
    turb_hpp_id uuid,
    turb_turbine_type_no_id integer,
    turb_in_service boolean,
    turb_max_power numeric,
    turb_min_working_flow numeric,
    turb_hpp_height numeric,
    turb_diameter numeric,
    turb_rotation_speed numeric,
    turb_nb_blades integer,
    turb_max_turbine_flow numeric,
    turb_description text
);


ALTER TABLE dam.turbine OWNER TO postgres;

--
-- Name: data_provider dp_id; Type: DEFAULT; Schema: dam; Owner: postgres
--

ALTER TABLE ONLY dam.data_provider ALTER COLUMN dp_id SET DEFAULT nextval('dam.data_provider_dp_id_seq'::regclass);


--
-- Name: bypass bypass_pkey; Type: CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.bypass
    ADD CONSTRAINT bypass_pkey PRIMARY KEY (bypass_id);


--
-- Name: data_provider data_provider_pkey; Type: CONSTRAINT; Schema: dam; Owner: postgres
--

ALTER TABLE ONLY dam.data_provider
    ADD CONSTRAINT data_provider_pkey PRIMARY KEY (dp_id);


--
-- Name: fishway fishway_pkey; Type: CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.fishway
    ADD CONSTRAINT fishway_pkey PRIMARY KEY (fi_ob_id, fi_species_id);


--
-- Name: hpp hpp_pkey; Type: CONSTRAINT; Schema: dam; Owner: postgres
--

ALTER TABLE ONLY dam.hpp
    ADD CONSTRAINT hpp_pkey PRIMARY KEY (hpp_id);


--
-- Name: obstruction obstruction_pkey; Type: CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.obstruction
    ADD CONSTRAINT obstruction_pkey PRIMARY KEY (ob_id);


--
-- Name: obstruction_place obstruction_place_pkey; Type: CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.obstruction_place
    ADD CONSTRAINT obstruction_place_pkey PRIMARY KEY (op_id);


--
-- Name: turbine turbine_pkey; Type: CONSTRAINT; Schema: dam; Owner: postgres
--

ALTER TABLE ONLY dam.turbine
    ADD CONSTRAINT turbine_pkey PRIMARY KEY (turb_id);


--
-- Name: obstruction uk_obstruction; Type: CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.obstruction
    ADD CONSTRAINT uk_obstruction UNIQUE (ob_op_id, ob_starting_date);


--
-- Name: obstruction_place uk_op_id_original; Type: CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.obstruction_place
    ADD CONSTRAINT uk_op_id_original UNIQUE (op_id_original);


--
-- Name: obstruction_place_geom_gist; Type: INDEX; Schema: dam; Owner: diaspara_admin
--

CREATE INDEX obstruction_place_geom_gist ON dam.obstruction_place USING gist (geom);


--
-- Name: obstruction tr_obstruction_insert; Type: TRIGGER; Schema: dam; Owner: diaspara_admin
--

CREATE TRIGGER tr_obstruction_insert BEFORE INSERT ON dam.obstruction 
FOR EACH ROW EXECUTE FUNCTION dam.observations_id_insert();


--
-- Name: obstruction tr_obstruction_update; Type: TRIGGER; Schema: dam; Owner: diaspara_admin
--

CREATE TRIGGER tr_obstruction_update BEFORE UPDATE ON dam.obstruction 
FOR EACH ROW EXECUTE FUNCTION dam.observations_id_update();


--
-- Name: data_provider fk_dp_edmo_key; Type: FK CONSTRAINT; Schema: dam; Owner: postgres
--

ALTER TABLE ONLY dam.data_provider
    ADD CONSTRAINT fk_dp_edmo_key FOREIGN KEY (dp_edmo_key) 
REFERENCES ref."EDMO"("Key") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: obstruction fk_event_change_no_id; Type: FK CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.obstruction
    ADD CONSTRAINT fk_event_change_no_id FOREIGN KEY (ob_event_change_no_id) 
REFERENCES nomenclature.event_change(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fishway fk_fi_fishway_id; Type: FK CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.fishway
    ADD CONSTRAINT fk_fi_fishway_id FOREIGN KEY (fi_fishway_id) 
REFERENCES nomenclature.fishway_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fishway fk_fi_species_id; Type: FK CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.fishway
    ADD CONSTRAINT fk_fi_species_id FOREIGN KEY (fi_species_id) 
REFERENCES nomenclature.species(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: hpp fk_hpp_ob_id; Type: FK CONSTRAINT; Schema: dam; Owner: postgres
--

ALTER TABLE ONLY dam.hpp
    ADD CONSTRAINT fk_hpp_ob_id FOREIGN KEY (hpp_ob_id) 
REFERENCES dam.obstruction(ob_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: hpp fk_hpp_orient_flow_no_id; Type: FK CONSTRAINT; Schema: dam; Owner: postgres
--

ALTER TABLE ONLY dam.hpp
    ADD CONSTRAINT fk_hpp_orient_flow_no_id FOREIGN KEY (hpp_orient_flow_no_id) 
REFERENCES nomenclature.orient_flow(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: hpp fk_hpp_turbine_type; Type: FK CONSTRAINT; Schema: dam; Owner: postgres
--

ALTER TABLE ONLY dam.hpp
    ADD CONSTRAINT fk_hpp_turbine_type FOREIGN KEY (hpp_turbine_type) 
REFERENCES nomenclature.turbine_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: obstruction fk_ob_fishway_type_no_id; Type: FK CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.obstruction
    ADD CONSTRAINT fk_ob_fishway_type_no_id FOREIGN KEY (ob_fishway_type_no_id) 
REFERENCES nomenclature.fishway_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: obstruction fk_ob_mitigation_measure_no_id; Type: FK CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.obstruction
    ADD CONSTRAINT fk_ob_mitigation_measure_no_id FOREIGN KEY (ob_mitigation_measure_no_id) 
REFERENCES nomenclature.downstream_mitigation_measure(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: obstruction fk_ob_obstruction_type_no_id; Type: FK CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.obstruction
    ADD CONSTRAINT fk_ob_obstruction_type_no_id FOREIGN KEY (ob_obstruction_type_no_id) 
REFERENCES nomenclature.obstruction_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: obstruction fk_ob_op_id; Type: FK CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.obstruction
    ADD CONSTRAINT fk_ob_op_id FOREIGN KEY (ob_op_id) 
REFERENCES dam.obstruction_place(op_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: obstruction_place fk_op_op_id; Type: FK CONSTRAINT; Schema: dam; Owner: diaspara_admin
--

ALTER TABLE ONLY dam.obstruction_place
    ADD CONSTRAINT fk_op_op_id FOREIGN KEY (op_op_id) 
REFERENCES dam.obstruction_place(op_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: turbine fk_turb_hpp_id; Type: FK CONSTRAINT; Schema: dam; Owner: postgres
--

ALTER TABLE ONLY dam.turbine
    ADD CONSTRAINT fk_turb_hpp_id FOREIGN KEY (turb_hpp_id) 
REFERENCES dam.hpp(hpp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: turbine fk_turb_turbine_type_no_id; Type: FK CONSTRAINT; Schema: dam; Owner: postgres
--

ALTER TABLE ONLY dam.turbine
    ADD CONSTRAINT fk_turb_turbine_type_no_id FOREIGN KEY (turb_turbine_type_no_id) 
REFERENCES nomenclature.turbine_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA dam; Type: ACL; Schema: -; Owner: diaspara_admin
--

GRANT USAGE ON SCHEMA dam TO diaspara_read;


--
-- Name: FUNCTION fk_id_batch_insert(); Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT ALL ON FUNCTION dam.fk_id_batch_insert() TO diaspara_read;


--
-- Name: FUNCTION fk_id_environmental_characteristic_insert(); Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT ALL ON FUNCTION dam.fk_id_environmental_characteristic_insert() TO diaspara_read;


--
-- Name: FUNCTION fk_id_observations_insert(); Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT ALL ON FUNCTION dam.fk_id_observations_insert() TO diaspara_read;


--
-- Name: FUNCTION integrity_observation_places_verify(); Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT ALL ON FUNCTION dam.integrity_observation_places_verify() TO diaspara_read;


--
-- Name: FUNCTION integrity_observations_verify(); Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT ALL ON FUNCTION dam.integrity_observations_verify() TO diaspara_read;


--
-- Name: FUNCTION observation_id_place_insert(); Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT ALL ON FUNCTION dam.observation_id_place_insert() TO diaspara_read;


--
-- Name: FUNCTION observation_id_place_update(); Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT ALL ON FUNCTION dam.observation_id_place_update() TO diaspara_read;


--
-- Name: FUNCTION observations_id_insert(); Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT ALL ON FUNCTION dam.observations_id_insert() TO diaspara_read;


--
-- Name: FUNCTION observations_id_update(); Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT ALL ON FUNCTION dam.observations_id_update() TO diaspara_read;


--
-- Name: TABLE bypass; Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT SELECT ON TABLE dam.bypass TO diaspara_read;


--
-- Name: TABLE data_provider; Type: ACL; Schema: dam; Owner: postgres
--

GRANT SELECT ON TABLE dam.data_provider TO diaspara_read;


--
-- Name: TABLE fishway; Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT SELECT ON TABLE dam.fishway TO diaspara_read;


--
-- Name: TABLE hpp; Type: ACL; Schema: dam; Owner: postgres
--

GRANT SELECT ON TABLE dam.hpp TO diaspara_read;


--
-- Name: TABLE obstruction; Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT SELECT ON TABLE dam.obstruction TO diaspara_read;


--
-- Name: TABLE obstruction_place; Type: ACL; Schema: dam; Owner: diaspara_admin
--

GRANT SELECT ON TABLE dam.obstruction_place TO diaspara_read;


--
-- Name: TABLE turbine; Type: ACL; Schema: dam; Owner: postgres
--

GRANT SELECT ON TABLE dam.turbine TO diaspara_read;


--
-- PostgreSQL database dump complete
--

