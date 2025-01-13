DROP PROCEDURE IF EXISTS taules;

delimiter //

CREATE PROCEDURE taules()
  SQL SECURITY INVOKER
BEGIN
    DECLARE fet TINYINT(1) DEFAULT 0;
    DECLARE nom_taula VARCHAR(255);

DECLARE cur CURSOR FOR
    SELECT table_name
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA=DATABASE();

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET fet = 1;

OPEN cur;
REPEAT
    FETCH cur INTO nom_taula;
    IF (fet = 0) THEN
        SET @mostra = concat('SELECT * FROM ', nom_taula, ' LIMIT 1;');
        PREPARE taula FROM @mostra;
        EXECUTE taula;
        DEALLOCATE PREPARE taula;
    END IF;
    UNTIL fet END REPEAT;
CLOSE cur;

END //
delimiter ;
