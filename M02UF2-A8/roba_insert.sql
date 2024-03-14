-- Inserts para la tabla categoria
INSERT INTO categoria (id_categoria, nom_cat, descripcio) VALUES
(1, 'Roba de casa', 'Llençols, estovalles, tovallons, etc.'),
(2, 'Complements', 'Cinturons, gorres, bufandes, etc.'),
(3, 'Roba de vestir', 'Ropa de nadons, nens, home i dona');

-- Inserts para la tabla clase
INSERT INTO clase (id_clase, id_categoria, nom_clase, descripcio) VALUES
(1, 1, 'Roba de llit', 'Llençols, estovalles, fundes, etc.'),
(2, 1, 'Roba de bany', 'Tovalloles de bany, estores, etc.'),
(3, 2, 'Accessoris', 'Cinturons, bufandes, gorres, mocadors, etc.'),
(4, 3, 'Roba de nadons', 'Samarretes, bodis, pijames, etc.'),
(5, 3, 'Roba de nens', 'Vestits, pantalons, samarretes, etc.'),
(6, 3, 'Roba home', 'Camises, pantalons, americanes, etc.'),
(7, 3, 'Roba de dona', 'Vestits, faldilles, pantalons, etc.');

-- Inserts para la tabla talla_nadons
INSERT INTO talla_nadons (id_article, nom_talla) VALUES
(6, '0-3 mesos'), 
(7, '3-6 mesos'), 
(8, '6-12 mesos'), 
(9, '12-18 mesos'), 
(10, '18-24 mesos');

-- Inserts para la tabla talla_nens
INSERT INTO talla_nens (id_article, nom_talla) VALUES
(5, '4'), 
(6, '6'), 
(7, '8'), 
(8, '10'), 
(9, '12'), 
(10, '14');

-- Inserts para la tabla talla_adults_superior
INSERT INTO talla_adults_superior (id_article, nom_talla) VALUES
(11, 'S'), 
(12, 'M'), 
(13, 'L'), 
(14, 'XL'), 
(15, 'XXL');

-- Inserts para la tabla talla_adults_inferior
INSERT INTO talla_adults_inferior (id_article, nom_talla) VALUES
(1, '34'), 
(2, '36'), 
(3, '38'), 
(4, '40'), 
(5, '42');

-- Inserts para la tabla color
INSERT INTO color (id_color, nom) VALUES
(1, 'Blanc'), (2, 'Negre'), (3, 'Blau'), (4, 'Gris'), (5, 'Vermell'),
(6, 'Verd'), (7, 'Groc'), (8, 'Rosa'), (9, 'Marró'), (10, 'Taronja');

-- Inserts para la tabla material
INSERT INTO material (id_material, nom) VALUES
(1, 'Cotó'), (2, 'Lli'), (3, 'Tergal'), (4, 'Seda'), (5, 'Felpa'),
(6, 'Polièster'), (7, 'Nylon'), (8, 'Llana'), (9, 'Pell'), (10, 'Denim');

-- Inserts para la tabla modelo
INSERT INTO modelo (id_modelo, nom) VALUES
(1, 'Levis501'), (2, 'NikeFit'), (3, 'Elegant'), (4, 'Casual'), (5, 'Estampat'),
(6, 'Floral'), (7, 'A ratlles'), (8, 'A quadres'), (9, 'Degradat'), (10, 'Llis');

-- Inserts para la tabla tipus
INSERT INTO tipus (id_tipus, nom) VALUES
(1, 'Pantalo Llarg'), (2, 'Samarreta'), (3, 'Pantalo Curt'), (4, 'Camisa'), (5, 'Pantalo Esportiu'),
(6, 'Vestit'), (7, 'Pantalo Regular Fit'), (8, 'A quadres'), (9, 'Degradat'), (10, 'Llis');


-- Inserts para la tabla article
INSERT INTO article (id_article, nom, id_categoria, id_clase, id_color, id_material, id_modelo, stock, preu_cost, preu_venda) VALUES
(1, 'Pantalo Texa Basic', 3, 6, 3, 10, 1, 50, 15.99, 29.99),
(2, 'Pantalo Texa Basic', 3, 6, 3, 10, 1, 50, 15.99, 29.99),
(3, 'Pantalo Texa Basic', 3, 6, 3, 10, 1, 50, 15.99, 29.99),
(4, 'Pantalo Texa Basic', 3, 6, 3, 10, 1, 50, 15.99, 29.99),
(5, 'Pantalo Texa Basic', 3, 5, 3, 10, 1, 50, 15.99, 29.99),
(6, 'Vestit de nena', 3, 4, 8, 1, 3, 60, 14.99, 29.99),
(7, 'Vestit de dona', 3, 7, 4, 2, 1, 3, 70, 29.99, 59.99),
(8, 'Samareta de cotó', 3, 5, 2, 1, 1, 1, 60, 8.99, 19.99),
(9, 'Pantalons de texans', 3, 6, 13, 2, 10, 4, 40, 24.99, 49.99),
(10, 'Vestit de festa', 3, 7, 14, 8, 4, 3, 30, 49.99, 99.99),
(11, 'Bufanda de llana', 2, 3, NULL, NULL, 8, 8, 80, 12.99, 24.99),
(12, 'Sabatilles esportives', 3, 2, NULL, 5, 6, 2, 50, 29.99, 59.99),
(13, 'Jaqueta de pell', 3, 6, 12, 4, 9, 1, 20, 79.99, 149.99),
(14, 'Pijama de nena', 3, 4, 10, 1, 1, 5, 35, 15.99, 29.99),
(15, 'Jaqueta elegant', 3, 7, 14, 2, 9, 3, 25, 59.99, 119.99),
(16, 'Sudadera amb caputxa', 3, 6, 12, 6, 5, 4, 45, 19.99, 39.99),
(17, 'Faldilla plisada', 3, 7, 12, 8, 1, 3, 30, 29.99, 59.99);
