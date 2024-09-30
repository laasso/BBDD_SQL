pager cat | tee -a /tmp/vk21-detall.out
Select '/tmp/vk21-detall.out' AS "L'arxiu resultant es troba al directori" ;

TRUNCATE mysql.general_log;
SELECT @@general_log into @gen_log;
SELECT @@log_output into @log_out;

SET GLOBAL general_log=1;
SET GLOBAL log_output='TABLE';
SET AUTOCOMMIT = 0;

-- *** INSERT producte en taula detall ***

SELECT '[ INSERT màxim de producte +1 ]' AS 'INSERT_detall';
INSERT INTO productes VALUES ('rei', '775c', 'Ref fab. imm', 1500, 100, sysdate(), NULL);
SELECT stock FROM productes WHERE id_fab='imm' AND id_producte='775c' INTO @prod;
SELECT @prod AS 'Stock màxim';

SET @valor = CASE 
  WHEN @prod=6 THEN '** Coincideix valor inicial **'
  ELSE
    '** NO coincideix valor inicial **'
END;
SELECT @valor AS '[ ** SETUP ** ]';

SELECT current_timestamp(3);
INSERT INTO detall VALUES (113239,'imm','775c', @prod+1, NULL);
SELECT stock FROM productes WHERE id_fab='imm' AND id_producte='775c' INTO @stock;

SET @valor = CASE 
  WHEN @stock=0 THEN '** Correcte **'
  ELSE
    '** ERROR o Incorrecte **'
END;
SELECT CONCAT(@valor, " ", @stock) AS '[ ** RESULTAT INSERT ** ]';

SELECT * FROM detall WHERE num_comanda=113239 AND fab='imm';
SHOW errors; -- Empty set
SHOW warnings; -- Empty set

-- *** UPDATE producte en taula detall ***

SELECT '[ Restem 10 unitats en comanda ]' AS 'UPDATE_taula_detall';
SELECT stock FROM productes WHERE id_fab='aci' AND id_producte='41002' INTO @stock;
SELECT @stock AS 'Stock previ aci 41002';
SELECT quantitat FROM detall WHERE num_comanda=113239 AND fab='aci' AND producte='41002'
INTO @q;
SELECT @q AS 'quantitat_previa_detall';
UPDATE detall SET quantitat = @q - 10 
  WHERE num_comanda=113239 AND fab='aci' AND producte='41002';
SELECT quantitat FROM detall WHERE num_comanda=113239 AND fab='aci' AND producte='41002'
INTO @q2;
SELECT @q2 AS 'quantitat_modif_detall';
SHOW errors; -- Empty set
SHOW warnings;

SELECT stock AS 'stock_modif', @stock AS 'stock_previ' FROM productes WHERE id_fab='aci' AND id_producte='41002' 
UNION 
SELECT quantitat AS 'quantitat_modif', @q AS 'quantitat_previa' FROM detall WHERE num_comanda=113239 AND fab='aci' AND producte='41002';

SET @valor = CASE 
  WHEN @stock+10=508 THEN '** Correcte **'
  ELSE
    '** ERROR o Incorrecte **'
END;
SELECT CONCAT(@valor, " ", @stock+10) AS '[ ** RESULTAT UPDATE - ** ]';

-- Afegirem més quantitat a detall del que tenim en stock de producte
-- Ens hauria d'afegir el màxim d'stock previ de producte +508 uds
-- El resultat serien 508+80 = 588 uds en detall

SELECT '[ Afegim 1000 unitats en comanda ]' AS 'UPDATE_taula_detall';
SELECT stock FROM productes WHERE id_fab='aci' AND id_producte='41002' INTO @stock;
SELECT @stock AS 'Stock previ aci 41002';
SELECT quantitat FROM detall WHERE num_comanda=113239 AND fab='aci' AND producte='41002'
INTO @q;
SELECT @q AS 'quantitat_previa_detall';
UPDATE detall SET quantitat = @q + 1000 
  WHERE num_comanda=113239 AND fab='aci' AND producte='41002';
SELECT quantitat FROM detall WHERE num_comanda=113239 AND fab='aci' AND producte='41002'
INTO @q2;
SELECT @q2 AS 'quantitat_modif_detall';
SHOW errors; -- Empty set
SHOW warnings;

SELECT stock AS 'stock_modif', @stock AS 'stock_previ' FROM productes WHERE id_fab='aci' AND id_producte='41002' 
UNION 
SELECT quantitat AS 'quantitat_modif', @q AS 'quantitat_previa' FROM detall WHERE num_comanda=113239 AND fab='aci' AND producte='41002';

SELECT stock FROM productes WHERE id_fab='aci' AND id_producte='41002' INTO @stock;
SET @valor = CASE 
  WHEN @stock = 0
    THEN '** Correcte **'
  ELSE
    '** ERROR o Incorrecte **'
END;
SELECT CONCAT(@valor, " ", @stock) AS '[ ** RESULTAT UPDATE + ** ]';


-- *** DELETE producte (registre) en taula detall ***

SELECT '[ Eliminem línia detall en comanda ]' AS 'DELETE_reg_taula_detall';
SELECT stock FROM productes WHERE id_fab='aci' AND id_producte='41002' INTO @stock;
SELECT @stock AS 'Stock previ aci 41002';
SELECT quantitat FROM detall WHERE num_comanda=113239 AND fab='aci' AND producte='41002'
INTO @q;
SELECT @q AS 'quantitat_previa_detall';
DELETE FROM detall 
  WHERE num_comanda=113239 AND fab='aci' AND producte='41002';
  
SELECT stock FROM productes WHERE id_fab='aci' AND id_producte='41002' INTO @stock2;
SELECT @stock2 AS 'Quantitat_stock_final_producte';
SHOW errors; -- Empty set
SHOW warnings;

SET @valor = CASE 
  WHEN @stock2 = @q
    THEN '** Correcte **'
  ELSE
    '** ERROR o Incorrecte **'
END;
SELECT CONCAT(@valor, " ", @stock2) AS '[ ** RESULTAT DELETE ** ]';


SELECT 'Joc de Proves' AS '----------------------- Finalitzacio ---------------------------';
SELECT event_time, CAST(argument AS CHAR(10000) CHARACTER SET utf8)  as arg  FROM mysql.general_log ORDER BY event_time;

nopager
notee

SET GLOBAL general_log=@gen_log;
SET GLOBAL log_output=@log_out;
ROLLBACK;
SET AUTOCOMMIT = 1;
