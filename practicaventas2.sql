USE ventas;

CREATE TABLE cabecera_factura (
    numero varchar(20) primary key,
    fecha datetime not null,
    codigo_cliente int not null
);

CREATE TABLE detalle_factura(
    numero_factura varchar(20) not null,
    linea int not null,
    codigo_producto int not null,
    cantidad decimal(10,2) not null,
    precio decimal(10,2) not null,
    total decimal(10,2) not null
);

CREATE TABLE producto(
    codigo int not null primary key,
    nombre varchar(100) not null,
    precio_actual decimal(10,2) not null
);

CREATE TABLE cliente(
    codigo int not null primary key,
    primer_nombre varchar(100) not null,
    primer_apellido varchar(100) not null,
    direccion varchar(100) null,
    nit varchar(20) not null
);

ALTER TABLE cabecera_factura ADD CONSTRAINT FK_FACTURA_CLIENTE FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo);
ALTER TABLE detalle_factura ADD CONSTRAINT FK_DETALLE_FACTURA_PRODUCTO FOREIGN KEY (codigo_producto) REFERENCES producto(codigo);
ALTER TABLE detalle_factura ADD CONSTRAINT FK_DETALLE_ENCABEZADO_FACTURA FOREIGN KEY (numero_factura) REFERENCES cabecera_factura(numero);
ALTER TABLE detalle_factura ADD CONSTRAINT PK_DETALLE_FACTURA PRIMARY KEY (numero_factura,linea);
INSERT INTO producto (codigo, nombre, precio_actual)
VALUES
    (1, 'Producto 1', 10.50),
    (2, 'Producto 2', 15.75),
    (3, 'Producto 3', 20.00);
    INSERT INTO cliente (codigo, primer_nombre, primer_apellido, direccion, nit)
VALUES
    (1, 'Karina', 'Sanchez', 'Bo. El Porvenir', '1234'),
    (2, 'DIego', 'Catalan', 'Col. Los Encinos', '9876');
INSERT INTO cabecera_factura (numero, fecha, codigo_cliente)
VALUES
    ('F001', '2024-04-01', 1),
    ('F002', '2024-04-02', 2);
    INSERT INTO detalle_factura (numero_factura, linea, codigo_producto, cantidad, precio, total)
VALUES
    ('F001', 1, 1, 2, 10, 21),
    ('F001', 2, 2, 1, 15, 15),
    ('F002', 1, 3, 3, 20, 60);
    SELECT cf.numero AS Numero_Factura, p.nombre AS Nombre_Producto, df.cantidad, df.precio, df.total
FROM cabecera_factura cf
INNER JOIN detalle_factura df ON cf.numero = df.numero_factura
INNER JOIN producto p ON df.codigo_producto = p.codigo
WHERE cf.numero = 'F001';
SELECT cf.numero AS Numero_Factura, c.primer_nombre AS Nombre_Cliente, c.primer_apellido AS Apellido_Cliente
FROM cabecera_factura cf
INNER JOIN cliente c ON cf.codigo_cliente = c.codigo;

INSERT INTO cabecera_factura (numero, fecha, codigo_cliente)
						values('3234234', '2024-04-06', '1'),
							  ('32233424', '2024-04-06', '1'),
                              ('3235644', '2024-04-06', '2'),
							  ('325867424', '2024-04-06', '2');
INSERT INTO detalle_factura (numero_factura, linea, codigo_producto, cantidad, precio, total)
							values('3234234', '1', 1, 1, 10.50, 10.50),
                                  ('32233424', '1', 1, 1, 10.50, 10.50);

SELECT detalle_factura.numero_factura, producto.nombre FROM	 detalle_factura 
JOIN producto on detalle_factura.codigo_producto = producto.codigo;

SELECT cf.numero AS Numero_Factura, c.primer_nombre AS Nombre_Cliente
FROM cabecera_factura cf
JOIN cliente c ON cf.codigo_cliente = c.codigo;

SELECT cf.numero AS Numero_Factura, c.codigo AS Codigo_Cliente
FROM cabecera_factura cf
JOIN cliente c ON cf.codigo_cliente = c.codigo;
						
select cabecera_factura.numero, cliente.primer_nombre, cliente.primer_apellido
	from cabecera_factura
    join cliente on cabecera_factura.codigo_cliente = cliente.codigo
    where cabecera_factura.numero = '32233424';