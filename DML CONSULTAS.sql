use Northwind

                               -- Instrucciones de la asignación 4.1:
-- 1- Listar todos los atributos/características de los productos
select * from Products

-- 2- Identificar cuántos clientes han realizado órdenes de compra
select cliente.ContactName as 'Contacto del cliente', cliente.CompanyName as 'Compañia del cliente ', orders.OrderID
from Customers cliente
inner join orders on Orders.CustomerID = cliente.CustomerID

--3- Listar todas categorías de productos existentes.
select * from Categories

-- 4- Mostrar el resultado de consultar todos los empleados mostrando los campos en español
select LastName Apellido, FirstName Nombre , Title Cargo , BirthDate Cumpleaños , HireDate Dia_Contratacion , Employees.Address dirección , City ciudad , Country País , HomePhone Telefono , notes notas
from Employees

-- 5- Mostrar todas las órdenes creadas a partir del 1ro de enero del 2017
select * from Orders
where OrderDate >= '2017-01-01'

-- 6- Mostrar todas las categorías que sean de tipo bebida
select * from Categories 
where CategoryName = 'Beverages'

--7- Cuáles suplidores son de UK, USA y Japón
select * from Suppliers
where Country = 'Japan' or Country = 'UK' or Country = 'USA'

-- 8- Mostrar los productos ordenados por precio de mayor a menor
select * from Products
order by UnitPrice desc

-- 9-  Listado de clientes ordenados según el orden en que fueron registrados al sistema (ID)
select * from Customers
order by CustomerID desc

--10- Cuáles clientes son de nacionalidad francesa, específicamente de París
select * from Customers
where Country = 'France' and city = 'Paris'

-- 11- Cuáles productos vienen en unidades de botellas y latas (sin importar el tamaño)
select * from Products
where QuantityPerUnit like '%bottles%' or QuantityPerUnit like '%cans%'

-- 12- Mostrar las primeras 10 compras realizadas en 1997
select top 10 * from Orders
where OrderDate like '%1997%'
order by OrderDate

-- 13- Cantidad de suplidores por país.
select Country , COUNT(SupplierID) as 'cantidad de suplidores por pais'  from Suppliers
group by Country

--14- Cantidad de productos por Orden de compra
select ProductName,COUNT([Order Details].OrderID) as 'Cantidad de productos vendidos'
from [Order Details]
inner join Products on Products.ProductID = [Order Details].ProductID
group by ProductName

-- 15- Mostrar Nombre, apellido y Fecha de Nacimiento de los empleados
select FirstName as 'Nombre' , LastName as 'Apellido' , BirthDate 'Nacimiento'
from Employees

-- 16- Cuántas órdenes en total se han realizado.
select count(Orders.OrderID) as 'Cantidad de ordenes hechas'
from Orders

                                      --Instrucciones de la asignación 4.2:
--1- Mostrar id, nombre y tipo (cliente o empleado) de las personas involucradas en una orden.
Select Orders.OrderID , Employees.FirstName  as 'Nombre del empleado '  ,Employees.Title as Cargo
from Employees
inner join Orders on Orders.EmployeeID = Employees.EmployeeID

UNION ALL

Select Orders.OrderID , Customers.ContactName , Customers.CompanyName
from Customers
inner join Orders on Orders.CustomerID = Customers.CustomerID

--2- De los 91 clientes existentes, ¿cuántos tienen órdenes realizadas?
SELECT customers.ContactName , count(Orders.OrderID)
FROM Customers
JOIN Orders on Orders.CustomerID = Customers.CustomerID
group by Customers.ContactName

--3- Listar todos los clientes que no han realizado ninguna compra?
SELECT Customers.CustomerID, Customers.ContactName
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.CustomerID IS NULL;


--4- Listar todas las órdenes de compra y en vez de presentar los IDs, presentar sus respectivas descripciones.
SELECT Orders.OrderID, Products.ProductName
FROM Orders
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID;


--5- Mostrar los datos del cliente y de las órdenes (si ha realizado alguna)
SELECT Customers.CustomerID, Customers.ContactName, Customers.CompanyName, Orders.OrderID, Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

                                       --Instrucciones de la asignación 4.3:
-- 1- Crear un producto nuevo, ingresando su categoría y suplidor.
INSERT INTO Products (ProductName, CategoryID, SupplierID)
VALUES ('Nuevo Producto', 1, 1);

-- 2- Guardar en otra tabla los productos que se encuentran descontinuados.
UPDATE Products
SET Discontinued = 1
WHERE ProductName = '';

-- 3- Insertar como Cliente el suplidor que se llama "Tokyo Traders".
INSERT INTO Customers (ContactName)
VALUES ('Tokyo Traders')
-- 4- Crear un suplidor, pero solo completar los datos obligatorios los demás llenarlos con NULL.
INSERT INTO Suppliers (CompanyName)
VALUES ('Nuevo Suplidor');

-- 5- Insertar una nueva region y determinar cual es el ID que se ha asignado al nuevo registro.
INSERT INTO Region (RegionDescription)
VALUES ('Nueva Región');


                                       --Instrucciones de la asignacion 4.4:


