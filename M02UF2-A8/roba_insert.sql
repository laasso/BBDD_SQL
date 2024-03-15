INSERT INTO categoria (id_categoria, nom_cat, descripcio) VALUES
(1, 'Ropa de casa', 'Ropa para uso en el hogar, como sábanas y toallas'),
(2, 'Complementos', 'Accesorios para complementar el vestuario'),
(3, 'Ropa de vestir', 'Prendas de vestir para todas las edades y géneros');

INSERT INTO clase (id_clase, id_categoria, nom_clase, descripcio) VALUES
(1, 1, 'Roba de llit', 'Llençols, estovalles, fundes, etc.'),
(2, 1, 'Roba de bany', 'Tovalloles de bany, estores, etc.'),
(3, 2, 'Accessoris', 'Cinturons, bufandes, gorres, mocadors, etc.'),
(4, 3, 'Roba de nadons', 'Samarretes, bodis, pijames, etc.'),
(5, 3, 'Roba de nens', 'Vestits, pantalons, samarretes, etc.'),
(6, 3, 'Roba home', 'Camises, pantalons, americanes, etc.'),
(7, 3, 'Roba de dona', 'Vestits, faldilles, pantalons, etc.');

INSERT INTO color (id_color, nom) VALUES
(1, 'Blanco'), (2, 'Negro'), (3, 'Azul'), (4, 'Gris'), (5, 'Rojo'),
(6, 'Verde'), (7, 'Amarillo'), (8, 'Rosa'), (9, 'Marrón'), (10, 'Naranja');

INSERT INTO material (id_material, nom) VALUES
(1, 'Algodón'), (2, 'Lino'), (3, 'Seda'), (4, 'Poliéster'), (5, 'Lana'),
(6, 'Cuero'), (7, 'Nylon'), (8, 'Denim'), (9, 'Felpa'), (10, 'Terciopelo');

INSERT INTO modelo (id_modelo, nom) VALUES
(1, 'Levis 501'), (2, 'Fit Nike'), (3, 'Estil Elegant'), (4, 'Aspecte Casual'), (5, 'Patró a Ratlles'),
(6, 'Disseny Floral'), (7, 'Estil a Quadres'), (8, 'Color Degradat'), (9, 'Textura Plana'), (10, 'Estampat');

INSERT INTO tipus (id_tipus, nom) VALUES
(1, 'Pantalones'), (2, 'Camisetas'), (3, 'Vestidos'), (4, 'Chaquetas'), (5, 'Faldas'),
(6, 'Camisas'), (7, 'Sudaderas'), (8, 'Accesorios'), (9, 'Zapatos'), (10, 'Calcetines');

INSERT INTO article (id_article, nom, id_categoria, id_clase, id_tipus, id_color, id_material, id_modelo, preu_cost, preu_venda) VALUES
(1, 'Levis 501 Azul Hombre', 3, 6, 1, 3, 8, 1, 25.00, 49.99),
(2, 'Levis 501 Negro Hombre', 3, 6, 1, 2, 8, 1, 25.00, 49.99),
(3, 'Levis 501 Rojo Hombre', 3, 6, 1, 5, 8, 1, 25.00, 49.99),
(4, 'Levis 501 Azul Mujer', 3, 7, 1, 3, 8, 1, 25.00, 49.99),
(5, 'Levis 501 Verde Mujer', 3, 7, 1, 6, 8, 1, 25.00, 49.99),
(6, 'Levis 501 Amarillo Mujer', 3, 7, 1, 7, 8, 1, 25.00, 49.99),
(7, 'Levis 501 Blanco Niño', 3, 5, 1, 1, 8, 1, 25.00, 49.99),
(8, 'Levis 501 Azul Niño', 3, 5, 1, 3, 8, 1, 25.00, 49.99),
(9, 'Levis 501 Negro Niña', 3, 5, 1, 2, 8, 1, 25.00, 49.99),
(18, 'Nike Fit Negro Hombre', 3, 6, 2, 2, 8, 2, 25.00, 49.99),
(22, 'Nike Fit Negro Mujer', 3, 7, 2, 2, 8, 2, 25.00, 49.99),
(23, 'Body Bebe ', 3, 4, 2, 2, 8, 6, 25.00, 49.99);


INSERT INTO talla_adults_superior (id_article, nom_talla, stock) VALUES
(18, 'S', 15),
(18, 'M', 20),
(18, 'L', 10),
(18, 'XL', 5),
(22, 'XS', 20),
(22, 'S', 15),
(22, 'M', 20),
(22, 'L', 10),
(22, 'XL', 5);

INSERT INTO talla_nadons (id_article, nom_talla, stock) VALUES
(23, '0', 10),
(23, '1', 12),
(23, '3', 40),
(23, '6', 90),
(23, '12', 42),
(23, '24', 123);


INSERT INTO talla_nens (id_article, nom_talla, stock) VALUES
(9, '4 años', 10),
(9, '6 años', 15),
(9, '8 años', 8),
(9, '10 años', 5);

INSERT INTO article (id_article, nom, id_categoria, id_clase, id_tipus, id_color, id_material, id_modelo, preu_cost, preu_venda) VALUES
(10, 'Sábanas de Algodón', 1, 1, NULL, 1, 1, NULL, 30.00, 59.99),
(11, 'Toallas Grises', 1, 2, NULL, 4, 9, NULL, 15.00, 29.99),
(12, 'Mantel de Lino', 1, 1, NULL, 1, 2, NULL, 20.00, 39.99),
(13, 'Alfombra de Felpa', 1, 2, NULL, 5, 9, NULL, 25.00, 49.99),
(19, 'Toallas Grises', 1, 2, NULL, 4, 9, NULL, 15.00, 29.99),
(20, 'Mantel de Lino', 1, 1, NULL, 1, 2, NULL, 20.00, 39.99),
(21, 'Alfombra de Felpa', 1, 2, NULL, 5, 9, NULL, 25.00, 49.99);

INSERT INTO article (id_article, nom, id_categoria, id_clase, id_tipus, id_color, id_material, id_modelo, preu_cost, preu_venda) VALUES
(14, 'Gorro de Lana', 2, 3, NULL, 9, 5, NULL, 10.00, 24.99),
(15, 'Bufanda a Rayas', 2, 3, NULL, 7, 5, NULL, 12.00, 29.99),
(16, 'Gorra Negra', 2, 3, NULL, 2, 1, NULL, 8.00, 19.99),
(17, 'Pañuelo Estampado', 2, 3, NULL, 10, 2, NULL, 7.00, 14.99);

INSERT INTO mida (id_article, amplada, llargada, stock) VALUES
(10, 34, 32, 20),
(11, 36, 32, 15),
(12, 38, 32, 10),
(13, 40, 32, 8),
(10, 100, 100, 20),
(11, 100, 100, 15),
(12, 100, 100, 10),
(13, 100, 100, 8);
