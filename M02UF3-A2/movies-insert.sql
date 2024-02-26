USE movies;

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE genere
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, @dummy, @dummy, @dummy, nom_genere);

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE pais
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, @dummy, @dummy, @dummy, @dummy, nom_pais);

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE directors
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, @dummy, @dummy, @dummy, @dummy, @dummy, nom_director) SET id_director = NULL;

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE actors
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,nom_actor);

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE pelicules
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_pelicula, titol, any, vots, @dummy, @dummy, @dummy, nom_estudi);

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE estudis
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, nom_estudi);

DROP TEMPORARY TABLE IF EXISTS tabla_completa;
CREATE TEMPORARY TABLE IF NOT EXISTS tabla_completa (
  id_pelicula INT,
  titol VARCHAR(255),
  any INT,
  vots INT,
  nom_genere VARCHAR(255),
  nom_pais VARCHAR(255),
  nom_director VARCHAR(255),
  estudis VARCHAR(255),
  nom_actor VARCHAR(255),
  rol VARCHAR(255)
);

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE tabla_completa 
FIELDS TERMINATED BY '\t' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_pelicula, titol, any, vots, nom_genere, nom_pais, nom_director, estudis, nom_actor, rol);


INSERT INTO pelicules_pais(id_pelicula, id_pais) 
SELECT DISTINCT id_pelicula, id_pais FROM tabla_completa tb
JOIN pais p USING(nom_pais);

INSERT INTO pelicules_genere(id_pelicula, id_genere) 
SELECT DISTINCT id_pelicula, id_genere FROM tabla_completa tb
JOIN genere g USING(nom_genere);

INSERT INTO pelicules_actors(id_pelicula, id_actor, rol) 
SELECT DISTINCT id_pelicula, id_actor, rol FROM tabla_completa tb
JOIN actors a USING(nom_actor);

INSERT INTO pelicules_directors(id_pelicula, id_director) 
SELECT DISTINCT id_pelicula, id_director FROM tabla_completa tb
JOIN directors d USING(nom_director);