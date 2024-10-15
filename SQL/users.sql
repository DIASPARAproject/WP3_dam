-- Should be created only once
CREATE ROLE diaspara_admin;
CREATE ROLE diaspara_read;
CREATE ROLE dbmig_FranceManager;

-- Should be done only once
--- group management
GRANT dbmig_FranceManager TO diaspara_admin WITH ADMIN OPTION;
GRANT diaspara_read TO diaspara_admin WITH ADMIN OPTION;
GRANT diaspara_read TO dbmig_FranceManager;
--- user management
GRANT diaspara_admin TO lbeaulaton WITH ADMIN OPTION;
GRANT dbmig_FranceManager TO jraitif WITH ADMIN OPTION;

-- Should be done each time the database is created
--- role management
GRANT CONNECT ON DATABASE "dbmig_France" TO diaspara_read;
ALTER DATABASE "dbmig_France" OWNER TO diaspara_admin;
--- extension management
CREATE EXTENSION "uuid-ossp" SCHEMA "public";
CREATE EXTENSION postgis SCHEMA "public";