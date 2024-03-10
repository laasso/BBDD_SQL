-- Inserts para la tabla CATEGORIA
INSERT INTO CATEGORIA (id_categoria, nom_cat, descripcio) VALUES
(1, 'Roba de casa', 'Llençols, estovalles, tovallons, etc.'),
(2, 'Complements', 'Cinturons, gorres, bufandes, etc.'),
(3, 'Roba de vestir', 'Ropa de nadons, nens, home i dona');

-- Inserts para la tabla CLASE
INSERT INTO CLASE (id_clase, id_categoria, nom_clase, descripcio) VALUES
(1, 1, 'Roba de llit', 'Llençols, estovalles, fundes, etc.'),
(2, 1, 'Roba de bany', 'Tovalloles de bany, estores, etc.'),
(3, 2, 'Accessoris', 'Cinturons, bufandes, gorres, mocadors, etc.'),
(4, 3, 'Roba de nadons', 'Samarretes, bodis, pijames, etc.'),
(5, 3, 'Roba de nens', 'Vestits, pantalons, samarretes, etc.'),
(6, 3, 'Roba home', 'Camises, pantalons, americanes, etc.'),
(7, 3, 'Roba de dona', 'Vestits, faldilles, pantalons, etc.');

-- Inserts para la tabla TALLA
INSERT INTO TALLA (id_talla, nom) VALUES
(1, 'XS'), (2, 'S'), (3, 'M'), (4, 'L'), (5, 'XL'),
(6, 'XXL'), (7, '0-3 mesos'), (8, '3-6 mesos'), (9, '6-12 mesos'), (10, '12-18 mesos'),
(11, '4'), (12, '6'), (13, '8'), (14, '10'), (15, '12'), (16, '14');

-- Inserts para la tabla COLOR
INSERT INTO COLOR (id_color, nom) VALUES
(1, 'Blanc'), (2, 'Negre'), (3, 'Blau'), (4, 'Gris'), (5, 'Vermell'),
(6, 'Verd'), (7, 'Groc'), (8, 'Rosa'), (9, 'Marró'), (10, 'Taronja');

-- Inserts para la tabla MATERIAL
INSERT INTO MATERIAL (id_material, nom) VALUES
(1, 'Cotó'), (2, 'Lli'), (3, 'Tergal'), (4, 'Seda'), (5, 'Felpa'),
(6, 'Polièster'), (7, 'Nylon'), (8, 'Llana'), (9, 'Pell'), (10, 'Denim');

-- Inserts para la tabla MODELO
INSERT INTO MODELO (id_modelo, nom) VALUES
(1, 'Clàssic'), (2, 'Esportiu'), (3, 'Elegant'), (4, 'Casual'), (5, 'Estampat'),
(6, 'Floral'), (7, 'A ratlles'), (8, 'A quadres'), (9, 'Degradat'), (10, 'Llis');

-- Inserts para la tabla ARTICLE
-- Inserts adicionales para la tabla ARTICLE
INSERT INTO ARTICLE (id_article, nom, id_categoria, id_clase, id_talla, id_color, id_material, id_modelo, stock, preu_cost, preu_venda) VALUES
(1, 'Joc de llençols', 1, 1, NULL, 1, 1, 1, 50, 15.99, 29.99),
(2, 'Tovalloles de bany', 1, 2, NULL, 3, 1, 1, 100, 8.99, 19.99),
(3, 'Cinturó de cuir', 2, 3, NULL, NULL, 9, 1, 30, 12.5, 29.99),
(4, 'Samarreta de nadó', 3, 4, 7, 8, 1, 5, 80, 7.99, 15.99),
(5, 'Vestit de nena', 3, 5, 8, 8, 1, 3, 60, 14.99, 29.99),
(6, 'Pantalons dhome', 3, 6, 2, 1, 6, 1, 120, 22.5, 49.99),
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

