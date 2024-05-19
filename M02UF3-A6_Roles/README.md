# Creació d'un sistema de gestió de base de dades amb usuaris, rols i permisos en MySQL

## Crear usuaris

En primer lloc, crearem els usuaris que seran de tipus "venedor", "director" i "gerent" amb les següents dades:

- Tres dels usuaris venedor de la taula venedors: contrasenya "P@ssw0rd1", política de canvis de contrasenya cada 60 dies, 3 intents fallits de connexió abans de bloquejar el compte durant 5 dies.
- Dos dels usuaris director de la taula venedors: contrasenya "P@ssw0rd2", l’usuari haurà de canviar la contrasenya la primera vegada que accedeixi al seu compte dins del servidor, 2 intents fallits de connexió abans de bloquejar el compte durant 3 dies.
- L’usuari que és gerent: contrasenya "P@ssw0rd3", sense política de canvi de contrasenya, 2 intents fallits de connexió abans de bloquejar el compte durant 1 dia.

## Crear rols i assignar privilegis

Després de crear els usuaris, crearem tres rols amb els noms "venedor", "director" i "gerent".

A continuació, assignarem els següents privilegis als rols:

- Venedor: SELECT, INSERT i UPDATE a la taula "comandes" i “detall” i només SELECT a “clients”.
- Director: SELECT, UPDATE, DELETE, DROP i ALTER a qualsevol taula de la BBDD.
- Gerent: tots els privilegis a qualsevol taula de la BBDD.

## Assignar rols als usuaris

Després d'assignar els privilegis als rols, assignarem els següents rols als usuaris:

- Als usuaris venedors que hem creat: rol de ‘venedor’.
- Als usuaris directors que hem creat: rol de ‘director’ i de ‘venedor’.
- A l’usuari gerent que hem creat: rol de ‘gerent’ i de ‘director’.

## Provar els permisos

Finalment, provarem els permisos en cada tipus d'usuari per assegurar-nos que els permisos es van assignar correctament. Per exemple, intentarem executar les següents comandes SQL:

- Usuari tipus venedor: SELECT, INSERT i UPDATE a la taula "comandes" i “detall”, SELECT i INSERT a la taula "productes".
- Usuari tipus director: SELECT i DELETE a la taula "venedors", SELECT, INSERT i DELETE a la taula "comandes".
- Usuari tipus gerent (el seu codi ??): SELECT i DELETE a la taula "venedors", “comandes” i creació d’una nova taula de nom ‘gerencia’.

Les proves estaran dins d’un script (un per a cada rol) per què es puguin executar consecutivament després de carregar-lo amb un SOURCE, segons el tipus d’usuari i es guardarà cada sortida en un arxiu independent de noms: venedor.txt, director.txt i gerent.txt.

## Per últim:

Crearem un nou usuari de nom ‘profe’ que haurà de tenir directament assignat el role de ‘gerent’. El provarem de crear des de l’usuari amb rol ‘gerent i des de l’usuari “root”.

Per obtenir les sortides podem fer servir pager i tee.

El podeu consultar en: [operatiu.es](https://operatiu.es/2024/05/18/mysql-scripts-dentrada-i-sortida/)
