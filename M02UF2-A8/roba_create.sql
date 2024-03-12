DROP DATABASE IF EXISTS roba;

CREATE DATABASE roba;

USE roba;

-- Creación de la tabla CATEGORIA
CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY,
    nom_cat VARCHAR(255),
    descripcio VARCHAR(255)
);

-- Creación de la tabla CLASE
CREATE TABLE CLASE (
    id_clase INT PRIMARY KEY,
    id_categoria INT,
    nom_clase VARCHAR(255),
    descripcio VARCHAR(255),
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

-- Creación de la tabla TALLA
CREATE TABLE TALLA (
    id_talla INT PRIMARY KEY,
    nom VARCHAR(50)
);

-- Creación de la tabla COLOR
CREATE TABLE COLOR (
    id_color INT PRIMARY KEY,
    nom VARCHAR(50)
);

-- Creación de la tabla MATERIAL
CREATE TABLE MATERIAL (
    id_material INT PRIMARY KEY,
    nom VARCHAR(50)
);

-- Creación de la tabla MODELO
CREATE TABLE MODELO (
    id_modelo INT PRIMARY KEY,
    nom VARCHAR(50)
);

-- Creación de la tabla MODELO
CREATE TABLE TIPUS (
    id_tipus INT PRIMARY KEY,
    nom VARCHAR(50)
);


-- Creación de la tabla ARTICLE
CREATE TABLE ARTICLE (
    id_article INT PRIMARY KEY,
    nom VARCHAR(255),
    id_categoria INT,
    id_clase INT,
    id_tipus iNT,
    id_talla INT,
    id_color INT,
    id_material INT,
    id_modelo INT,
    stock INT,
    preu_cost FLOAT,
    preu_venda FLOAT,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),
    FOREIGN KEY (id_clase) REFERENCES CLASE(id_clase),
    FOREIGN KEY (id_talla) REFERENCES TALLA(id_talla),
    FOREIGN KEY (id_color) REFERENCES COLOR(id_color),
    FOREIGN KEY (id_material) REFERENCES MATERIAL(id_material),
    FOREIGN KEY (id_modelo) REFERENCES MODELO(id_modelo),
    FOREIGN KEY (id_tipus) REFERENCES TIPUS(Id_tipus)

);

-- Creación de la tabla MODELO
CREATE TABLE MIDA (
    id_article INT,
    amplada INT,
    llargada INT,
    FOREIGN KEY (id_article) REFERENCES ARTICLE(id_article)

);