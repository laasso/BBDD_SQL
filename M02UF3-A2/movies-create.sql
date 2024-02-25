USE movies;

LOAD DATA LOCAL INFILE 'r/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/movie-create.sql' INTO TABLE genere
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_genere, nom_genere);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/movie-create.sql' INTO TABLE pais
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_pais, nom_pais);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/movie-create.sql' INTO TABLE directors
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_director, nom_director);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/movie-create.sql' INTO TABLE actors
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_actor, nom_actor);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/movie-create.sql' INTO TABLE estudis
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_estudi, nom_estudi);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/movie-create.sql' INTO TABLE pelicules
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_movie, titol, any, vots, id_genere, id_pais, id_director, id_estudi);

LOAD DATA LOCAL INFILE '/home/usuari/Escritorio/BBDD_SQL/M02UF3-A2/movie-create.sql' INTO TABLE pelicules_actors
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_movie, nom_actor, rol);
