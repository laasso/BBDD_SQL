DROP DATABASE IF EXISTS data;
CREATE DATABASE IF NOT EXISTS data;
USE data

CREATE table data_csv (
    id INT auto_increment,
    nom VARCHAR(16),
    cognom1 VARCHAR(24),
    cognom2 VARCHAR(24),
    dataNaixement DATE,
    email VARCHAR(48),
    KEY (id),
    PRIMARY KEY (id)
);

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF3_ImportData/dades.csv' INTO TABLE data_csv
FIELDS TERMINATED BY ',' IGNORE 1 LINES
(nom, cognom1, cognom2, dataNaixement, email) SET id=NULL;

CREATE TABLE data_xml LIKE data_csv;

LOAD XML LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF3_ImportData/dades.xml' INTO TABLE data_xml
ROWS IDENTIFIED BY '<persona>';

CREATE TABLE IF NOT EXISTS data_json(
    id INT auto_increment PRIMARY KEY,
    dades_json
);

system mysqlsh root@localhost/data --import /home/usuari/BBDD_SQL/M02UF3_ImportData/dades.json data_json dades --schema=data

SELECT json_pretty(json_arraygg(json_obecjt(id,dades))) FROM data_json\G

SELECT dades->>'$.nom' FROM data_json;

SELECT dades->>'$.nom' AS nom, dades->>'$.email' AS email FROM data_json;

SELECT dades->>'$.nom' AS nom, dades->>'$.email' AS email FROM data_json
WHERE dades->>'$.email' LIKE '%.cat';

/*