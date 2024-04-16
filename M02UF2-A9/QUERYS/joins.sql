-- Mostrar el preu mitja de pisos amb ascensor

SELECT AVG(v.preu_venda) AS Preu_Mitja
FROM vivenda v
JOIN pis p ON v.id_vivenda = p.id_vivenda
JOIN caracteristiques_vivendes cv ON v.id_vivenda = cv.id_vivenda
JOIN caracteristiques c ON cv.id_caracteristica = c.id_caracteristica
WHERE c.ascensor = TRUE;

/*
+---------------+
| Preu_Mitja    |
+---------------+
| 155549.346651 |
+---------------+
1 row in set (0,01 sec)
*/

-- Mostrar el preu mitja de pisos sense ascensor

SELECT AVG(v.preu_venda) AS Preu_Mitja
FROM vivenda v
JOIN pis p ON v.id_vivenda = p.id_vivenda
JOIN caracteristiques_vivendes cv ON v.id_vivenda = cv.id_vivenda
JOIN caracteristiques c ON cv.id_caracteristica = c.id_caracteristica
WHERE (c.ascensor IS NULL OR c.ascensor = FALSE);

/*
+---------------+
| Preu_Mitja    |
+---------------+
| 141143.962865 |
+---------------+
1 row in set (0,01 sec)
*/

--Selecciona el id de pis preu descripcio i comarca dels 10 inmobles mes barats.

SELECT v.id_vivenda, v.preu_venda, v.tipus, v.descripcio, p.nom_oficial AS provincia
FROM vivenda AS v
INNER JOIN municipi_vivenda mv ON v.id_vivenda = mv.id_vivenda
INNER JOIN municipi m ON mv.id_municipi = m.id_municipi
INNER JOIN provincia p ON m.id_provincia = p.id_provincia
ORDER BY v.preu_venda ASC
LIMIT 10;

/*
+------------+------------+-------+----------------------------------------------------------------------------------------------------------------------------------------------------+-----------+
| id_vivenda | preu_venda | tipus | descripcio                                                                                                                                         | provincia |
+------------+------------+-------+----------------------------------------------------------------------------------------------------------------------------------------------------+-----------+
|   36556081 |   20216.00 | Piso  | El inmueble (PISO) se encuentra situado en el municipio de Ripoll (GIRONA). La vivienda está ubicada en un edificio de un edificio de tres a       | Girona    |
|   38529858 |   20216.00 | Piso  | Piso de dos dormitorios y cuarto de baño, situado en la planta baja de un edificio de cuatro alturas sin ascensor. Se encuentra situado en e       | Girona    |
|   83758765 |   23000.00 | Piso  | Se vende economico piso de origen en Ripoll. El piso consta de 65m2, distribuidos en 2 habitaciones dobles. Salón comedor. Cocina office con       | Girona    |
|   84745502 |   26000.00 | Piso  | Año construcción: 1923. Estado conservación: Regular. Habitaciones: 3. Condición: Exterior. Dormitorios: Dobles: 3. Baños / aseos: Baños: 1.       | Girona    |
|   84966935 |   26000.00 | Piso  | Se vende piso en Ripoll, situado en la colonia noguera. El piso esta de irigen, bien conservado. Con 87m2. Consta de 3 habitaciones, dos de        | Girona    |
|   37830166 |   28300.00 | Piso  | Apartamento con 2 dormitorios y ba¦o. Situada en el municipio de Ripoll, provincia de Girona. Se distribuye en comedor-estar, cocina, dos ha       | Girona    |
|   38662543 |   28300.00 | Piso  | Apartamento con 2 dormitorios y baño. Situada en el municipio de Ripoll, provincia de Girona. Se distribuye en comedor-estar, cocina, dos ha       | Girona    |
|   38624253 |   28585.00 | Piso  | Tapiado. El inmueble (PISO) se encuentra situado en el municipio de TORRELLES DE FOIX (BARCELONA). El inmueble (PISO) se distribuye en. El I       | Barcelona |
|   39805377 |   30000.00 | Piso  | Estado conservación: Buena. Habitaciones: 2. Salón (m²): 13.86. Dormitorios: Dobles: 3. totes exteriors. Cocina: Independiente. Balcones: 2.       | Girona    |
|   84240341 |   30283.00 | Piso  | Tapiado. El inmueble (PISO) se encuentra situado en el municipio de TORRELLES DE FOIX (BARCELONA). EDIFICIO DE VIVIENDAS, OFICINAS O MIXTO -       | Barcelona |
+------------+------------+-------+----------------------------------------------------------------------------------------------------------------------------------------------------+-----------+
10 rows in set (0,01 sec)
*/