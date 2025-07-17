--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)

-- Started on 2023-08-01 21:35:51 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 40 (class 2615 OID 2557612)
-- Name: dbmig; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dbmig;
ALTER SCHEMA dbmig OWNER TO diaspara_admin;
GRANT USAGE ON SCHEMA dbmig TO diaspara_read;

--
-- TOC entry 2632 (class 1255 OID 2557658)
-- Name: fk_id_batch_insert(); Type: FUNCTION; Schema: dbmig; Owner: postgres
--

CREATE FUNCTION dbmig.fk_id_batch_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM ob_id FROM "dbmig".observations WHERE ob_id = NEW.ba_ob_id;
  IF FOUND THEN
	RETURN NEW;
  ELSE
	RAISE EXCEPTION '6- Invalid ba_ob_id (%)', NEW.ba_ob_id;
  END IF;
END
$$;


ALTER FUNCTION dbmig.fk_id_batch_insert() OWNER TO diaspara_admin;

--
-- TOC entry 2633 (class 1255 OID 2557659)
-- Name: fk_id_environmental_characteristic_insert(); Type: FUNCTION; Schema: dbmig; Owner: postgres
--

CREATE FUNCTION dbmig.fk_id_environmental_characteristic_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM op_id FROM "dbmig".observation_places WHERE op_id = NEW.ec_op_id;
  IF FOUND THEN
	RETURN NEW;
  ELSE
	RAISE EXCEPTION '5- Invalid ec_op_id (%)', NEW.ec_op_id;
  END IF;
END
$$;


ALTER FUNCTION dbmig.fk_id_environmental_characteristic_insert() OWNER TO diaspara_admin;

--
-- TOC entry 2634 (class 1255 OID 2557660)
-- Name: fk_id_observations_insert(); Type: FUNCTION; Schema: dbmig; Owner: postgres
--

CREATE FUNCTION dbmig.fk_id_observations_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM op_id FROM "dbmig".observation_places WHERE op_id = NEW.ob_op_id;
  IF FOUND THEN
	RETURN NEW;
  ELSE
	RAISE EXCEPTION '5- Invalid ob_op_id (%)', NEW.ob_op_id;
  END IF;
END
$$;


ALTER FUNCTION dbmig.fk_id_observations_insert() OWNER TO diaspara_admin;

--
-- TOC entry 2635 (class 1255 OID 2557661)
-- Name: integrity_observation_places_verify(); Type: FUNCTION; Schema: dbmig; Owner: postgres
--

CREATE FUNCTION dbmig.integrity_observation_places_verify() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM ob_op_id FROM "dbmig".observations WHERE ob_op_id = OLD.op_id;
  IF FOUND THEN
	RAISE EXCEPTION '6- You try to delete an observation places record while there is some records in observations refering to it. op_id: (%)', OLD.op_id;
  ELSE
	PERFORM ec_op_id FROM "dbmig".environmental_characteristic WHERE ec_op_id = OLD.op_id;
	IF FOUND THEN
		RAISE EXCEPTION '6- You try to delete an observation places record while there is some records in environmental_characteristic refering to it. op_id: (%)', OLD.op_id;
		ELSE
			RETURN OLD;
		END IF;
  END IF;
END
$$;


ALTER FUNCTION dbmig.integrity_observation_places_verify() OWNER TO diaspara_admin;

--
-- TOC entry 2636 (class 1255 OID 2557662)
-- Name: integrity_observations_verify(); Type: FUNCTION; Schema: dbmig; Owner: postgres
--

CREATE FUNCTION dbmig.integrity_observations_verify() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM ba_ob_id FROM "dbmig".batch WHERE ba_ob_id = OLD.ob_id;
  IF FOUND THEN
	RAISE EXCEPTION '6- You try to delete an observation record while there is some records in batch refering to it. ob_id: (%)', OLD.ob_id;
  ELSE
	RETURN OLD;
  END IF;
END
$$;


ALTER FUNCTION dbmig.integrity_observations_verify() OWNER TO diaspara_admin;

--
-- TOC entry 2637 (class 1255 OID 2557663)
-- Name: observation_id_place_insert(); Type: FUNCTION; Schema: dbmig; Owner: postgres
--

CREATE FUNCTION dbmig.observation_id_place_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM op_id FROM "dbmig".observation_places WHERE op_id = NEW.op_id;
  IF FOUND THEN
	RAISE EXCEPTION '2- Invalid op_id (%)', NEW.op_id;
  ELSE
	RETURN NEW;
  END IF;
END
$$;


ALTER FUNCTION dbmig.observation_id_place_insert() OWNER TO diaspara_admin;

--
-- TOC entry 2638 (class 1255 OID 2557664)
-- Name: observation_id_place_update(); Type: FUNCTION; Schema: dbmig; Owner: postgres
--

CREATE FUNCTION dbmig.observation_id_place_update() RETURNS trigger
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


ALTER FUNCTION dbmig.observation_id_place_update() OWNER TO diaspara_admin;

--
-- TOC entry 2639 (class 1255 OID 2557665)
-- Name: observations_id_insert(); Type: FUNCTION; Schema: dbmig; Owner: postgres
--

CREATE FUNCTION dbmig.observations_id_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM ob_id FROM "dbmig".observations WHERE ob_id = NEW.ob_id;
  IF FOUND THEN
	RAISE EXCEPTION '3- Invalid ob_id (%)', NEW.ob_id;
  ELSE
	RETURN NEW;
  END IF;
END
$$;


ALTER FUNCTION dbmig.observations_id_insert() OWNER TO diaspara_admin;

--
-- TOC entry 2640 (class 1255 OID 2557666)
-- Name: observations_id_update(); Type: FUNCTION; Schema: dbmig; Owner: postgres
--

CREATE FUNCTION dbmig.observations_id_update() RETURNS trigger
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


ALTER FUNCTION dbmig.observations_id_update() OWNER TO diaspara_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 336 (class 1259 OID 2558333)
-- Name: batch; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.batch (
    ba_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    ba_no_species integer,
    ba_no_stage integer,
    ba_no_value_type integer,
    ba_no_biological_characteristic_type integer,
    ba_quantity real,
    ba_no_individual_status integer,
    ba_batch_level integer,
    ba_ob_id uuid NOT NULL,
    ba_ba_id uuid
);


ALTER TABLE dbmig.batch OWNER TO diaspara_admin;

--
-- TOC entry 337 (class 1259 OID 2558337)
-- Name: biological_characteristic; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.biological_characteristic (
    bc_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    bc_ba_id uuid NOT NULL,
    bc_no_characteristic_type integer NOT NULL,
    bc_no_value_type integer NOT NULL,
    bc_numvalue real
);


ALTER TABLE dbmig.biological_characteristic OWNER TO diaspara_admin;

--
-- TOC entry 338 (class 1259 OID 2558341)
-- Name: bypass; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.bypass (
    bypass_id uuid NOT NULL,
    bypass_hpp_id uuid,
    bypass_water_depth numeric,
    bypass_width numeric,
    bypass_is_flowing boolean
);


ALTER TABLE dbmig.bypass OWNER TO diaspara_admin;

--
-- TOC entry 339 (class 1259 OID 2558346)
-- Name: observations; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.observations (
    ob_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    ob_no_origin integer,
    ob_no_type integer,
    ob_no_period integer,
    ob_starting_date date,
    ob_ending_date date,
    ob_op_id uuid NOT NULL,
    ob_dp_id integer NOT NULL
);


ALTER TABLE dbmig.observations OWNER TO diaspara_admin;

