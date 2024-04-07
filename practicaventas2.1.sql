CREATE DATABASE practica;
USE practica;

CREATE TABLE Cabecera_factura ( 
numero VARCHAR (20) PRIMARY KEY,
fecha DATETIME NOT NULL,
Codigo_cliente int not null
);

CREATE TABLE Detalle_factura (
Numero_factura VARCHAR (20) NOT NULL,
Linea INT NOT NULL,
Codigo_producto INT NOT NULL, 
Cantidad decimal (10,2) NOT NULL, 
Precio decimal (10,2) NOT NULL, 
Total decimal (10,2) NOT NULL
);

CREATE TABLE Producto (
Codigo INT NOT NULL PRIMARY KEY,
Nombre VARCHAR (100) NOT NULL,
Precio_actual decimal(10,2) NOT NULL
);

CREATE TABLE Cliente (
Codigo INT NOT NULL PRIMARY KEY,
Primer_nombre VARCHAR (100) NOT NULL, 
Primer_apellido VARCHAR (100) NOT NULL, 
Direccion VARCHAR (100) NULL,
NIT VARCHAR (20) NOT NULL
);

ALTER TABLE Cabecera_factura ADD CONSTRAINT FK_FACTURA_CLIENTE FOREIGN KEY
(Codigo_Cliente)  REFERENCES Cliente (Codigo);

ALTER TABLE Detalle_factura ADD CONSTRAINT  FK_DETALLE_FACTURA_PRODUCTO FOREIGN KEY 
(Codigo_producto) REFERENCES Producto (Codigo);

ALTER TABLE Detalle_factura ADD CONSTRAINT  FK_DETALLE_ENCABEZADO_FACTURA FOREIGN KEY
(Numero_factura)  REFERENCES Cabecera_factura(numero);

ALTER TABLE Detalle_factura ADD CONSTRAINT PK_DETALLE_FACTURA PRIMARY KEY
(Numero_factura,linea);

INSERT INTO producto (codigo, nombre, precio_actual)
             VALUES  (12, 'Producto 1', 14.75),
                     (13, 'Producto 2', 15.75),
					 (14, 'Producto 3', 20.50);
                  
    INSERT INTO cliente (codigo, primer_nombre, primer_apellido, direccion, nit)
            VALUES          (1, 'Jasson', 'Torres', 'Cton. Calvario', '145352-5'),
				            (2, 'Saul', 'Silvestre', 'Aldea. Gonzalez', '225863-4');
INSERT INTO cabecera_factura (numero, fecha, codigo_cliente)
			VALUES        ('A003', '2024-04-06', 1),
                          ('A004', '2024-04-06', 2);
	SELECT * FROM detalle_factura;
  INSERT INTO detalle_factura (numero_factura, linea, codigo_producto, cantidad, precio, total)
VALUES
    ('A003', 1, 12, 11, 17.00, 18.00),
    ('A004', 1, 13, 12, 16.00, 19.00);
                          
    SELECT cf.numero AS Numero_Factura, p.nombre AS Nombre_Producto, df.cantidad, df.precio, df.total
FROM cabecera_factura cf
INNER JOIN detalle_factura df ON cf.numero = df.numero_factura
INNER JOIN producto p ON df.codigo_producto = p.codigo
WHERE cf.numero = 'a003';
SELECT cf.numero AS Numero_Factura, c.primer_nombre AS Nombre_Cliente, c.primer_apellido AS Apellido_Cliente
FROM cabecera_factura cf
INNER JOIN cliente c ON cf.codigo_cliente = c.codigo;

