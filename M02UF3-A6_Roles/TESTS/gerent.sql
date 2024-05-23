-- Proves per a l'usuari de tipus gerent
USE vk22;

-- Prova SELECT a la taula "venedors"
SELECT * FROM venedors LIMIT 1;

-- Prova DELETE a la taula "venedors"
DELETE FROM venedors WHERE num_ven = 1;

-- Prova DELETE a la taula "comandes"
DELETE FROM comandes WHERE num_comanda = 112885;

-- Prova creació d'una nova taula de nom 'gerencia'
CREATE TABLE gerencia (
    id_gerencia INT AUTO_INCREMENT PRIMARY KEY,
    nom_gerencia VARCHAR(255) NOT NULL
);
