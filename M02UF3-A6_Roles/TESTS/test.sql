-- Test de permisos per a Venedor
-- Connectar com a usuari Venedor1
CONNECT 'Venedor1'@'localhost' IDENTIFIED BY 'P@ssw0rd1';
-- Redirigir la sortida a venedor.txt
TEE /home/lasso/BBDD_SQL/M02UF3-A6_Roles/TESTS/venedor.txt;

-- Provar permisos SELECT, INSERT i UPDATE a la taula "comandes"
SELECT * FROM vk22.comandes;
INSERT INTO vk22.comandes (column1, column2) VALUES ('value1', 'value2');
UPDATE vk22.comandes SET column1 = 'new_value' WHERE column2 = 'value2';

-- Provar permisos SELECT i INSERT a la taula "productes"
SELECT * FROM vk22.productes;
INSERT INTO vk22.productes (column1, column2) VALUES ('value1', 'value2');

-- Acabar la redirecció de sortida
NOTEE;

-- Desconnectar
DISCONNECT;

-- Test de permisos per a Director
-- Connectar com a usuari Director1
CONNECT 'Director1'@'localhost' IDENTIFIED BY 'P@ssw0rd2';
-- Redirigir la sortida a director.txt
TEE /home/lasso/BBDD_SQL/M02UF3-A6_Roles/TESTS/director.txt;

-- Provar permisos SELECT i DELETE a la taula "venedors"
SELECT * FROM vk22.venedors;
DELETE FROM vk22.venedors WHERE column1 = 'value1';

-- Provar permisos SELECT, INSERT i DELETE a la taula "comandes"
SELECT * FROM vk22.comandes;
INSERT INTO vk22.comandes (column1, column2) VALUES ('value1', 'value2');
DELETE FROM vk22.comandes WHERE column1 = 'value1';

-- Acabar la redirecció de sortida
NOTEE;

-- Desconnectar
DISCONNECT;

-- Test de permisos per a Gerent
-- Connectar com a usuari Gerent
CONNECT 'Gerent'@'localhost' IDENTIFIED BY 'P@ssw0rd3';
-- Redirigir la sortida a gerent.txt
TEE /home/lasso/BBDD_SQL/M02UF3-A6_Roles/TESTS/gerent.txt;

-- Provar permisos SELECT i DELETE a la taula "venedors"
SELECT * FROM vk22.venedors;
DELETE FROM vk22.venedors WHERE column1 = 'value1';

-- Provar permisos SELECT i DELETE a la taula "comandes"
SELECT * FROM vk22.comandes;
DELETE FROM vk22.comandes WHERE column1 = 'value1';

-- Provar creació d'una nova taula anomenada "gerencia"
CREATE TABLE vk22.gerencia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    column1 VARCHAR(255) NOT NULL,
    column2 VARCHAR(255) NOT NULL
);

-- Acabar la redirecció de sortida
NOTEE;

-- Desconnectar
DISCONNECT;
