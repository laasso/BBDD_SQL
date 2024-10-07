# Enunciat PLSQL amb la BBDD `agencia21`

Les taules que trobarem són:

- Aeroports
- Clients
- Escales
- Hotels
- Ofertes_Hotels
- Reserves_Hotels
- Reserves_Viatges
- Viatges
- Vols
- Vols_Viatges

La taula `Viatges` correspon a l'oferta d'Hotel i Vol que promociona l'agència de viatges i on ofereix una quantitat màxima de places (`N_Places`).

Ens interessa tenir actualitzada aquesta quantitat i per això, necessitarem que de cada nova reserva (insert) de la taula `Reserves_Viatges` actualitzi la quantitat reservada de la taula `Viatges`. Pel mateix motiu, no podrem registrar de cap manera un número de places (`N_Places`) en `Reserves_Viatges` superior al que s'ofereix en la taula `Viatges` i tampoc es podrà reservar si la data de sortida del viatge és igual o anterior al dia en què es vol reservar (la data actual).

**Nota:** Els errors que retornarà el trigger per aquestes restriccions seran:

```sql
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Error: Supera el límit de places";
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Error: El viatge està realitzat i no admet reserves";

DROP TRIGGER IF EXISTS before_insert_Reserves_Viatges;
DELIMITER //
CREATE TRIGGER before_insert_Reserves_Viatges
BEFORE INSERT ON Reserves_Viatges
FOR EACH ROW
BEGIN
  -- Aquí van les accions del trigger
END //
DELIMITER ;
DROP TRIGGER IF EXISTS after_insert_Reserves_Viatges;
DELIMITER //
CREATE TRIGGER after_insert_Reserves_Viatges
AFTER INSERT ON Reserves_Viatges
FOR EACH ROW
BEGIN
  UPDATE -- Aquí va l'actualització de les places reservades
END //
DELIMITER ;
```

Els triggers hauran de funcionar per a qualsevol esdeveniment de la taula `Reserves_Viatges` (INSERT / UPDATE / DELETE).
