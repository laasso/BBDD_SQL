DROP DATABASE IF EXISTS movies;

CREATE DATABASE movies;

USE movies;

CREATE TABLE pelicules (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titol VARCHAR(255) NOT NULL,
    any INT,
    vots INT,
    genere VARCHAR(255),
    pais VARCHAR(255),
    director VARCHAR(255),
    estudis VARCHAR(255),
    actor VARCHAR(255),
    rol VARCHAR(255)
);

CREATE TABLE genere (
    id_genere INT AUTO_INCREMENT PRIMARY KEY,
    nom_genere VARCHAR(100) UNIQUE
);

CREATE TABLE paisos (
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


CREATE TABLE estudis (
    id_estudi INT AUTO_INCREMENT PRIMARY KEY,
    nom_estudi VARCHAR(255) UNIQUE
);


CREATE TABLE rols (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    id_pelicula INT,
    id_actor INT,
    nom_rol VARCHAR(255),
    FOREIGN KEY (id_pelicula) REFERENCES pelicules(id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES actors(id_actor)
);
