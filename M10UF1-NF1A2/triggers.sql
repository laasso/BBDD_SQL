USE agencia21;

DROP TRIGGER IF EXISTS before_insert_Reserves_Viatges;

-- Trigger para insertar en detall
DELIMITER $$
 
CREATE TRIGGER before_insert_Reserves_Viatges
BEFORE INSERT ON Reserves_Viatges
FOR EACH ROW
BEGIN
    IF Reserves_Viatges.N_Places > Viatges.N_Places THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hi ha places suficients';
    END IF;
    IF Viatges.Data_Sortida < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No es poden reservar viatges passats';
    END IF;

END $$

DELIMITER ;

DROP TRIGGER IF EXISTS after_insert_Reserves_Viatges;

-- Trigger para insertar en detall
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