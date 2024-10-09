USE agencia21;

DROP TRIGGER IF EXISTS before_insert_Reserves_Viatges;

-- Trigger para insertar en detall
DELIMITER $$
 
CREATE TRIGGER before_insert_Reserves_Viatges
BEFORE INSERT ON Reserves_Viatges
FOR EACH ROW
BEGIN
    DECLARE places_disponibles INT;
    DECLARE data_sort DATE;

    SELECT N_Places, Data_Sortida INTO places_disponibles, data_sort
    FROM Viatges
    WHERE Codi = NEW.Codi_Viatge;

    IF NEW.N_Places > places_disponibles THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hi ha places suficients';
    END IF;
    IF data_sort < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No es poden reservar viatges passats';
    END IF;

END $$

DELIMITER ;

-- Trigger para insertar en Resresves_Viatges

DROP TRIGGER IF EXISTS after_insert_Reserves_Viatges;

DELIMITER $$

CREATE TRIGGER after_insert_Reserves_Viatges
AFTER INSERT ON Reserves_Viatges
FOR EACH ROW
BEGIN
    UPDATE Viatges
    SET N_Places = N_Places - NEW.N_Places
    WHERE Codi = NEW.Codi_Viatge;
END $$

DELIMITER ;


-- Trigger per evitar la eliminciaio de viatges realitzats

DROP TRIGGER IF EXISTS before_delete_Reserves_Viatges;

DELIMITER $$

CREATE TRIGGER before_delete_Reserves_Viatges
BEFORE DELETE ON Reserves_Viatges
FOR EACH ROW
BEGIN
    DECLARE viatge_realitzat INT;

    IF (SELECT Data_Tornada FROM Viatges WHERE Codi = OLD.Codi_Viatge) < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No es poden eliminar viatges realitzats';
    END IF;
END $$


DELIMITER ;


-- Trigger para evitar que se actualicen en negativo el numero de plazas

DROP TRIGGER IF EXISTS before_update_Viatges;

DELIMITER $$

CREATE TRIGGER before_update_Reserves_Viatges
BEFORE UPDATE ON Reserves_Viatges
FOR EACH ROW
BEGIN
    DECLARE places_disponibles INT;
    DECLARE data_sort DATE;

    SELECT N_Places, Data_Sortida INTO places_disponibles, data_sort
    FROM Viatges
    WHERE Codi = NEW.Codi_Viatge;

    IF NEW.N_Places > places_disponibles THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Supera el límit de places';
    END IF;
    IF data_sort < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No es poden reservar viatges passats';
    END IF;

END $$

DELIMITER ;