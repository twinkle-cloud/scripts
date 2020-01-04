\c t_oauth;
-- ==================================================================
-- *    Going to initialize the OAUTH_CLIENT_DETAILS Records.       *
-- ==================================================================
TRUNCATE TABLE public.OAUTH_CLIENT_DETAILS RESTART IDENTITY CASCADE;
-- DML

INSERT INTO public.OAUTH_CLIENT_DETAILS (CLIENT_ID, RESOURCE_IDS, CLIENT_SECRET, SCOPE, AUTHORIZED_GRANT_TYPES, WEB_SERVER_REDIRECT_URI, AUTHORITIES, ACCESS_TOKEN_VALIDITY, REFRESH_TOKEN_VALIDITY, ADDITIONAL_INFORMATION, AUTOAPPROVE)
VALUES ('test_client', NULL, '$2a$10$2szDKjvKHJCWE6YQNznogOeQF3USZHmCYj1fG7YbfK.vnTgNKLzri', 'read', 'client_credentials,authorization_code,mobile,password,refresh_token', 'http://baidu.com', NULL, 7200, 108000, NULL, NULL);
