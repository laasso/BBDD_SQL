### **Conceptos básicos**

1. **Procedimientos almacenados**: Son bloques de código SQL que se almacenan en la base de datos y se pueden ejecutar repetidamente. Permiten realizar operaciones complejas en la base de datos con lógica programada, como bucles, condicionales, y manejo de errores.
    
2. **Cursores**: Son herramientas que permiten recorrer fila por fila un conjunto de resultados en SQL. Se usan principalmente cuando necesitas procesar cada fila de forma individual en lugar de aplicar operaciones a todo el conjunto.
    

### Ejemplo con la BBBDD adn

### Creación del procedimiento

```sql
DELIMITER $$

CREATE PROCEDURE contar_nucleotidos (IN nucleotido CHAR(1))
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE seq_id INT;
    DECLARE seq_adn TEXT;
    DECLARE count_result INT;
    
    -- Cursor para recorrer las secuencias de ADN
    DECLARE cur CURSOR FOR 
        SELECT idgen, adn FROM adn;
    
    -- Manejo de fin del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    -- Abrir el cursor
    OPEN cur;
    
    read_loop: LOOP
        -- Leer cada fila
        FETCH cur INTO seq_id, seq_adn;
        
        -- Verificar si ya se ha recorrido todo
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Contar las apariciones del nucleótido
        SET count_result = (LENGTH(seq_adn) - LENGTH(REPLACE(seq_adn, nucleotido, '')));
        
        -- Mostrar el resultado
        SELECT CONCAT('Gen ID: ', seq_id, ', Nucleótido: ', nucleotido, ', Ocurrencias: ', count_result) AS resultado;
    END LOOP;
    
    -- Cerrar el cursor
    CLOSE cur;
END$$

DELIMITER ;
```

### Explicación

1. **Parámetro de entrada**: El procedimiento recibe un nucleótido como parámetro (`A`, `T`, `C`, o `G`).
2. **Cursor**: Recorre todas las secuencias de ADN (`adn`) en la tabla.
3. **Cálculo**: Usa la función `LENGTH` para contar cuántas veces aparece el nucleótido en cada secuencia.
4. **Manejo de errores**: Usa un controlador para finalizar el bucle cuando se hayan procesado todas las filas.

### Ejecución del procedimiento

Supongamos que quieres contar el número de apariciones del nucleótido `A`:

```sql
CALL contar_nucleotidos('A');
```

### Resultado esperado

El procedimiento devolverá un conjunto de resultados con la cantidad de veces que aparece el nucleótido `A` en cada gen, por ejemplo:

```
Gen ID: 1, Nucleótido: A, Ocurrencias: 5
Gen ID: 2, Nucleótido: A, Ocurrencias: 3
...
```

### **¿Qué son los cursores en SQL?**

Un **cursor** en SQL es una herramienta que te permite procesar fila por fila un conjunto de resultados de una consulta. Aunque en SQL normalmente se trabaja de forma "declarativa" (operaciones sobre conjuntos completos de datos), los cursores permiten trabajar de manera "procedimental", operando sobre una fila a la vez.

### ¿Cuándo usar un cursor?

- Cuando necesitas realizar una operación compleja en cada fila de un conjunto de resultados.
- Cuando no puedes usar operaciones SQL estándar como `UPDATE`, `INSERT` o `DELETE` sobre múltiples filas directamente.
- Cuando la lógica requiere recorrer datos de manera iterativa (como cálculos fila por fila o generación de resultados intermedios).

---

### Partes principales de un cursor

1. **Declaración del cursor**: Define qué conjunto de filas devolverá el cursor (mediante una consulta `SELECT`).
2. **Apertura del cursor (`OPEN`)**: Inicializa el cursor y prepara el conjunto de resultados.
3. **Lectura de datos (`FETCH`)**: Extrae una fila del cursor para procesarla.
4. **Cierre del cursor (`CLOSE`)**: Libera los recursos asociados al cursor.

---

### Ejemplo paso a paso con la base de datos `adn`

Vamos a crear un ejemplo donde el cursor recorra cada fila de la tabla `adn` y calcule la longitud de la secuencia de ADN (`adn`) y cuente cuántas veces aparece el nucleótido `G`. Los resultados se almacenarán en una tabla de auditoría llamada `adn_auditoria`.

---

#### Paso 1: Crear la tabla de auditoría

Primero, creamos una tabla para almacenar los resultados procesados.

```sql
CREATE TABLE adn_auditoria (
    idgen INT,
    nomgen VARCHAR(64),
    longitud_adn INT,
    nucleotido_g_count INT
);
```

---

#### Paso 2: Crear el procedimiento con cursor

El procedimiento recorrerá la tabla `adn`, calculará los datos necesarios y los insertará en la tabla `adn_auditoria`.

```sql
DELIMITER $$

CREATE PROCEDURE procesar_adn()
BEGIN
    -- Declaraciones
    DECLARE done INT DEFAULT 0;
    DECLARE seq_id INT;
    DECLARE seq_nom VARCHAR(64);
    DECLARE seq_adn TEXT;
    DECLARE longitud INT;
    DECLARE count_g INT;
    
    -- Cursor para recorrer la tabla `adn`
    DECLARE cur CURSOR FOR 
        SELECT idgen, nomgen, adn FROM adn;
    
    -- Manejador para el fin del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Abrir el cursor
    OPEN cur;

    read_loop: LOOP
        -- Extraer la siguiente fila
        FETCH cur INTO seq_id, seq_nom, seq_adn;

        -- Verificar si hemos terminado
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Calcular la longitud del ADN
        SET longitud = LENGTH(seq_adn);

        -- Contar cuántas veces aparece 'G'
        SET count_g = (LENGTH(seq_adn) - LENGTH(REPLACE(seq_adn, 'G', '')));

        -- Insertar los resultados en la tabla de auditoría
        INSERT INTO adn_auditoria (idgen, nomgen, longitud_adn, nucleotido_g_count)
        VALUES (seq_id, seq_nom, longitud, count_g);
    END LOOP;

    -- Cerrar el cursor
    CLOSE cur;
END$$

DELIMITER ;
```

