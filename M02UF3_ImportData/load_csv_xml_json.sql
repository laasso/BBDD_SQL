DROP DATABSE IF EXISTS data;
CREATE DATABASE IF NOT EXISTS data;
USE data

CREATE table data_csv (
    id INT auto_increment,
    nom VARCHAR(16),
    cognom1 VARCHAR(24)
    cognom2 VARCHAR(24)
    dataNaixement DATE,
    email VARCHAR(48),
    KEY (id),
    PRIMARY KEY (id)
);

LOAD DATA INFILE '/home/alumne_1r/BBDD_SQL/M02UF3_ImportData/dades.csv' INTO TABLE data_csv
FIELDS TERMINATED BY ',' IGNORE 1 LINES
(nom, congom1, cognom2, dataNaixement, email) SET id=NULL;

CREATE TABLE data_xml LIKE data_csv;

LOAD XML LOCAL INFILE '/home/alumne_1r/BBDD_SQL/M02UF3_ImportData/dades.csv' INTO TABLE data_xml
ROWS IDENTIFIED BY '<persona>';

CREATE TABLE IF NOT EXISTS data_json(
    id INT auto_increment PRIMARY KEY,
    dades_json
);

--system mysqlsh root@localhost/data --import dades.json data_json dades --schema=data