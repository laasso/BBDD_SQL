#!/bin/bash

# Executa les proves per a l'usuari venedor
mysql -u Venedor1 -p'P@ssw0rd1' < ./venedor.sql > ./venedor.txt

# Executa les proves per a l'usuari director
mysql -u Director1 -p'P@ssw0rd2' < ./director.sql > ./director.txt

# Executa les proves per a l'usuari gerent
mysql -u Gerent -p'P@ssw0rd3' < ./gerent.sql > ./gerent.txt

echo "Proves completades."
