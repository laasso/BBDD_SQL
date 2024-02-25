USE movies;

-- Insertar datos en la tabla 'genere' desde el archivo CSV
LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE genere
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, @dummy, @dummy, @dummy, nom_genere);

-- Insertar datos en la tabla 'pais' desde el archivo CSV
LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE pais
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, @dummy, @dummy, @dummy, @dummy, nom_pais);

-- Insertar datos en la tabla 'directors' desde el archivo CSV
LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE directors
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, @dummy, @dummy, @dummy, @dummy @dummy, nom_director);

-- Insertar datos en la tabla 'actors' desde el archivo CSV
LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE actors
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom_actor, @dummy);

-- Insertar datos en la tabla 'pelicules' desde el archivo CSV
LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/raspi_json_movies.csv' INTO TABLE pelicules
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_pelicula, titol, any, vots,@dummy, @dummy, estudis);
