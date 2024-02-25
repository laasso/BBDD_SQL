USE movies;

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE genere
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom_genere);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE pais
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom_pais);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE directors
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom_director);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE actors
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom_actor);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE pelicules
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@id_movie, titol, any, vots, @genere, @pais, @director, estudis, @actor, @rol)
SET id_pelicula = @id_movie;
