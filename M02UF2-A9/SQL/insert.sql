USE habitatge;
DROP TEMPORARY TABLE IF EXISTS municipi_com_prov;

-- Crear una taula temporal per emmagatzemar dades dels municipis
CREATE TEMPORARY TABLE IF NOT EXISTS municipi_com_prov (
    cod_mun INT PRIMARY KEY,           
    nom_mun VARCHAR(48),               
    cod_prov INT,                      
    nom_prov VARCHAR(48),             
    cod_com INT,                       
    nom_com VARCHAR(48),               
    UTMX VARCHAR(100),                 
    UTMY VARCHAR(100),                 
    longi DECIMAL(9,6),             
    lati DECIMAL(9,6),                 
    coord_point VARCHAR(100)           
);

-- Carregar dades del fitxer CSV a la taula temporal municipi_com_prov
LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF2-A9/DATA/municipi_com_prov.csv' INTO TABLE municipi_com_prov
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(cod_mun, nom_mun, cod_prov, nom_prov, cod_com, nom_com, UTMX, UTMY, longi, lati, coord_point);

-- Carregar dades del fitxer CSV a la taula provincia
LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF2-A9/DATA/provincia.csv' INTO TABLE provincia
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_provincia, nom_catala, nom_oficial);

-- Inserir dades a la taula comarca
INSERT INTO comarca(id_comarca, nom_comarca)
SELECT DISTINCT cod_com, nom_com
FROM municipi_com_prov
WHERE cod_com IS NOT NULL;

-- Inserir dades a la taula municipi
INSERT INTO municipi(id_municipi, id_provincia, nom_municipi, id_comarca, utmX, utmY, longitud, latitud, coord_vectorial)
SELECT DISTINCT cod_mun, cod_prov, nom_mun, cod_com, UTMX, UTMY, longi, lati, coord_point 
FROM municipi_com_prov;

-- Crear una taula temporal per emmagatzemar dades de les cases
DROP TEMPORARY TABLE IF EXISTS houses;
CREATE TEMPORARY TABLE IF NOT EXISTS houses (
    house_id INT AUTO_INCREMENT PRIMARY KEY,
    house_type VARCHAR(24),
    air_conditioner BOOLEAN,
    balcony BOOLEAN,
    bath_num INT,
    built_in_wardrobe BOOLEAN,
    chimeney BOOLEAN,
    condicion VARCHAR(64),
    construct_date INT,
    floor VARCHAR(24),
    garage_desc VARCHAR(64),
    garden BOOLEAN,
    heating VARCHAR(64),
    lift BOOLEAN,
    loc_city VARCHAR(48),
    loc_zone VARCHAR(48),
    m2_real DECIMAL(8, 2),
    m2_useful INT,
    obtention_date DATE,
    price DECIMAL(10, 2),
    room_num VARCHAR(24),
    storage_room BOOLEAN,
    swimming_pool BOOLEAN,
    terrace BOOLEAN,
    descript VARCHAR(140)
);

-- Carregar dades dels fitxers CSV a la taula temporal houses (barcelona i girona)
LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF2-A9/DATA/houses_barcelona.csv' INTO TABLE houses
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(descript, air_conditioner, balcony, bath_num, built_in_wardrobe, chimeney, condicion, 
construct_date, floor, garage_desc, garden, heating, house_id, house_type, lift, loc_city, loc_zone, 
m2_real, m2_useful, obtention_date, price, room_num, storage_room, swimming_pool, terrace);

LOAD DATA LOCAL INFILE '/home/usuari/BBDD_SQL/M02UF2-A9/DATA/houses_girona.csv' INTO TABLE houses
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(descript, air_conditioner, balcony, bath_num, built_in_wardrobe, chimeney, condicion, 
construct_date, floor, garage_desc, garden, heating, house_id, house_type, lift, loc_city, loc_zone, 
m2_real, m2_useful, obtention_date, price, room_num, storage_room, swimming_pool, terrace);

-- Inserir dades a la taula vivenda
INSERT INTO vivenda(id_vivenda, dormitoris, banys, superficie_vivenda, any_construccio, 
estat_conservacio, preu_venda, descripcio, data)
SELECT house_id, room_num, bath_num, m2_real, construct_date, condicion, price,
descript, obtention_date
FROM houses;

-- Actualitzar la columna tipus de la taula vivenda segons el tipus de casa
UPDATE vivenda
SET tipus = 'Pis'
WHERE id_vivenda IN (
SELECT house_id
FROM houses
WHERE house_type = "Dúplex" or 
house_type = "Piso" or 
house_type = "Ático" or 
house_type = "Estudio"
);

