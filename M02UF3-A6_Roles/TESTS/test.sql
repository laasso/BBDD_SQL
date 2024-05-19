-- Executar els scripts i guardar els resultats en fitxers
USE mysql;

-- Executar script de prova per l'usuari Venedor
SOURCE /home/lasso/BBDD_SQL/M02UF3-A6_Roles/TESTS/venedor.sql;
TEE /home/lasso/BBDD_SQL/M02UF3-A6_Roles/TESTS/venedor.txt;

-- Executar script de prova per l'usuari Director
SOURCE /home/lasso/BBDD_SQL/M02UF3-A6_Roles/TESTS/director.sql;
TEE /home/lasso/BBDD_SQL/M02UF3-A6_Roles/TESTS/director.txt;

-- Executar script de prova per l'usuari Gerent
SOURCE /home/lasso/BBDD_SQL/M02UF3-A6_Roles/TESTS/venedor.sql;
TEE /home/lasso/BBDD_SQL/M02UF3-A6_Roles/TESTS/gerent.txt;
