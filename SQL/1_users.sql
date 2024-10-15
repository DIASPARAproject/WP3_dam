-- Should be created only once
-- each role groups will appear and all databases
-- note the roless might already have been created on the server.... so check ...
CREATE ROLE diaspara_admin;
CREATE ROLE diaspara_read;
CREATE ROLE diaspara_france_admin; -- administrateur pour un schema
CREATE ROLE diaspara_satmanager;
CREATE ROLE diaspara_eelmanager;

GRANT ALL PRIVILEGES ON SCHEMA public TO diaspara_admin ;


CREATE ROLE jules WITH 
  NOSUPERUSER
  CREATEDB
  CREATEROLE
  INHERIT
  LOGIN
  CONNECTION LIMIT -1;

--- ALTER ROLE jules IN DATABASE "diaspara" SET search_path="$user", public;

CREATE ROLE cedric WITH 
  NOSUPERUSER
  CREATEDB
  CREATEROLE
  INHERIT
  LOGIN
  CONNECTION LIMIT -1;
ALTER ROLE cedric WITH password '***************'; --c
--- ALTER ROLE jules IN DATABASE "diaspara" SET search_path="$user", public;



--- GRANT DBEel_DBManager TO lbeaulaton WITH ADMIN OPTION;
GRANT diaspara_admin TO jules ;
GRANT diaspara_france_admin TO jules ;
GRANT diaspara_admin TO cedric ;
GRANT diaspara_france_admin TO cedric ;

-- Should be done each time the database is created
--- role management
GRANT CONNECT ON DATABASE dbmig TO diaspara_read;
ALTER DATABASE dbmig OWNER TO diaspara_admin;

# TODO ON SERVER MODIFY pg_hba.conf

--- extension management
CREATE EXTENSION "uuid-ossp" SCHEMA "public";
CREATE EXTENSION postgis SCHEMA "public";
