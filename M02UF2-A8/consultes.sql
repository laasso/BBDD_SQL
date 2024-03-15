-- Consultas unitabla

-- 1. Seleccionar todos los modelos de la tabla modelo
SELECT * FROM modelo;

-- Respuesta del servidor: Devuelve todos los modelos existentes en la tabla 'modelo'.

-- 2. Seleccionar el precio de venta de todos los artículos de la tabla article
SELECT preu_venda FROM article;

-- Respuesta del servidor: Devuelve el precio de venta de todos los artículos en la tabla 'article'.

-- 3. Contar la cantidad de colores distintos en la tabla color
SELECT COUNT(DISTINCT nom) AS cantidad_colores FROM color;

-- Respuesta del servidor: Devuelve la cantidad de colores distintos presentes en la tabla 'color'.

-- 4. Seleccionar el nombre y descripción de todas las categorías de la tabla categoria
SELECT nom_cat, descripcio FROM categoria;

-- Respuesta del servidor: Devuelve el nombre y la descripción de todas las categorías presentes en la tabla 'categoria'.


-- Consultas multitabla

-- 1. Seleccionar la informacion con nombres de los articulos
SELECT a.nom AS nombre_articulo, c.nom AS nombre_color, m.nom AS nombre_modelo, t.nom AS tipo, 
       a.preu_cost AS precio_coste, a.preu_venda AS precio_venta
FROM article a
INNER JOIN color c ON a.id_color = c.id_color
INNER JOIN modelo m ON a.id_modelo = m.id_modelo
INNER JOIN tipus t ON a.id_tipus = t.id_tipus;

-- Respuesta del servidor: Devuelve el nombre y el precio de venta de los artículos junto con el nombre del modelo correspondiente.

-- 2. Seleccionar el nombre del artículo, el tipo y el precio de venta de los artículos de la tabla article junto con el nombre del tipo de la tabla tipus
SELECT a.nom AS nombre_articulo, t.nom AS tipo, a.preu_venda
FROM article a
INNER JOIN tipus t ON a.id_tipus = t.id_tipus;

-- Respuesta del servidor: Devuelve el nombre del artículo, el tipo y el precio de venta de los artículos junto con el nombre del tipo correspondiente.

-- 3. Seleccionar el nombre del artículo, la clase y el precio de venta de los artículos de la tabla article junto con la descripción de la clase de la tabla clase
SELECT a.nom AS nombre_articulo, c.nom_clase AS clase, a.preu_venda
FROM article a
INNER JOIN clase c ON a.id_clase = c.id_clase;

-- Respuesta del servidor: Devuelve el nombre del artículo, la clase y el precio de venta de los artículos junto con la descripción de la clase correspondiente.


-- Consultas con subconsultas

-- 1. Seleccionar el nombre y la descripción de las categorías de la tabla categoria donde existan artículos asociados en la tabla article
SELECT nom_cat, descripcio
FROM categoria
WHERE id_categoria IN (SELECT DISTINCT id_categoria FROM article);

-- Respuesta del servidor: Devuelve el nombre y la descripción de las categorías donde existan artículos asociados.

-- 2. Seleccionar el nombre del artículo, el precio de venta y el nombre del tipo de la tabla tipus donde el precio de venta sea mayor que el precio de coste
SELECT nom AS nombre_articulo, preu_venda, (SELECT nom FROM tipus WHERE id_tipus = a.id_tipus) AS tipo
FROM article a
WHERE preu_venda > preu_cost;

-- Respuesta del servidor: Devuelve el nombre del artículo, el precio de venta y el nombre del tipo donde el precio de venta sea mayor que el precio de coste.

-- 3. Seleccionar el nombre del artículo y el precio de venta de los artículos de la tabla article donde el nombre del color esté presente en la tabla talla_adults_superior
SELECT nom AS nombre_articulo, preu_venda
FROM article
WHERE id_color IN (SELECT id_color FROM talla_adults_superior);

-- Respuesta del servidor: Devuelve el nombre del artículo y el precio de venta donde el color esté presente en la tabla 'talla_adults_superior'.
