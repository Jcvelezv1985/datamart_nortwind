use Northwind
go

/* TABLA PRODUCTO */
SELECT *
FROM Producto;

SELECT *
FROM Categoria;

SELECT P.nombre AS Producto,c.nombre AS Categoria
FROM Producto AS P
INNER JOIN Categoria AS C
ON C.categoriaID = P.categoriaID;

/* TABLA CLIENTE */
SELECT *
FROM Cliente;

SELECT C.ContactName AS Nombre,C.City AS Ciudad,C.Country AS Pais
FROM Cliente AS C;

/* TABLA PROVEEDOR */

SELECT *
FROM Cliente ;

SELECT C.CompanyName AS NombreCompañia,C.Country AS Pais
FROM Cliente AS C;

/* TABLA EMPLEADOS*/

SELECT *
FROM Empleado;

SELECT E.LastName AS Apellido, E.ReportsTo AS Informe
FROM Empleado AS E
WHERE E.ReportsTo IS NOT NULL;

/* TABLA TIEMPO */

SELECT *
FROM DetalleOrden;

SELECT CONVERT(date,O.fecha) AS Fecha,CONVERT(int,DATEPART(YEAR,O.fecha)) AS Anio,CONVERT(int,DATEPART(QUARTER,O.fecha)) AS Trimestre,CONVERT(INT,DATEPART(MONTH,O.fecha)) AS Mes,CONVERT(INT,DATEPART(DAY,O.fecha)) AS Dia
FROM Orden AS O;

/* ORDEN*/

SELECT BDNM_P.Id AS ProductoId, BDNM_C.Id AS ClienteId, BDNM_E.Id AS EmpleadoId, BDNM_T.Id AS TiempoId, BDNM_PR.Id AS ProveedorId,
(BDNW_P.UnitPrice*BDNW_P.QuantityPerUnit) AS TotalPrecio, BDNW_P.QuantityPerUnit AS Cantidad
FROM Producto AS BDNW_P
INNER JOIN Categoria AS BDNW_Ca
ON BDNW_P.categoriaID = BDNW_Ca.categoriaID
INNER JOIN Proveedor AS BDNW_Pr
ON BDNW_P.provedorID = BDNW_Pr.proveedorID
INNER JOIN DetalleOrden AS BDNW_D
ON BDNW_P.productoID = BDNW_D.productoID
INNER JOIN Orden AS BDNW_O
ON BDNW_D.ordenID  = BDNW_O.ordenID
INNER JOIN Cliente AS BDNW_C
ON BDNW_O.clienteID = BDNW_C.clienteID
INNER JOIN Empleado AS BDNW_E
ON BDNW_O.empleadoID = BDNW_E.empleadoID
INNER JOIN NorthwindDataMart.dbo.Producto AS BDNM_P
ON BDNM_P.Nombre = BDNM_P.Nombre
INNER JOIN NorthwindDataMart.dbo.Cliente AS BDNM_C
ON BDNW_C.ContactName = BDNM_C.Nombre
INNER JOIN NorthwindDataMart.dbo.Empleado AS BDNM_E
ON BDNW_E.LastName = BDNM_E.Apellido
INNER JOIN NorthwindDataMart.dbo.Tiempo AS BDNM_T
ON BDNW_O.fecha = (CONVERT(DATE,BDNM_T.Fecha))
INNER JOIN NorthwindDataMart.dbo.Proveedor AS BDNM_PR
ON BDNW_Pr.nombreCompania = BDNM_PR.NombreCompañia;

use NorthwindDataMart

go

delete 
from dbo.Orden;

delete 
from dbo.Producto;

delete 
from dbo.Cliente;

delete
from dbo.Proveedor;

delete
from dbo.Empleado;

delete
from dbo.Tiempo;

delete 
from Orden;

select *
from Orden


select * from Cliente