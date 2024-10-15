DROP TRIGGER IF EXISTS after_insert_photo;

DELIMITER $$

CREATE TRIGGER after_insert_photo
AFTER INSERT ON photouser
FOR EACH ROW
BEGIN
    DECLARE pos_ini INT DEFAULT 0;
    DECLARE pos_final INT DEFAULT 0;
    DECLARE hashtag VARCHAR(24);
    DECLARE desc_restant VARCHAR(255);

    SET desc_restant = NEW.descripcio;

    WHILE LOCATE('#', desc_restant) > 0 DO
        SET pos_ini = LOCATE('#', desc_restant);
        SET pos_final = LOCATE(' ', desc_restant, pos_ini);

        IF pos_final = 0 THEN
            SET hashtag = SUBSTRING(desc_restant, pos_ini);
        ELSE
            SET hashtag = SUBSTRING(desc_restant, pos_ini, pos_final - pos_ini);
        END IF;

        INSERT INTO tagphoto(idphoto, nomuser, tag)
        VALUES (NEW.idphoto, NEW.nomuser, REPLACE(hashtag, '#',''));

        IF pos_final = 0 THEN
            SET desc_restant = '';
        ELSE
            SET desc_restant = SUBSTRING(desc_restant, pos_final);
        END IF;
    END WHILE;

END $$

DELIMITER ;


DROP TRIGGER IF EXISTS after_update_photo;

DELIMITER $$

CREATE TRIGGER after_update_photo
AFTER UPDATE ON photouser
FOR EACH ROW
BEGIN
    DECLARE pos_ini INT DEFAULT 0;
    DECLARE pos_final INT DEFAULT 0;
    DECLARE hashtag VARCHAR(255);
    DECLARE desc_restant VARCHAR(255);

    DELETE FROM tagphoto WHERE idphoto = NEW.idphoto;

    SET desc_restant = NEW.descripcio;

    WHILE LOCATE('#', desc_restant) > 0 DO
        SET pos_ini = LOCATE('#', desc_restant);
        SET pos_final = LOCATE(' ', desc_restant, pos_ini);

        IF pos_final = 0 THEN
            SET hashtag = SUBSTRING(desc_restant, pos_ini);
        ELSE
            SET hashtag = SUBSTRING(desc_restant, pos_ini, pos_final - pos_ini);
        END IF;

        INSERT INTO tagphoto(idphoto, nomuser, tag)
        VALUES (NEW.idphoto, NEW.nomuser, REPLACE(hashtag, '#',''));

        IF pos_final = 0 THEN
            SET desc_restant = '';
        ELSE
            SET desc_restant = SUBSTRING(desc_restant, pos_final);
        END IF;
    END WHILE;

END $$

DELIMITER ;


