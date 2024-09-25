-- Creación de los triggers para mantener actualizado el stock en la tabla `productes`.

-- Trigger para controlar las inserciones en la tabla `detall`
DELIMITER $$
CREATE TRIGGER actualiza_stock_insert 
AFTER INSERT ON detall
FOR EACH ROW
BEGIN
  DECLARE stock_actual INT;

  -- Obtenemos el stock actual del producto
  SELECT stock INTO stock_actual FROM productes WHERE num_prod = NEW.num_prod;

  -- Si la cantidad comprada excede el stock disponible, ajustamos la cantidad
  IF NEW.unitats > stock_actual THEN
    -- Ajustamos la cantidad al stock disponible
    SET NEW.unitats = stock_actual;
  END IF;

  -- Actualizamos el stock restando las unidades compradas
  UPDATE productes 
  SET stock = stock - NEW.unitats 
  WHERE num_prod = NEW.num_prod;
END $$
DELIMITER ;

-- Trigger para controlar las actualizaciones en la tabla `detall`
DELIMITER $$
CREATE TRIGGER actualiza_stock_update 
AFTER UPDATE ON detall
FOR EACH ROW
BEGIN
  DECLARE stock_actual INT;
  DECLARE diferencia INT;

  -- Obtenemos el stock actual del producto
  SELECT stock INTO stock_actual FROM productes WHERE num_prod = NEW.num_prod;

  -- Calculamos la diferencia entre la nueva cantidad y la cantidad anterior
  SET diferencia = NEW.unitats - OLD.unitats;

  -- Si la nueva cantidad excede el stock disponible, ajustamos la cantidad
  IF diferencia > stock_actual THEN
    SET NEW.unitats = OLD.unitats + stock_actual;
    SET diferencia = stock_actual;
  END IF;

  -- Actualizamos el stock en función de la diferencia de unidades
  UPDATE productes 
  SET stock = stock - diferencia 
  WHERE num_prod = NEW.num_prod;
END $$
DELIMITER ;

-- Trigger para controlar las eliminaciones en la tabla `detall`
DELIMITER $$
CREATE TRIGGER actualiza_stock_delete 
AFTER DELETE ON detall
FOR EACH ROW
BEGIN
  -- Cuando se elimina un pedido, devolvemos el stock al almacén
  UPDATE productes 
  SET stock = stock + OLD.unitats 
  WHERE num_prod = OLD.num_prod;
END $$
DELIMITER ;

-- Fin de la creación de triggers.