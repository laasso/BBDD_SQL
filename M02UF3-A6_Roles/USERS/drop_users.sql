-- Eliminar usuarios
DROP USER IF EXISTS 'DanRoberts'@'localhost';
DROP USER IF EXISTS 'SueSmith'@'localhost';
DROP USER IF EXISTS 'PaulCruz'@'localhost';
DROP USER IF EXISTS 'BobSmith'@'localhost';
DROP USER IF EXISTS 'LarryFitch'@'localhost';
DROP USER IF EXISTS 'SamClark'@'localhost';

-- Eliminar roles
DROP ROLE IF EXISTS 'Venedor';
DROP ROLE IF EXISTS 'Director'; 
DROP ROLE IF EXISTS 'Gerent';

-- Desbloquear cuentas de usuario
ALTER USER 'DanRoberts'@'localhost' ACCOUNT UNLOCK;
ALTER USER 'SueSmith'@'localhost' ACCOUNT UNLOCK;
ALTER USER 'PaulCruz'@'localhost' ACCOUNT UNLOCK;
ALTER USER 'BobSmith'@'localhost' ACCOUNT UNLOCK;
ALTER USER 'LarryFitch'@'localhost' ACCOUNT UNLOCK;
ALTER USER 'SamClark'@'localhost' ACCOUNT UNLOCK;
