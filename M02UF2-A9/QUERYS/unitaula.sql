-- Mostar el preu mitja per comprar un pis de mes de 2 dormitoris i any de cionstruccio superior a 2005
SELECT AVG(preu_venda) AS Preu_Mitja FROM vivenda
WHERE dormitoris > 2 AND any_construccio > 2005;
/*
+---------------+
| Preu_Mitja    |
+---------------+
| 346688.426966 |
+---------------+
1 row in set, 96 warnings (0,00 sec)

*/


-- Mostrar el codi INE amb el nom dels municipis que tinguin id comarca 2
SELECT codi_INE AS INE , nom_municipi AS Nom FROM municipi
WHERE id_comarca = 2;

/*
+-------+-----------------------------+
| INE   | Nom                         |
+-------+-----------------------------+
| 42717 | Capmany                     |
| 10617 | Mollet de Peralada          |
| 11117 | Navata                      |
| 11517 | Ordis                       |
| 11917 | Palau de Santa Eulàlia      |
| 12017 | Palau-saverdera             |
| 12817 | Pau                         |
| 12917 | Pedret i Marzà              |
| 13217 | Peralada                    |
| 13517 | Pont de Molins              |
| 13617 | Pontós                      |
| 13817 | Portbou                     |
| 14017 | Port de la Selva, el        |
| 14317 | Rabós                       |
| 15117 | Riumors                     |
| 15217 | Roses                       |
| 15817 | Sant Climent Sescebes       |
| 17117 | Sant Llorenç de la Muga     |
| 17517 | Sant Miquel de Fluvià       |
| 17617 | Sant Mori                   |
| 17817 | Sant Pere Pescador          |
| 18217 | Santa Llogaia d'Àlguema     |
| 18717 | Saus, Camallera i Llampaies |
| 18817 | Selva de Mar, la            |
| 19617 | Terrades                    |
| 19817 | Torroella de Fluvià         |
| 21017 | Ventalló                    |
| 21417 | Vilabertran                 |
| 21717 | Viladamat                   |
| 22117 | Vilafant                    |
| 22217 | Vilaür                      |
| 22317 | Vilajuïga                   |
| 22517 | Vilamacolum                 |
| 22617 | Vilamalla                   |
| 22717 | Vilamaniscle                |
| 22817 | Vilanant                    |
| 23017 | Vila-sacra                  |
| 23417 | Biure                       |
+-------+-----------------------------+
38 rows in set (0,00 sec)*/


-- Mostrar els pisos duplex agrupats per numero de planta
SELECT * FROM pis
WHERE tipus = 'Dúplex'
GROUP BY num_planta;

/*
+------------+---------+---------------------+
| id_vivenda | tipus   | num_planta          |
+------------+---------+---------------------+
|     361079 | Dúplex  | planta 3ª exterior  |
|     393376 | Dúplex  | planta 1ª exterior  |
|     418969 | Dúplex  | bajo exterior       |
|    1754544 | Dúplex  | planta 2ª exterior  |
|   30285888 | Dúplex  | planta 4ª exterior  |
|   31695845 | Dúplex  | planta 2ª           |
|   33142243 | Dúplex  | planta 1ª           |
|   36786921 | Dúplex  | bajo interior       |
|   38204375 | Dúplex  |                     |
|   38519296 | Dúplex  | interior            |
|   81245906 | Dúplex  | planta 3ª interior  |
|   82633084 | Dúplex  | planta 3ª           |
|   82677243 | Dúplex  | exterior            |
+------------+---------+---------------------+
13 rows in set (0,00 sec)*/

-- Mostra els pisos amb una superficie de terrassa superiro a 100
SELECT * FROM vivenda 
WHERE superficie_terrassa > 100
AND tipus = 'Piso';

