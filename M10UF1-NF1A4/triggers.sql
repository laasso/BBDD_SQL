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
