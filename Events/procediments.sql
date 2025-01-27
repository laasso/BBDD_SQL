DROP PROCEDURE IF EXISTS taulestime;
DELIMITER //

CREATE PROCEDURE taulestime()
  SQL SECURITY INVOKER
BEGIN
    DECLARE fet TINYINT(1) DEFAULT 0;
    DECLARE nom_taula VARCHAR(255);
    DECLARE temps VARCHAR(255);

DECLARE cur CURSOR FOR
    SELECT table_name
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA=DATABASE();

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET fet = 1;

SET temps = DATE_FORMAT(NOW(), '%Y%m%d%H%i%S');


OPEN cur;
REPEAT
    FETCH cur INTO nom_taula;
    IF (fet = 0) THEN
        SET @mostra = CONCAT(
            'SELECT * FROM ', nom_taula, 
            ' INTO OUTFILE \'', '/var/lib/mysql-files/', temps, "_", nom_taula, ".csv\' ",
            "FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n';"
        );
        PREPARE taula FROM @mostra;
        EXECUTE taula;
        DEALLOCATE PREPARE taula;
    END IF;
    UNTIL fet END REPEAT;
CLOSE cur;

END //
DELIMITER ;


