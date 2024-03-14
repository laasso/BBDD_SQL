-- Inserts para la tabla categoria
INSERT INTO categoria (id_categoria, nom_cat, descripcio) VALUES
(1, 'Ropa de casa', 'Ropa para uso en el hogar, como sábanas y toallas'),
(2, 'Complementos', 'Accesorios para complementar el vestuario'),
(3, 'Ropa de vestir', 'Prendas de vestir para todas las edades y géneros');

INSERT INTO CLASE (id_clase, id_categoria, nom_clase, descripcio) VALUES
(1, 1, 'Roba de llit', 'Llençols, estovalles, fundes, etc.'),
(2, 1, 'Roba de bany', 'Tovalloles de bany, estores, etc.'),
(3, 2, 'Accessoris', 'Cinturons, bufandes, gorres, mocadors, etc.'),
(4, 3, 'Roba de nadons', 'Samarretes, bodis, pijames, etc.'),
(5, 3, 'Roba de nens', 'Vestits, pantalons, samarretes, etc.'),
(6, 3, 'Roba home', 'Camises, pantalons, americanes, etc.'),
(7, 3, 'Roba de dona', 'Vestits, faldilles, pantalons, etc.');

-- Inserts para la tabla color
INSERT INTO color (id_color, nom) VALUES
(1, 'Blanco'), (2, 'Negro'), (3, 'Azul'), (4, 'Gris'), (5, 'Rojo'),
(6, 'Verde'), (7, 'Amarillo'), (8, 'Rosa'), (9, 'Marrón'), (10, 'Naranja');

-- Inserts para la tabla material
INSERT INTO material (id_material, nom) VALUES
(1, 'Algodón'), (2, 'Lino'), (3, 'Seda'), (4, 'Poliéster'), (5, 'Lana'),
(6, 'Cuero'), (7, 'Nylon'), (8, 'Denim'), (9, 'Felpa'), (10, 'Terciopelo');

-- Inserts para la tabla modelo
INSERT INTO modelo (id_modelo, nom) VALUES
(1, 'Levis 501'), (2, 'Nike Air Force'), (3, 'Elegant Style'), (4, 'Casual Look'), (5, 'Striped Pattern'),
(6, 'Floral Design'), (7, 'Checked Style'), (8, 'Degraded Color'), (9, 'Plain Texture'), (10, 'Printed');

-- Inserts para la tabla tipus
INSERT INTO tipus (id_tipus, nom) VALUES
(1, 'Pantalones'), (2, 'Camisetas'), (3, 'Vestidos'), (4, 'Chaquetas'), (5, 'Faldas'),
(6, 'Camisas'), (7, 'Sudaderas'), (8, 'Accesorios'), (9, 'Zapatos'), (10, 'Calcetines');

-- Inserts para la tabla article
INSERT INTO article (id_article, nom, id_categoria, id_clase, id_tipus, id_color, id_material, id_modelo, preu_cost, preu_venda) VALUES
(1, 'Levis 501 Blanco', 3, 5, 1, 3, 8, 1, 25.00, 49.99),
(2, 'Vestido Floral', 3, 4, 3, 6, 1, 6, 35.00, 69.99),
(3, 'Gorra de Lana', 2, 3, 8, 5, 5, 3, 10.00, 19.99),
(4, 'Camiseta Rayada', 3, 2, 2, 4, 1, 5, 15.00, 29.99),
(5, 'Chaqueta de Cuero', 3, 4, 4, 2, 6, 4, 80.00, 149.99);

-- Inserts para la tabla mida (ejemplo de tallas y medidas para los pantalones)
INSERT INTO mida (id_article, amplada, llargada, stock) VALUES
(1, 34, 32, 20),
(1, 36, 32, 15),
(1, 38, 32, 10),
(1, 40, 32, 8);

-- Inserts para la tabla talla_adults_superior (ejemplo de tallas y stock para la chaqueta de cuero)
INSERT INTO talla_adults_superior (id_article, nom_talla, stock) VALUES
(5, 'S', 15),
(5, 'M', 20),
(5, 'L', 10),
(5, 'XL', 5);

-- Inserts para la tabla talla_nens (ejemplo de tallas y stock para la camiseta rayada)
INSERT INTO talla_nens (id_article, nom_talla, stock) VALUES
(4, '4 años', 10),
(4, '6 años', 15),
(4, '8 años', 8),
(4, '10 años', 5);
-- Inserts para la tabla article
INSERT INTO article (id_article, nom, id_categoria, id_clase, id_tipus, id_color, id_material, id_modelo, preu_cost, preu_venda) VALUES
(1, 'Levis 501 Azul Hombre', 3, 5, 1, 3, 8, 1, 25.00, 49.99),
(2, 'Levis 501 Negro Hombre', 3, 5, 1, 2, 8, 1, 25.00, 49.99),
(3, 'Levis 501 Rojo Hombre', 3, 5, 1, 5, 8, 1, 25.00, 49.99),
(4, 'Levis 501 Azul Mujer', 3, 5, 1, 3, 8, 1, 25.00, 49.99),
(5, 'Levis 501 Verde Mujer', 3, 5, 1, 6, 8, 1, 25.00, 49.99),
(6, 'Levis 501 Amarillo Mujer', 3, 5, 1, 7, 8, 1, 25.00, 49.99),
(7, 'Levis 501 Blanco Niño', 3, 5, 1, 1, 8, 1, 25.00, 49.99),
(8, 'Levis 501 Azul Niño', 3, 5, 1, 3, 8, 1, 25.00, 49.99),
(9, 'Levis 501 Negro Niña', 3, 5, 1, 2, 8, 1, 25.00, 49.99);

-- Ropa de Casa
INSERT INTO article (id_article, nom, id_categoria, id_clase, id_tipus, id_color, id_material, id_modelo, preu_cost, preu_venda) VALUES
(10, 'Sábanas de Algodón', 1, 1, NULL, 1, 1, NULL, 30.00, 59.99),
(11, 'Toallas Grises', 1, 2, NULL, 4, 9, NULL, 15.00, 29.99),
(12, 'Mantel de Lino', 1, 1, NULL, 1, 2, NULL, 20.00, 39.99),
(13, 'Alfombra de Felpa', 1, 2, NULL, 5, 9, NULL, 25.00, 49.99);

-- Complementos
INSERT INTO article (id_article, nom, id_categoria, id_clase, id_tipus, id_color, id_material, id_modelo, preu_cost, preu_venda) VALUES
(14, 'Gorro de Lana', 2, 3, NULL, 9, 5, NULL, 10.00, 24.99),
(15, 'Bufanda a Rayas', 2, 3, NULL, 7, 5, NULL, 12.00, 29.99),
(16, 'Gorra Negra', 2, 3, NULL, 2, 1, NULL, 8.00, 19.99),
(17, 'Pañuelo Estampado', 2, 3, NULL, 10, 2, NULL, 7.00, 14.99);
