DROP PROCEDURE IF EXISTS taules_buides;

delimiter //

CREATE PROCEDURE taules_buides()
  SQL SECURITY INVOKER
BEGIN
    DECLARE fet TINYINT(1) DEFAULT 0;
    DECLARE nom_taula VARCHAR(255);

    select table_name 
    from information_schema.tables
    where table_rows = 0
        and table_schema = DATABASE();


END //
delimiter ;
