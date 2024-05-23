-- Assignar rols als usuaris
GRANT venedor TO 'DanRoberts'@'localhost', 'SueSmith'@'localhost', 'PaulCruz'@'localhost';
GRANT director, venedor TO 'BobSmith'@'localhost', 'LarryFitch'@'localhost';
GRANT gerent, director TO 'SamClark'@'localhost';


-- Establis els rols predeterminats a cada usuari
SET DEFAULT ROLE ALL TO 'SamClark'@'localhost'; -- Gerent
SET DEFAULT ROLE ALL TO 'BobSmith'@'localhost', 'LarryFitch'@'localhost'; -- Director1 y Director2
SET DEFAULT ROLE ALL TO 'DanRoberts'@'localhost', 'SueSmith'@'localhost', 'PaulCruz'@'localhost'; -- Venedor1, Venedor2 y Venedor3

FLUSH PRIVILEGES;