/*
+------------+-------+------------+-------+--------------------+---------------------+-----------------+--------------------------+------------+--------------------+-------------------------------------------------------------------------------------------------------------------------------------------------+------------+
| id_vivenda | tipus | dormitoris | banys | superficie_vivenda | superficie_terrassa | any_construccio | estat_conservacio        | preu_venda | disponible_lloguer | descripcio                                                                                                                                      | data       |
+------------+-------+------------+-------+--------------------+---------------------+-----------------+--------------------------+------------+--------------------+-------------------------------------------------------------------------------------------------------------------------------------------------+------------+
|     310988 | Piso  | 2          |     1 |             118.00 |              160.45 |               0 | segunda mano/buen estado |  170000.00 |               NULL | vistas a la montaña y situado a 5 minutos de las pistas de esquí. precio negociable, distribución:, terraza descubierta de 18 m2, la casa di    | 2019-04-15 |
|     402733 | Piso  | 3          |     1 |             104.00 |              140.50 |               0 | segunda mano/buen estado |  138000.00 |               NULL | lo vendo por asuntos personales, es muy bonita todo plano, sin escaleras, vecinos muy amables, muy confortable, todas las ventanas menos una    | 2019-04-12 |
|     418550 | Piso  | 1          |     1 |              50.00 |              108.96 |               0 | segunda mano/buen estado |  126000.00 |               NULL | Piso gelida 1 hab. 50, 69m2 eur 134. 000 piso en zona residencial, todo exterior, luminoso. Acabados de alta calidad: parquet y puertas de h    | 2019-04-12 |
|    1616126 | Piso  | 3          |     2 |              90.00 |              148.72 |               0 | segunda mano/buen estado |  198000.00 |               NULL | Piso en perfecto estado, acabados de 1ª calidad: suelos mármol, puertas roble, armarios empotrados, aire y calefacción por bomba de calor de    | 2019-04-12 |
|    1802871 | Piso  | 3          |     1 |              85.00 |              148.31 |               0 | segunda mano/buen estado |  100000.00 |               NULL | Piso totalmente reformado y con materiales de calidad extra, se dejaría con muebles y electrodomésticos todo de primera calidad, puerta blin    | 2019-04-15 |
|    1821974 | Piso  | 3          |     1 |              83.00 |              177.95 |               0 | segunda mano/buen estado |  135000.00 |               NULL | en el centro de rosas a 50m de la playa, distribución:, terraza descubierta de 40 m2, 2 vecinos en el edificio, la casa dispone de:,portero     | 2019-04-15 |
|    1829645 | Piso  | 2          |     1 |              65.00 |              130.59 |            2005 | segunda mano/buen estado |  125000.00 |               NULL | apartamento de montaña amueblado con jardin, 2 habitaciones, cocina y salón-comedor con chimenea, a un paso de las pistas de esqui. zona muy    | 2019-04-15 |
|    1865151 | Piso  | 1          |     1 |              48.00 |              121.71 |               0 | segunda mano/buen estado |  122000.00 |               NULL | se vende apartamento muy luminosos, amueblado y reformado, a 5 minutos de la playa. Consta de cocina americana, totalmente equipada, un dorm    | 2019-04-15 |
|    1921978 | Piso  | 2          |     1 |              90.00 |              150.79 |               0 | segunda mano/buen estado |  135000.00 |               NULL | PISCINA COMUNITARIA Y JARDINES MUY CUIDADOS, distribución:, terraza descubierta de 30 m2, 30 vecinos en el edificio, la casa dispone de:,por    | 2019-04-15 |
|    1933206 | Piso  | 3          |     1 |              85.00 |              167.25 |               0 | segunda mano/buen estado |  120000.00 |               NULL | Piso en Sant Sadurni d´Anoia, barrio Vivendas vilarnau, provincia de Barcelona. Zona muy tranquila con mucho espacio para estacionar el Vehi    | 2019-04-12 |
+------------+-------+------------+-------+--------------------+---------------------+-----------------+--------------------------+------------+--------------------+-------------------------------------------------------------------------------------------------------------------------------------------------+------------+
10 rows in set (0,00 sec)*/