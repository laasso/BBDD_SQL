-- Mostar el preu mitja per comprar un pis de mes de 2 dormitoris i any de cionstruccio superior a 2005
SELECT AVG(preu_venda) AS Preu_Mitja FROM vivenda
WHERE dormitoris > 2 AND any_construccio > 2005;