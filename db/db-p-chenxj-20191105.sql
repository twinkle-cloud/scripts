
create user t_admin with ENCRYPTED PASSWORD 'abcd1234';
create database t_twinkle owner t_admin;
GRANT ALL PRIVILEGES ON DATABASE t_twinkle to t_admin;
\c t_twinkle;
ALTER SCHEMA public OWNER to t_admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO t_admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO t_admin;
create extension "uuid-ossp";
