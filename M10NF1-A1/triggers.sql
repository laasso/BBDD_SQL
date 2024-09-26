USE vk21;

-- Trigger para insertar en detall
DROP TRIGGER IF EXISTS actualiza_stock_insert;
DELIMITER $$

CREATE TRIGGER actualiza_stock_insert
AFTER INSERT ON detall
FOR EACH ROW
BEGIN
    -- Ajustar el stock del producto en función de la cantidad insertada
    UPDATE productes
    SET stock = stock - NEW.quantitat
    WHERE id_producte = NEW.producte AND id_fab = NEW.fab;
END$$

DELIMITER ;

-- Trigger para actualizar en detall
DROP TRIGGER IF EXISTS actualiza_stock_update;
DELIMITER $$

CREATE TRIGGER actualiza_stock_update
AFTER UPDATE ON detall
FOR EACH ROW
BEGIN
    -- Si se cambia la cantidad del mismo producto
    IF OLD.producte = NEW.producte AND OLD.fab = NEW.fab THEN
        UPDATE productes
        SET stock = stock - (NEW.quantitat - OLD.quantitat)
        WHERE id_producte = NEW.producte AND id_fab = NEW.fab;
    ELSE
        -- Si se cambia el producto o el fabricante
        -- Reponer el stock del producto antiguo
        UPDATE productes
        SET stock = stock + OLD.quantitat
        WHERE id_producte = OLD.producte AND id_fab = OLD.fab;

        -- Reducir el stock del nuevo producto
        UPDATE productes
        SET stock = stock - NEW.quantitat
        WHERE id_producte = NEW.producte AND id_fab = NEW.fab;
    END IF;
END $$

DELIMITER ;

-- Trigger para eliminar en detall
DROP TRIGGER IF EXISTS actualiza_stock_delete;
DELIMITER $$

CREATE TRIGGER actualiza_stock_delete
AFTER DELETE ON detall
FOR EACH ROW
BEGIN
    -- Reponer el stock al eliminar un detalle
    UPDATE productes
    SET stock = stock + OLD.quantitat
    WHERE id_producte = OLD.producte AND id_fab = OLD.fab;
END $$

DELIMITER ;
