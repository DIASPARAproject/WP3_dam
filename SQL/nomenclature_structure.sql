--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)

-- Started on 2023-08-01 20:11:46 CEST

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
-- TOC entry 19 (class 2615 OID 2557613)
-- Name: damdb_nomenclature; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA damdb_nomenclature;


ALTER SCHEMA damdb_nomenclature OWNER TO diaspara_admin;
GRANT USAGE ON SCHEMA damdb_nomenclature TO diaspara_read;

--
-- TOC entry 2641 (class 1255 OID 2557667)
-- Name: nomenclature_id_insert(); Type: FUNCTION; Schema: damdb_nomenclature; Owner: postgres
--

CREATE FUNCTION damdb_nomenclature.nomenclature_id_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM no_id FROM "damdb_nomenclature".nomenclature WHERE no_id = NEW.no_id;
  IF FOUND THEN
	RAISE EXCEPTION '1- Invalid no_id (%)', NEW.no_id;
  ELSE
	RETURN NEW;
  END IF;
END
$$;


ALTER FUNCTION damdb_nomenclature.nomenclature_id_insert() OWNER TO diaspara_admin;


--
-- TOC entry 2642 (class 1255 OID 2557668)
-- Name: nomenclature_id_update(); Type: FUNCTION; Schema: damdb_nomenclature; Owner: postgres
--

CREATE FUNCTION damdb_nomenclature.nomenclature_id_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM no_id FROM "damdb_nomenclature".nomenclature WHERE no_id = NEW.no_id;
  IF FOUND THEN
	RETURN NEW;
  ELSE
	RAISE EXCEPTION '1- Invalid no_id (%)', NEW.no_id;
  END IF;
END
$$;


ALTER FUNCTION damdb_nomenclature.nomenclature_id_update() OWNER TO diaspara_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 372 (class 1259 OID 2558478)
-- Name: nomenclature; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.nomenclature (
    no_id integer NOT NULL,
    no_code character varying(2),
    no_type character varying(60),
    no_name character varying(80)
);


ALTER TABLE damdb_nomenclature.nomenclature OWNER TO diaspara_admin;

