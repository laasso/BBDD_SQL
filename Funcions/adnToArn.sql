DELIMITER //
DROP FUNCTION IF EXISTS adn_to_arn; 
CREATE FUNCTION adn_to_arn(id_gen INT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE adn_seq TEXT;
    DECLARE arn_seq TEXT DEFAULT '';     
    DECLARE i INT DEFAULT 1;     
    DECLARE adn_char CHAR(1); 
    DECLARE arn_char CHAR(1);
    
    SELECT adn INTO adn_seq
    FROM adn
    WHERE idgen = id_gen;

    IF adn_seq IS NULL THEN
        RETURN NULL; 
    END IF;

    WHILE i <= CHAR_LENGTH(adn_seq) DO
        SET adn_char = SUBSTRING(adn_seq, i, 1);

        SELECT idarn INTO arn_char
        FROM transcrip
        WHERE idadn = adn_char;

        SET arn_seq = CONCAT(arn_seq, IFNULL(arn_char, ''));
        SET i = i + 1; 
    END WHILE;

       RETURN arn_seq;
END//
DELIMITER ;

