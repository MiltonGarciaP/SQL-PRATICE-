Create database CompañiaX

Create table Ingenieros(
Nombre varchar (50),
IDingenieros int  Primary key,
IDproyecto int not null ,
Codigo_proyecto int not null,
Area varchar (50),
Año int null,
Tiempo Varchar (40),
Salario money not null
)
	
Create table proyecto (
IDproyecto int primary key, 
Codigo_Proyecto int not null,
Nombre_de_Proyecto varchar(50)
)

insert Ingenieros Values ('Milton',1,1,125,'Software',2015,'5 de abril del 2015',100000)

insert Ingenieros Values ('Jose',2,1,125,'Diseño',2016,'24 de septiembre del 2016',85000)

insert Ingenieros Values ('Pedro',3,1,125,'Sonido',2018,'4 de octubre del 2018',70000)

insert Ingenieros Values ('Francisco',4,2,225,'Sonido',2021,'5 de enero del 2021',50000)

insert Ingenieros Values ('Carlos',5,2,225,'Software',2020,'14 de febrero del 2020',60000)

insert Ingenieros Values ('Juan',6,2,225,'Diseño',2010,'7 de marzo del 2010',150000)

insert Ingenieros Values ('Elena',7,2,225,'Software',2021,'30 de junio del 2021',50000)

insert Ingenieros Values ('Antonio',8,3,325,'Diseño',2017,'15 de noviembre del 2017',75000)

insert Ingenieros Values ('Karla',9,3,325,'Software',2014,'8 de diciembre del 2014',125000)

insert Ingenieros Values ('Iisabela',10,3,325,'Sonido',2021,'5 de abril del 2021',50000)


insert proyecto values (1,125,'Valorant')

insert proyecto values (2,225,'Warzone')

insert proyecto values (3,325,'Fifa')


Select IDingenieros, Nombre, Año from Ingenieros 
Where Año = 2021

SELECT area, SUM(salario)
FROM Ingenieros
GROUP BY Area

Select IDingenieros, Nombre,IDproyecto from Ingenieros 


Select IDingenieros, Nombre from Ingenieros 
Where IDproyecto= 1

