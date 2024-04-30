DROP DATABASE IF EXISTS `gramola`;

Create Database IF NOT Exists `gramola`
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE gramola
--

CREATE TABLE provincia (
codiprov INT(2) UNSIGNED ZEROFILL,
nom_provincia VARCHAR(24) UNIQUE,
PRIMARY KEY(codiprov)
);

CREATE TABLE municipi (
codimun INT(4) UNSIGNED ZEROFILL,
codiprov INT(2) UNSIGNED ZEROFILL,
nom_municipi VARCHAR(44),
PRIMARY KEY(codimun, codiprov),
INDEX `fk_municipi_1_idx` (`codiprov`),
FOREIGN KEY(codiprov) REFERENCES provincia(codiprov) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE grups (
    codi_grup INT AUTO_INCREMENT PRIMARY KEY,
    nom_grup VARCHAR(100),
    genere_principal VARCHAR(50),
    any_creacio INT
);

CREATE TABLE discos (
    id_disc INT AUTO_INCREMENT PRIMARY KEY,
    codi_grup INT,
    any_disc INT,
    titol VARCHAR(100),
    durada_minuts INT CHECK (durada_minuts <= 74),
    cost_economic DECIMAL(10, 2),
    UNIQUE (codi_grup, any_disc),
    FOREIGN KEY (codi_grup) REFERENCES grups(codi_grup)
);

CREATE TABLE generes (
    id_genere INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(30)
);

CREATE TABLE discografiques (
    NIF VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(100),
    web VARCHAR(100)
);


CREATE TABLE contractes (
    id_contracte INT AUTO_INCREMENT PRIMARY KEY,
    codi_grup INT,
    NIF VARCHAR(20),
    data_inici DATE,
    data_final DATE,
    FOREIGN KEY (codi_grup) REFERENCES grups(codi_grup),
    FOREIGN KEY (NIF) REFERENCES discografiques(NIF)
);

CREATE TABLE concerts (
    id_concert INT AUTO_INCREMENT PRIMARY KEY,
    codi_grup INT,
    data_concert DATE,
    hora_inici TIME,
    codi_municipi INT(4) UNSIGNED ZEROFILL,
    preu_entrada_pista DECIMAL(10, 2),
    preu_entrada_grada DECIMAL(10, 2),
    FOREIGN KEY (codi_grup) REFERENCES grups(codi_grup),
    FOREIGN KEY (codi_municipi) REFERENCES municipi(codimun)
);


CREATE TABLE grups_generes (
    id_relacion INT AUTO_INCREMENT PRIMARY KEY,
    codi_grup INT,
    id_genere INT,
    FOREIGN KEY (codi_grup) REFERENCES grups(codi_grup),
    FOREIGN KEY (id_genere) REFERENCES generes(id_genere)
);
