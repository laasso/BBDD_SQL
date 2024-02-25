USE movies;

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/movie-create.sql' INTO TABLE genere
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom_genere);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/movie-create.sql' INTO TABLE pais
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom_pais);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/movie-create.sql' INTO TABLE directors
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom_director);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/movie-create.sql' INTO TABLE actors
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom_actor);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/movie-create.sql' INTO TABLE pelicules
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titol, any, vots, estudis);
