DELIMITER //

CREATE TRIGGER process_arn_sequence
AFTER INSERT ON arn_sequences
FOR EACH ROW
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE triplet CHAR(3);
    DECLARE result VARCHAR(255) DEFAULT '';

    WHILE i <= CHAR_LENGTH(NEW.sequence) - 2 DO
        SET triplet = SUBSTRING(NEW.sequence, i, 3);

        SELECT amino_acid INTO @amino FROM codon_translation WHERE codon = triplet;
        
        IF @amino IS NOT NULL THEN
            SET result = CONCAT(result, @amino);
        ELSE
            SET result = CONCAT(result, '?'); -- Para tripletes no reconocidos
        END IF;

        SET i = i + 3;
    END WHILE;

    -- Aquí puedes hacer algo con el resultado, como guardarlo en otra tabla, o mostrarlo.
    INSERT INTO translated_sequences (sequence_id, translated_sequence) VALUES (NEW.id, result);

END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER convertir_adn_a_arn
AFTER INSERT ON adn_table
FOR EACH ROW
BEGIN
    DECLARE cadena_adn VARCHAR(255);
    DECLARE cadena_arn VARCHAR(255);

    -- Almacenar la cadena de ADN insertada
    SET cadena_adn = NEW.cadena_adn;
    
    -- Reemplazar T por U en la cadena de ADN para convertir a ARN
    SET cadena_arn = REPLACE(cadena_adn, 'T', 'U');
    
    -- Actualizar la columna ARN en la tabla con la cadena convertida
    UPDATE adn_table
    SET cadena_arn = cadena_arn
    WHERE id = NEW.id;
END;
//
DELIMITER ;


