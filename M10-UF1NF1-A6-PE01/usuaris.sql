-- ***************
-- *** Usuaris ***
-- ***************
-- Usuari 1: accés només des de localhost, amb 2 privilegis
DROP USER IF EXISTS 'usuari1'@'localhost';
CREATE USER 'usuari1'@'localhost' IDENTIFIED BY 'P@ssword1';
GRANT SELECT, INSERT ON *.* TO 'usuari1'@'localhost';

-- Usuari 2: accés des de qualsevol host ('%') amb 3 privilegis
DROP USER IF EXISTS 'usuari2'@'%';
CREATE USER 'usuari2'@'%' IDENTIFIED BY 'P@ssword2';
GRANT SELECT, INSERT, UPDATE ON *.* TO 'usuari2'@'%';

-- Usuari 3: accés només des d'una IP fixa (192.168.1.100), amb 2 privilegis
DROP USER IF EXISTS 'usuari3'@'192.168.1.100';
CREATE USER 'usuari3'@'192.168.1.100' IDENTIFIED BY 'P@ssword3';
GRANT SELECT, DELETE ON *.* TO 'usuari3'@'192.168.1.100';

-- Usuari 4: accés només des de localhost, amb 6 privilegis
DROP USER IF EXISTS 'usuari4'@'localhost';
CREATE USER 'usuari4'@'localhost' IDENTIFIED BY 'P@ssword4';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP ON *.* TO 'usuari4'@'localhost';

-- Usuari 5: accés des de qualsevol host ('%'), amb 1 privilegi
DROP USER IF EXISTS 'usuari5'@'%';
CREATE USER 'usuari5'@'%' IDENTIFIED BY 'P@assword5';
GRANT SELECT ON *.* TO 'usuari5'@'%';

FLUSH PRIVILEGES;