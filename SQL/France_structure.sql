-- @block establishment

DROP TABLE IF EXISTS France.establishment;
CREATE TABLE France.establishment(
    et_short_name text, -- ce n'est qu'un ex
    et_link text -- ce n'est qu'un ex
) INHERITS (damdb.establishment);
COMMENT ON COLUMN France.establishment.et_link is 'link to a website';
ALTER TABLE France.establishment
    ADD CONSTRAINT FRA_establishment_pkey PRIMARY KEY (et_id);
ALTER TABLE France.establishment OWNER TO damdb_FranceManager;
GRANT SELECT ON TABLE France.establishment TO diaspara_read;

CREATE TRIGGER tr_pk_id_establishment_insert BEFORE INSERT OR UPDATE ON France.establishment FOR EACH ROW EXECUTE FUNCTION damdb.pk_id_establishment_insert();

CREATE TRIGGER tr_establishment_delete
BEFORE DELETE ON France.establishment
FOR EACH ROW EXECUTE FUNCTION damdb.integrity_establishment_verify();

-- @block data provider

DROP TABLE IF EXISTS France.data_provider;
CREATE TABLE France.data_provider(
) INHERITS (damdb.data_provider);
ALTER TABLE France.data_provider
    ADD CONSTRAINT FRA_data_provider_pkey PRIMARY KEY (dp_id);
ALTER TABLE France.data_provider OWNER TO damdb_FranceManager;
GRANT SELECT ON TABLE France.data_provider TO diaspara_read;

CREATE TRIGGER tr_pk_id_data_provider_insert BEFORE INSERT OR UPDATE ON France.data_provider FOR EACH ROW EXECUTE FUNCTION damdb.pk_id_data_provider_insert();

CREATE TRIGGER tr_fk_id_establishment_insert
BEFORE INSERT OR UPDATE ON France.data_provider
FOR EACH ROW EXECUTE FUNCTION damdb.fk_id_establishment_insert();

-- @block observation_places
--- @label table creation
DROP TABLE IF EXISTS France.observation_places;
CREATE TABLE France.observation_places(
    op_dp_id INT,
    country CHAR(2) DEFAULT 'FR'
    -- VOIR S'IL FAUT METTRE AUTRE CHOSE
) INHERITS (damdb.observation_places);
ALTER TABLE France.observation_places
    ADD CONSTRAINT FRA_observation_places_pkey PRIMARY KEY (op_id);

--- @label owner and privileges
ALTER TABLE France.observation_places OWNER TO damdb_FranceManager;
GRANT SELECT ON TABLE France.observation_places TO diaspara_read;

--- @label primary key workaround
CREATE TRIGGER tr_observation_places_insert BEFORE INSERT ON France.observation_places FOR EACH ROW EXECUTE FUNCTION damdb.observation_id_place_insert();

CREATE TRIGGER tr_observation_places_update BEFORE UPDATE ON France.observation_places FOR EACH ROW EXECUTE FUNCTION damdb.observation_id_place_update();

CREATE TRIGGER tr_observation_places_delete
BEFORE DELETE ON France.observation_places
FOR EACH ROW EXECUTE FUNCTION damdb.integrity_observation_places_verify();

--- @label foreign keys
ALTER TABLE France.observation_places
    ADD CONSTRAINT FRA_fk_op_no_observationplacetype FOREIGN KEY (op_no_observationplacetype) REFERENCES damdb_nomenclature.observation_place_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE France.observation_places
    ADD CONSTRAINT FRA_fk_dp_id FOREIGN KEY (op_dp_id) REFERENCES France.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--- @label foreign keys workaround
CREATE TRIGGER tr_fk_id_data_provider_insert BEFORE INSERT OR UPDATE ON France.observation_places FOR EACH ROW EXECUTE FUNCTION damdb.fk_id_data_provider_insert();

