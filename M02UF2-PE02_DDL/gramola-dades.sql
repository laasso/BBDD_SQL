LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF2-PE02_DDL/municipi_prov.csv' 
INTO TABLE provincia 
FIELDS TERMINATED BY '\t' 
IGNORE 1 LINES (@dummy, @dummy, @codip, @nomp) SET codiprov=@codip, nom_provincia=@nomp;

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF2-PE02_DDL/municipi_prov.csv' 
INTO TABLE municipi 
FIELDS TERMINATED BY '\t' 
IGNORE 1 LINES (@codim, @nomm, @codip) SET codimun=@codim, codiprov=@codip, nom_municipi=@nomm;


LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF2-PE02_DDL/grups.csv'
INTO TABLE grups
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom_grup, genere_principal, any_creacio);

INSERT INTO generes (nom)
SELECT DISTINCT genere_principal
FROM grups;

DROP TEMPORARY TABLE IF EXISTS temp_discos;

CREATE TEMPORARY TABLE temp_discos (
    nom_grup VARCHAR(100),
    titol VARCHAR(100),
    any_disc INT,
    durada_minuts INT,
    cost_economic DECIMAL(10, 2)
);

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF2-PE02_DDL/discos.csv'
INTO TABLE temp_discos
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nom_grup, titol, any_disc, durada_minuts, cost_economic);

INSERT INTO discos (codi_grup, any_disc, titol, durada_minuts, cost_economic)
SELECT g.codi_grup, t.any_disc, t.titol, t.durada_minuts, t.cost_economic
FROM temp_discos t
JOIN grups g ON t.nom_grup = g.nom_grup;

DROP TEMPORARY TABLE IF EXISTS temp_discos;

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF2-PE02_DDL/discografica.csv'
INTO TABLE discografiques
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nif, nom, email, web);

INSERT INTO contractes (codi_grup, NIF, data_inici, data_final)
VALUES 
(1, 'D44460802P', '2023-01-01', NULL),
(2, 'E46903680X', '2022-05-15', '2023-05-14'),
(50, 'F39115993P', '2023-09-01', NULL),
(32, 'G34878926R', '2024-03-01', NULL),
(10, 'E46903680X', '2024-01-01', NULL),
(6, 'F39115993P', '2024-04-01', NULL),
(7, 'D44460802P', '2024-06-01', NULL),
(34, 'E46903680X', '2024-09-01', NULL),
(22, 'J46032381C', '2025-01-01', NULL),
(2, 'D44460802P', '2025-05-01', NULL);

ALTER TABLE grups
ADD busca_discografica BOOLEAN DEFAULT 0;
UPDATE grups
SET busca_discografica = CASE
WHEN EXISTS (SELECT 1 FROM contractes WHERE contractes.codi_grup = grups.codi_grup) THEN 0
ELSE 1
END;


INSERT INTO concerts (codi_grup, data_concert, hora_inici, codi_municipi, preu_entrada_pista, preu_entrada_grada) VALUES
(1, '2024-05-01', '20:00:00', 1469, 20.00, 30.00),
(2, '2024-05-15', '21:30:00', 9102, 25.00, 35.00),
(3, '2024-05-30', '19:00:00', 9120, 15.00, 25.00),
(4, '2024-06-05', '18:30:00', 9139, 20.00, 30.00),
(5, '2024-06-10', '19:45:00', 9141, 25.00, 35.00),
(6, '2024-06-15', '21:00:00', 9154, 15.00, 25.00),
(7, '2024-06-20', '20:15:00', 9158, 20.00, 30.00),
(8, '2024-06-25', '19:30:00', 9167, 25.00, 35.00),
(9, '2024-06-30', '18:45:00', 9998, 15.00, 25.00),
(10, '2024-07-05', '20:00:00', 9999, 20.00, 30.00);