UPDATE vivenda
SET tipus = 'Casa'
WHERE id_vivenda IN (
SELECT house_id
FROM houses
WHERE house_type != "Dúplex" and
house_type != "Piso" and 
house_type != "Ático" and 
house_type != "Estudio"
);

-- Inserir dades a la taula pis segons el tipus de casa
INSERT INTO pis(id_vivenda, tipus, num_planta)
SELECT house_id, LTRIM(house_type), floor 
FROM houses 
WHERE house_type = "Dúplex" or 
house_type = "Piso" or 
house_type = "Ático" or 
house_type = "Estudio";

-- Inserir dades a la taula casa segons el tipus de casa
INSERT INTO casa(id_vivenda, tipus, num_plantes)
SELECT house_id, LTRIM(house_type), floor 
FROM houses 
WHERE house_type != "Dúplex" and
house_type != "Piso" and 
house_type != "Ático" and 
house_type != "Estudio";

-- Inserir dades a la taula municipi_vivenda
INSERT INTO municipi_vivenda(id_vivenda, id_municipi, id_provincia)
SELECT house_id, id_municipi, id_provincia
FROM municipi m
JOIN houses h ON h.loc_city=m.nom_municipi;

-- Inserir dades a la taula consum_energetic
INSERT INTO consum_energetic (id_vivenda, consum, emisions)
SELECT
    id_vivenda,
    (
        CASE ROUND(RAND()* 6)
            WHEN 0 THEN 'A'
            WHEN 1 THEN 'B'
            WHEN 2 THEN 'C'
            WHEN 3 THEN 'D'
            WHEN 4 THEN 'E'
            WHEN 5 THEN 'F'
            WHEN 6 THEN 'G'
        END
    ) AS consum,
    (
        CASE ROUND(RAND()* 6)
            WHEN 0 THEN 'A'
            WHEN 1 THEN 'B'
            WHEN 2 THEN 'C'
            WHEN 3 THEN 'D'
            WHEN 4 THEN 'E'
            WHEN 5 THEN 'F'
            WHEN 6 THEN 'G'
        END
    ) AS emisions
FROM vivenda
ORDER BY RAND();

-- Actualitzar la columna codi_INE de la taula municipi
UPDATE municipi
SET codi_INE = CONCAT(LEFT(id_municipi, 3), id_provincia)
WHERE codi_INE IS NULL;

-- Inserir dades a la taula caracteristiques i caracteristiques_vivendes
INSERT INTO caracteristiques(aire_condicionat, ascensor, armari_empotrat, garatge, jardi, calefaccio, piscina, traster, xemeneia, terassa, balco)
SELECT air_conditioner, lift, built_in_wardrobe, garage_desc, garden, heating, swimming_pool, storage_room, chimeney, terrace, balcony
FROM houses ORDER BY house_id;

INSERT INTO caracteristiques_vivendes(id_vivenda)
SELECT house_id
FROM houses 
ORDER BY house_id; 

-- Actualitzar dades de la taula casa amb superfícies de garatge i jardí
UPDATE casa c
JOIN (
    SELECT 
        v.id_vivenda, 
        CASE WHEN c.garatge IS NOT NULL AND c.garatge != '' THEN ROUND(RAND() * 100 + 20, 2) ELSE NULL END AS superficie_garatge,
        CASE WHEN c.jardi = 1 THEN ROUND(RAND() * 200 + 50, 2) ELSE NULL END AS superficie_jardi
    FROM houses h
    INNER JOIN vivenda v ON h.house_id = v.id_vivenda
    INNER JOIN caracteristiques_vivendes cv ON v.id_vivenda = cv.id_vivenda
    INNER JOIN caracteristiques c ON cv.id_caracteristica = c.id_caracteristica
    WHERE c.garatge IS NOT NULL OR c.jardi = 1
) AS new_data ON c.id_vivenda = new_data.id_vivenda
SET c.superficie_garatge = new_data.superficie_garatge,
    c.superficie_jardi = new_data.superficie_jardi;

-- Actualitzar dades de la taula vivenda amb superfície de terrassa
UPDATE vivenda v
JOIN (
    SELECT 
        h.house_id,
        CASE WHEN c.terassa = 1 THEN ROUND(RAND() * 150 + 30, 2) ELSE NULL END AS superficie_terrassa
    FROM 
        houses h
    JOIN 
        caracteristiques_vivendes cv ON h.house_id = cv.id_vivenda
    JOIN 
        caracteristiques c ON cv.id_caracteristica = c.id_caracteristica
) AS new_data ON v.id_vivenda = new_data.house_id
SET v.superficie_terrassa = new_data.superficie_terrassa;

-- Assignar valors aleatoris (0 o 1) a la columna disponible_lloguer de la taula vivenda
UPDATE vivenda
SET disponible_lloguer = ROUND(RAND());
