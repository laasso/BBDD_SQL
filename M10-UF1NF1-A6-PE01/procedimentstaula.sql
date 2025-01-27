DROP PROCEDURE IF EXISTS userpriv;

delimiter //

CREATE PROCEDURE userpriv()
BEGIN
    DECLARE fet TINYINT(1) DEFAULT 0;
    DECLARE nom_usuari VARCHAR(255);
    DECLARE j VARCHAR(255);

DECLARE cur CURSOR FOR
    SELECT user
    FROM mysql.user;

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET fet = 1;

DROP TEMPORARY TABLE IF EXISTS taulpermisos;

CREATE TEMPORARY TABLE IF NOT EXISTS taulpermisos (
    Nom VARCHAR(255),
    Privilegis VARCHAR(255)
);

OPEN cur;
REPEAT
    FETCH cur INTO nom_usuari;
    IF (fet = 0) THEN
        SET @mostra = concat("SELECT privilegis('", nom_usuari, "');");
        PREPARE usuari FROM @mostra;
        EXECUTE usuari;
        INSERT INTO taulpermisos VALUES (nom_usuari, usuari);

        DEALLOCATE PREPARE usuari;

    END IF;
    UNTIL fet END REPEAT;
CLOSE cur;

SELECT * FROM taulpermisos;

END //
delimiter ;
