SELECT * FROM productes WHERE id_producte="41001" AND id_fab="aci";

INSERT INTO comandes VALUES('113240', 'Joc de proves', '2024-09-25', 2111, 105, 21, 0);

INSERT INTO detall(num_comanda,fab, producte, quantitat, preu) VALUES('113240','aci', '41001', 10, 82.50);

SELECT * FROM detall WHERE num_comanda='113240';

SELECT * FROM productes WHERE id_producte="41001" AND id_fab="aci";

UPDATE detall SET quantitat=15 WHERE num_comanda='113240';

SELECT * FROM detall WHERE num_comanda='113240';

SELECT * FROM productes WHERE id_producte="41001" AND id_fab="aci";

SELECT * FROM productes WHERE id_producte="41001" AND id_fab="bio";

UPDATE detall SET fab='bio', preu=30.00 WHERE num_comanda='113240';

SELECT * FROM detall WHERE num_comanda='113240';

SELECT * FROM productes WHERE id_producte="41001" AND id_fab="aci";

SELECT * FROM productes WHERE id_producte="41001" AND id_fab="bio";

DELETE FROM detall WHERE num_comanda='113240';

SELECT * FROM detall WHERE num_comanda='113240';

SELECT * FROM productes WHERE id_producte="41001" AND id_fab="bio";