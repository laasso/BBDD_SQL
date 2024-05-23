-- Proves per a l'usuari de tipus director
USE vk22;

-- Prova SELECT a la taula "venedors"
SELECT * FROM venedors LIMIT 1;

-- Prova DELETE a la taula "venedors"
DELETE FROM venedors WHERE num_ven = 1;

-- Prova SELECT a la taula "comandes"
SELECT * FROM comandes LIMIT 1;

-- Prova INSERT a la taula "comandes"
INSERT INTO comandes (num_comanda, descripcio, data_comanda, clie, ven, iva, dte) VALUES (DEFAULT, 'Descripció de prova', NOW(), 123, 456, 21, 0);

-- Prova DELETE a la taula "comandes"
DELETE FROM comandes WHERE num_comanda = 112885;
