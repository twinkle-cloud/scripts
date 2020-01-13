\c t_oauth;
-- ==================================================================
-- *    Going to initialize the OAUTH_CLIENT_DETAILS Records.       *
-- ==================================================================
TRUNCATE TABLE public.OAUTH_CLIENT_DETAILS RESTART IDENTITY CASCADE;
-- DML
-- client_id: twinkle_cloud_client, client_secret: BC(cloud_client_1A)
INSERT INTO public.OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES ('twinkle_cloud_client', NULL, '{bcrypt}$2a$10$WEdbTYeZBk0QIj1O0UXL9O8K5tQ1LiCNuo.MAilc4iAKRSM1ZGdd2', 'read,write', 'client_credentials,authorization_code,mobile,password,refresh_token', 'https://www.twinkle.net', NULL, 7200, 108000, NULL, NULL);
