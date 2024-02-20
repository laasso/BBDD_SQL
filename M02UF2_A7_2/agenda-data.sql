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

INSERT INTO tipusvincle (nom,descripcio) VALUES
    ('Comercial', '(Compra-venda de productes)'),
    ('Departament', '(Treballen al mateix departament)'),
    ('Transport', '(relació amb enviament de mercaderies)'),
    ('Assessorament', '(De formació)'),
    ('Altres', '(Relació genèrica o encara no definida)');


INSERT INTO relacio (contacte1, contacte2, tipusvincle_id)
SELECT
    c1.mobil AS contacte1,
    c2.mobil AS contacte2,
    (SELECT id FROM tipusvincle ORDER BY RAND() LIMIT 1) AS tipusvincle_id
FROM
    contacte c1
    JOIN contacte c2 ON c1.mobil < c2.mobil
ORDER BY RAND()
LIMIT 100;

-- Insertar reuniones entre contactos que tienen un tipo de vínculo previo
INSERT INTO reunions (contacte1, contacte2, tipus_reunio, estat, data_reunio, hores_reunio)
SELECT
    c1.mobil AS contacte1,
    c2.mobil AS contacte2,
    IF(RAND() < 0.5, 'Presencial', 'Telemàtica') AS tipus_reunio,
    0 AS estat, -- Por defecto, una nueva reunión se establece como pendiente
    DATE_ADD(NOW(), INTERVAL FLOOR(RAND() * 2 - 1) MONTH) + INTERVAL FLOOR(RAND() * 16 - 8) HOUR AS data_reunio,
    FLOOR(RAND() * 8) + 1 AS hores_reunio
FROM
    relacio r
    JOIN contacte c1 ON r.contacte1 = c1.mobil
    JOIN contacte c2 ON r.contacte2 = c2.mobil
ORDER BY RAND()
LIMIT 100;


