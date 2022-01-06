use Mantenimiento_DB;
go 
INSERT INTO Empresas(Nombre,email,Telefono,Dirección) 
VALUES ('Empresa1','Empresa1@gmail','+54116546465','Ctast 234'),
('Empresa2','Empresa2@gmail','+541165464651','Ctast 734'),
('Empresa3','Empresa3@gmail','+541161236465','Ctst 214'),
('Empresa4','Empresa4@gmail','+541162312345','Cst 230');
go
INSERT INTO Facturas(Id_empresa,Fecha_emisión, Fecha_pago,Total_pagar) 
VALUES (1,'2021-06-02','2021-06-02',100),
(2,'2021-06-02',null,100),
(3,'2021-06-02','2021-10-02',300),
(4,'2021-06-02','2021-06-02',200),
(1,'2021-06-02',null,100.2),
(2,'2021-06-02','2021-10-02',150),
(2,'2021-06-02','2021-10-02',100);
go
INSERT INTO Categorias(Nombre) 
VALUES ('Reparaciones'),
('Reemplazos');
go
INSERT INTO Trabajos_Estandar(Descripción,Precio_asociado,Id_categoria) 
VALUES ('reparacion 1',100,1),
('reparacion 2',120,1),
('reemplazo equipo 1',130,2),
('reemplazo equipo 1',140,2);
go
INSERT INTO Detalle_matenimiento(Descripción,Cantidad,Id_empresa,Id_trabajo,Id_factura) 
VALUES ('Reparaciones1',4,1,3,1),
('Reemplazos1',4,1,3,null),
('Reparaciones2',4,1,3,1),
('Reparaciones3',4,1,3,null),
('Reemplazos2',4,1,3,2),
('Reemplazos3',4,1,3,3),
('Reemplazos5',4,1,3,4),
('Reemplazos2',4,1,3,5),
('Reemplazos2',4,1,3,6),
('Reemplazos2',4,1,3,7);