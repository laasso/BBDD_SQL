    DROP DATABASE IF EXISTS movies;

    CREATE DATABASE movies;

    USE movies;

    CREATE TABLE pelicules (
        id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
        titol VARCHAR(255) NOT NULL,
        any INT,
        vots INT,
        estudis VARCHAR(255)
    );

    CREATE TABLE genere (
        id_genere INT AUTO_INCREMENT PRIMARY KEY,
        nom_genere VARCHAR(100) UNIQUE
    );

    CREATE TABLE pais (
        id_pais INT AUTO_INCREMENT PRIMARY KEY,
        nom_pais VARCHAR(255) UNIQUE
    );

    CREATE TABLE directors (
        id_director INT AUTO_INCREMENT PRIMARY KEY,
        nom_director VARCHAR(255) UNIQUE
    );

    CREATE TABLE actors (
        id_actor INT AUTO_INCREMENT PRIMARY KEY,
        nom_actor VARCHAR(255) UNIQUE
    );
    

    CREATE TABLE pelicules_genere (
        id_pelicula INT,
        id_genere INT,
        PRIMARY KEY (id_pelicula, id_genere),
        FOREIGN KEY (id_pelicula) REFERENCES pelicules(id_pelicula),
        FOREIGN KEY (id_genere) REFERENCES genere(id_genere)
    );

    CREATE TABLE pelicules_pais (
        id_pelicula INT,
        id_pais INT,
        PRIMARY KEY (id_pelicula, id_pais),
        FOREIGN KEY (id_pelicula) REFERENCES pelicules(id_pelicula),
        FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
    );

    CREATE TABLE pelicules_directors (
        id_pelicula INT,
        id_director INT,
        PRIMARY KEY (id_pelicula, id_director),
        FOREIGN KEY (id_pelicula) REFERENCES pelicules(id_pelicula),
        FOREIGN KEY (id_director) REFERENCES directors(id_director)
    );

    CREATE TABLE pelicules_actors (
        id_pelicula INT,
        id_actor INT,
        rol VARCHAR(255),
        PRIMARY KEY (id_pelicula, id_actor, rol),
        FOREIGN KEY (id_pelicula) REFERENCES pelicules(id_pelicula),
        FOREIGN KEY (id_actor) REFERENCES actors(id_actor)
    );

CREATE TABLE movies-taules-dump.sql (id INT PRIMARY KEY);