-- @block station de ASPE
--- @label table creation
DROP TABLE IF EXISTS France.aspe_station_op;
CREATE TABLE France.aspe_station_op(
    op_code_sandre text
    -- VOIR S'IL FAUT METTRE AUTRE CHOSE
) INHERITS (France.observation_places);
ALTER TABLE France.aspe_station_op
    ADD CONSTRAINT FRA_aspe_station_op_pkey PRIMARY KEY (op_id);
ALTER TABLE France.aspe_station_op
    ALTER COLUMN op_gis_layername
    SET DEFAULT 'ASPE'; -- ne pas hésiter à mettre des valeurs par défaut quand c'est pertinent

--- @label owner and privileges
ALTER TABLE France.aspe_station_op OWNER TO damdb_FranceManager;
GRANT SELECT ON TABLE France.aspe_station_op TO diaspara_read;

--- @label primary key workaround
CREATE TRIGGER tr_aspe_station_op BEFORE INSERT ON France.aspe_station_op FOR EACH ROW EXECUTE FUNCTION damdb.observation_id_place_insert();

CREATE TRIGGER tr_aspe_station_op_update BEFORE UPDATE ON France.aspe_station_op FOR EACH ROW EXECUTE FUNCTION damdb.observation_id_place_update();

CREATE TRIGGER tr_aspe_station_delete
BEFORE DELETE ON France.aspe_station_op
FOR EACH ROW EXECUTE FUNCTION damdb.integrity_observation_places_verify();

--- @label foreign keys
ALTER TABLE France.aspe_station_op
    ADD CONSTRAINT FRA_fk_op_no_observationplacetype FOREIGN KEY (op_no_observationplacetype) REFERENCES damdb_nomenclature.observation_place_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE France.aspe_station_op
    ADD CONSTRAINT FRA_fk_dp_id FOREIGN KEY (op_dp_id) REFERENCES France.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--- @label foreign keys workaround
CREATE TRIGGER tr_fk_id_data_provider_insert BEFORE INSERT OR UPDATE ON France.aspe_station_op FOR EACH ROW EXECUTE FUNCTION damdb.fk_id_data_provider_insert();


-- @block station de RSA
--- @label table creation
DROP TABLE IF EXISTS France.rsa_station_op;
CREATE TABLE France.rsa_station_op(
    op_code_sandre text
    -- VOIR S'IL FAUT METTRE AUTRE CHOSE
) INHERITS (France.observation_places);
ALTER TABLE France.rsa_station_op
    ADD CONSTRAINT FRA_rsa_station_op_pkey PRIMARY KEY (op_id);

--- @label owner and privileges
ALTER TABLE France.rsa_station_op OWNER TO damdb_FranceManager;
GRANT SELECT ON TABLE France.rsa_station_op TO diaspara_read;

--- @label primary key workaround
CREATE TRIGGER tr_rsa_station_op BEFORE INSERT ON France.rsa_station_op FOR EACH ROW EXECUTE FUNCTION damdb.observation_id_place_insert();

CREATE TRIGGER tr_rsa_station_op_update BEFORE UPDATE ON France.rsa_station_op FOR EACH ROW EXECUTE FUNCTION damdb.observation_id_place_update();

CREATE TRIGGER tr_rsa_station_delete
BEFORE DELETE ON France.rsa_station_op
FOR EACH ROW EXECUTE FUNCTION damdb.integrity_observation_places_verify();