---

#### Paso 3: Ejecutar el procedimiento

Ahora puedes llamar al procedimiento para que procese las secuencias de ADN.

```sql
CALL procesar_adn();
```

---

#### Paso 4: Ver los resultados

Después de ejecutar el procedimiento, puedes ver los resultados almacenados en la tabla `adn_auditoria`:

```sql
SELECT * FROM adn_auditoria;
```

---

### Explicación del flujo

1. **Declaración del cursor**: Se define el cursor con la consulta `SELECT idgen, nomgen, adn FROM adn`.
2. **Bucle (`LOOP`)**:
    - Se lee cada fila con `FETCH cur INTO`.
    - Se realizan los cálculos necesarios: longitud de ADN y conteo de `G`.
    - Los resultados se insertan en la tabla `adn_auditoria`.
3. **Manejo de errores**:
    - El manejador `CONTINUE HANDLER FOR NOT FOUND` asegura que se salga del bucle cuando no haya más filas.
4. **Cierre del cursor**: Libera los recursos asociados al cursor con `CLOSE cur`.

---

En un cursor estándar, las filas se **extraen una a una**, en el orden en que se obtienen de la consulta `SELECT` asociada al cursor. No puedes extraer directamente una fila específica al momento de abrir el cursor, ya que este opera como un puntero que avanza fila por fila.

### Flujo básico del cursor

1. El cursor devuelve todas las filas que cumplen la condición del `SELECT`.
2. Con cada operación `FETCH`, se extrae la **siguiente fila** de los resultados, moviendo el puntero hacia adelante.
3. Si necesitas trabajar con una fila específica, debes incluir una **condición en la consulta del cursor** (`WHERE`) antes de abrirlo.

---

### ¿Cómo trabajar con filas específicas?

#### Opción 1: Filtrar las filas en el `DECLARE CURSOR`

Si sabes que solo necesitas filas específicas, usa un `WHERE` en la definición del cursor para limitar el conjunto de datos. Ejemplo:

```sql
DECLARE cur CURSOR FOR 
    SELECT idgen, nomgen, adn 
    FROM adn 
    WHERE idgen = 5; -- Solo selecciona la fila con idgen = 5
```

Cuando uses este cursor, solo procesará las filas que cumplan con esa condición.

---

#### Opción 2: Usar lógica condicional dentro del bucle

Si el conjunto de datos que necesitas es amplio, pero quieres realizar operaciones solo sobre filas específicas, puedes usar un `IF` dentro del bucle para filtrar filas. Ejemplo:

```sql
DECLARE cur CURSOR FOR 
    SELECT idgen, nomgen, adn 
    FROM adn; -- Selecciona todas las filas

read_loop: LOOP
    FETCH cur INTO seq_id, seq_nom, seq_adn;

    IF done THEN
        LEAVE read_loop;
    END IF;

    -- Filtrar por condiciones específicas
    IF seq_id = 5 THEN
        -- Operaciones específicas para la fila con idgen = 5
        INSERT INTO adn_auditoria (idgen, nomgen, longitud_adn, nucleotido_g_count)
        VALUES (seq_id, seq_nom, LENGTH(seq_adn), 
                LENGTH(seq_adn) - LENGTH(REPLACE(seq_adn, 'G', '')));
    END IF;
END LOOP;
```

En este caso, aunque el cursor procesa todas las filas, el código solo ejecuta las operaciones sobre las filas que cumplen con `seq_id = 5`.

---

#### Opción 3: Usar múltiples cursores

Si necesitas trabajar con varias filas específicas, pero de forma separada, puedes abrir varios cursores, cada uno con su propia condición. Ejemplo:

```sql
DECLARE cur1 CURSOR FOR 
    SELECT idgen, nomgen, adn 
    FROM adn 
    WHERE idgen = 1;

DECLARE cur2 CURSOR FOR 
    SELECT idgen, nomgen, adn 
    FROM adn 
    WHERE idgen = 2;

-- Procesar el primer cursor
OPEN cur1;
FETCH cur1 INTO seq_id, seq_nom, seq_adn;
-- Procesa los datos de la fila con idgen = 1
CLOSE cur1;

-- Procesar el segundo cursor
OPEN cur2;
FETCH cur2 INTO seq_id, seq_nom, seq_adn;
-- Procesa los datos de la fila con idgen = 2
CLOSE cur2;
```

Este enfoque es útil si tienes que trabajar de manera independiente con diferentes filas específicas.

---

### ¿Por qué usar un cursor aquí?

Un cursor es útil en este caso porque necesitamos procesar cada secuencia de ADN de manera individual y realizar cálculos específicos para cada fila. Aunque este problema podría resolverse con una sola consulta SQL utilizando funciones agregadas, el uso de cursores permite lógica más compleja y flexible.


### Resumen

- **Por defecto**: Los cursores extraen las filas **en orden**, una a una.
- **Para filas específicas**:
    - Filtra las filas con un `WHERE` en la consulta del cursor.
    - Usa condiciones dentro del bucle (`IF`) para decidir si procesar una fila.
    - Abre múltiples cursores con diferentes condiciones, si es necesario.

