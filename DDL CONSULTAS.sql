                                              --Instrucciones de la asignacion 5.1:
--1- Crear un nuevo esquema para guardar las tablas pertenecientes al departamento de cuentas por cobrar.
CREATE SCHEMA CuentasPorCobrar;

--2- Crear una tabla que guarde la informacion correspondiente a las cuentas por cobrar, la cual debe llevar la siguiente estructura:

	--a) Id - Debe ser un serial que se genere automaticamente
	--b) id cliente - debe ser un campo que haga relacion con la tabla de cliente (FK)
	--c) id factura - debe ser un campo que haga relacion con la tabla de ventas (FK)
	--d) Fecha - Fecha creacion de la cuenta por cobrar
	--e) Credito - Monto pagado hasta la fecha
	--f) Total pendiente - diferencia de la factura menos los creditos

	CREATE TABLE CuentasPorCobrar.CuentasPorCobrar (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ClienteId INT FOREIGN KEY REFERENCES Sales.Customer(CustomerID),
    FacturaId INT FOREIGN KEY REFERENCES Sales.SalesOrderHeader(SalesOrderID),
    Fecha DATE DEFAULT GETDATE(),
    Credito DECIMAL(10, 2),
    TotalPendiente DECIMAL(10, 2)
);


--3- La tabla debe contener ciertos comportamientos de negocio tales como los siguientes:
	--a) No se debe pagar mas de lo pendiente en la factura
	--b) Las fechas de las cuentas por cobrar deben ser del mismo dia, es decir, no se permite fechas anteriores o posteriores a la fecha actual.
	CREATE TRIGGER ValidarCuentasPorCobrar
ON CuentasPorCobrar.CuentasPorCobrar
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @FechaActual DATE
    SELECT @FechaActual = GETDATE()

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE Fecha != @FechaActual
    )
    BEGIN
        RAISEERROR('La fecha de la cuenta por cobrar debe ser la fecha actual.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Sales.SalesOrderHeader soh ON i.FacturaId = soh.SalesOrderID
        JOIN Sales.SalesOrderDetail sod ON i.FacturaId = sod.SalesOrderID
        WHERE i.Credito > soh.TotalDue - sod.LineTotal
    )
    BEGIN
        RAISEERROR('El crédito no puede ser mayor que el total pendiente de la factura.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END
END;

--4- Insertar data con los ejercicios del punto 3 y validar que la tabla se comporta tal lo requerido.
INSERT INTO CuentasPorCobrar.CuentasPorCobrar (ClienteId, FacturaId, Credito, TotalPendiente)
VALUES (123, 456, 50.00, 150.00);

                                     -- Instrucciones de la asignacion 5.2:
--1- Agregar un campo nuevo llamado TodayDate;
ALTER TABLE Sales.SalesPerson
ADD TodayDate DATE;

--2- Modificar campo TodayDate y configurarlo como default con la fecha del dia;
ALTER TABLE Sales.SalesPerson
ADD CONSTRAINT DF_TodayDate DEFAULT GETDATE() FOR TodayDate;

--3- Eliminar columna Bonus;
ALTER TABLE Sales.SalesPerson
DROP COLUMN Bonus;

--4- Crear una restrinccion para que el campo SalesQuota no permita valores en cero;
ALTER TABLE Sales.SalesPerson
ADD CONSTRAINT CHK_SalesQuota CHECK (SalesQuota <> 0);

--5- Insertar un registro en la tabla para validar el constraint
INSERT INTO Sales.SalesPerson (TodayDate, SalesQuota)
VALUES (GETDATE(), 10000);
--7- Deshabilitar el constraint y tratar de insertar el registro nuevamente
ALTER TABLE Sales.SalesPerson
NOCHECK CONSTRAINT CHK_SalesQuota;

INSERT INTO Sales.SalesPerson (TodayDate, SalesQuota)
VALUES (GETDATE(), 0); 

--8- Eliminar la restriccion
ALTER TABLE Sales.SalesPerson
DROP CONSTRAINT CHK_SalesQuota;

                                           -- Instrucciones de la asignacion 5.3:  

--1- Ejecutar scritp adjunto [dbo].[Categories].txt y efectuar las siguientes actividades.
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
	[Picture] [image] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


GO

  --a) Eliminar la tabla creada utilizando Tsql.
  DROP TABLE [dbo].[Categories];

--2- Eliminar la tabla Person y anotar el comportamiento 
DROP TABLE Person;

                                            --Instrucciones de la asignacion 5.4:
--1- Elegir 5 tablas para truncar incluyendo dbo.errorlog.

	--a) Listar las tablas a ser truncadas
SELECT TOP 5 *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_NAME != 'sysdiagrams'; 


	--b) Enumerar las tablas que pudieron ser truncadas sastifactoriamente
TRUNCATE TABLE [Person];
TRUNCATE TABLE [Categories];
	--c) Cual es el error de las tablas que da error, investigar de que se trata
BEGIN TRY
    TRUNCATE TABLE [PRODUCTION];
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
                                             --Instrucciones de la asignación 5.5:
--1- Documentar la tabla [Production].[ProductReview] utilizando los comentarios segun el caso:
	--a) Para describir el contexto de la tabla utilizar comentarios multiples.
/* 
La tabla ProductReview almacena las revisiones de productos realizadas por los clientes.
Contiene detalles sobre las opiniones de los clientes, calificaciones y fechas de revisión.
*/

	--b) Para describir los campos, utilizar comentarios simples.
	SELECT TOP 1
    [ProductReviewID] -- ID de la revisión del producto
    ,[ProductID] -- ID del producto revisado
    ,[ReviewerName] -- Nombre del revisor
    ,[ReviewDate] -- Fecha de la revisión
    ,[EmailAddress] -- Correo electrónico del revisor
    ,[Rating] -- Calificación del producto
    ,[Comments] -- Comentarios sobre el producto
    ,[ModifiedDate] -- Fecha de modificación
FROM [AdventureWorks].[Production].[ProductReview];