--- @label foreign keys
ALTER TABLE France.rsa_station_op
    ADD CONSTRAINT FRA_fk_op_no_observationplacetype FOREIGN KEY (op_no_observationplacetype) REFERENCES damdb_nomenclature.observation_place_type(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE France.rsa_station_op
    ADD CONSTRAINT FRA_fk_dp_id FOREIGN KEY (op_dp_id) REFERENCES France.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--- @label foreign keys workaround
CREATE TRIGGER tr_fk_id_data_provider_insert BEFORE INSERT OR UPDATE ON France.rsa_station_op FOR EACH ROW EXECUTE FUNCTION damdb.fk_id_data_provider_insert();

-- @block observations
--- @label table creation
DROP TABLE IF EXISTS France.observations;
CREATE TABLE France.observations(
    -- VOIR S'IL FAUT METTRE AUTRE CHOSE
) INHERITS (damdb.observations);
ALTER TABLE France.observations
    ADD CONSTRAINT FRA_observations_pkey PRIMARY KEY (ob_id);

--- @label owner and privileges
ALTER TABLE France.observations OWNER TO damdb_FranceManager;
GRANT SELECT ON TABLE France.observations TO diaspara_read;

--- @label primary key workaround
CREATE TRIGGER tr_observations_delete
    BEFORE DELETE ON France.observations
    FOR EACH ROW EXECUTE FUNCTION damdb.integrity_observations_verify();

CREATE TRIGGER tr_observations_insert
    BEFORE INSERT ON France.observations
    FOR EACH ROW EXECUTE FUNCTION damdb.observations_id_insert();

CREATE TRIGGER tr_observations_update
    BEFORE UPDATE ON France.observations
    FOR EACH ROW EXECUTE FUNCTION damdb.observations_id_update();

--- @label foreign keys
ALTER TABLE France.observations
    ADD CONSTRAINT FRA_fk_dp_id FOREIGN KEY (ob_dp_id) REFERENCES France.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE France.observations
    ADD CONSTRAINT FRA_fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES damdb_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE France.observations
    ADD CONSTRAINT FRA_fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES damdb_nomenclature.period_type(no_id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE France.observations
    ADD CONSTRAINT FRA_fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES damdb_nomenclature.observation_type(no_id) ON DELETE RESTRICT ON UPDATE CASCADE;

--- @label foreign keys workaround
CREATE TRIGGER tr_observations_op_id_insert
    BEFORE INSERT OR UPDATE ON France.observations
    FOR EACH ROW EXECUTE FUNCTION damdb.fk_id_observations_insert();

-- @block electrofishing
--- @label table creation
DROP TABLE IF EXISTS France.electrofishing;
CREATE TABLE France.electrofishing(
    -- VOIR S'IL FAUT METTRE AUTRE CHOSE
) INHERITS (damdb.electrofishing, France.observations); -- à noter le double héritage
ALTER TABLE France.electrofishing
    ADD CONSTRAINT FRA_electrofishing_pkey PRIMARY KEY (ob_id);

--- @label default
ALTER TABLE France.electrofishing
    ALTER COLUMN ob_no_origin
    SET DEFAULT 11; -- Raw data
ALTER TABLE France.electrofishing
    ALTER COLUMN ob_no_type
    SET DEFAULT 22; -- electrofishing
ALTER TABLE France.electrofishing
    ALTER COLUMN ob_no_period
    SET DEFAULT 75; -- daily

--- @label owner and privileges
ALTER TABLE France.electrofishing OWNER TO damdb_FranceManager;
GRANT SELECT ON TABLE France.electrofishing TO diaspara_read;

--- @label primary key workaround
CREATE TRIGGER tr_electrofishing_delete
    BEFORE DELETE ON France.electrofishing
    FOR EACH ROW EXECUTE FUNCTION damdb.integrity_observations_verify();

CREATE TRIGGER tr_electrofishing_insert
    BEFORE INSERT ON France.electrofishing
    FOR EACH ROW EXECUTE FUNCTION damdb.observations_id_insert();

CREATE TRIGGER tr_electrofishing_update
    BEFORE UPDATE ON France.electrofishing
    FOR EACH ROW EXECUTE FUNCTION damdb.observations_id_update();

--- @label foreign keys
ALTER TABLE France.electrofishing
    ADD CONSTRAINT FRA_fk_dp_id FOREIGN KEY (ob_dp_id) REFERENCES France.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE France.electrofishing
    ADD CONSTRAINT FRA_fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES damdb_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE France.electrofishing
    ADD CONSTRAINT FRA_fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES damdb_nomenclature.period_type(no_id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE France.electrofishing
    ADD CONSTRAINT FRA_fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES damdb_nomenclature.observation_type(no_id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE France.electrofishing
    ADD CONSTRAINT FRA_fk_ef_electrofishing_mean FOREIGN KEY (ef_no_electrofishing_mean) REFERENCES damdb_nomenclature.electrofishing_mean(no_id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE France.electrofishing
    ADD CONSTRAINT FRA_fk_ef_electrofishing_method FOREIGN KEY (ef_no_fishingmethod) REFERENCES damdb_nomenclature.scientific_observation_method(no_id) ON DELETE RESTRICT ON UPDATE CASCADE;

--- @label foreign keys workaround
CREATE TRIGGER tr_electrofishing_op_id_insert
    BEFORE INSERT OR UPDATE ON France.electrofishing
    FOR EACH ROW EXECUTE FUNCTION damdb.fk_id_observations_insert();

-- @block electrofishing ASPE
--- @label table creation
DROP TABLE IF EXISTS France.aspe_operation_ef;
CREATE TABLE France.aspe_operation_ef(
    -- VOIR S'IL FAUT METTRE AUTRE CHOSE
) INHERITS (France.electrofishing);
ALTER TABLE France.aspe_operation_ef
    ADD CONSTRAINT FRA_aspe_operation_ef_pkey PRIMARY KEY (ob_id);

--- @label owner and privileges
ALTER TABLE France.aspe_operation_ef OWNER TO damdb_FranceManager;
GRANT SELECT ON TABLE France.aspe_operation_ef TO diaspara_read;

--- @label primary key workaround
CREATE TRIGGER tr_electrofishing_delete
    BEFORE DELETE ON France.aspe_operation_ef
    FOR EACH ROW EXECUTE FUNCTION damdb.integrity_observations_verify();

CREATE TRIGGER tr_electrofishing_insert
    BEFORE INSERT ON France.aspe_operation_ef
    FOR EACH ROW EXECUTE FUNCTION damdb.observations_id_insert();

CREATE TRIGGER tr_electrofishing_update
    BEFORE UPDATE ON France.aspe_operation_ef
    FOR EACH ROW EXECUTE FUNCTION damdb.observations_id_update();

--- @label foreign keys
ALTER TABLE France.aspe_operation_ef
    ADD CONSTRAINT FRA_fk_dp_id FOREIGN KEY (ob_dp_id) REFERENCES France.data_provider(dp_id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE France.aspe_operation_ef
    ADD CONSTRAINT FRA_fk_ob_origin FOREIGN KEY (ob_no_origin) REFERENCES damdb_nomenclature.observation_origin(no_id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE France.aspe_operation_ef
    ADD CONSTRAINT FRA_fk_ob_period FOREIGN KEY (ob_no_period) REFERENCES damdb_nomenclature.period_type(no_id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE France.aspe_operation_ef
    ADD CONSTRAINT FRA_fk_ob_type FOREIGN KEY (ob_no_type) REFERENCES damdb_nomenclature.observation_type(no_id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE France.aspe_operation_ef
    ADD CONSTRAINT FRA_fk_ef_electrofishing_mean FOREIGN KEY (ef_no_electrofishing_mean) REFERENCES damdb_nomenclature.electrofishing_mean(no_id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE France.aspe_operation_ef
    ADD CONSTRAINT FRA_fk_ef_electrofishing_method FOREIGN KEY (ef_no_fishingmethod) REFERENCES damdb_nomenclature.scientific_observation_method(no_id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE France.aspe_operation_ef
    ADD CONSTRAINT fk_ob_op_id FOREIGN KEY (ob_op_id) REFERENCES France.aspe_station_op(op_id) ON DELETE CASCADE ON UPDATE CASCADE; -- à noter le rajout de cette contrainte: on veut que les opérations ASPE soit sur des stations ASPE

--- @label foreign keys workaround
CREATE TRIGGER tr_electrofishing_op_id_insert
    BEFORE INSERT OR UPDATE ON France.aspe_operation_ef
    FOR EACH ROW EXECUTE FUNCTION damdb.fk_id_observations_insert();