--1- Eliminar la data de la tabla "Region".
DELETE FROM Territories
DELETE FROM Region;


--2- Eliminar los datos de la tabla Customer que no tengan ordenes de compra
DELETE FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);

--3- Validar cuantos registros tiene la tabla "Orders Details" y borrar el 35% de la data.
SELECT COUNT(*) AS TotalRecords FROM [Order Details];

DELETE FROM [Order Details]
WHERE [Order Details].OrderID IN (
    SELECT TOP 35 PERCENT [Order Details].OrderID
    FROM [Order Details] 
    ORDER BY NEWID()
)

--4- Eliminar 10 registros de la tabla "Orders Details" en un solo script.
DELETE TOP(10) FROM [Order Details];

--5- Utilizar la instruccion TRUNCATE con la tabla de ordenes y anotar el comportamiento. 
TRUNCATE TABLE Orders;

--6- Ejecutar el script debajo el cual crea e inserta informacion a una tabla llamada "Estudiantes" y hacer lo siguiente:
CREATE TABLE [dbo].[Estudiantes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](10) NULL,
	[Apellido] [nchar](10) NULL,
	[Curso] [nchar](10) NULL
) ON [PRIMARY]


GO


INSERT INTO [dbo].[Estudiantes] 
VALUES 
('Persio','Martinez','BI'),
('Rosa','Gomez','BIG Data'),
('Ana','Martinez','ML'),
('Jose','Mena','DL')	
	--a) Eliminar todos los registros manteniendo el ultimo indice (el proximo dato registrado debe ser el No.7)
	DELETE FROM Estudiantes WHERE ID < (SELECT MAX(ID) FROM Estudiantes);
	--b) Ejecutar nuevamente el script que inserta el estudiante Rosa Gomez
	INSERT INTO Estudiantes (Nombre, Apellido, Curso)
VALUES ('Rosa', 'Gomez', 'BIG Data');
	--c) Eliminar todos los registros reiniciando los indices (el proximo dato registrado debe ser el No.1)
	TRUNCATE TABLE Estudiantes;
	--b) Ejecutar nuevamente el script que inserta el estudiante Ana Martinez
	INSERT INTO Estudiantes (Nombre, Apellido, Curso)
VALUES ('Ana', 'Martinez', 'ML');
	                                    --Instrucciones de la asignacion 4.5:
--1- Corregir el nombre del producto "Chocolade" por "Chocolate" y el precio unitario ya que este cuesta 13 pesos hoy.
UPDATE Products
SET ProductName = 'Chocolate', UnitPrice = 13
WHERE ProductName = 'Chocolade';
--2- Asignar la orden 10832 a la represntante de venta Margaret Peacock ya que la persona que actualmente tiene la orden es el vicepresidente de ventas Andrew Fuller
UPDATE Orders
SET EmployeeID = (
    SELECT EmployeeID 
    FROM Employees 
    WHERE FirstName = 'Margaret' AND LastName = 'Peacock'
)
WHERE OrderID = 10832;

--3- Actualizar el nombre de las regiones a espanol. Actualemnte se encuentran en ingles.
UPDATE Region
SET RegionDescription = 
    CASE RegionDescription
        WHEN 'Eastern' THEN 'Este'
        WHEN 'Western' THEN 'Oeste'
        WHEN 'Northern' THEN 'Norte'
        WHEN 'Southern' THEN 'Sur'
        ELSE RegionDescription -- Si hay más regiones, mantén su nombre actual
    END
WHERE RegionDescription IN ('Eastern', 'Western', 'Northern', 'Southern');

--4- Actualizar las unidades en stock de productos a 0 si el mismo se encuentra descontinuado.
UPDATE Products
SET UnitsInStock = 0
WHERE Discontinued = 1;

--5- Revisar la informacion de estructura de la compnia (empleados) y organizarla segun la linea de jerarquia:

	--Vice Presidente  no le reporta a nadie

	--Gerente de venta le reporta el Vice Presidente

	--Coordinador de ventas Internas  le reporta el Gerente de ventas.

	--Representantes de ventas  le reporta al Gerente de ventas.
	-- Representantes de ventas le reportan al Gerente de ventas
UPDATE Employees
SET ReportsTo = (
    SELECT EmployeeID 
    FROM Employees 
    WHERE TitleOfCourtesy = 'Sales Manager'
)
WHERE TitleOfCourtesy = 'Sales Representative';

-- Coordinador de ventas internas le reporta al Gerente de ventas
UPDATE Employees
SET ReportsTo = (
    SELECT EmployeeID 
    FROM Employees 
    WHERE TitleOfCourtesy = 'Sales Manager'
)
WHERE TitleOfCourtesy = 'Inside Sales Coordinator';

-- Gerente de ventas le reporta al Vicepresidente
UPDATE Employees
SET ReportsTo = NULL -- Vice Presidente (ID = 2)
WHERE Title = 'Sales Manager';


