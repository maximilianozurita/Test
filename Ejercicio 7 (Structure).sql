CREATE DATABASE Mantenimiento_DB
GO
USE Mantenimiento_DB;
GO
CREATE TABLE Empresas(
id INT not null PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50) not null,
email VARCHAR (60) not null UNIQUE,
Telefono VARCHAR(20) null,
Dirección VARCHAR(100) not null,
Estado BIT DEFAULT(1),
)
GO
CREATE TABLE Facturas(
id INT not null PRIMARY KEY IDENTITY(1,1),
Id_empresa INT FOREIGN KEY REFERENCES Empresas(id),
Fecha_emisión DATE DEFAULT(GETDATE()),
Fecha_pago DATE DEFAULT (null),
Total_pagar DECIMAL,
Estado BIT DEFAULT(1),
)
GO
CREATE TABLE Categorias(
id INT not null PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50) not null,
Estado BIT DEFAULT(1),
)
GO
CREATE TABLE Trabajos_Estandar(
id INT not null PRIMARY KEY IDENTITY(1,1),
Descripción VARCHAR(50) not null,
Precio_asociado DECIMAL,
Id_categoria INT FOREIGN KEY REFERENCES Categorias(id),
Estado BIT DEFAULT(1),
)
GO
CREATE TABLE Detalle_matenimiento(
id INT not null PRIMARY KEY IDENTITY(1,1),
Descripción VARCHAR(50) not null,
Cantidad INT,
Id_empresa INT FOREIGN KEY REFERENCES Empresas(id),
Id_trabajo INT FOREIGN KEY REFERENCES Trabajos_Estandar(id),
Id_factura INT FOREIGN KEY REFERENCES Facturas(id),
Estado BIT DEFAULT(1),
)