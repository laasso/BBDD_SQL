-- Proves per a l'usuari de tipus gerent
USE vk22;

-- Prova SELECT a la taula "venedors"
SELECT * FROM venedors LIMIT 1;

-- Prova DELETE a la taula "venedors"
DELETE FROM venedors WHERE id_venedor = 1;

-- Prova SELECT a la taula "comandes"
SELECT * FROM comandes LIMIT 1;

-- Prova DELETE a la taula "comandes"
DELETE FROM comandes WHERE id_comanda = 1;

-- Prova creació d'una nova taula de nom 'gerencia'
CREATE TABLE gerencia (
    id_gerencia INT AUTO_INCREMENT PRIMARY KEY,
    nom_gerencia VARCHAR(255) NOT NULL
);
