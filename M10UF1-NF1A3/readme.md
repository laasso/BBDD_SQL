# Triggers InstaDB

Trigger que analitza els inserts en la taula photouser i les paraules precedides per # en la columna `descripcio` i que insertarà a la taula tagphoto amb identificador de photo i usuari. Tants registres com tags tingui una mateixa fotografia d'un mateix usuari.

Trigger que fa el mateix que el cas anterior, però pels UPDATE de la taula photouser i que canvia a la taula tagphoto.
