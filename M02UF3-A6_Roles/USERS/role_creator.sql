-- Crear rols i assignar privilegis
CREATE ROLE Venedor;
GRANT SELECT, INSERT, UPDATE ON vk22.comandes TO Venedor;
GRANT SELECT, INSERT, UPDATE ON vk22.detall TO Venedor;
GRANT SELECT ON vk22.clients TO Venedor;

CREATE ROLE Director;
GRANT SELECT, UPDATE, DELETE, DROP, ALTER ON vk22.* TO Director;

CREATE ROLE Gerent;
GRANT ALL PRIVILEGES ON vk22.* TO Gerent;
