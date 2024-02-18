LOAD DATA INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF2_A7_2/agenda.contacte.csv.tsv'
INTO TABLE contacte
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(phone, nom, cognom1, cognom2, @date_naixament, correu_electronic)
SET data_naixament = STR_TO_DATE(@date_naixament, '%Y-%m-%d');
