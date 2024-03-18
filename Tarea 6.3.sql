
Create table Cliente_Libro(
Codigo_cliente int not null ,
Nombre_cliente varchar(30),
id_libro int not null,
Numeros_de_libro int not null,
Nombrelibro varchar (50),
Autor varchar (50),
Año_de_alquiler_del_libro int not null
)
Create table Libro (
id_libro int not null,
Nombrelibro varchar(50),
Autor varchar(50),
Año_de_publicación int not null
)
-- cree una segunda tabla del libro pero en ejemplo no ponia una segunda tabla creela tabla libro solo para organizar mejor los datos que solo son de los libros vendidos 
insert Cliente_Libro values (5,'Pedro',1,1,'Cocina desde cero','Juan nuñez',2021)
insert Cliente_Libro values (1,'Pedro',2,1,'Segunda Guerra mundial','John aybar',2021)
insert Cliente_Libro values (2,'Roberto',3,1,'Computación para principiantes','Milton García',2014)
insert cliente_libro values (2,'Roberto',4,1,'Base de datos desde cero','Milton García',2020)
insert Cliente_Libro values (2,'Roberto',5,1,'Conducción de un tanque ','Rafael salcedo',2020)
insert Cliente_Libro values (3,'Francisco',6,1,'Mecanica avanzada ','Alcides Castillo',2015)
insert Cliente_Libro values (3,'Francisco',6,1,'Reposteria','Juan nuñez',2016)
insert Cliente_Libro values (3,'Francisco',7,1,'Historia Dominicana','Sebastian espinal',2018)
insert Cliente_Libro values (3,'Francisco',8,1,'Fisica','Oscar Aquino',2018)
insert Cliente_Libro values (4,'Dianna',9,1,'Los tres mosqueteros','Ivan Padrón',2014)
insert Cliente_Libro values (5,'karla',10,1,'Juana de arco','Milton García',2013)
insert Cliente_Libro values (5,'Karla',11,1,'Sql amateur','Carlos amador',2020)
insert Cliente_Libro values (6,'Antonio',12,1,'Guerra Fria','Elena payero',2018)
insert Cliente_Libro values (7,'Laura',13,1,'Hisoria de los disposivos moviles','Juana polanco',2016)
insert Cliente_Libro values (7,'Laura',1,1,'Cocina desde cero','Juan nuñez',2020)

insert Libro values (1,'Cocina desde cero','Juan nuñez',2017)
insert Libro values (2,'Segunda Guerra mundial','John aybar',2014)
insert Libro values (3,'Computación para principiantes','Milton García',2005)
insert libro values (4,'Base de datos desde cero','Milton García',2002)
insert Libro values (5,'Conducción de un tanque ','Rafael salcedo',2017)
insert Libro values (6,'Mecanica avanzada ','Alcides Castillo',1999)
insert Libro values (6,'Reposteria','Juan nuñez',2015)
insert Libro values (7,'Historia Dominicana','Sebastian espinal',2004)
insert Libro values (8,'Fisica','Oscar Aquino',2014)
insert Libro values (9,'Los tres mosqueteros','Ivan Padrón',205)
insert Libro values (10,'Juana de arco','Milton García',2012)
insert Libro values (11,'Sql amateur','Carlos amador',2020)
insert Libro values (12,'Guerra Fria','Elena payero',1989)
insert Libro values (13,'Hisoria de los disposivos moviles' ,'Juana polanco',2015)
insert Libro values (1,'Cocina desde cero','Juan nuñez',2017)

-- cree una segunda tabla del libro pero en ejemplo no ponia una segunda tabla cree la tabla libro solo para organizar mejor los datos que solo son de los libros  vendidos 

--Los libros vendidos o alquilados  por año
SELECT Año_de_alquiler_del_libro, SUM(Numeros_de_libro)
FROM Cliente_Libro
GROUP BY Año_de_alquiler_del_libro