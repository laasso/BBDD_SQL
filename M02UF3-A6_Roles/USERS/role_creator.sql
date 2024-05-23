-- Crear rols
CREATE ROLE venedor;
CREATE ROLE director;
CREATE ROLE gerent;

-- Assignar privilegis als rols
GRANT SELECT, INSERT, UPDATE ON vk22.comandes TO venedor;
GRANT SELECT, INSERT, UPDATE ON vk22.detall TO venedor;
GRANT SELECT ON vk22.clients TO venedor;

GRANT SELECT, UPDATE, DELETE, DROP, ALTER ON vk22.* TO director;

GRANT ALL PRIVILEGES ON vk22.* TO gerent;
