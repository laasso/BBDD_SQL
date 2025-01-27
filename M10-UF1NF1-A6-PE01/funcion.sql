DROP FUNCTION IF EXISTS privilegis;

DELIMITER //

CREATE FUNCTION privilegis(usuaris VARCHAR(255)) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE resultat int;

    SELECT count(*) INTO resultat
    FROM information_schema.user_privileges
    WHERE grantee LIKE CONCAT('%', usuaris, '%');

    RETURN resultat;

END //

DELIMITER ;



