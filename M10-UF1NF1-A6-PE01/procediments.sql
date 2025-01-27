DROP PROCEDURE IF EXISTS userpriv;

delimiter //

CREATE PROCEDURE userpriv()
BEGIN
    DECLARE fet TINYINT(1) DEFAULT 0;
    DECLARE nom_usuari VARCHAR(255);
    
DECLARE cur CURSOR FOR
    SELECT user
    FROM mysql.user;

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET fet = 1;

OPEN cur;
REPEAT
    FETCH cur INTO nom_usuari;
    IF (fet = 0) THEN
        SET @mostra = concat("SELECT privilegis('", nom_usuari, "');");
        PREPARE usuari FROM @mostra;
        EXECUTE usuari;
        DEALLOCATE PREPARE usuari;
    END IF;
    UNTIL fet END REPEAT;
CLOSE cur;

END //
delimiter ;
