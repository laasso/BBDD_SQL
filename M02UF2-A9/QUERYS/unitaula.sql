-- Mostar el preu mitja per comprar un pis de mes de 2 dormitoris i any de cionstruccio superior a 2005
SELECT AVG(preu_venda) AS Preu_Mitja FROM vivenda
WHERE dormitoris > 2 AND any_construccio > 2005;

-- Mostrar el codi INE amb el nom dels municipis que tinguin id comarca 2
SELECT codi_INE AS INE , nom_municipi AS Nom FROM municipi
WHERE id_comarca = 2;

-- Mostrar els pisos duplex agrupats per numero de planta

SELECT * FROM pis
WHERE tipus = 'Dúplex'
GROUP BY num_planta;