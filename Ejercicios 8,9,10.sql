use Mantenimiento_DB;
--Ej 8
SELECT 
	SUM(Total_pagar) AS suma_impagos 
FROM Facturas 
	WHERE Fecha_pago is null;

--Ej 9

SELECT
	DISTINCT Id_empresa, 
	Empresas.Nombre AS Nombre 
FROM Facturas
	inner join Empresas ON Empresas.id=Facturas.Id_empresa
	WHERE Id_empresa not in
		(SELECT Id_empresa 
		FROM Facturas 
		WHERE Fecha_pago is null);

--Ej 10 (Se tomo Id_empresa=2 y fecha 2021-05-02 como ejemplo)
SELECT 
	Empresas.Nombre AS Empresa, 
	SUM(Total_pagar) AS Total_pagado 
FROM Facturas 
	inner join Empresas ON Empresas.id=Facturas.Id_empresa
	WHERE Fecha_pago is not null AND Id_empresa=2 AND Fecha_pago>'2021-05-02'
	GROUP BY Empresas.Nombre;