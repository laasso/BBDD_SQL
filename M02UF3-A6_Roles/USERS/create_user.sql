USE mysql;

-- Crear los usuarios vendedor
CREATE USER 'DanRoberts'@'localhost' IDENTIFIED BY 'P@ssw0rd1' PASSWORD EXPIRE INTERVAL 60 DAY FAILED_LOGIN_ATTEMPTS 3;
CREATE USER 'SueSmith'@'localhost' IDENTIFIED BY 'P@ssw0rd1' PASSWORD EXPIRE INTERVAL 60 DAY FAILED_LOGIN_ATTEMPTS 3;
CREATE USER 'PaulCruz'@'localhost' IDENTIFIED BY 'P@ssw0rd1' PASSWORD EXPIRE INTERVAL 60 DAY FAILED_LOGIN_ATTEMPTS 3;

-- Crear los usuarios director
CREATE USER 'BobSmith'@'localhost' IDENTIFIED BY 'P@ssw0rd2' PASSWORD EXPIRE INTERVAL 1 DAY FAILED_LOGIN_ATTEMPTS 2 ACCOUNT LOCK;
CREATE USER 'LarryFitch'@'localhost' IDENTIFIED BY 'P@ssw0rd2' PASSWORD EXPIRE INTERVAL 1 DAY FAILED_LOGIN_ATTEMPTS 2 ACCOUNT LOCK;

-- Crear el usuario gerente
CREATE USER 'SamClark'@'localhost' IDENTIFIED BY 'P@ssw0rd3' FAILED_LOGIN_ATTEMPTS 2 ACCOUNT LOCK;

-- Mostrar informació dels usuarios creats per comprovar el correcte funcionament
SELECT *
FROM mysql.user
WHERE user IN ('DanRoberts', 'SueSmith', 'PaulCruz', 'BobSmith', 'LarryFitch', 'SamClark');