--
-- TOC entry 340 (class 1259 OID 2558350)
-- Name: obstruction; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.obstruction (
    ot_no_obstruction_type integer,
    ot_obstruction_number integer,
    ot_no_mortality_type integer,
    ot_no_mortality real
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.obstruction OWNER TO diaspara_admin;

--
-- TOC entry 341 (class 1259 OID 2558354)
-- Name: chemical_obstruction; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.chemical_obstruction (
    co_chemical_type character varying(30),
    co_pollution character varying(30),
    co_distribution_type character varying(30),
    co_distribution integer
)
INHERITS (dbmig.obstruction);


ALTER TABLE dbmig.chemical_obstruction OWNER TO diaspara_admin;

--
-- TOC entry 342 (class 1259 OID 2558358)
-- Name: data_provider; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.data_provider (
    dp_id integer NOT NULL,
    dp_name character varying(60),
    dp_et_id integer
);


ALTER TABLE dbmig.data_provider OWNER TO diaspara_admin;

--
-- TOC entry 343 (class 1259 OID 2558361)
-- Name: data_provider_dp_id_seq; Type: SEQUENCE; Schema: dbmig; Owner: postgres
--

CREATE SEQUENCE dbmig.data_provider_dp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbmig.data_provider_dp_id_seq OWNER TO diaspara_admin;

--
-- TOC entry 8243 (class 0 OID 0)
-- Dependencies: 343
-- Name: data_provider_dp_id_seq; Type: SEQUENCE OWNED BY; Schema: dbmig; Owner: postgres
--

ALTER SEQUENCE dbmig.data_provider_dp_id_seq OWNED BY dbmig.data_provider.dp_id;


--
-- TOC entry 344 (class 1259 OID 2558362)
-- Name: differentiation; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.differentiation (
    di_rate real,
    di_no_sex integer
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.differentiation OWNER TO diaspara_admin;

--
-- TOC entry 345 (class 1259 OID 2558366)
-- Name: ecological_status; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.ecological_status (
    es_no_statusclass integer
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.ecological_status OWNER TO diaspara_admin;

--
-- TOC entry 346 (class 1259 OID 2558370)
-- Name: electrofishing; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.electrofishing (
    ef_no_fishingmethod integer,
    ef_no_electrofishing_mean integer,
    ef_wetted_area real,
    ef_fished_length real,
    ef_fished_width real,
    ef_duration double precision,
    ef_nbpas integer
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.electrofishing OWNER TO diaspara_admin;

--
-- TOC entry 347 (class 1259 OID 2558374)
-- Name: environmental_characteristic; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.environmental_characteristic (
    ec_id integer NOT NULL,
    ec_temperature real,
    ec_slope real,
    ec_distance_sea real,
    ec_wettered_area real,
    ec_no_ecologicalproduct integer,
    ec_noncalcareous_precent real,
    ec_op_id uuid
);


ALTER TABLE dbmig.environmental_characteristic OWNER TO diaspara_admin;

--
-- TOC entry 348 (class 1259 OID 2558377)
-- Name: environmental_characteristic_ec_id_seq; Type: SEQUENCE; Schema: dbmig; Owner: postgres
--

CREATE SEQUENCE dbmig.environmental_characteristic_ec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbmig.environmental_characteristic_ec_id_seq OWNER TO diaspara_admin;

--
-- TOC entry 8244 (class 0 OID 0)
-- Dependencies: 348
-- Name: environmental_characteristic_ec_id_seq; Type: SEQUENCE OWNED BY; Schema: dbmig; Owner: postgres
--

ALTER SEQUENCE dbmig.environmental_characteristic_ec_id_seq OWNED BY dbmig.environmental_characteristic.ec_id;


--
-- TOC entry 349 (class 1259 OID 2558378)
-- Name: establishment; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.establishment (
    et_id integer NOT NULL,
    et_establishment_name character varying(100)
);


ALTER TABLE dbmig.establishment OWNER TO diaspara_admin;

--
-- TOC entry 350 (class 1259 OID 2558381)
-- Name: establishment_et_id_seq; Type: SEQUENCE; Schema: dbmig; Owner: postgres
--

CREATE SEQUENCE dbmig.establishment_et_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbmig.establishment_et_id_seq OWNER TO diaspara_admin;

--
-- TOC entry 8245 (class 0 OID 0)
-- Dependencies: 350
-- Name: establishment_et_id_seq; Type: SEQUENCE OWNED BY; Schema: dbmig; Owner: postgres
--

ALTER SEQUENCE dbmig.establishment_et_id_seq OWNED BY dbmig.establishment.et_id;


--
-- TOC entry 351 (class 1259 OID 2558382)
-- Name: predation; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.predation (
    pr_no_predation_type integer,
    pr_predator_number integer,
    pr_no_effort_unit integer,
    pr_effort_value real,
    pr_maxumin_length real,
    pr_minimum_length real
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.predation OWNER TO diaspara_admin;

--
-- TOC entry 352 (class 1259 OID 2558386)
-- Name: fishery; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.fishery (
    fi_no_fisher_type integer,
    fi_no_geartype integer
)
INHERITS (dbmig.predation);


ALTER TABLE dbmig.fishery OWNER TO diaspara_admin;

--
-- TOC entry 353 (class 1259 OID 2558390)
-- Name: gear_fishing; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.gear_fishing (
    gf_no_gear_type integer,
    gf_gear_number integer,
    gf_no_effort_type integer,
    gf_effort_value real,
    gf_no_name integer
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.gear_fishing OWNER TO diaspara_admin;

--
-- TOC entry 354 (class 1259 OID 2558394)
-- Name: growth; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.growth (
    gr_rate real,
    gr_assymptotique_length real,
    gr_constante real
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.growth OWNER TO diaspara_admin;

--
-- TOC entry 355 (class 1259 OID 2558398)
-- Name: habitat_loss; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.habitat_loss (
    el_no_hahitat_losstype integer,
    el_no_unity_type integer,
    el_value real
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.habitat_loss OWNER TO diaspara_admin;

--
-- TOC entry 356 (class 1259 OID 2558402)
-- Name: hpp; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.hpp (
    hpp_id uuid NOT NULL,
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
    hpp_nb_trashrack_bypass integer,
    hpp_turb_max_flow numeric,
    hpp_reserved_flow numeric,
    hpp_flow_trashrack_bypass numeric,
    hpp_max_power numeric,
    hpp_nb_turbines integer,
    hpp_orientation_bar_rack numeric,
    hpp_id_original text,
    hpp_source text
);


ALTER TABLE dbmig.hpp OWNER TO diaspara_admin;

--
-- TOC entry 8246 (class 0 OID 0)
-- Dependencies: 356
-- Name: COLUMN hpp.hpp_inclination_bar_rack; Type: COMMENT; Schema: dbmig; Owner: postgres
--

COMMENT ON COLUMN dbmig.hpp.hpp_inclination_bar_rack IS 'Inclination of the bar rack, angle in degree between the bottom and the bar rack';


--
-- TOC entry 8247 (class 0 OID 0)
-- Dependencies: 356
-- Name: COLUMN hpp.hpp_orientation_bar_rack; Type: COMMENT; Schema: dbmig; Owner: postgres
--

COMMENT ON COLUMN dbmig.hpp.hpp_orientation_bar_rack IS 'Orientation of the bar rack, angle in degree between the bank and the bar rack';


--
-- TOC entry 357 (class 1259 OID 2558407)
-- Name: maturation; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.maturation (
    ma_param1 real,
    ma_param2 real,
    ma_lenght integer,
    ma_no_sex integer
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.maturation OWNER TO diaspara_admin;

--
-- TOC entry 358 (class 1259 OID 2558411)
-- Name: migration; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.migration (
    mi_proportion real,
    mi_speed_unity character varying(30),
    mi_speed real,
    mi_arrival_op_id uuid
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.migration OWNER TO diaspara_admin;

--
-- TOC entry 359 (class 1259 OID 2558415)
-- Name: migration_monitoring; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.migration_monitoring (
    mm_no_monitoring_type integer,
    mm_no_monitoring_direction integer,
    mm_escapment_rate real,
    mm_no_name integer
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.migration_monitoring OWNER TO diaspara_admin;

--
-- TOC entry 360 (class 1259 OID 2558419)
-- Name: mortality; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.mortality (
    mo_no_mortality_type integer
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.mortality OWNER TO diaspara_admin;

--
-- TOC entry 361 (class 1259 OID 2558423)
-- Name: observation_places; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.observation_places (
    op_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    op_gis_systemname character varying(20),
    op_gis_layername character varying(30),
    op_gislocation character varying(15),
    op_placename character varying(250),
    op_no_observationplacetype integer,
    op_op_id uuid,
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 3035))
);


ALTER TABLE dbmig.observation_places OWNER TO diaspara_admin;

--
-- TOC entry 366 (class 1259 OID 2558450)
-- Name: physical_obstruction; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.physical_obstruction (
    po_no_obstruction_passability integer,
    po_obstruction_height real,
    po_downs_pb boolean,
    po_downs_water_depth numeric,
    po_presence_eel_pass boolean,
    po_method_perm_ev text,
    po_date_presence_eel_pass date,
    mitigation_measure_no_id integer
)
INHERITS (dbmig.obstruction);


ALTER TABLE dbmig.physical_obstruction OWNER TO diaspara_admin;

--
-- TOC entry 8250 (class 0 OID 0)
-- Dependencies: 366
-- Name: COLUMN physical_obstruction.po_downs_pb; Type: COMMENT; Schema: dbmig; Owner: postgres
--

COMMENT ON COLUMN dbmig.physical_obstruction.po_downs_pb IS '¿Existe un problema para la migración aguas abajo? (Opinión de experto):
- Si el agua cae en una profundidad menor a un metro cerca de la presa, quiere decir que existe impacto (TRUE).
- Si el agua cae río abajo desde una presa con un salto de agua menor a cuatro metros, y que la profundidad del agua cerca de la presa es de un metro (sin rocas, ni otros obstáculos), entonces el impacto es nulo (FALSE); en caso contrario, existe impacto (TRUE).
- Si el salto de agua es mayor a cuatro metros, la profundidad del agua cerca de la presa debería ser ¼ parte del salto de agua. Esto debe ser medido en condiciones de fuerte caudal (que corresponde con la mayor parte de migración ríos abajo de las anguilas plateadas). Si la profundidad es menor de la indicada, entonces existe impacto (TRUE).';


--
-- TOC entry 8251 (class 0 OID 0)
-- Dependencies: 366
-- Name: COLUMN physical_obstruction.po_downs_water_depth; Type: COMMENT; Schema: dbmig; Owner: postgres
--

COMMENT ON COLUMN dbmig.physical_obstruction.po_downs_water_depth IS 'Water depth close to the dam';


--
-- TOC entry 8252 (class 0 OID 0)
-- Dependencies: 366
-- Name: COLUMN physical_obstruction.po_presence_eel_pass; Type: COMMENT; Schema: dbmig; Owner: postgres
--

COMMENT ON COLUMN dbmig.physical_obstruction.po_presence_eel_pass IS 'Presence of an eel pass';


--
-- TOC entry 8253 (class 0 OID 0)
-- Dependencies: 366
-- Name: COLUMN physical_obstruction.po_method_perm_ev; Type: COMMENT; Schema: dbmig; Owner: postgres
--

COMMENT ON COLUMN dbmig.physical_obstruction.po_method_perm_ev IS 'Permeability/ Impact evaluation method';


--
-- TOC entry 8254 (class 0 OID 0)
-- Dependencies: 366
-- Name: COLUMN physical_obstruction.po_date_presence_eel_pass; Type: COMMENT; Schema: dbmig; Owner: postgres
--

COMMENT ON COLUMN dbmig.physical_obstruction.po_date_presence_eel_pass IS 'Date of construction of an eel pass';


--
-- TOC entry 8255 (class 0 OID 0)
-- Dependencies: 366
-- Name: COLUMN physical_obstruction.mitigation_measure_no_id; Type: COMMENT; Schema: dbmig; Owner: postgres
--

COMMENT ON COLUMN dbmig.physical_obstruction.mitigation_measure_no_id IS 'Type of measure for downtream migration mitigation';

--
-- TOC entry 369 (class 1259 OID 2558465)
-- Name: stocking; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.stocking (
    st_mortality_rate real,
    st_population_origin character varying(60)
)
INHERITS (dbmig.observations);


ALTER TABLE dbmig.stocking OWNER TO diaspara_admin;

--
-- TOC entry 370 (class 1259 OID 2558469)
-- Name: turbine; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.turbine (
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


ALTER TABLE dbmig.turbine OWNER TO diaspara_admin;

--
-- TOC entry 371 (class 1259 OID 2558474)
-- Name: upstream; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.upstream (
    up_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    up_op_id_parent uuid,
    up_op_id_child uuid
);


ALTER TABLE dbmig.upstream OWNER TO diaspara_admin;

--
-- TOC entry 373 (class 1259 OID 2558481)
-- Name: view_electrofishing; Type: VIEW; Schema: dbmig; Owner: postgres
--

CREATE VIEW dbmig.view_electrofishing AS
 SELECT row_number() OVER () AS id,
    ob.op_id,
    ob.op_gis_layername,
    ob.op_placename,
    ob.ob_id,
    ob.ob_starting_date,
    ob.ef_wetted_area,
    ob.ef_nbpas,
    ob.ef_fished_length,
    ob.ef_fished_width,
    o1.no_name AS ob_origin,
    o2.no_name AS ob_type,
    o3.no_name AS ob_period,
    o4.no_name AS ef_fishingmethod,
    o5.no_name AS ef_electrofishing_mean,
    ob.dp_name AS ob_dp_name,
    ba1.ba_quantity AS density,
    ba2.ba_quantity AS totalnumber,
    ba3.ba_quantity AS nbp1,
    ba4.ba_quantity AS nbp2,
    ba5.ba_quantity AS nbp3,
    bc.count AS nb_size_measured,
    ob.the_geom
   FROM (((((((((((( SELECT observation_places.op_id,
            observation_places.op_gis_systemname,
            observation_places.op_gis_layername,
            observation_places.op_gislocation,
            observation_places.op_placename,
            observation_places.op_no_observationplacetype,
            observation_places.op_op_id,
            observation_places.the_geom,
            electrofishing.ob_id,
            electrofishing.ob_no_origin,
            electrofishing.ob_no_type,
            electrofishing.ob_no_period,
            electrofishing.ob_starting_date,
            electrofishing.ob_ending_date,
            electrofishing.ob_op_id,
            electrofishing.ob_dp_id,
            electrofishing.ef_no_fishingmethod,
            electrofishing.ef_no_electrofishing_mean,
            electrofishing.ef_wetted_area,
            electrofishing.ef_fished_length,
            electrofishing.ef_fished_width,
            electrofishing.ef_duration,
            electrofishing.ef_nbpas,
            data_provider.dp_id,
            data_provider.dp_name,
            data_provider.dp_et_id
           FROM ((dbmig.observation_places
             JOIN dbmig.electrofishing ON ((observation_places.op_id = electrofishing.ob_op_id)))
             JOIN dbmig.data_provider ON ((data_provider.dp_id = electrofishing.ob_dp_id)))) ob
     JOIN dbmig_nomenclature.nomenclature o1 ON ((ob.ob_no_origin = o1.no_id)))
     JOIN dbmig_nomenclature.nomenclature o2 ON ((ob.ob_no_type = o2.no_id)))
     JOIN dbmig_nomenclature.nomenclature o3 ON ((ob.ob_no_period = o3.no_id)))
     JOIN dbmig_nomenclature.nomenclature o4 ON ((ob.ef_no_fishingmethod = o4.no_id)))
     JOIN dbmig_nomenclature.nomenclature o5 ON ((ob.ef_no_electrofishing_mean = o5.no_id)))
     LEFT JOIN ( SELECT ba.ba_ob_id,
            ba.ba_quantity,
            ba.ba_batch_level,
            ba.ba_species,
            ba.ba_stage,
            ba.ba_value_type,
            ba.ba_biological_characteristic_type,
            ba.ba_individual_status
           FROM ( SELECT batch.ba_ob_id,
                    batch.ba_quantity,
                    batch.ba_batch_level,
                    b1.no_name AS ba_species,
                    b2.no_name AS ba_stage,
                    b3.no_name AS ba_value_type,
                    b4.no_name AS ba_biological_characteristic_type,
                    b5.no_name AS ba_individual_status
                   FROM (((((dbmig.batch
                     JOIN dbmig_nomenclature.nomenclature b1 ON ((batch.ba_no_species = b1.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b2 ON ((batch.ba_no_stage = b2.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b3 ON ((batch.ba_no_value_type = b3.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b4 ON ((batch.ba_no_biological_characteristic_type = b4.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b5 ON ((batch.ba_no_individual_status = b5.no_id)))) ba
          WHERE (((ba.ba_species)::text = 'Anguilla anguilla'::text) AND (((ba.ba_stage)::text = 'Yellow eel'::text) OR ((ba.ba_stage)::text = 'Yellow & silver eel mixed'::text) OR ((ba.ba_stage)::text = 'G, Y & S eel mixed'::text)) AND ((ba.ba_biological_characteristic_type)::text = 'Density'::text))) ba1 ON ((ba1.ba_ob_id = ob.ob_id)))
     LEFT JOIN ( SELECT ba.ba_ob_id,
            ba.ba_quantity,
            ba.ba_batch_level,
            ba.ba_species,
            ba.ba_stage,
            ba.ba_value_type,
            ba.ba_biological_characteristic_type,
            ba.ba_individual_status
           FROM ( SELECT batch.ba_ob_id,
                    batch.ba_quantity,
                    batch.ba_batch_level,
                    b1.no_name AS ba_species,
                    b2.no_name AS ba_stage,
                    b3.no_name AS ba_value_type,
                    b4.no_name AS ba_biological_characteristic_type,
                    b5.no_name AS ba_individual_status
                   FROM (((((dbmig.batch
                     JOIN dbmig_nomenclature.nomenclature b1 ON ((batch.ba_no_species = b1.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b2 ON ((batch.ba_no_stage = b2.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b3 ON ((batch.ba_no_value_type = b3.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b4 ON ((batch.ba_no_biological_characteristic_type = b4.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b5 ON ((batch.ba_no_individual_status = b5.no_id)))) ba
          WHERE (((ba.ba_species)::text = 'Anguilla anguilla'::text) AND (((ba.ba_stage)::text = 'Yellow eel'::text) OR ((ba.ba_stage)::text = 'Yellow & silver eel mixed'::text) OR ((ba.ba_stage)::text = 'G, Y & S eel mixed'::text)) AND ((ba.ba_biological_characteristic_type)::text = 'Number'::text) AND (ba.ba_batch_level = 1))) ba2 ON ((ba2.ba_ob_id = ob.ob_id)))
     LEFT JOIN ( SELECT ba.ba_ob_id,
            ba.ba_quantity,
            ba.ba_batch_level,
            ba.ba_species,
            ba.ba_stage,
            ba.ba_value_type,
            ba.ba_biological_characteristic_type,
            ba.ba_individual_status
           FROM ( SELECT batch.ba_ob_id,
                    batch.ba_quantity,
                    batch.ba_batch_level,
                    b1.no_name AS ba_species,
                    b2.no_name AS ba_stage,
                    b3.no_name AS ba_value_type,
                    b4.no_name AS ba_biological_characteristic_type,
                    b5.no_name AS ba_individual_status
                   FROM (((((dbmig.batch
                     JOIN dbmig_nomenclature.nomenclature b1 ON ((batch.ba_no_species = b1.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b2 ON ((batch.ba_no_stage = b2.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b3 ON ((batch.ba_no_value_type = b3.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b4 ON ((batch.ba_no_biological_characteristic_type = b4.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b5 ON ((batch.ba_no_individual_status = b5.no_id)))) ba
          WHERE (((ba.ba_species)::text = 'Anguilla anguilla'::text) AND (((ba.ba_stage)::text = 'Yellow eel'::text) OR ((ba.ba_stage)::text = 'Yellow & silver eel mixed'::text) OR ((ba.ba_stage)::text = 'G, Y & S eel mixed'::text)) AND ((ba.ba_biological_characteristic_type)::text = 'Number p1'::text))) ba3 ON ((ba3.ba_ob_id = ob.ob_id)))
     LEFT JOIN ( SELECT ba.ba_ob_id,
            ba.ba_quantity,
            ba.ba_batch_level,
            ba.ba_species,
            ba.ba_stage,
            ba.ba_value_type,
            ba.ba_biological_characteristic_type,
            ba.ba_individual_status
           FROM ( SELECT batch.ba_ob_id,
                    batch.ba_quantity,
                    batch.ba_batch_level,
                    b1.no_name AS ba_species,
                    b2.no_name AS ba_stage,
                    b3.no_name AS ba_value_type,
                    b4.no_name AS ba_biological_characteristic_type,
                    b5.no_name AS ba_individual_status
                   FROM (((((dbmig.batch
                     JOIN dbmig_nomenclature.nomenclature b1 ON ((batch.ba_no_species = b1.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b2 ON ((batch.ba_no_stage = b2.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b3 ON ((batch.ba_no_value_type = b3.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b4 ON ((batch.ba_no_biological_characteristic_type = b4.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b5 ON ((batch.ba_no_individual_status = b5.no_id)))) ba
          WHERE (((ba.ba_species)::text = 'Anguilla anguilla'::text) AND (((ba.ba_stage)::text = 'Yellow eel'::text) OR ((ba.ba_stage)::text = 'Yellow & silver eel mixed'::text) OR ((ba.ba_stage)::text = 'G, Y & S eel mixed'::text)) AND ((ba.ba_biological_characteristic_type)::text = 'Number p2'::text))) ba4 ON ((ba4.ba_ob_id = ob.ob_id)))
     LEFT JOIN ( SELECT ba.ba_ob_id,
            ba.ba_quantity,
            ba.ba_batch_level,
            ba.ba_species,
            ba.ba_stage,
            ba.ba_value_type,
            ba.ba_biological_characteristic_type,
            ba.ba_individual_status
           FROM ( SELECT batch.ba_ob_id,
                    batch.ba_quantity,
                    batch.ba_batch_level,
                    b1.no_name AS ba_species,
                    b2.no_name AS ba_stage,
                    b3.no_name AS ba_value_type,
                    b4.no_name AS ba_biological_characteristic_type,
                    b5.no_name AS ba_individual_status
                   FROM (((((dbmig.batch
                     JOIN dbmig_nomenclature.nomenclature b1 ON ((batch.ba_no_species = b1.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b2 ON ((batch.ba_no_stage = b2.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b3 ON ((batch.ba_no_value_type = b3.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b4 ON ((batch.ba_no_biological_characteristic_type = b4.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b5 ON ((batch.ba_no_individual_status = b5.no_id)))) ba
          WHERE (((ba.ba_species)::text = 'Anguilla anguilla'::text) AND (((ba.ba_stage)::text = 'Yellow eel'::text) OR ((ba.ba_stage)::text = 'Yellow & silver eel mixed'::text) OR ((ba.ba_stage)::text = 'G, Y & S eel mixed'::text)) AND ((ba.ba_biological_characteristic_type)::text = 'Number p3'::text))) ba5 ON ((ba5.ba_ob_id = ob.ob_id)))
     LEFT JOIN ( SELECT electrofishing.ob_id,
            count(*) AS count
           FROM ((dbmig.electrofishing
             JOIN dbmig.batch ON ((electrofishing.ob_id = batch.ba_ob_id)))
             JOIN dbmig.biological_characteristic ON ((biological_characteristic.bc_ba_id = batch.ba_id)))
          WHERE (biological_characteristic.bc_no_characteristic_type = 39)
          GROUP BY electrofishing.ob_id) bc ON ((bc.ob_id = ob.ob_id)));


ALTER TABLE dbmig.view_electrofishing OWNER TO diaspara_admin;

--
-- TOC entry 377 (class 1259 OID 2558495)
-- Name: view_electrofishing_size; Type: VIEW; Schema: dbmig; Owner: postgres
--

CREATE VIEW dbmig.view_electrofishing_size AS
 WITH ba_number AS (
         SELECT ba.ba_ob_id,
            ba.ba_quantity AS totalnumber,
            ba.ba_batch_level,
            ba.ba_species,
            ba.ba_stage,
            ba.ba_value_type,
            ba.ba_biological_characteristic_type,
            ba.ba_individual_status
           FROM ( SELECT batch.ba_ob_id,
                    batch.ba_quantity,
                    batch.ba_batch_level,
                    b1.no_name AS ba_species,
                    b2.no_name AS ba_stage,
                    b3.no_name AS ba_value_type,
                    b4.no_name AS ba_biological_characteristic_type,
                    b5.no_name AS ba_individual_status
                   FROM (((((dbmig.batch
                     JOIN dbmig_nomenclature.nomenclature b1 ON ((batch.ba_no_species = b1.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b2 ON ((batch.ba_no_stage = b2.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b3 ON ((batch.ba_no_value_type = b3.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b4 ON ((batch.ba_no_biological_characteristic_type = b4.no_id)))
                     JOIN dbmig_nomenclature.nomenclature b5 ON ((batch.ba_no_individual_status = b5.no_id)))) ba
          WHERE (((ba.ba_species)::text = 'Anguilla anguilla'::text) AND (((ba.ba_stage)::text = 'Yellow eel'::text) OR ((ba.ba_stage)::text = 'Yellow & silver eel mixed'::text) OR ((ba.ba_stage)::text = 'G, Y & S eel mixed'::text)) AND ((ba.ba_biological_characteristic_type)::text = 'Number'::text) AND (ba.ba_batch_level = 1))
        ), taille AS (
         SELECT data_provider.dp_name,
            electrofishing.ob_id,
            bc.bc_id,
            bc.bc_ba_id,
            bc.bc_no_characteristic_type,
            bc.bc_no_value_type,
            bc.bc_numvalue,
            ba_number.totalnumber
           FROM ((((((((dbmig.biological_characteristic bc
             JOIN dbmig.batch ON ((bc.bc_ba_id = batch.ba_id)))
             JOIN dbmig.electrofishing ON ((batch.ba_ob_id = electrofishing.ob_id)))
             JOIN ba_number ON ((ba_number.ba_ob_id = electrofishing.ob_id)))
             JOIN dbmig.observation_places ON ((electrofishing.ob_op_id = observation_places.op_id)))
             JOIN dbmig.data_provider ON ((electrofishing.ob_dp_id = data_provider.dp_id)))
             JOIN dbmig_nomenclature.biological_characteristic_type ON ((bc.bc_no_characteristic_type = biological_characteristic_type.no_id)))
             JOIN dbmig_nomenclature.species ON ((batch.ba_no_species = species.no_id)))
             JOIN dbmig_nomenclature.value_type ON ((batch.ba_no_value_type = value_type.no_id)))
          WHERE (((species.no_name)::text = 'Anguilla anguilla'::text) AND ((biological_characteristic_type.no_name)::text = 'Length'::text) AND ((value_type.no_name)::text = 'Raw data or Individual data'::text) AND (bc.bc_numvalue > (50)::double precision) AND (bc.bc_numvalue < (1400)::double precision))
        ), test AS (
         SELECT taille.dp_name,
            taille.ob_id,
            min(taille.bc_numvalue) AS min,
            max(taille.bc_numvalue) AS max,
            count(*) AS count,
            taille.totalnumber
           FROM taille
          GROUP BY taille.ob_id, taille.dp_name, taille.totalnumber
        ), diag AS (
         SELECT test.ob_id,
                CASE
                    WHEN ((test.totalnumber < (10)::double precision) AND ((test.count)::double precision = test.totalnumber)) THEN 'ok1'::text
                    WHEN ((test.totalnumber >= (10)::double precision) AND ((test.count)::double precision >= ((0.80)::double precision * test.totalnumber))) THEN 'ok2'::text
                    WHEN ((test.totalnumber >= (50)::double precision) AND (test.count >= 30)) THEN 'ok3'::text
                    ELSE 'no'::text
                END AS diagnostic
           FROM test
          ORDER BY test.dp_name
        ), selected_length AS (
         SELECT taille.ob_id,
            taille.dp_name,
            taille.bc_id,
            taille.bc_ba_id,
            taille.bc_no_characteristic_type,
            taille.bc_no_value_type,
            taille.bc_numvalue,
            taille.totalnumber,
            diag.diagnostic
           FROM (taille
             JOIN diag USING (ob_id))
          WHERE (diag.diagnostic <> 'no'::text)
        ), length_class AS (
         SELECT selected_length.ob_id,
            selected_length.dp_name,
            selected_length.bc_id,
            selected_length.bc_ba_id,
            selected_length.bc_no_characteristic_type,
            selected_length.bc_no_value_type,
            selected_length.bc_numvalue,
            selected_length.totalnumber,
            selected_length.diagnostic,
                CASE
                    WHEN (selected_length.bc_numvalue < (50)::double precision) THEN '0 - error'::text
                    WHEN ((selected_length.bc_numvalue >= (50)::double precision) AND (selected_length.bc_numvalue < (150)::double precision)) THEN '1 - <150'::text
                    WHEN ((selected_length.bc_numvalue >= (150)::double precision) AND (selected_length.bc_numvalue < (300)::double precision)) THEN '2 - [150-300['::text
                    WHEN ((selected_length.bc_numvalue >= (300)::double precision) AND (selected_length.bc_numvalue < (450)::double precision)) THEN '3 - [300-450['::text
                    WHEN ((selected_length.bc_numvalue >= (450)::double precision) AND (selected_length.bc_numvalue < (600)::double precision)) THEN '4 - [450-600['::text
                    WHEN ((selected_length.bc_numvalue >= (600)::double precision) AND (selected_length.bc_numvalue < (750)::double precision)) THEN '5 - [600-750['::text
                    WHEN (selected_length.bc_numvalue >= (750)::double precision) THEN '6 - >=750'::text
                    ELSE NULL::text
                END AS length_class
           FROM selected_length
        ), count_class AS (
         SELECT length_class.ob_id,
            length_class.dp_name,
            length_class.length_class,
            count(*) AS nb_class
           FROM length_class
          GROUP BY length_class.ob_id, length_class.dp_name, length_class.length_class
          ORDER BY length_class.ob_id, length_class.dp_name, length_class.length_class
        ), combinaison_total AS (
         SELECT ob.ob_id,
            ob.dp_name,
            classe.length_class
           FROM ( SELECT DISTINCT length_class.ob_id,
                    length_class.dp_name
                   FROM length_class) ob,
            ( SELECT DISTINCT length_class.length_class
                   FROM length_class) classe
        )
 SELECT combinaison_total.ob_id,
    combinaison_total.dp_name,
    combinaison_total.length_class,
    COALESCE(count_class.nb_class, (0)::bigint) AS number
   FROM (combinaison_total
     LEFT JOIN count_class USING (ob_id, length_class, dp_name))
  ORDER BY combinaison_total.ob_id, combinaison_total.dp_name, combinaison_total.length_class;


ALTER TABLE dbmig.view_electrofishing_size OWNER TO diaspara_admin;

--
-- TOC entry 378 (class 1259 OID 2558500)
-- Name: wildlife; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.wildlife (
    wi_no_species integer
)
INHERITS (dbmig.predation);


ALTER TABLE dbmig.wildlife OWNER TO diaspara_admin;

--
-- TOC entry 379 (class 1259 OID 2558504)
-- Name: within; Type: TABLE; Schema: dbmig; Owner: postgres
--

CREATE TABLE dbmig.within (
    wi_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    wi_op_id_parent uuid,
    wi_op_id_child uuid
);


ALTER TABLE dbmig.within OWNER TO diaspara_admin;

--
-- TOC entry 7674 (class 2604 OID 2562091)
-- Name: chemical_obstruction ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.chemical_obstruction ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7675 (class 2604 OID 2562092)
-- Name: data_provider dp_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.data_provider ALTER COLUMN dp_id SET DEFAULT nextval('dbmig.data_provider_dp_id_seq'::regclass);


--
-- TOC entry 7676 (class 2604 OID 2562093)
-- Name: differentiation ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.differentiation ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7677 (class 2604 OID 2562094)
-- Name: ecological_status ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.ecological_status ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7678 (class 2604 OID 2562095)
-- Name: electrofishing ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7679 (class 2604 OID 2562096)
-- Name: environmental_characteristic ec_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.environmental_characteristic ALTER COLUMN ec_id SET DEFAULT nextval('dbmig.environmental_characteristic_ec_id_seq'::regclass);


--
-- TOC entry 7680 (class 2604 OID 2562097)
-- Name: establishment et_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.establishment ALTER COLUMN et_id SET DEFAULT nextval('dbmig.establishment_et_id_seq'::regclass);


--
-- TOC entry 7682 (class 2604 OID 2562098)
-- Name: fishery ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7683 (class 2604 OID 2562099)
-- Name: gear_fishing ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7684 (class 2604 OID 2562100)
-- Name: growth ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.growth ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7685 (class 2604 OID 2562101)
-- Name: habitat_loss ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7686 (class 2604 OID 2562102)
-- Name: maturation ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.maturation ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7687 (class 2604 OID 2562103)
-- Name: migration ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7688 (class 2604 OID 2562104)
-- Name: migration_monitoring ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7689 (class 2604 OID 2562105)
-- Name: mortality ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.mortality ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();

--
-- TOC entry 7673 (class 2604 OID 2562108)
-- Name: obstruction ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7693 (class 2604 OID 2562109)
-- Name: physical_obstruction ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7681 (class 2604 OID 2562110)
-- Name: predation ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();

--
-- TOC entry 7695 (class 2604 OID 2562112)
-- Name: stocking ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.stocking ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7697 (class 2604 OID 2562113)
-- Name: wildlife ob_id; Type: DEFAULT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.wildlife ALTER COLUMN ob_id SET DEFAULT public.uuid_generate_v4();


--
-- TOC entry 7712 (class 2606 OID 6985857)
-- Name: batch batch_pkey; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.batch
    ADD CONSTRAINT batch_pkey PRIMARY KEY (ba_id);


--
-- TOC entry 7716 (class 2606 OID 6985859)
-- Name: biological_characteristic biological_characteristic_pkey; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.biological_characteristic
    ADD CONSTRAINT biological_characteristic_pkey PRIMARY KEY (bc_id);


--
-- TOC entry 7720 (class 2606 OID 6985861)
-- Name: bypass bypass_pkey; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.bypass
    ADD CONSTRAINT bypass_pkey PRIMARY KEY (bypass_id);


--
-- TOC entry 7726 (class 2606 OID 6985863)
-- Name: chemical_obstruction chemical_obstruction_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.chemical_obstruction
    ADD CONSTRAINT chemical_obstruction_id PRIMARY KEY (ob_id);


--
-- TOC entry 7728 (class 2606 OID 6985865)
-- Name: data_provider data_provider_pkey; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.data_provider
    ADD CONSTRAINT data_provider_pkey PRIMARY KEY (dp_id);


--
-- TOC entry 7730 (class 2606 OID 6985867)
-- Name: differentiation differentiation_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.differentiation
    ADD CONSTRAINT differentiation_id PRIMARY KEY (ob_id);


--
-- TOC entry 7732 (class 2606 OID 6985869)
-- Name: ecological_status ecological_status_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.ecological_status
    ADD CONSTRAINT ecological_status_id PRIMARY KEY (ob_id);


--
-- TOC entry 7736 (class 2606 OID 6985871)
-- Name: electrofishing electrofishing_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT electrofishing_id PRIMARY KEY (ob_id);


--
-- TOC entry 7738 (class 2606 OID 6985873)
-- Name: environmental_characteristic environmental_characteristic_pkey; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.environmental_characteristic
    ADD CONSTRAINT environmental_characteristic_pkey PRIMARY KEY (ec_id);


--
-- TOC entry 7740 (class 2606 OID 6985875)
-- Name: establishment establishment_pkey; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.establishment
    ADD CONSTRAINT establishment_pkey PRIMARY KEY (et_id);


--
-- TOC entry 7744 (class 2606 OID 6985877)
-- Name: fishery fishery_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fishery_id PRIMARY KEY (ob_id);


--
-- TOC entry 7746 (class 2606 OID 6985879)
-- Name: gear_fishing gear_fishing_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT gear_fishing_id PRIMARY KEY (ob_id);


--
-- TOC entry 7748 (class 2606 OID 6985881)
-- Name: growth growth_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.growth
    ADD CONSTRAINT growth_id PRIMARY KEY (ob_id);


--
-- TOC entry 7750 (class 2606 OID 6985883)
-- Name: habitat_loss habitat_loss_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT habitat_loss_id PRIMARY KEY (ob_id);


--
-- TOC entry 7752 (class 2606 OID 6985885)
-- Name: hpp hpp_pkey; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.hpp
    ADD CONSTRAINT hpp_pkey PRIMARY KEY (hpp_id);


--
-- TOC entry 7754 (class 2606 OID 6985887)
-- Name: maturation maturation_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.maturation
    ADD CONSTRAINT maturation_id PRIMARY KEY (ob_id);


--
-- TOC entry 7756 (class 2606 OID 6985889)
-- Name: migration migration_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration
    ADD CONSTRAINT migration_id PRIMARY KEY (ob_id);


--
-- TOC entry 7758 (class 2606 OID 6985891)
-- Name: migration_monitoring migration_monitoring_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT migration_monitoring_id PRIMARY KEY (ob_id);


--
-- TOC entry 7760 (class 2606 OID 6985893)
-- Name: mortality mortality_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.mortality
    ADD CONSTRAINT mortality_id PRIMARY KEY (ob_id);


--
-- TOC entry 7764 (class 2606 OID 6985895)
-- Name: observation_places observation_places_pkey; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.observation_places
    ADD CONSTRAINT observation_places_pkey PRIMARY KEY (op_id);


--
-- TOC entry 7722 (class 2606 OID 6985897)
-- Name: observations observations_pkey; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.observations
    ADD CONSTRAINT observations_pkey PRIMARY KEY (ob_id);


--
-- TOC entry 7724 (class 2606 OID 6985899)
-- Name: obstruction obstruction_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT obstruction_id PRIMARY KEY (ob_id);


--
-- TOC entry 7769 (class 2606 OID 6985901)
-- Name: physical_obstruction physical_obstruction_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT physical_obstruction_id PRIMARY KEY (ob_id);

--
-- TOC entry 7742 (class 2606 OID 6985905)
-- Name: predation predation_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT predation_id PRIMARY KEY (ob_id);


--
-- TOC entry 7772 (class 2606 OID 6985907)
-- Name: stocking stocking_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.stocking
    ADD CONSTRAINT stocking_id PRIMARY KEY (ob_id);


--
-- TOC entry 7774 (class 2606 OID 6985909)
-- Name: turbine turbine_pkey; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.turbine
    ADD CONSTRAINT turbine_pkey PRIMARY KEY (turb_id);


--
-- TOC entry 7776 (class 2606 OID 6985911)
-- Name: upstream upstream_pkey; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.upstream
    ADD CONSTRAINT upstream_pkey PRIMARY KEY (up_id);


--
-- TOC entry 7778 (class 2606 OID 6985913)
-- Name: wildlife wildlife_id; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.wildlife
    ADD CONSTRAINT wildlife_id PRIMARY KEY (ob_id);


--
-- TOC entry 7780 (class 2606 OID 6985915)
-- Name: within within_pkey; Type: CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.within
    ADD CONSTRAINT within_pkey PRIMARY KEY (wi_id);


--
-- TOC entry 7713 (class 1259 OID 6986804)
-- Name: dbmig_batch_ix_ba_id; Type: INDEX; Schema: dbmig; Owner: postgres
--

CREATE INDEX dbmig_batch_ix_ba_id ON dbmig.batch USING btree (ba_id);


--
-- TOC entry 7714 (class 1259 OID 6986805)
-- Name: dbmig_batch_ix_ba_ob_id; Type: INDEX; Schema: dbmig; Owner: postgres
--

CREATE INDEX dbmig_batch_ix_ba_ob_id ON dbmig.batch USING btree (ba_ob_id);


--
-- TOC entry 7717 (class 1259 OID 6986806)
-- Name: dbmig_biological_characteristic_ix_bc_ba_id; Type: INDEX; Schema: dbmig; Owner: postgres
--

CREATE INDEX dbmig_biological_characteristic_ix_bc_ba_id ON dbmig.biological_characteristic USING btree (bc_ba_id);


--
-- TOC entry 7718 (class 1259 OID 6986807)
-- Name: dbmig_biological_characteristic_ix_bc_id; Type: INDEX; Schema: dbmig; Owner: postgres
--

CREATE INDEX dbmig_biological_characteristic_ix_bc_id ON dbmig.biological_characteristic USING btree (bc_id);


--
-- TOC entry 7733 (class 1259 OID 6986808)
-- Name: dbmig_electrofishing_ix_ob_id; Type: INDEX; Schema: dbmig; Owner: postgres
--

CREATE INDEX dbmig_electrofishing_ix_ob_id ON dbmig.electrofishing USING btree (ob_id);


--
-- TOC entry 7734 (class 1259 OID 6986809)
-- Name: dbmig_electrofishing_ix_ob_op_id; Type: INDEX; Schema: dbmig; Owner: postgres
--

CREATE INDEX dbmig_electrofishing_ix_ob_op_id ON dbmig.electrofishing USING btree (ob_op_id);


--
-- TOC entry 7761 (class 1259 OID 6986810)
-- Name: dbmig_observation_place_ix_op_id; Type: INDEX; Schema: dbmig; Owner: postgres
--

CREATE INDEX dbmig_observation_place_ix_op_id ON dbmig.observation_places USING btree (op_id);


--
-- TOC entry 7762 (class 1259 OID 6986811)
-- Name: indexgeobs; Type: INDEX; Schema: dbmig; Owner: postgres
--

CREATE INDEX indexgeobs ON dbmig.observation_places USING gist (the_geom);

--
-- TOC entry 7899 (class 2620 OID 6987072)
-- Name: batch tr_batch_ob_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_batch_ob_id_insert BEFORE INSERT OR UPDATE ON dbmig.batch FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_batch_insert();


--
-- TOC entry 7908 (class 2620 OID 6987073)
-- Name: chemical_obstruction tr_chemical_obstruction_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_chemical_obstruction_insert BEFORE INSERT ON dbmig.chemical_obstruction FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7909 (class 2620 OID 6987074)
-- Name: chemical_obstruction tr_chemical_obstruction_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_chemical_obstruction_update BEFORE UPDATE ON dbmig.chemical_obstruction FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7912 (class 2620 OID 6987075)
-- Name: differentiation tr_differentiation_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_differentiation_insert BEFORE INSERT ON dbmig.differentiation FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7913 (class 2620 OID 6987076)
-- Name: differentiation tr_differentiation_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_differentiation_update BEFORE UPDATE ON dbmig.differentiation FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7916 (class 2620 OID 6987077)
-- Name: ecological_status tr_ecological_status_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_ecological_status_insert BEFORE INSERT ON dbmig.ecological_status FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7917 (class 2620 OID 6987078)
-- Name: ecological_status tr_ecological_status_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_ecological_status_update BEFORE UPDATE ON dbmig.ecological_status FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7920 (class 2620 OID 6987079)
-- Name: electrofishing tr_electrofishing_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_electrofishing_insert BEFORE INSERT ON dbmig.electrofishing FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7921 (class 2620 OID 6987080)
-- Name: electrofishing tr_electrofishing_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_electrofishing_update BEFORE UPDATE ON dbmig.electrofishing FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7924 (class 2620 OID 6987081)
-- Name: environmental_characteristic tr_environmental_characteristic_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_environmental_characteristic_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.environmental_characteristic FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_environmental_characteristic_insert();


--
-- TOC entry 7929 (class 2620 OID 6987082)
-- Name: fishery tr_fishery_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_fishery_insert BEFORE INSERT ON dbmig.fishery FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7930 (class 2620 OID 6987083)
-- Name: fishery tr_fishery_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_fishery_update BEFORE UPDATE ON dbmig.fishery FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7933 (class 2620 OID 6987084)
-- Name: gear_fishing tr_gearfishing_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_gearfishing_insert BEFORE INSERT ON dbmig.gear_fishing FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7934 (class 2620 OID 6987085)
-- Name: gear_fishing tr_gearfishing_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_gearfishing_update BEFORE UPDATE ON dbmig.gear_fishing FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7937 (class 2620 OID 6987086)
-- Name: growth tr_growth_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_growth_insert BEFORE INSERT ON dbmig.growth FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7938 (class 2620 OID 6987087)
-- Name: growth tr_growth_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_growth_update BEFORE UPDATE ON dbmig.growth FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7941 (class 2620 OID 6987088)
-- Name: habitat_loss tr_habitat_loss_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_habitat_loss_insert BEFORE INSERT ON dbmig.habitat_loss FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7942 (class 2620 OID 6987089)
-- Name: habitat_loss tr_habitat_loss_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_habitat_loss_update BEFORE UPDATE ON dbmig.habitat_loss FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7945 (class 2620 OID 6987090)
-- Name: maturation tr_maturation_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_maturation_insert BEFORE INSERT ON dbmig.maturation FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7946 (class 2620 OID 6987091)
-- Name: maturation tr_maturation_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_maturation_update BEFORE UPDATE ON dbmig.maturation FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7949 (class 2620 OID 6987092)
-- Name: migration tr_migration_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_migration_insert BEFORE INSERT ON dbmig.migration FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7953 (class 2620 OID 6987093)
-- Name: migration_monitoring tr_migration_monitoring_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_migration_monitoring_insert BEFORE INSERT ON dbmig.migration_monitoring FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7954 (class 2620 OID 6987094)
-- Name: migration_monitoring tr_migration_monitoring_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_migration_monitoring_update BEFORE UPDATE ON dbmig.migration_monitoring FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7950 (class 2620 OID 6987095)
-- Name: migration tr_migration_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_migration_update BEFORE UPDATE ON dbmig.migration FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7957 (class 2620 OID 6987096)
-- Name: mortality tr_mortality_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_mortality_insert BEFORE INSERT ON dbmig.mortality FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7958 (class 2620 OID 6987097)
-- Name: mortality tr_mortality_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_mortality_update BEFORE UPDATE ON dbmig.mortality FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7961 (class 2620 OID 6987098)
-- Name: observation_places tr_observation_places_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observation_places_delete BEFORE DELETE ON dbmig.observation_places FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observation_places_verify();


--
-- TOC entry 7962 (class 2620 OID 6987099)
-- Name: observation_places tr_observation_places_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observation_places_insert BEFORE INSERT ON dbmig.observation_places FOR EACH ROW EXECUTE FUNCTION dbmig.observation_id_place_insert();


--
-- TOC entry 7963 (class 2620 OID 6987100)
-- Name: observation_places tr_observation_places_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observation_places_update BEFORE UPDATE ON dbmig.observation_places FOR EACH ROW EXECUTE FUNCTION dbmig.observation_id_place_update();


--
-- TOC entry 7910 (class 2620 OID 6987101)
-- Name: chemical_obstruction tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.chemical_obstruction FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7914 (class 2620 OID 6987102)
-- Name: differentiation tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.differentiation FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7918 (class 2620 OID 6987103)
-- Name: ecological_status tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.ecological_status FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7922 (class 2620 OID 6987104)
-- Name: electrofishing tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.electrofishing FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7931 (class 2620 OID 6987105)
-- Name: fishery tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.fishery FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7935 (class 2620 OID 6987106)
-- Name: gear_fishing tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.gear_fishing FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7939 (class 2620 OID 6987107)
-- Name: growth tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.growth FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7943 (class 2620 OID 6987108)
-- Name: habitat_loss tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.habitat_loss FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7947 (class 2620 OID 6987109)
-- Name: maturation tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.maturation FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7951 (class 2620 OID 6987110)
-- Name: migration tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.migration FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7955 (class 2620 OID 6987111)
-- Name: migration_monitoring tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.migration_monitoring FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7959 (class 2620 OID 6987112)
-- Name: mortality tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.mortality FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7900 (class 2620 OID 6987113)
-- Name: observations tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.observations FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7904 (class 2620 OID 6987114)
-- Name: obstruction tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.obstruction FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7964 (class 2620 OID 6987115)
-- Name: physical_obstruction tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.physical_obstruction FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7925 (class 2620 OID 6987116)
-- Name: predation tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.predation FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7968 (class 2620 OID 6987117)
-- Name: stocking tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.stocking FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7972 (class 2620 OID 6987118)
-- Name: wildlife tr_observations_delete; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_delete BEFORE DELETE ON dbmig.wildlife FOR EACH ROW EXECUTE FUNCTION dbmig.integrity_observations_verify();


--
-- TOC entry 7901 (class 2620 OID 6987119)
-- Name: observations tr_observations_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_insert BEFORE INSERT ON dbmig.observations FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7911 (class 2620 OID 6987120)
-- Name: chemical_obstruction tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.chemical_obstruction FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7915 (class 2620 OID 6987121)
-- Name: differentiation tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.differentiation FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7919 (class 2620 OID 6987122)
-- Name: ecological_status tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.ecological_status FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7923 (class 2620 OID 6987123)
-- Name: electrofishing tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.electrofishing FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7932 (class 2620 OID 6987124)
-- Name: fishery tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.fishery FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7936 (class 2620 OID 6987125)
-- Name: gear_fishing tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.gear_fishing FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7940 (class 2620 OID 6987126)
-- Name: growth tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.growth FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7944 (class 2620 OID 6987127)
-- Name: habitat_loss tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.habitat_loss FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7948 (class 2620 OID 6987128)
-- Name: maturation tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.maturation FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7952 (class 2620 OID 6987129)
-- Name: migration tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.migration FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7956 (class 2620 OID 6987130)
-- Name: migration_monitoring tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.migration_monitoring FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7960 (class 2620 OID 6987131)
-- Name: mortality tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.mortality FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7902 (class 2620 OID 6987132)
-- Name: observations tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.observations FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7905 (class 2620 OID 6987133)
-- Name: obstruction tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.obstruction FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7965 (class 2620 OID 6987134)
-- Name: physical_obstruction tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.physical_obstruction FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7926 (class 2620 OID 6987135)
-- Name: predation tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.predation FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7969 (class 2620 OID 6987136)
-- Name: stocking tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.stocking FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7973 (class 2620 OID 6987137)
-- Name: wildlife tr_observations_op_id_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_op_id_insert BEFORE INSERT OR UPDATE ON dbmig.wildlife FOR EACH ROW EXECUTE FUNCTION dbmig.fk_id_observations_insert();


--
-- TOC entry 7903 (class 2620 OID 6987138)
-- Name: observations tr_observations_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_observations_update BEFORE UPDATE ON dbmig.observations FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7906 (class 2620 OID 6987139)
-- Name: obstruction tr_obstruction_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_obstruction_insert BEFORE INSERT ON dbmig.obstruction FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7907 (class 2620 OID 6987140)
-- Name: obstruction tr_obstruction_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_obstruction_update BEFORE UPDATE ON dbmig.obstruction FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7966 (class 2620 OID 6987141)
-- Name: physical_obstruction tr_physical_obstruction_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_physical_obstruction_insert BEFORE INSERT ON dbmig.physical_obstruction FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7967 (class 2620 OID 6987142)
-- Name: physical_obstruction tr_physical_obstruction_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_physical_obstruction_update BEFORE UPDATE ON dbmig.physical_obstruction FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7927 (class 2620 OID 6987143)
-- Name: predation tr_predation_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_predation_insert BEFORE INSERT ON dbmig.predation FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7928 (class 2620 OID 6987144)
-- Name: predation tr_predation_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_predation_update BEFORE UPDATE ON dbmig.predation FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7970 (class 2620 OID 6987145)
-- Name: stocking tr_stocking_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_stocking_insert BEFORE INSERT ON dbmig.stocking FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7971 (class 2620 OID 6987146)
-- Name: stocking tr_stocking_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_stocking_update BEFORE UPDATE ON dbmig.stocking FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7974 (class 2620 OID 6987147)
-- Name: wildlife tr_wildlife_insert; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_wildlife_insert BEFORE INSERT ON dbmig.wildlife FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_insert();


--
-- TOC entry 7975 (class 2620 OID 6987148)
-- Name: wildlife tr_wildlife_update; Type: TRIGGER; Schema: dbmig; Owner: postgres
--

CREATE TRIGGER tr_wildlife_update BEFORE UPDATE ON dbmig.wildlife FOR EACH ROW EXECUTE FUNCTION dbmig.observations_id_update();


--
-- TOC entry 7792 (class 2606 OID 6987452)
-- Name: bypass c_fk_bypass_hpp_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.bypass
    ADD CONSTRAINT c_fk_bypass_hpp_id FOREIGN KEY (bypass_hpp_id) REFERENCES dbmig.hpp(hpp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7853 (class 2606 OID 6987457)
-- Name: hpp c_fk_hpp_ob_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.hpp
    ADD CONSTRAINT c_fk_hpp_ob_id FOREIGN KEY (hpp_ob_id) REFERENCES dbmig.physical_obstruction(ob_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7854 (class 2606 OID 6987462)
-- Name: hpp c_fk_hpp_orient_flow_no_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.hpp
    ADD CONSTRAINT c_fk_hpp_orient_flow_no_id FOREIGN KEY (hpp_orient_flow_no_id) REFERENCES dbmig_nomenclature.orient_flow(no_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7876 (class 2606 OID 6987467)
-- Name: physical_obstruction c_fk_mitigation_measure_no_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT c_fk_mitigation_measure_no_id FOREIGN KEY (mitigation_measure_no_id) REFERENCES dbmig_nomenclature.downstream_mitigation_measure(no_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7888 (class 2606 OID 6987472)
-- Name: turbine c_fk_turb_hpp_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.turbine
    ADD CONSTRAINT c_fk_turb_hpp_id FOREIGN KEY (turb_hpp_id) REFERENCES dbmig.hpp(hpp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7889 (class 2606 OID 6987477)
-- Name: turbine c_fk_turb_turbine_type_no_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.turbine
    ADD CONSTRAINT c_fk_turb_turbine_type_no_id FOREIGN KEY (turb_turbine_type_no_id) REFERENCES dbmig_nomenclature.turbine_type(no_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7785 (class 2606 OID 6987482)
-- Name: batch fk_ba_biological_characteristic_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.batch
    ADD CONSTRAINT fk_ba_biological_characteristic_type FOREIGN KEY (ba_no_biological_characteristic_type) REFERENCES dbmig_nomenclature.biological_characteristic_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7786 (class 2606 OID 6987487)
-- Name: batch fk_ba_individual_status; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.batch
    ADD CONSTRAINT fk_ba_individual_status FOREIGN KEY (ba_no_individual_status) REFERENCES dbmig_nomenclature.individual_status(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7787 (class 2606 OID 6987492)
-- Name: batch fk_ba_species; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.batch
    ADD CONSTRAINT fk_ba_species FOREIGN KEY (ba_no_species) REFERENCES dbmig_nomenclature.species(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7788 (class 2606 OID 6987497)
-- Name: batch fk_ba_stage; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.batch
    ADD CONSTRAINT fk_ba_stage FOREIGN KEY (ba_no_stage) REFERENCES dbmig_nomenclature.stage(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7789 (class 2606 OID 6987502)
-- Name: batch fk_ba_value_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.batch
    ADD CONSTRAINT fk_ba_value_type FOREIGN KEY (ba_no_value_type) REFERENCES dbmig_nomenclature.value_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7790 (class 2606 OID 6987507)
-- Name: biological_characteristic fk_bc_characteristic_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.biological_characteristic
    ADD CONSTRAINT fk_bc_characteristic_type FOREIGN KEY (bc_no_characteristic_type) REFERENCES dbmig_nomenclature.biological_characteristic_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7791 (class 2606 OID 6987512)
-- Name: biological_characteristic fk_bc_value_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.biological_characteristic
    ADD CONSTRAINT fk_bc_value_type FOREIGN KEY (bc_no_value_type) REFERENCES dbmig_nomenclature.value_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7808 (class 2606 OID 6987517)
-- Name: differentiation fk_di_sex; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.differentiation
    ADD CONSTRAINT fk_di_sex FOREIGN KEY (di_no_sex) REFERENCES dbmig_nomenclature.sex(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7837 (class 2606 OID 6987522)
-- Name: gear_fishing fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7864 (class 2606 OID 6987527)
-- Name: migration_monitoring fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7813 (class 2606 OID 6987532)
-- Name: ecological_status fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.ecological_status
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7847 (class 2606 OID 6987537)
-- Name: habitat_loss fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7884 (class 2606 OID 6987542)
-- Name: stocking fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.stocking
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7825 (class 2606 OID 6987547)
-- Name: predation fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7831 (class 2606 OID 6987552)
-- Name: fishery fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7892 (class 2606 OID 6987557)
-- Name: wildlife fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.wildlife
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7797 (class 2606 OID 6987562)
-- Name: obstruction fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7877 (class 2606 OID 6987567)
-- Name: physical_obstruction fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7803 (class 2606 OID 6987572)
-- Name: chemical_obstruction fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.chemical_obstruction
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7860 (class 2606 OID 6987577)
-- Name: migration fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7855 (class 2606 OID 6987582)
-- Name: maturation fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.maturation
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7843 (class 2606 OID 6987587)
-- Name: growth fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.growth
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7870 (class 2606 OID 6987592)
-- Name: mortality fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.mortality
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7809 (class 2606 OID 6987597)
-- Name: differentiation fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.differentiation
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7818 (class 2606 OID 6987602)
-- Name: electrofishing fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7793 (class 2606 OID 6987607)
-- Name: observations fk_dp; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.observations
    ADD CONSTRAINT fk_dp FOREIGN KEY (ob_dp_id) REFERENCES dbmig.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7824 (class 2606 OID 6987612)
-- Name: environmental_characteristic fk_ec_no_ecologicalproduct; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.environmental_characteristic
    ADD CONSTRAINT fk_ec_no_ecologicalproduct FOREIGN KEY (ec_no_ecologicalproduct) REFERENCES dbmig_nomenclature.ecological_productivity(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7819 (class 2606 OID 6987617)
-- Name: electrofishing fk_ef_electrofishing_mean; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT fk_ef_electrofishing_mean FOREIGN KEY (ef_no_electrofishing_mean) REFERENCES dbmig_nomenclature.electrofishing_mean(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7820 (class 2606 OID 6987622)
-- Name: electrofishing fk_ef_electrofishing_method; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT fk_ef_electrofishing_method FOREIGN KEY (ef_no_fishingmethod) REFERENCES dbmig_nomenclature.scientific_observation_method(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7848 (class 2606 OID 6987627)
-- Name: habitat_loss fk_el_habitat_losstype; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT fk_el_habitat_losstype FOREIGN KEY (el_no_hahitat_losstype) REFERENCES dbmig_nomenclature.habitat_loss_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7849 (class 2606 OID 6987632)
-- Name: habitat_loss fk_el_unity_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT fk_el_unity_type FOREIGN KEY (el_no_unity_type) REFERENCES dbmig_nomenclature.type_of_unit(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7814 (class 2606 OID 6987637)
-- Name: ecological_status fk_es_statusclass; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.ecological_status
    ADD CONSTRAINT fk_es_statusclass FOREIGN KEY (es_no_statusclass) REFERENCES dbmig_nomenclature.ecological_status_class(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7807 (class 2606 OID 6987642)
-- Name: data_provider fk_et_id; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.data_provider
    ADD CONSTRAINT fk_et_id FOREIGN KEY (dp_et_id) REFERENCES dbmig.establishment(et_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7832 (class 2606 OID 6987647)
-- Name: fishery fk_fi_fisher_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fk_fi_fisher_type FOREIGN KEY (fi_no_fisher_type) REFERENCES dbmig_nomenclature.fisher_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7833 (class 2606 OID 6987652)
-- Name: fishery fk_fi_geartype; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fk_fi_geartype FOREIGN KEY (fi_no_geartype) REFERENCES dbmig_nomenclature.gear_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7838 (class 2606 OID 6987657)
-- Name: gear_fishing fk_gf_effort_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT fk_gf_effort_type FOREIGN KEY (gf_no_effort_type) REFERENCES dbmig_nomenclature.effort_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7839 (class 2606 OID 6987662)
-- Name: gear_fishing fk_gf_geartype; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT fk_gf_geartype FOREIGN KEY (gf_no_gear_type) REFERENCES dbmig_nomenclature.gear_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7856 (class 2606 OID 6987667)
-- Name: maturation fk_ma_sex; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.maturation
    ADD CONSTRAINT fk_ma_sex FOREIGN KEY (ma_no_sex) REFERENCES dbmig_nomenclature.sex(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7865 (class 2606 OID 6987672)
-- Name: migration_monitoring fk_mm_monitoring_direction; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT fk_mm_monitoring_direction FOREIGN KEY (mm_no_monitoring_direction) REFERENCES dbmig_nomenclature.migration_direction(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7866 (class 2606 OID 6987677)
-- Name: migration_monitoring fk_mm_monitoring_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT fk_mm_monitoring_type FOREIGN KEY (mm_no_monitoring_type) REFERENCES dbmig_nomenclature.control_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7871 (class 2606 OID 6987682)
-- Name: mortality fk_mo_mortality; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.mortality
    ADD CONSTRAINT fk_mo_mortality FOREIGN KEY (mo_no_mortality_type) REFERENCES dbmig_nomenclature.mortality_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7794 (class 2606 OID 6987687)
-- Name: observations fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.observations
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7840 (class 2606 OID 6987692)
-- Name: gear_fishing fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7867 (class 2606 OID 6987697)
-- Name: migration_monitoring fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7815 (class 2606 OID 6987702)
-- Name: ecological_status fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.ecological_status
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7850 (class 2606 OID 6987707)
-- Name: habitat_loss fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7885 (class 2606 OID 6987712)
-- Name: stocking fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.stocking
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7826 (class 2606 OID 6987717)
-- Name: predation fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7834 (class 2606 OID 6987722)
-- Name: fishery fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7893 (class 2606 OID 6987727)
-- Name: wildlife fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.wildlife
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7798 (class 2606 OID 6987732)
-- Name: obstruction fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7878 (class 2606 OID 6987737)
-- Name: physical_obstruction fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7804 (class 2606 OID 6987742)
-- Name: chemical_obstruction fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.chemical_obstruction
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7861 (class 2606 OID 6987747)
-- Name: migration fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7857 (class 2606 OID 6987752)
-- Name: maturation fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.maturation
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7844 (class 2606 OID 6987757)
-- Name: growth fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.growth
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7872 (class 2606 OID 6987762)
-- Name: mortality fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.mortality
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7810 (class 2606 OID 6987767)
-- Name: differentiation fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.differentiation
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7821 (class 2606 OID 6987772)
-- Name: electrofishing fk_ob_origin; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES dbmig_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7795 (class 2606 OID 6987777)
-- Name: observations fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.observations
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7841 (class 2606 OID 6987782)
-- Name: gear_fishing fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7868 (class 2606 OID 6987787)
-- Name: migration_monitoring fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7816 (class 2606 OID 6987792)
-- Name: ecological_status fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.ecological_status
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7851 (class 2606 OID 6987797)
-- Name: habitat_loss fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7886 (class 2606 OID 6987802)
-- Name: stocking fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.stocking
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7827 (class 2606 OID 6987807)
-- Name: predation fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7835 (class 2606 OID 6987812)
-- Name: fishery fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7894 (class 2606 OID 6987817)
-- Name: wildlife fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.wildlife
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7799 (class 2606 OID 6987822)
-- Name: obstruction fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7879 (class 2606 OID 6987827)
-- Name: physical_obstruction fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7805 (class 2606 OID 6987832)
-- Name: chemical_obstruction fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.chemical_obstruction
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7862 (class 2606 OID 6987837)
-- Name: migration fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7858 (class 2606 OID 6987842)
-- Name: maturation fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.maturation
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7845 (class 2606 OID 6987847)
-- Name: growth fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.growth
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7873 (class 2606 OID 6987852)
-- Name: mortality fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.mortality
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7811 (class 2606 OID 6987857)
-- Name: differentiation fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.differentiation
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7822 (class 2606 OID 6987862)
-- Name: electrofishing fk_ob_period; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES dbmig_nomenclature.period_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7796 (class 2606 OID 6987867)
-- Name: observations fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.observations
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7842 (class 2606 OID 6987872)
-- Name: gear_fishing fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.gear_fishing
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7869 (class 2606 OID 6987877)
-- Name: migration_monitoring fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration_monitoring
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7817 (class 2606 OID 6987882)
-- Name: ecological_status fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.ecological_status
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7852 (class 2606 OID 6987887)
-- Name: habitat_loss fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.habitat_loss
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7887 (class 2606 OID 6987892)
-- Name: stocking fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.stocking
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7828 (class 2606 OID 6987897)
-- Name: predation fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7836 (class 2606 OID 6987902)
-- Name: fishery fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.fishery
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7895 (class 2606 OID 6987907)
-- Name: wildlife fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.wildlife
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7800 (class 2606 OID 6987912)
-- Name: obstruction fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7880 (class 2606 OID 6987917)
-- Name: physical_obstruction fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7806 (class 2606 OID 6987922)
-- Name: chemical_obstruction fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.chemical_obstruction
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7863 (class 2606 OID 6987927)
-- Name: migration fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.migration
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7859 (class 2606 OID 6987932)
-- Name: maturation fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.maturation
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7846 (class 2606 OID 6987937)
-- Name: growth fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.growth
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7874 (class 2606 OID 6987942)
-- Name: mortality fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.mortality
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7812 (class 2606 OID 6987947)
-- Name: differentiation fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.differentiation
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7823 (class 2606 OID 6987952)
-- Name: electrofishing fk_ob_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.electrofishing
    ADD CONSTRAINT fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES dbmig_nomenclature.observation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7875 (class 2606 OID 6987957)
-- Name: observation_places fk_op_no_observationplacetype; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.observation_places
    ADD CONSTRAINT fk_op_no_observationplacetype FOREIGN KEY (op_no_observationplacetype) REFERENCES dbmig_nomenclature.observation_place_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7801 (class 2606 OID 6987962)
-- Name: obstruction fk_ot_mortality_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT fk_ot_mortality_type FOREIGN KEY (ot_no_mortality_type) REFERENCES dbmig_nomenclature.biological_characteristic_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7881 (class 2606 OID 6987967)
-- Name: physical_obstruction fk_ot_mortality_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_ot_mortality_type FOREIGN KEY (ot_no_mortality_type) REFERENCES dbmig_nomenclature.biological_characteristic_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7802 (class 2606 OID 6987972)
-- Name: obstruction fk_ot_obstruction_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.obstruction
    ADD CONSTRAINT fk_ot_obstruction_type FOREIGN KEY (ot_no_obstruction_type) REFERENCES dbmig_nomenclature.obstruction_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7882 (class 2606 OID 6987977)
-- Name: physical_obstruction fk_ot_phys_obstruction_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_ot_phys_obstruction_type FOREIGN KEY (ot_no_obstruction_type) REFERENCES dbmig_nomenclature.obstruction_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7883 (class 2606 OID 6987982)
-- Name: physical_obstruction fk_po_obstruction_passability; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.physical_obstruction
    ADD CONSTRAINT fk_po_obstruction_passability FOREIGN KEY (po_no_obstruction_passability) REFERENCES dbmig_nomenclature.obstruction_impact(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7829 (class 2606 OID 6987987)
-- Name: predation fk_pr_effort_unit; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT fk_pr_effort_unit FOREIGN KEY (pr_no_effort_unit) REFERENCES dbmig_nomenclature.effort_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7830 (class 2606 OID 6987992)
-- Name: predation fk_pr_predation_type; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.predation
    ADD CONSTRAINT fk_pr_predation_type FOREIGN KEY (pr_no_predation_type) REFERENCES dbmig_nomenclature.predation_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7890 (class 2606 OID 6987997)
-- Name: upstream fk_up_op_idchild; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.upstream
    ADD CONSTRAINT fk_up_op_idchild FOREIGN KEY (up_op_id_child) REFERENCES dbmig.observation_places(op_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7891 (class 2606 OID 6988002)
-- Name: upstream fk_up_op_idparent; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.upstream
    ADD CONSTRAINT fk_up_op_idparent FOREIGN KEY (up_op_id_parent) REFERENCES dbmig.observation_places(op_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7897 (class 2606 OID 6988007)
-- Name: within fk_wi_op_idchild; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.within
    ADD CONSTRAINT fk_wi_op_idchild FOREIGN KEY (wi_op_id_child) REFERENCES dbmig.observation_places(op_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7898 (class 2606 OID 6988012)
-- Name: within fk_wi_op_idparent; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.within
    ADD CONSTRAINT fk_wi_op_idparent FOREIGN KEY (wi_op_id_parent) REFERENCES dbmig.observation_places(op_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 7896 (class 2606 OID 6988017)
-- Name: wildlife fk_wi_species; Type: FK CONSTRAINT; Schema: dbmig; Owner: postgres
--

ALTER TABLE ONLY dbmig.wildlife
    ADD CONSTRAINT fk_wi_species FOREIGN KEY (wi_no_species) REFERENCES dbmig_nomenclature.species(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2023-08-01 21:35:59 CEST

--
-- PostgreSQL database dump complete
--

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA dbmig TO diaspara_read;
GRANT SELECT
ON ALL TABLES
IN SCHEMA dbmig
TO diaspara_read;