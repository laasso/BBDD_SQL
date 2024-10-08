USE agencia21;

DROP TRIGGER IF EXISTS before_insert_Reserves_Viatges;

-- Trigger para insertar en detall
DELIMITER $$
 
CREATE TRIGGER before_insert_Reserves_Viatges
BEFORE INSERT ON Reserves_Viatges
FOR EACH ROW
BEGIN
    IF Reserves_Viatges.N_places > Viatges.N_places THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hi ha places suficients';
    END IF;
    IF Viatges.Data_Sortida < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No es poden reservar viatges passats';
    END IF;

END $$

-- Trigger para actualizar en detall
