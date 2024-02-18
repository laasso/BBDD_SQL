LOAD DATA INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF2_A7_2/agenda.contacte.csv.tsv'
INTO TABLE contacte
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(mobil, nom, cognom1, cognom2, @data_naixement, correu_electronic)
SET data_naixement = STR_TO_DATE(@data_naixement, '%Y-%m-%d');
