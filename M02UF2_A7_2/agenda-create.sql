DROP DATABASE IF EXISTS agenda;

CREATE DATABASE agenda;

USE agenda;


CREATE TABLE contacte (

    mobil VARCHAR(15) PRIMARY KEY,

    nom VARCHAR(25),

    cognom1 VARCHAR(25),

    cognom2 VARCHAR(25),

    data_naixament DATE,

    correu_electronic VARCHAR(50)

);


CREATE TABLE tipusvincle (

    id INT PRIMARY KEY AUTO_INCREMENT,

    nom VARCHAR(50)

);


CREATE TABLE relacio (

    id INT PRIMARY KEY AUTO_INCREMENT,

    contacte1 VARCHAR(15),

    contacte2 VARCHAR(15),

    tipusvincle_id INT,

    FOREIGN KEY (contacte1) REFERENCES contacte(mobil),

    FOREIGN KEY (contacte2) REFERENCES contacte(mobil),

    FOREIGN KEY (tipusvincle_id) REFERENCES tipusvincle(id)

);


CREATE TABLE reunions (

	id INT PRIMARY KEY AUTO_INCREMENT,

	contacte1 VARCHAR(15),

	contacte2 VARCHAR(15),

	data_reunio DATETIME,

	durada_hores INT,

	estat ENUM('Pendent', 'Realitzada', 'No realitzada'),

	FOREIGN KEY (contacte1) REFERENCES contacte(mobil),

	FOREIGN KEY (contacte2) REFERENCES contacte(mobil)

);