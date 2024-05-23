-- Assignar rols als usuaris
GRANT venedor TO 'Venedor1'@'localhost', 'Venedor2'@'localhost', 'Venedor3'@'localhost','Director1'@'localhost', 'Director2'@'localhost';
GRANT director TO 'Director1'@'localhost', 'Director2'@'localhost','Gerent'@'localhost';
GRANT gerent TO 'Gerent'@'localhost';

SET DEFAULT ROLE ALL TO 'Gerent'@'localhost';
SET DEFAULT ROLE ALL TO 'Director1'@'localhost';
SET DEFAULT ROLE ALL TO 'Director2'@'localhost';
SET DEFAULT ROLE ALL TO 'Venedor1'@'localhost';
SET DEFAULT ROLE ALL TO 'Venedor2'@'localhost';
SET DEFAULT ROLE ALL TO 'Venedor3'@'localhost';
FLUSH PRIVILEGES;