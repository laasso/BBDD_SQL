USE instadb;

DROP TRIGGER IF EXISTS after_insert_photo;

DELIMITER $$

CREATE TRIGGER IF NOT EXISTS after_insert_photo
AFTER INSERT ON photouser
FOR EACH ROW
BEGIN
    DECLARE longitud INT;
    DECLARE posicio_incial INT DEFAULT 0;
    SET @POS=1;
    set @FRASE='ESTO ES UNA #FRASE DE PRUEBA de #FRANCIA';
    SET LON = LENGTH(@FRASE);

    -- SET posicio_incial = LOCATE('#', new.descripcio);
    -- DECLARE posicio_final INT DEFAULT 0;
    -- SET posicio_final = LOCATE(' ', new.descripcio);

    -- SET hastag =  SUBSTRING(new.descripcio, posicio_inicial, posicio_final) FROM photouser;

    -- INSERT INTO tagphoto(idphoto, nomuser, tag)
    -- SELECT idphoto, nomuser, hastag FROM photouser;

END $$

DELIMITER ;


INSERT INTO photouser(nomuser, lloc, descripcio)
VALUES ('Dale', 'Providence', '#sild');

-- SELECT LOCATE('#', descripcio) INTO pos_ini
-- SELECT LOCATE('', descripcio) INTO pos_final
