-- Should be created only once
-- each role groups will appear and all databases
-- note the roless might already have been created on the server.... so check ...




createDB -U postgres migdb

# TODO ON SERVER MODIFY pg_hba.conf


--- extension management
CREATE EXTENSION "uuid-ossp" SCHEMA "public";
CREATE EXTENSION postgis SCHEMA "public";



GRANT ALL PRIVILEGES ON SCHEMA public TO diaspara_admin ;


-- Should be done each time the database is created
--- role management
GRANT CONNECT ON DATABASE damdb TO diaspara_read;
ALTER DATABASE damdb OWNER TO diaspara_admin;



