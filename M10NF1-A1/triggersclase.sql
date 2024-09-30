USE vk21;
DROP TRIGGER IF EXISTS edat;

DELIMITER $$

CREATE TRIGGER edat
BEFORE INSERT ON venedors
FOR EACH ROW
BEGIN
    DECLARE data_avui YEAR;
    DECLARE edat INT;

    SET data_avui = YEAR(CURDATE());
    SET edat = data_avui - NEW.any_naix;

    IF edat > 67 THEN
        SET NEW.titol = 'Jubilat';
    END IF;
    IF edat < 0 THEN
        SET NEW.titol = 'ERROR';
    END IF;
    IF edat < 18 THEN
        SET NEW.titol = 'Menor';
    END IF;
END $$

DELIMITER ;
