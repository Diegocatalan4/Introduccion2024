-- DDL DATA DEFINITION LANGUAGE
-- Crear base de datos.
CREATE DATABASE Ventas;
USE Ventas;
-- crea tabla

CREATE TABLE Cabecera_factura ( 
numero VARCHAR (20) PRIMARY KEY,
fecha DATETIME NOT NULL,
Codigo_cliente int not null
);

INSERT INTO Cabecera_factrura (numero,fecha,codigo_cliente)
	        VALUES (4755863, 2024-05-06,1000025);

CREATE TABLE Detalle_factura (
Numero_factura VARCHAR (20) NOT NULL,
Linea INT NOT NULL,
Codigo_producto INT NOT NULL, 
Cantidad decimal (10,2) NOT NULL, 
Precio decimal (10,2) NOT NULL, 
Total decimal (10,2) NOT NULL
);

INSERT INTO Detalle_factura (Numero_factura,Linea,Codigo_producto,Cantidad,Precio,Total)
			VALUES (17548-4,4,100052,300,105,400);

CREATE TABLE Producto (
Codigo INT NOT NULL PRIMARY KEY,
Nombre VARCHAR (100) NOT NULL,
Precio_actual decimal(10,2) NOT NULL
);

INSERT INTO Producto (Codigo, Nombre, Precio_actual)
		   VALUES (42873, Fernanda, 200);

CREATE TABLE Cliente (
Codigo INT NOT NULL PRIMARY KEY,
Primer_nombre VARCHAR (100) NOT NULL, 
Primer_apellido VARCHAR (100) NOT NULL, 
Direccion VARCHAR (100) NULL,
NIT VARCHAR (20) NOT NULL
);
INSERT INTO Cliente (Codigo,Primer_nombre, Primer_apellido, Direccion, Nit)
		    VALUES (25386, Jasson, Garcia, Guatemala,22578-1);

ALTER TABLE Cabecera_factura ADD CONSTRAINT FK_FACTURA_CLIENTE FOREIGN KEY
(Codigo_Cliente)  REFERENCES Cliente (Codigo);

ALTER TABLE Detalle_factura ADD CONSTRAINT  FK_DETALLE_FACTURA_PRODUCTO FOREIGN KEY 
(Codigo_producto) REFERENCES Producto (Codigo);

ALTER TABLE Detalle_factura ADD CONSTRAINT  FK_DETALLE_ENCABEZADO_FACTURA FOREIGN KEY
(Numero_factura)  REFERENCES Cabecera_factura(numero);

ALTER TABLE Detalle_factura ADD CONSTRAINT PK_DETALLE_FACTURA PRIMARY KEY
(Numero_factura,linea)





            





