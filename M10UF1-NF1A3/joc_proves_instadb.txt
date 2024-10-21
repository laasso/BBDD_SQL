pager cat | tee -a /tmp/instadb.out
Select '/tmp/instadb.out' AS "L'arxiu resultant es troba al directori" ;

TRUNCATE mysql.general_log;
SELECT @@general_log into @gen_log;
SELECT @@log_output into @log_out;

SET GLOBAL general_log=1;
SET GLOBAL log_output='TABLE';
SET @tags=NULL, @valor=NULL;
SET AUTOCOMMIT = 0;

-- *** INSERT photouser ***

SELECT current_timestamp(3);
INSERT INTO photouser VALUES (1000, 'Allen', sysdate(), 'Noruega', 'Lorem #Ipsum ##, #fjord .');
SHOW ERRORS;
SHOW warnings;
SELECT count(*) as tags FROM tagphoto WHERE idphoto=1000 AND nomuser = 'Allen' INTO @tags;

SET @valor = CASE 
  WHEN @tags=3 THEN '** Correcte **'
  ELSE
    '** ERROR o Incorrecte **'
END;
SELECT CONCAT(@valor, " ", @tags) AS '[ ** RESULTAT INSERT ** ]';

-- *** UPDATE photouser ***

SELECT current_timestamp(3);
SET @tags=NULL, @valor=NULL;

UPDATE photouser SET descripcio = 'Els tags es #minimitzen de tagphoto' where idphoto = 1000 and nomuser = 'Allen';

SELECT count(*) as tags FROM tagphoto WHERE idphoto=1000 AND nomuser = 'Allen' INTO @tags;

SET @valor = CASE 
  WHEN @tags=1 THEN '** Correcte **'
  ELSE
    '** ERROR o Incorrecte **'
END;

SELECT CONCAT(@valor, " ", @tags) AS '[ ** RESULTAT UPDATE ** ]';

SHOW errors;
SHOW warnings;


SELECT 'Joc de Proves' AS '----------------------- Finalitzacio ---------------------------';
SELECT event_time, CAST(argument AS CHAR(10000) CHARACTER SET utf8)  as arg  FROM mysql.general_log ORDER BY event_time;

nopager
notee

SET GLOBAL general_log=@gen_log;
SET GLOBAL log_output=@log_out;
-- ROLLBACK;
-- SET AUTOCOMMIT = 1;
