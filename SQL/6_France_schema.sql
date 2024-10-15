-- ***************************************************
-- Creating schema France (with diaspara_admin right)
-- ***************************************************

CREATE SCHEMA France;
ALTER SCHEMA France OWNER TO dbmig_FranceManager;
GRANT USAGE ON SCHEMA France TO diaspara_read;
COMMENT ON SCHEMA France is 'Data from France';
