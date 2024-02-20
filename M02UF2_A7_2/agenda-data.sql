USE agenda;

/*INSERT CSV SEPARAT PER TABULACIONS*/

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF2_A7_2/agenda.contacte.csv.tsv'
INTO TABLE contacte
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(mobil, nom, cognom1, cognom2, @data_naixement, correu_electronic)
SET data_naixement = STR_TO_DATE(@data_naixement, '%Y-%m-%d');


/*INSERT REUNIONS ALEATORIES*/

INSERT INTO reunions (contacte1, contacte2, tipus_reunio, estat, data_reunio, hores_reunio)
SELECT
    c1.mobil AS contacte1,
    c2.mobil AS contacte2,
    IF(RAND() < 0.5, 'Presencial', 'Telemàtica') AS tipus_reunio,
    CASE
        WHEN DATE_ADD(NOW(), INTERVAL FLOOR(RAND() * 2 - 1) MONTH) + INTERVAL FLOOR(RAND() * 16 - 8) HOUR < NOW() THEN
            IF(RAND() < 0.5, 1, 0)
        ELSE
            0
    END AS estat,
    DATE_ADD(NOW(), INTERVAL FLOOR(RAND() * 2 - 1) MONTH) + INTERVAL FLOOR(RAND() * 16 - 8) HOUR AS data_reunio,
    FLOOR(RAND() * 8) + 1 AS hores_reunio
FROM
    contacte c1
    CROSS JOIN contacte c2
ORDER BY RAND()
LIMIT 100;


