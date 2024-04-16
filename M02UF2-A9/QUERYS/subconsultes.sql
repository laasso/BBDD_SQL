-- Obtenir el preu mitja de venda per provincia

SELECT provincia.nom_oficial, (
    SELECT AVG(vivenda.preu_venda)
    FROM vivenda
    JOIN municipi_vivenda ON vivenda.id_vivenda = municipi_vivenda.id_vivenda
    JOIN municipi ON municipi_vivenda.id_municipi = municipi.id_municipi
    JOIN provincia p ON municipi.id_provincia = p.id_provincia
    WHERE p.nom_oficial = provincia.nom_oficial
) AS precio_promedio
FROM provincia;

-- Obtenir el numero de vivendas total per comrarca

SELECT comarca.nom_comarca, (
    SELECT COUNT(*)
    FROM vivenda
    JOIN municipi_vivenda ON vivenda.id_vivenda = municipi_vivenda.id_vivenda
    JOIN municipi ON municipi_vivenda.id_municipi = municipi.id_municipi
    JOIN comarca c ON municipi.id_comarca = c.id_comarca
    WHERE c.nom_comarca = comarca.nom_comarca
) AS total_viviendas
FROM comarca;

