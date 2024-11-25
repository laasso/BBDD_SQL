DELIMITER //

CREATE PROCEDURE ShowColumnsAndTypes(IN table_name VARCHAR(255), IN db_name VARCHAR(255))
BEGIN
    -- Declaración de variables
    DECLARE col_name VARCHAR(255);
    DECLARE data_type VARCHAR(255);
    DECLARE done INT DEFAULT 0;

    -- Declaración del cursor
    DECLARE column_cursor CURSOR FOR
        SELECT COLUMN_NAME, DATA_TYPE
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = db_name AND TABLE_NAME = table_name;

    -- Manejo del final del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Abrir el cursor
    OPEN column_cursor;

    -- Iterar sobre las columnas
    read_loop: LOOP
        FETCH column_cursor INTO col_name, data_type;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Mostrar cada columna con su tipo
        SELECT CONCAT('Columna: ', col_name, ' - Tipo: ', data_type) AS Column_Info;
    END LOOP;

    -- Cerrar el cursor
    CLOSE column_cursor;
END //

DELIMITER ;

