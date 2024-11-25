DROP PROCEDURE IF EXISTS ciutats;
DROP PROCEDURE IF EXISTS ciutats_lim;
DROP PROCEDURE IF EXISTS ciutat3;

DELIMITER $$

CREATE PROCEDURE ciutats()
BEGIN
    SELECT Name, Population FROM City;
END $$

DELIMITER $$

CREATE PROCEDURE ciutats_lim(IN lon INT)
BEGIN
    SELECT Name, Population 
    FROM City 
    ORDER BY Name 
    LIMIT lon;
END $$

DELIMITER $$

CREATE PROCEDURE ciutat3(IN pais VARCHAR(50), OUT numciutats INT)
BEGIN
    SELECT COUNT(*) INTO numciutats
    FROM City 
    WHERE CountryCode = (
        SELECT Code FROM Country WHERE Name = pais
    );
END $$

DELIMITER ;

