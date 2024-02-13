-- DOG###############################################

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/M02UF2-A7/dogs_breeds_columns(1).csv'
IGNORE INTO TABLE dog
FIELDS TERMINATED BY '\t' ENCLOSED BY '"' ESCAPED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(iddog, name) ;



-- PAIS###############################################

DROP TEMPORARY TABLE IF EXISTS temp_pais;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_pais LIKE pais;
LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/M02UF2-A7/dogs_breeds_columns(1).csv'
IGNORE INTO TABLE temp_pais
FIELDS TERMINATED BY '\t' ENCLOSED BY '"' ESCAPED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, @dummy, @dummy, @dummy, nompais) SET idpais = NULL;

DROP TEMPORARY TABLE IF EXISTS 2pais;
CREATE TEMPORARY TABLE IF NOT EXISTS 2pais LIKE pais;

-- Ara inserirem de forma unitària

INSERT IGNORE INTO 2pais
SELECT NULL, RTRIM(LTRIM(SUBSTRING_INDEX
(SUBSTRING_INDEX(nompais, ',', n), ',', -1))) AS Valor
FROM temp_pais
CROSS JOIN (
  SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
) AS numbers
WHERE n <= 1 + LENGTH(nompais) - LENGTH(REPLACE(nompais, ',', ''))
AND nompais <> '';

-- Ara ja tindrem els insert ordenats alfabèticament amb la següent comanda
INSERT IGNORE INTO pais SELECT NULL, nompais FROM 2pais ORDER BY 2;

DROP TEMPORARY TABLE IF EXISTS temp_pais;
DROP TEMPORARY TABLE IF EXISTS 2pais;
DROP TEMPORARY TABLE IF EXISTS tmp;
CREATE TEMPORARY TABLE IF NOT EXISTS tmp (
  id INT,
  atribut VARCHAR(80)
);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/M02UF2-A7/dogs_breeds_columns(1).csv'
IGNORE INTO TABLE tmp
FIELDS TERMINATED BY '\t' ENCLOSED BY '"' ESCAPED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(@id, @dummy, @dummy, @dummy, @atribut) SET id=@id, atribut=@atribut;

INSERT INTO dog_pais (iddog, idpais)
SELECT id,
( SELECT p.idpais FROM pais p WHERE p.nompais LIKE
RTRIM(LTRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(atribut, ',', n), ',', -1))) ) AS Valor
FROM tmp
CROSS JOIN (
   SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
) AS numbers
WHERE n <= 1 + LENGTH(atribut) - LENGTH(REPLACE(atribut, ',', ''))
AND atribut <> '';

DROP TEMPORARY TABLE IF EXISTS tmp;

-- GRUP##################3
LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/M02UF2-A7/dogs_breeds_columns(1).csv'
IGNORE INTO TABLE grup
FIELDS TERMINATED BY '\t' ENCLOSED BY '"' ESCAPED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, @dummy, nomgrup) SET idgrup = NULL;

-- #ULLS####################3
DROP TEMPORARY TABLE IF EXISTS temp_ulls;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_ulls LIKE color_ulls;
LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/M02UF2-A7/dogs_breeds_columns(1).csv'
IGNORE INTO TABLE temp_ulls
FIELDS TERMINATED BY '\t' ENCLOSED BY '"' ESCAPED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, color_ulls) SET idcolulls = NULL;

DROP TEMPORARY TABLE IF EXISTS 2ulls;
CREATE TEMPORARY TABLE IF NOT EXISTS 2ulls LIKE color_ulls;

-- Ara inserirem de forma unitària

INSERT IGNORE INTO 2ulls
SELECT NULL, RTRIM(LTRIM(SUBSTRING_INDEX
(SUBSTRING_INDEX(color_ulls, ',', n), ',', -1))) AS Valor
FROM temp_ulls
CROSS JOIN (
  SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
) AS numbers
WHERE n <= 1 + LENGTH(color_ulls) - LENGTH(REPLACE(color_ulls, ',', ''))
AND color_ulls <> '';

-- Ara ja tindrem els insert ordenats alfabèticament amb la següent comanda
INSERT IGNORE INTO color_ulls SELECT NULL, color_ulls FROM 2ulls ORDER BY 2;

DROP TEMPORARY TABLE IF EXISTS temp_ulls;
DROP TEMPORARY TABLE IF EXISTS 2ulls;
DROP TEMPORARY TABLE IF EXISTS tmp;
CREATE TEMPORARY TABLE IF NOT EXISTS tmp (
  id INT,
  atribut VARCHAR(80)
);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/M02UF2-A7/dogs_breeds_columns(1).csv'
IGNORE INTO TABLE tmp
FIELDS TERMINATED BY '\t' ENCLOSED BY '"' ESCAPED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(@id, @dummy, @dummy, @dummy, @atribut) SET id=@id, atribut=@atribut;

INSERT INTO dog_color_ulls (iddog, idcolulls)
SELECT id,
( SELECT p.idcolulls FROM color_ulls p WHERE p.color_ulls LIKE
RTRIM(LTRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(atribut, ',', n), ',', -1))) ) AS Valor
FROM tmp
CROSS JOIN (
   SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
) AS numbers
WHERE n <= 1 + LENGTH(atribut) - LENGTH(REPLACE(atribut, ',', ''))
AND atribut <> '';

DROP TEMPORARY TABLE IF EXISTS tmp;
