DROP DATABASE IF EXISTS agenda;

CREATE DATABASE agenda;

USE agenda;


CREATE TABLE contacte (

    mobil VARCHAR(15) PRIMARY KEY,

    nom VARCHAR(25),

    cognom1 VARCHAR(25),

    cognom2 VARCHAR(25),

    data_naixement DATE,

    correu_electronic VARCHAR(50)

);


CREATE TABLE tipusvincle (

    id INT PRIMARY KEY AUTO_INCREMENT,

    nom VARCHAR(50)

);


CREATE TABLE relacio (

    id INT PRIMARY KEY AUTO_INCREMENT,

    contacte1 VARCHAR(15),

    contacte2 VARCHAR(15),

    tipusvincle_id INT,

    FOREIGN KEY (contacte1) REFERENCES contacte(mobil),

    FOREIGN KEY (contacte2) REFERENCES contacte(mobil),

    FOREIGN KEY (tipusvincle_id) REFERENCES tipusvincle(id)

);


CREATE TABLE reunions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    contacte1 VARCHAR(15),
    contacte2 VARCHAR(15),
    data_reunio DATETIME,
    durada_hores INT,
    tipus_reunio ENUM('Presencial', 'Telemàtica'),
    estat INT,
    descripcio VARCHAR(50) GENERATED ALWAYS AS (
        CASE 
            WHEN estat = 1 THEN 'Realitzat'
            WHEN estat = 0 THEN 'No realitzat'
            ELSE 'Pendent'
        END
    ) STORED,
    data_registre TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE PROCEDURE generar_inserts_reunions()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE contacto1 VARCHAR(15);
    DECLARE contacto2 VARCHAR(15);
    DECLARE fecha_reunion DATETIME;
    DECLARE duracion INT;
    DECLARE tipo_reunion ENUM('Presencial', 'Telemàtica');
    DECLARE estado INT;

    WHILE i <= 100 DO
        -- Obtener contactos aleatorios
        SELECT mobil INTO contacto1 FROM contacte ORDER BY RAND() LIMIT 1;
        SELECT mobil INTO contacto2 FROM contacte ORDER BY RAND() LIMIT 1;
        
        -- Generar fecha aleatoria entre 2 meses antes y después de la fecha y hora actual con un intervalo de 8 horas
        SET fecha_reunion = NOW() - INTERVAL FLOOR(RAND() * 60) DAY + INTERVAL FLOOR(RAND() * 16 - 8) HOUR;

        -- Generar duracion aleatoria entre 1 y 8 horas
        SET duracion = FLOOR(RAND() * 8) + 1;

        -- Generar tipo de reunion aleatoria
        SET tipo_reunion = IF(RAND() > 0.5, 'Presencial', 'Telemàtica');

        -- Generar estado aleatorio
        IF fecha_reunion < NOW() THEN
            SET estado = IF(RAND() > 0.5, 1, 0);
        ELSE
            SET estado = 0;
        END IF;

        -- Insertar datos generados en la tabla reunions
        INSERT INTO reunions (contacte1, contacte2, data_reunio, durada_hores, tipus_reunio, estat)
        VALUES (contacto1, contacto2, fecha_reunion, duracion, tipo_reunion, estado);
        
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
