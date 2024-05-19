-- Activa la grabación de la salida en el archivo venedor.txt
TEE venedor.txt;

-- Crear el rol y asignar privilegios
CREATE ROLE Venedor;
GRANT SELECT, INSERT, UPDATE ON vk22.comandes TO Venedor;
GRANT SELECT, INSERT, UPDATE ON vk22.detall TO Venedor;
GRANT SELECT ON vk22.clients TO Venedor;

-- Desactiva la grabación
NOTEE;
