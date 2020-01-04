
create user admin with ENCRYPTED PASSWORD 'abcd1234';
create database t_twinkle owner admin;
GRANT ALL PRIVILEGES ON DATABASE t_twinkle to admin;

create database t_gateway owner admin;
GRANT ALL PRIVILEGES ON DATABASE t_gateway to admin;

create database t_oauth owner admin;
GRANT ALL PRIVILEGES ON DATABASE t_oauth to admin;

\c t_twinkle;
ALTER SCHEMA public OWNER to admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;
create extension "uuid-ossp";

\c t_gateway;
ALTER SCHEMA public OWNER to admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;
create extension "uuid-ossp";

\c t_oauth;
ALTER SCHEMA public OWNER to admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;
create extension "uuid-ossp";