--
-- TOC entry 374 (class 1259 OID 2558486)
-- Name: biological_characteristic_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.biological_characteristic_type (
    bc_label character varying(100),
    bc_unit character varying(25),
    bc_data_type character varying(25)
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.biological_characteristic_type OWNER TO diaspara_admin;

--
-- TOC entry 375 (class 1259 OID 2558489)
-- Name: species; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.species (
    sp_vernacular_name character varying(30)
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.species OWNER TO diaspara_admin;

--
-- TOC entry 376 (class 1259 OID 2558492)
-- Name: value_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.value_type (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.value_type OWNER TO diaspara_admin;

--
-- TOC entry 380 (class 1259 OID 2558508)
-- Name: control_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.control_type (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.control_type OWNER TO diaspara_admin;

--
-- TOC entry 381 (class 1259 OID 2558511)
-- Name: downstream_mitigation_measure; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.downstream_mitigation_measure (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.downstream_mitigation_measure OWNER TO diaspara_admin;

--
-- TOC entry 382 (class 1259 OID 2558514)
-- Name: ecological_productivity; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.ecological_productivity (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.ecological_productivity OWNER TO diaspara_admin;

--
-- TOC entry 383 (class 1259 OID 2558517)
-- Name: ecological_status_class; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.ecological_status_class (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.ecological_status_class OWNER TO diaspara_admin;

--
-- TOC entry 384 (class 1259 OID 2558520)
-- Name: effort_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.effort_type (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.effort_type OWNER TO diaspara_admin;

--
-- TOC entry 385 (class 1259 OID 2558523)
-- Name: electrofishing_mean; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.electrofishing_mean (
    ef_definition character varying(500)
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.electrofishing_mean OWNER TO diaspara_admin;

--
-- TOC entry 386 (class 1259 OID 2558528)
-- Name: fisher_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.fisher_type (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.fisher_type OWNER TO diaspara_admin;

--
-- TOC entry 387 (class 1259 OID 2558531)
-- Name: fishway_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.fishway_type (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.fishway_type OWNER TO diaspara_admin;

--
-- TOC entry 388 (class 1259 OID 2558534)
-- Name: gear_characteristic_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.gear_characteristic_type (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.gear_characteristic_type OWNER TO diaspara_admin;

--
-- TOC entry 389 (class 1259 OID 2558537)
-- Name: gear_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.gear_type (
    isscfg_code character varying(6),
    main_gear character varying(60),
    eel_specific_gear character varying(60)
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.gear_type OWNER TO diaspara_admin;

--
-- TOC entry 390 (class 1259 OID 2558540)
-- Name: habitat_loss_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.habitat_loss_type (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.habitat_loss_type OWNER TO diaspara_admin;

--
-- TOC entry 391 (class 1259 OID 2558543)
-- Name: individual_status; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.individual_status (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.individual_status OWNER TO diaspara_admin;

--
-- TOC entry 392 (class 1259 OID 2558546)
-- Name: migration_direction; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.migration_direction (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.migration_direction OWNER TO diaspara_admin;

--
-- TOC entry 393 (class 1259 OID 2558549)
-- Name: mortality_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.mortality_type (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.mortality_type OWNER TO diaspara_admin;

--
-- TOC entry 394 (class 1259 OID 2558552)
-- Name: nomenclature_no_id_seq; Type: SEQUENCE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE SEQUENCE damdb_nomenclature.nomenclature_no_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE damdb_nomenclature.nomenclature_no_id_seq OWNER TO diaspara_admin;

--
-- TOC entry 8091 (class 0 OID 0)
-- Dependencies: 394
-- Name: nomenclature_no_id_seq; Type: SEQUENCE OWNED BY; Schema: damdb_nomenclature; Owner: postgres
--

ALTER SEQUENCE damdb_nomenclature.nomenclature_no_id_seq OWNED BY damdb_nomenclature.nomenclature.no_id;


--
-- TOC entry 395 (class 1259 OID 2558553)
-- Name: observation_origin; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.observation_origin (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.observation_origin OWNER TO diaspara_admin;

--
-- TOC entry 396 (class 1259 OID 2558556)
-- Name: observation_place_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.observation_place_type (
    obs_subtype_name character varying(30)
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.observation_place_type OWNER TO diaspara_admin;

--
-- TOC entry 397 (class 1259 OID 2558559)
-- Name: observation_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.observation_type (
    obs_type_class_name character varying(30)
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.observation_type OWNER TO diaspara_admin;

--
-- TOC entry 398 (class 1259 OID 2558562)
-- Name: obstruction_impact; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.obstruction_impact (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.obstruction_impact OWNER TO diaspara_admin;

--
-- TOC entry 399 (class 1259 OID 2558565)
-- Name: obstruction_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.obstruction_type (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.obstruction_type OWNER TO diaspara_admin;

--
-- TOC entry 8092 (class 0 OID 0)
-- Dependencies: 399
-- Name: TABLE obstruction_type; Type: COMMENT; Schema: damdb_nomenclature; Owner: postgres
--

COMMENT ON TABLE damdb_nomenclature.obstruction_type IS 'This table used to contain only physical obstruction as type, the types have been extended during sudoang';


--
-- TOC entry 400 (class 1259 OID 2558568)
-- Name: orient_flow; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.orient_flow (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.orient_flow OWNER TO diaspara_admin;

--
-- TOC entry 401 (class 1259 OID 2558571)
-- Name: period_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.period_type (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.period_type OWNER TO diaspara_admin;

--
-- TOC entry 402 (class 1259 OID 2558574)
-- Name: predation_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.predation_type (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.predation_type OWNER TO diaspara_admin;

--
-- TOC entry 403 (class 1259 OID 2558577)
-- Name: predator_subtype; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.predator_subtype (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.predator_subtype OWNER TO diaspara_admin;

--
-- TOC entry 404 (class 1259 OID 2558580)
-- Name: scientific_observation_method; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.scientific_observation_method (
    sc_observation_category character varying(30),
    sc_definition character varying(500)
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.scientific_observation_method OWNER TO diaspara_admin;

--
-- TOC entry 405 (class 1259 OID 2558585)
-- Name: sex; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.sex (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.sex OWNER TO diaspara_admin;

--
-- TOC entry 406 (class 1259 OID 2558588)
-- Name: stage; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.stage (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.stage OWNER TO diaspara_admin;

--
-- TOC entry 407 (class 1259 OID 2558591)
-- Name: turbine_type; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.turbine_type (
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.turbine_type OWNER TO diaspara_admin;

--
-- TOC entry 408 (class 1259 OID 2558594)
-- Name: type_of_unit; Type: TABLE; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TABLE damdb_nomenclature.type_of_unit (
    tu_unit character varying(10)
)
INHERITS (damdb_nomenclature.nomenclature);


ALTER TABLE damdb_nomenclature.type_of_unit OWNER TO diaspara_admin;

--
-- TOC entry 7665 (class 2604 OID 2562114)
-- Name: biological_characteristic_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.biological_characteristic_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7668 (class 2604 OID 2562115)
-- Name: control_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.control_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7669 (class 2604 OID 2562116)
-- Name: downstream_mitigation_measure no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.downstream_mitigation_measure ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7670 (class 2604 OID 2562117)
-- Name: ecological_productivity no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.ecological_productivity ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7671 (class 2604 OID 2562118)
-- Name: ecological_status_class no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.ecological_status_class ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7672 (class 2604 OID 2562119)
-- Name: effort_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.effort_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7673 (class 2604 OID 2562120)
-- Name: electrofishing_mean no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.electrofishing_mean ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7674 (class 2604 OID 2562121)
-- Name: fisher_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.fisher_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7675 (class 2604 OID 2562122)
-- Name: fishway_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.fishway_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7676 (class 2604 OID 2562123)
-- Name: gear_characteristic_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.gear_characteristic_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7677 (class 2604 OID 2562124)
-- Name: gear_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.gear_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7678 (class 2604 OID 2562125)
-- Name: habitat_loss_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.habitat_loss_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7679 (class 2604 OID 2562126)
-- Name: individual_status no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.individual_status ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7680 (class 2604 OID 2562127)
-- Name: migration_direction no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.migration_direction ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7681 (class 2604 OID 2562128)
-- Name: mortality_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.mortality_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7664 (class 2604 OID 2562129)
-- Name: nomenclature no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.nomenclature ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7682 (class 2604 OID 2562130)
-- Name: observation_origin no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.observation_origin ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7683 (class 2604 OID 2562131)
-- Name: observation_place_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.observation_place_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7684 (class 2604 OID 2562132)
-- Name: observation_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.observation_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7685 (class 2604 OID 2562133)
-- Name: obstruction_impact no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.obstruction_impact ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7686 (class 2604 OID 2562134)
-- Name: obstruction_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.obstruction_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7687 (class 2604 OID 2562135)
-- Name: orient_flow no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.orient_flow ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7688 (class 2604 OID 2562136)
-- Name: period_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.period_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7689 (class 2604 OID 2562137)
-- Name: predation_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.predation_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7690 (class 2604 OID 2562138)
-- Name: predator_subtype no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.predator_subtype ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7691 (class 2604 OID 2562139)
-- Name: scientific_observation_method no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.scientific_observation_method ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7692 (class 2604 OID 2562140)
-- Name: sex no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.sex ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7666 (class 2604 OID 2562141)
-- Name: species no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.species ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7693 (class 2604 OID 2562142)
-- Name: stage no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.stage ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7694 (class 2604 OID 2562143)
-- Name: turbine_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.turbine_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7695 (class 2604 OID 2562144)
-- Name: type_of_unit no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.type_of_unit ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7667 (class 2604 OID 2562145)
-- Name: value_type no_id; Type: DEFAULT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.value_type ALTER COLUMN no_id SET DEFAULT nextval('damdb_nomenclature.nomenclature_no_id_seq'::regclass);


--
-- TOC entry 7699 (class 2606 OID 6985917)
-- Name: biological_characteristic_type bc_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.biological_characteristic_type
    ADD CONSTRAINT bc_id PRIMARY KEY (no_id);


--
-- TOC entry 7707 (class 2606 OID 6985919)
-- Name: downstream_mitigation_measure c_pk_downstream_mitigation_measure; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.downstream_mitigation_measure
    ADD CONSTRAINT c_pk_downstream_mitigation_measure PRIMARY KEY (no_id);


--
-- TOC entry 7705 (class 2606 OID 6985921)
-- Name: control_type control_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.control_type
    ADD CONSTRAINT control_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7711 (class 2606 OID 6985923)
-- Name: ecological_status_class ecolo_class_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.ecological_status_class
    ADD CONSTRAINT ecolo_class_id PRIMARY KEY (no_id);


--
-- TOC entry 7709 (class 2606 OID 6985925)
-- Name: ecological_productivity ecological_productivity_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.ecological_productivity
    ADD CONSTRAINT ecological_productivity_id PRIMARY KEY (no_id);


--
-- TOC entry 7715 (class 2606 OID 6985927)
-- Name: electrofishing_mean ef_mean_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.electrofishing_mean
    ADD CONSTRAINT ef_mean_id PRIMARY KEY (no_id);


--
-- TOC entry 7713 (class 2606 OID 6985929)
-- Name: effort_type effort_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.effort_type
    ADD CONSTRAINT effort_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7717 (class 2606 OID 6985931)
-- Name: fisher_type fisher_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.fisher_type
    ADD CONSTRAINT fisher_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7719 (class 2606 OID 6985933)
-- Name: fishway_type fishway_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.fishway_type
    ADD CONSTRAINT fishway_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7721 (class 2606 OID 6985935)
-- Name: gear_characteristic_type gear_characteristic_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.gear_characteristic_type
    ADD CONSTRAINT gear_characteristic_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7723 (class 2606 OID 6985937)
-- Name: gear_type gear_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.gear_type
    ADD CONSTRAINT gear_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7725 (class 2606 OID 6985939)
-- Name: habitat_loss_type habitat_loss_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.habitat_loss_type
    ADD CONSTRAINT habitat_loss_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7727 (class 2606 OID 6985941)
-- Name: individual_status indiv_status_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.individual_status
    ADD CONSTRAINT indiv_status_id PRIMARY KEY (no_id);


--
-- TOC entry 7729 (class 2606 OID 6985943)
-- Name: migration_direction migration_direction_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.migration_direction
    ADD CONSTRAINT migration_direction_id PRIMARY KEY (no_id);


--
-- TOC entry 7731 (class 2606 OID 6985945)
-- Name: mortality_type mortality_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.mortality_type
    ADD CONSTRAINT mortality_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7697 (class 2606 OID 6985947)
-- Name: nomenclature nomenclature_pkey; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.nomenclature
    ADD CONSTRAINT nomenclature_pkey PRIMARY KEY (no_id);


--
-- TOC entry 7733 (class 2606 OID 6985949)
-- Name: observation_origin obs_origin_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.observation_origin
    ADD CONSTRAINT obs_origin_id PRIMARY KEY (no_id);


--
-- TOC entry 7735 (class 2606 OID 6985951)
-- Name: observation_place_type obs_subtype_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.observation_place_type
    ADD CONSTRAINT obs_subtype_id PRIMARY KEY (no_id);


--
-- TOC entry 7737 (class 2606 OID 6985953)
-- Name: observation_type obs_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.observation_type
    ADD CONSTRAINT obs_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7739 (class 2606 OID 6985955)
-- Name: obstruction_impact obstruction_impact_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.obstruction_impact
    ADD CONSTRAINT obstruction_impact_id PRIMARY KEY (no_id);


--
-- TOC entry 7741 (class 2606 OID 6985957)
-- Name: obstruction_type obstruction_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.obstruction_type
    ADD CONSTRAINT obstruction_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7743 (class 2606 OID 6985959)
-- Name: orient_flow orient_flow_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.orient_flow
    ADD CONSTRAINT orient_flow_id PRIMARY KEY (no_id);


--
-- TOC entry 7745 (class 2606 OID 6985961)
-- Name: period_type period_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.period_type
    ADD CONSTRAINT period_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7747 (class 2606 OID 6985963)
-- Name: predation_type predation_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.predation_type
    ADD CONSTRAINT predation_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7749 (class 2606 OID 6985965)
-- Name: predator_subtype predator_subtype_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.predator_subtype
    ADD CONSTRAINT predator_subtype_id PRIMARY KEY (no_id);


--
-- TOC entry 7751 (class 2606 OID 6985967)
-- Name: scientific_observation_method sc_observ_method_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.scientific_observation_method
    ADD CONSTRAINT sc_observ_method_id PRIMARY KEY (no_id);


--
-- TOC entry 7753 (class 2606 OID 6985969)
-- Name: sex sex_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.sex
    ADD CONSTRAINT sex_id PRIMARY KEY (no_id);


--
-- TOC entry 7701 (class 2606 OID 6985971)
-- Name: species sp_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.species
    ADD CONSTRAINT sp_id PRIMARY KEY (no_id);


--
-- TOC entry 7755 (class 2606 OID 6985973)
-- Name: stage st_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.stage
    ADD CONSTRAINT st_id PRIMARY KEY (no_id);


--
-- TOC entry 7757 (class 2606 OID 6985975)
-- Name: turbine_type turbine_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.turbine_type
    ADD CONSTRAINT turbine_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7759 (class 2606 OID 6985977)
-- Name: type_of_unit type_of_unit_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.type_of_unit
    ADD CONSTRAINT type_of_unit_id PRIMARY KEY (no_id);


--
-- TOC entry 7703 (class 2606 OID 6985979)
-- Name: value_type vl_type_id; Type: CONSTRAINT; Schema: damdb_nomenclature; Owner: postgres
--

ALTER TABLE ONLY damdb_nomenclature.value_type
    ADD CONSTRAINT vl_type_id PRIMARY KEY (no_id);


--
-- TOC entry 7770 (class 2620 OID 6987149)
-- Name: downstream_mitigation_measure downstream_mitigation_measure_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER downstream_mitigation_measure_insert BEFORE INSERT ON damdb_nomenclature.downstream_mitigation_measure FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7771 (class 2620 OID 6987150)
-- Name: downstream_mitigation_measure downstream_mitigation_measure_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER downstream_mitigation_measure_update BEFORE UPDATE ON damdb_nomenclature.downstream_mitigation_measure FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7768 (class 2620 OID 6987151)
-- Name: control_type r_control_type_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER r_control_type_insert BEFORE INSERT ON damdb_nomenclature.control_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7762 (class 2620 OID 6987152)
-- Name: biological_characteristic_type tr_bio_characteristic_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_bio_characteristic_insert BEFORE INSERT ON damdb_nomenclature.biological_characteristic_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7763 (class 2620 OID 6987153)
-- Name: biological_characteristic_type tr_bio_characteristic_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_bio_characteristic_update BEFORE UPDATE ON damdb_nomenclature.biological_characteristic_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7769 (class 2620 OID 6987154)
-- Name: control_type tr_control_type_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_control_type_update BEFORE UPDATE ON damdb_nomenclature.control_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7774 (class 2620 OID 6987155)
-- Name: ecological_status_class tr_ecolo_status_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_ecolo_status_insert BEFORE INSERT ON damdb_nomenclature.ecological_status_class FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7775 (class 2620 OID 6987156)
-- Name: ecological_status_class tr_ecolo_status_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_ecolo_status_update BEFORE UPDATE ON damdb_nomenclature.ecological_status_class FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7772 (class 2620 OID 6987157)
-- Name: ecological_productivity tr_ecological_prod_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_ecological_prod_insert BEFORE INSERT ON damdb_nomenclature.ecological_productivity FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7773 (class 2620 OID 6987158)
-- Name: ecological_productivity tr_ecological_prod_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_ecological_prod_update BEFORE UPDATE ON damdb_nomenclature.ecological_productivity FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7776 (class 2620 OID 6987159)
-- Name: effort_type tr_effort_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_effort_insert BEFORE INSERT ON damdb_nomenclature.effort_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7777 (class 2620 OID 6987160)
-- Name: effort_type tr_effort_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_effort_update BEFORE UPDATE ON damdb_nomenclature.effort_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7778 (class 2620 OID 6987161)
-- Name: electrofishing_mean tr_electrofishing_mean_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_electrofishing_mean_insert BEFORE INSERT ON damdb_nomenclature.electrofishing_mean FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7779 (class 2620 OID 6987162)
-- Name: electrofishing_mean tr_electrofishing_mean_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_electrofishing_mean_update BEFORE UPDATE ON damdb_nomenclature.electrofishing_mean FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7780 (class 2620 OID 6987163)
-- Name: fisher_type tr_fisher_type_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_fisher_type_insert BEFORE INSERT ON damdb_nomenclature.fisher_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7781 (class 2620 OID 6987164)
-- Name: fisher_type tr_fisher_type_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_fisher_type_update BEFORE UPDATE ON damdb_nomenclature.fisher_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7782 (class 2620 OID 6987165)
-- Name: fishway_type tr_fishway_type_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_fishway_type_insert BEFORE INSERT ON damdb_nomenclature.fishway_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7783 (class 2620 OID 6987166)
-- Name: fishway_type tr_fishway_type_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_fishway_type_update BEFORE UPDATE ON damdb_nomenclature.fishway_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7784 (class 2620 OID 6987167)
-- Name: gear_characteristic_type tr_gear_characteristic_type_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_gear_characteristic_type_insert BEFORE INSERT ON damdb_nomenclature.gear_characteristic_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7785 (class 2620 OID 6987168)
-- Name: gear_characteristic_type tr_gear_characteristic_type_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_gear_characteristic_type_update BEFORE UPDATE ON damdb_nomenclature.gear_characteristic_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7786 (class 2620 OID 6987169)
-- Name: gear_type tr_gear_type_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_gear_type_insert BEFORE INSERT ON damdb_nomenclature.gear_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7787 (class 2620 OID 6987170)
-- Name: gear_type tr_gear_type_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_gear_type_update BEFORE UPDATE ON damdb_nomenclature.gear_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7788 (class 2620 OID 6987171)
-- Name: habitat_loss_type tr_habitat_loss_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_habitat_loss_insert BEFORE INSERT ON damdb_nomenclature.habitat_loss_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7789 (class 2620 OID 6987172)
-- Name: habitat_loss_type tr_habitat_loss_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_habitat_loss_update BEFORE UPDATE ON damdb_nomenclature.habitat_loss_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7790 (class 2620 OID 6987173)
-- Name: individual_status tr_indiv_status_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_indiv_status_insert BEFORE INSERT ON damdb_nomenclature.individual_status FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7791 (class 2620 OID 6987174)
-- Name: individual_status tr_indiv_status_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_indiv_status_update BEFORE UPDATE ON damdb_nomenclature.individual_status FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7792 (class 2620 OID 6987175)
-- Name: migration_direction tr_migration_direction_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_migration_direction_insert BEFORE INSERT ON damdb_nomenclature.migration_direction FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7793 (class 2620 OID 6987176)
-- Name: migration_direction tr_migration_direction_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_migration_direction_update BEFORE UPDATE ON damdb_nomenclature.migration_direction FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7794 (class 2620 OID 6987177)
-- Name: mortality_type tr_mortality_type_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_mortality_type_insert BEFORE INSERT ON damdb_nomenclature.mortality_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7795 (class 2620 OID 6987178)
-- Name: mortality_type tr_mortality_type_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_mortality_type_update BEFORE UPDATE ON damdb_nomenclature.mortality_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7760 (class 2620 OID 6987179)
-- Name: nomenclature tr_nomenclature_id_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_nomenclature_id_insert BEFORE INSERT ON damdb_nomenclature.nomenclature FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7761 (class 2620 OID 6987180)
-- Name: nomenclature tr_nomenclature_id_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_nomenclature_id_update BEFORE UPDATE ON damdb_nomenclature.nomenclature FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7796 (class 2620 OID 6987181)
-- Name: observation_origin tr_obs_origin_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_obs_origin_insert BEFORE INSERT ON damdb_nomenclature.observation_origin FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7797 (class 2620 OID 6987182)
-- Name: observation_origin tr_obs_origin_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_obs_origin_update BEFORE UPDATE ON damdb_nomenclature.observation_origin FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7798 (class 2620 OID 6987183)
-- Name: observation_place_type tr_obs_subtype_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_obs_subtype_insert BEFORE INSERT ON damdb_nomenclature.observation_place_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7799 (class 2620 OID 6987184)
-- Name: observation_place_type tr_obs_subtype_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_obs_subtype_update BEFORE UPDATE ON damdb_nomenclature.observation_place_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7800 (class 2620 OID 6987185)
-- Name: observation_type tr_obs_type_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_obs_type_insert BEFORE INSERT ON damdb_nomenclature.observation_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7801 (class 2620 OID 6987186)
-- Name: observation_type tr_obs_type_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_obs_type_update BEFORE UPDATE ON damdb_nomenclature.observation_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7802 (class 2620 OID 6987187)
-- Name: obstruction_impact tr_obstruction_impact_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_obstruction_impact_insert BEFORE INSERT ON damdb_nomenclature.obstruction_impact FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7803 (class 2620 OID 6987188)
-- Name: obstruction_impact tr_obstruction_impact_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_obstruction_impact_update BEFORE UPDATE ON damdb_nomenclature.obstruction_impact FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7804 (class 2620 OID 6987189)
-- Name: obstruction_type tr_obstruction_type_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_obstruction_type_insert BEFORE INSERT ON damdb_nomenclature.obstruction_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7805 (class 2620 OID 6987190)
-- Name: obstruction_type tr_obstruction_type_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_obstruction_type_update BEFORE UPDATE ON damdb_nomenclature.obstruction_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7806 (class 2620 OID 6987191)
-- Name: orient_flow tr_orient_flow_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_orient_flow_insert BEFORE INSERT ON damdb_nomenclature.orient_flow FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7807 (class 2620 OID 6987192)
-- Name: orient_flow tr_orient_flow_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_orient_flow_update BEFORE UPDATE ON damdb_nomenclature.orient_flow FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7808 (class 2620 OID 6987193)
-- Name: period_type tr_period_type_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_period_type_insert BEFORE INSERT ON damdb_nomenclature.period_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7809 (class 2620 OID 6987194)
-- Name: period_type tr_period_type_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_period_type_update BEFORE UPDATE ON damdb_nomenclature.period_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7810 (class 2620 OID 6987195)
-- Name: predation_type tr_predation_type_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_predation_type_insert BEFORE INSERT ON damdb_nomenclature.predation_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7811 (class 2620 OID 6987196)
-- Name: predation_type tr_predation_type_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_predation_type_update BEFORE UPDATE ON damdb_nomenclature.predation_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7812 (class 2620 OID 6987197)
-- Name: predator_subtype tr_predator_subtype_check; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_predator_subtype_check BEFORE UPDATE ON damdb_nomenclature.predator_subtype FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7813 (class 2620 OID 6987198)
-- Name: predator_subtype tr_predator_subtype_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_predator_subtype_insert BEFORE INSERT ON damdb_nomenclature.predator_subtype FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7814 (class 2620 OID 6987199)
-- Name: scientific_observation_method tr_scientific_obs_method_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_scientific_obs_method_insert BEFORE INSERT ON damdb_nomenclature.scientific_observation_method FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7815 (class 2620 OID 6987200)
-- Name: scientific_observation_method tr_scientific_obs_method_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_scientific_obs_method_update BEFORE UPDATE ON damdb_nomenclature.scientific_observation_method FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7816 (class 2620 OID 6987201)
-- Name: sex tr_sex_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_sex_insert BEFORE INSERT ON damdb_nomenclature.sex FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7817 (class 2620 OID 6987202)
-- Name: sex tr_sex_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_sex_update BEFORE UPDATE ON damdb_nomenclature.sex FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7764 (class 2620 OID 6987203)
-- Name: species tr_species_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_species_insert BEFORE INSERT ON damdb_nomenclature.species FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7765 (class 2620 OID 6987204)
-- Name: species tr_species_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_species_update BEFORE UPDATE ON damdb_nomenclature.species FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7818 (class 2620 OID 6987205)
-- Name: stage tr_stage_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_stage_insert BEFORE INSERT ON damdb_nomenclature.stage FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7819 (class 2620 OID 6987206)
-- Name: stage tr_stage_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_stage_update BEFORE UPDATE ON damdb_nomenclature.stage FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7820 (class 2620 OID 6987207)
-- Name: turbine_type tr_turbine_type_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_turbine_type_insert BEFORE INSERT ON damdb_nomenclature.turbine_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7821 (class 2620 OID 6987208)
-- Name: turbine_type tr_turbine_type_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_turbine_type_update BEFORE UPDATE ON damdb_nomenclature.turbine_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7822 (class 2620 OID 6987209)
-- Name: type_of_unit tr_type_of_unit_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_type_of_unit_insert BEFORE INSERT ON damdb_nomenclature.type_of_unit FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7823 (class 2620 OID 6987210)
-- Name: type_of_unit tr_type_of_unit_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_type_of_unit_update BEFORE UPDATE ON damdb_nomenclature.type_of_unit FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


--
-- TOC entry 7766 (class 2620 OID 6987211)
-- Name: value_type tr_value_type_insert; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_value_type_insert BEFORE INSERT ON damdb_nomenclature.value_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_insert();


--
-- TOC entry 7767 (class 2620 OID 6987212)
-- Name: value_type tr_value_type_update; Type: TRIGGER; Schema: damdb_nomenclature; Owner: postgres
--

CREATE TRIGGER tr_value_type_update BEFORE UPDATE ON damdb_nomenclature.value_type FOR EACH ROW EXECUTE FUNCTION damdb_nomenclature.nomenclature_id_update();


-- Completed on 2023-08-01 20:11:53 CEST

--
-- PostgreSQL database dump complete
--

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA damdb_nomenclature TO diaspara_read;
GRANT SELECT
ON ALL TABLES
IN SCHEMA damdb_nomenclature
TO diaspara_read;
GRANT ALL
ON ALL TABLES
IN SCHEMA damdb_nomenclature
TO diaspara_admin;

