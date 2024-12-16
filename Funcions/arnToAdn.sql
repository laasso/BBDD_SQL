DELIMITER //
DROP FUNCTION IF EXISTS arntoadn; -- arn to adn codificant
CREATE FUNCTION arntoadn(arn TEXT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE arn_char CHAR(1);
    DECLARE adn_seq TEXT DEFAULT '';
    WHILE i <= CHAR_LENGTH(arn) DO
        SET arn_char = SUBSTRING(arn, i, 1);
        SET adn_seq = CONCAT(adn_seq,
            CASE arn_char
                WHEN 'U' THEN 'A'
                WHEN 'A' THEN 'T'
                WHEN 'C' THEN 'G'
                WHEN 'G' THEN 'C'
                ELSE ''
            END
        );
        SET i = i + 1;
    END WHILE;
    -- Retorna la seqüència ADN complementaria
    RETURN adn_seq;
END//
DELIMITER ;

-- Select arntoadn(adn) From adn where idgen=114;
