-- Proves per a l'usuari de tipus venedor
USE vk22;

-- Prova SELECT a la taula "comandes"
SELECT * FROM comandes LIMIT 1;

-- Prova INSERT a la taula "comandes"
INSERT INTO comandes (num_comanda, data_comanda, clie) VALUES (DEFAULT, NOW(), 100);

-- Prova UPDATE a la taula "comandes"
UPDATE comandes SET iva = 20 WHERE num_comanda = 113051;

-- Prova SELECT a la taula "detall"
SELECT * FROM detall LIMIT 1;

-- Prova INSERT a la taula "detall"
INSERT INTO detall (num_comanda, fab, producte, quantitat, preu) VALUES (1123123, 'imm', 41003, 10, 5);

-- Prova SELECT a la taula "productes"
SELECT * FROM productes LIMIT 1;

-- Prova INSERT a la taula "productes"
INSERT INTO productes (id_producte, nom_producte, preu_unitari) VALUES (DEFAULT, 'Producte de prova', 10);
