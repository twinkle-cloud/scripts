\c t_gateway;
-- ==================================================================
-- *        Going to initialize the T_GATEWAY_ROUTE Records.        *
-- ==================================================================
TRUNCATE TABLE public.T_GATEWAY_ROUTE RESTART IDENTITY CASCADE;

-- DML
-- 
INSERT INTO public.T_GATEWAY_ROUTE (id, route_id, uri, predicates, filters, orders, description, status, creator_id)
VALUES
('7e693ad5-26df-11ea-af25-0cc47a669986',
 'authorization-server',
 'lb://twinkle-authorization:8000',
 '[{"name":"Path","args":{"pattern":"/authorization/**"}}]',
 '[{"name":"StripPrefix","args":{"parts":"1"}}]',
 100,
 '',
 1, 'system'),
('8906e027-26df-11ea-af25-0cc47a669986',
 'authentication-server',
 'lb://twinkle-authentication:8001',
 '[{"name":"Path","args":{"pattern":"/authentication/**"}}]',
 '[{"name":"StripPrefix","args":{"parts":"1"}}]',
 100,
 '',
 1, 'system'),
('93494192-26df-11ea-af25-0cc47a669986',
 'twinkle-usermgmt',
 'lb://twinkle-usermgmt:8010',
 '[{"name":"Path","args":{"pattern":"/tenant/**"}}]',
 '[{"name":"StripPrefix","args":{"parts":"1"}}]',
 100,
 '',
 1, 'system'),
('9d1f8421-26df-11ea-af25-0cc47a669986',
 'twinkle-gateway-admin',
 'lb://twinkle-gateway-admin:9999',
 '[{"name":"Path","args":{"pattern":"/gateway-admin/**"}}]',
 '[{"name":"StripPrefix","args":{"parts":"1"}}]',
 100,
 '',
 1, 'system');
