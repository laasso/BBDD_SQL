-- Proves per a l'usuari de tipus venedor
USE vk22;

-- Prova SELECT a la taula "comandes"
SELECT * FROM comandes LIMIT 1;

-- Prova INSERT a la taula "comandes"
INSERT INTO comandes (id_comanda, data_comanda, total) VALUES (DEFAULT, NOW(), 100);

-- Prova UPDATE a la taula "comandes"
UPDATE comandes SET total = 200 WHERE id_comanda = 1;

-- Prova SELECT a la taula "detall"
SELECT * FROM detall LIMIT 1;

-- Prova INSERT a la taula "detall"
INSERT INTO detall (id_detall, id_producte, quantitat, preu_unitari) VALUES (DEFAULT, 1, 10, 5);

-- Prova SELECT a la taula "productes"
SELECT * FROM productes LIMIT 1;

-- Prova INSERT a la taula "productes"
INSERT INTO productes (id_producte, nom_producte, preu_unitari) VALUES (DEFAULT, 'Producte de prova', 10);
