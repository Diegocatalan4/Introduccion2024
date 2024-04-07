-- comandos DDL data definition lenguage
-- crear base de datos
CREATE database escuela;
-- borrar base de datos
DROP database alumno;
-- indicar que base de datos usar
USE escuela;
-- crear tabla
CREATE TABLE alumno (
	carnet varchar(20) NOT NULL,
    primer_nombre VARCHAR(150) NOT NULL,
    primer_apellido VARCHAR(150) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    genero VARCHAR(150) NULL,
    telefono VARCHAR(10) NOT NULL,
    correo_electronico VARCHAR(120)
    );
    
    -- borrar tabla
    DROP TABLE alumno;
    
    -- COMANDOS DML Data Manipulatio Lenguage
    
    -- INSERT para insertar datos
    INSERT INTO alumno(carnet,
    primer_nombre,
    primer_apellido,
    fecha_nacimiento,
    genero,
    telefono,
    correo_electronico)
    values (
    '0907-24-16823', 'Angel', 'Mejia', '2004-01-01','Masculino', '40301921', 'amejia@miumg.edu.gt'
    );
       INSERT INTO alumno(carnet,
    primer_nombre,
    primer_apellido,
    fecha_nacimiento,
    genero,
    telefono,
    correo_electronico)
    values (
    '0907-24-76543', 'Diego', 'Catalan', '1999-01-01','Masculino', '12983719', 'Cdiego@miumg.edu.gt'
    ),
    (
    '0907-24-7656746', 'Jonatan', 'figueroa', '2005-01-01','Masculino', '8374929', 'Jfigueroa@miumg.edu.gt'
    ),
    (
    '0907-24-787823', 'Jasson', 'Garcia', '2003-01-01','Masculino', '8739843', 'Jgarcia@miumg.edu.gt'
    );
    -- hacer una consulta
    SELECT * FROM alumno;
    -- Eliminar los datos de una tabla
	truncate table alumno;
    -- agregar llave primaria
    ALTER TABLE alumno ADD PRIMARY KEY (carnet);
    -- hacer una consulta desde un campo
    SELECT carnet, primer_nombre, primer_apellido FROM alumno;
    -- Buscar entre registros
    SELECT carnet, primer_nombre, primer_apellido 
    FROM alumno
    WHERE primer_nombre = 'Jasson';
    -- buscar con el inicio de un dato
    SELECT carnet, primer_nombre, primer_apellido 
    FROM alumno
    WHERE primer_apellido like ('ga%');
       -- buscar con el final de un dato
    SELECT carnet, primer_nombre, primer_apellido 
    FROM alumno
    WHERE primer_apellido like ('%a');
    -- Actualizar datos
    UPDATE alumno 
		SET telefono = '30425663'
        WHERE carnet = '0907-24-787823';
	UPDATE alumno 
		SET telefono = '30425663'
        WHERE primer_apellido like ('g%');
	-- Eliminar un dato
    DELETE FROM alumno
    WHERE carnet = '0907-24-787823';
    -- con where se pueden usar los condicionales (=), diferente (<>), Mayor que (>), Menor que (<)
    
    CREATE TABLE notas(
    carnet VARCHAR(20) NOT NULL,
    clase VARCHAR(100) NOT NULL,
    parcial int,
    nota int);
    INSERT INTO notas (carnet, clase, parcial, nota)
		VALUES ('0907-24-76543', 'introduccion', 1, 15),
				('0907-24-787823', 'introduccion', 2, 10),
                ('0907-24-7656746', 'introduccion', 1, 14);
		SELECT * from notas WHERE nota >= 11;  
                