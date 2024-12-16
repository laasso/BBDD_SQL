DROP PROCEDURE IF EXISTS met;

DELIMITER $$

CREATE PROCEDURE met(IN idgenin INT)
BEGIN
    DECLARE arn_chain TEXT;
    DECLARE longitud INT;
    DECLARE pos_met INT DEFAULT 0;
    DECLARE triplet CHAR(3);
    DECLARE seq_proteina TEXT DEFAULT '';
    DECLARE proteina_longitud INT;
    DECLARE stop_pos INT DEFAULT 0;

    -- Obtener la cadena de ARN y su longitud
    SELECT arn, CHAR_LENGTH(arn)
    INTO arn_chain, longitud
    FROM adn
    WHERE idgen = idgenin;

    -- Validar si se obtuvo una cadena válida
    IF arn_chain IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cadena de ARN no existe para este ID.';
    END IF;

    -- Buscar el primer triplete "AUG"
    SET pos_met = LOCATE('AUG', arn_chain);

    IF pos_met = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cadena no conté Metionina "AUG"';
    END IF;

    -- Procesar todas las proteínas en la cadena
    WHILE pos_met > 0 DO
        SET seq_proteina = '';
        SET stop_pos = 0;

        -- Leer tripletes desde la posición actual
        WHILE (pos_met + 2) <= longitud DO
            SET triplet = SUBSTRING(arn_chain, pos_met, 3);

            -- Verificar si es un codón STOP
            IF triplet = '-' THEN
                SET stop_pos = pos_met;
                LEAVE;
            END IF;

            -- Añadir triplete a la proteína
            SET seq_proteina = CONCAT(seq_proteina, triplet);

            -- Mover a la siguiente posición
            SET pos_met = pos_met + 3;
        END WHILE;

        -- Calcular longitud de la proteína
        SET proteina_longitud = CHAR_LENGTH(seq_proteina);

        -- Mostrar resultado de la proteína procesada
        SELECT arn_chain AS 'Cadena de ARN',
               longitud AS 'Longitud',
               (pos_met - CHAR_LENGTH(seq_proteina)) AS 'Posición inicial (AUG)',
               seq_proteina AS 'Secuencia de nucleótidos',
               proteina_longitud AS 'Longitud de nucleótidos',
               stop_pos AS 'Posición del STOP';

        -- Buscar el siguiente "AUG" después de la posición actual
        SET pos_met = LOCATE('AUG', arn_chain, pos_met + 1);
    END WHILE;
END$$

DELIMITER ;

