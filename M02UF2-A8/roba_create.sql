DROP DATABASE IF EXISTS roba;

CREATE DATABASE roba;

USE roba;

-- Creación de la tabla categoria
CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY,
    nom_cat VARCHAR(255),
    descripcio VARCHAR(255)
);

-- Creación de la tabla clase
CREATE TABLE clase (
    id_clase INT PRIMARY KEY,
    id_categoria INT,
    nom_clase VARCHAR(255),
    descripcio VARCHAR(255),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- Creación de la tabla color
CREATE TABLE color (
    id_color INT PRIMARY KEY,
    nom VARCHAR(50)
);

-- Creación de la tabla material
CREATE TABLE material (
    id_material INT PRIMARY KEY,
    nom VARCHAR(50)
);

-- Creación de la tabla modelo
CREATE TABLE modelo (
    id_modelo INT PRIMARY KEY,
    nom VARCHAR(50)
);

-- Creación de la tabla tipus
CREATE TABLE tipus (
    id_tipus INT PRIMARY KEY,
    nom VARCHAR(50)
);

-- Creación de la tabla article
CREATE TABLE article (
    id_article INT PRIMARY KEY,
    nom VARCHAR(255),
    id_categoria INT,
    id_clase INT,
    id_tipus INT,
    id_color INT,
    id_material INT,
    id_modelo INT,
    preu_cost FLOAT,
    preu_venda FLOAT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_clase) REFERENCES clase(id_clase),
    FOREIGN KEY (id_color) REFERENCES color(id_color),
    FOREIGN KEY (id_material) REFERENCES material(id_material),
    FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo),
    FOREIGN KEY (id_tipus) REFERENCES tipus(id_tipus)
);

-- Creación de la tabla mida
CREATE TABLE mida (
    id_article INT,
    amplada INT,
    llargada INT,
    FOREIGN KEY (id_article) REFERENCES article(id_article)
);

-- Creación de la tabla talla_adults_superior
CREATE TABLE talla_adults_superior (
    id_article INT,
    nom_talla VARCHAR(50),
    stock INT,
    PRIMARY KEY (id_article, nom_talla),
    FOREIGN KEY (id_article) REFERENCES article(id_article)
);

-- Creación de la tabla talla_adults_inferior
CREATE TABLE talla_adults_inferior (
    id_article INT,
    nom_talla VARCHAR(50),
    stock INT,
    PRIMARY KEY (id_article, nom_talla),
    FOREIGN KEY (id_article) REFERENCES article(id_article)
);

-- Creación de la tabla talla_nadons
CREATE TABLE talla_nadons (
    id_article INT,
    nom_talla VARCHAR(50),
    stock INT,
    PRIMARY KEY (id_article, nom_talla),
    FOREIGN KEY (id_article) REFERENCES article(id_article)
);

-- Creación de la tabla talla_nens
CREATE TABLE talla_nens (
    id_article INT,
    nom_talla VARCHAR(50),
    stock INT,
    PRIMARY KEY (id_article, nom_talla),
    FOREIGN KEY (id_article) REFERENCES article(id_article)
);
