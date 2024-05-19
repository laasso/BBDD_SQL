-- Proves per a l'usuari de tipus director
USE vk22;

-- Prova SELECT a la taula "venedors"
SELECT * FROM venedors LIMIT 1;

-- Prova DELETE a la taula "venedors"
DELETE FROM venedors WHERE id_venedor = 1;

-- Prova SELECT a la taula "comandes"
SELECT * FROM comandes LIMIT 1;

-- Prova INSERT a la taula "comandes"
INSERT INTO comandes (id_comanda, data_comanda, total) VALUES (DEFAULT, NOW(), 100);

-- Prova DELETE a la taula "comandes"
DELETE FROM comandes WHERE id_comanda = 1;
