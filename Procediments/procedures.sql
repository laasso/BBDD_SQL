-- Procedure ciutats

DROP PROCEDURE IF EXISTS ciutats;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS ciutats()
BEGIN
	SELECT Name,Population FROM City;
END//
DELIMITER ;

-- Procedure ciutats_lim

DROP PROCEDURE IF EXISTS ciutats_lim;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS ciutats_lim(IN lon INT)
BEGIN
	SELECT Name,Population FROM City ORDER BY Name LIMIT lon;
END//
DELIMITER ;

-- Procedure ciutats_lim2

DROP PROCEDURE IF EXISTS ciutats_lim2;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS ciutats_lim2(IN ini INT, IN lon INT)
BEGIN
	SELECT Name,Population FROM City ORDER BY Name LIMIT ini,lon;
END//
DELIMITER ;

-- Procedure ciutat3

DROP PROCEDURE IF EXISTS ciutat3;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS ciutat3(IN pais VARCHAR(28), OUT nomciutats INT)
BEGIN
	SELECT COUNT(*) INTO nomciutats
	FROM City WHERE CountryCode = (
	  SELECT Code FROM Country WHERE Name = pais);
	
	
END//
DELIMITER ;
