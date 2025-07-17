-- grant roles for diaspara_read
GRANT USAGE 
    ON SCHEMA dbmig
    TO diaspara_read;

GRANT EXECUTE 
    ON ALL FUNCTIONS
    IN SCHEMA dbmig
    TO diaspara_read;

GRANT SELECT
    ON ALL TABLES
    IN SCHEMA dbmig
    TO diaspara_read;
    
-- grant roles for diaspara_read
GRANT USAGE 
    ON SCHEMA dbmig_nomenclature
    TO diaspara_read;

GRANT EXECUTE 
    ON ALL FUNCTIONS
    IN SCHEMA dbmig_nomenclature
    TO diaspara_read;

GRANT SELECT
    ON ALL TABLES
    IN SCHEMA dbmig_nomenclature
    TO diaspara_read;