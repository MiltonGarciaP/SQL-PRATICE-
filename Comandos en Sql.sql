-- Para crear una base de datos utilizamos 'create database' y el noombre deseado como en el ejemplo 'Practica'
create database Practica 
/*Para crear una tabla en la base de datos ya creada utilzamos create table y despues el nombre de la tabla y despues dentro de dos paretseis 
se ponen los nombre de columnas y los datos que va permitir por ejemplo
int enteros
Varchar() entre dos comillas datos alphanumericos 
money (se pueden utilizar numero comas y puntos se utiliza comunmente en el dinero)
etc
*/

create table usuario 
(

id_usuario int not null,
nombre varchar(30) not null,
edad int not null 

)
/* Para insertar los valores en una tabla y sus correspondientes columnas se utiliza insert nombre de la tabla despues values y en dos parentesis se pone en mismo orden 
los valores correpondientes al orden de columnas deseadas 
*/
insert usuario values (1,'David',22)
insert usuario values (2,'Tatiana',24)
insert usuario values (1,'Miguel',21)
insert usuario values (1,'Karla',20)
insert usuario values (1,'Maria',19)
insert usuario values (1,'Nancy',23)

--Consultas 

-- enseñar todo 
select * from usuario 

--enseñar algo en especifico 
select nombre,edad from usuario 

where id_usuario = 1

-- borrar algo en especifico 
delete from usuario 
where nombre = 'carlos'

-- Borral todos los datos de una tabla 
delete from usuario

-- actualizar algo en especifico 
update usuario set nombre  = 'Roberto'
where id_usuario = 2

-- Actualizar todo en una tabla con un dato epecifico 
update usuario set nombre  = 'Roberto'

--Ver con los videos 
-- Con este podemos ver la función indentity que es para aumentar en uno en uno empezando desde el uno 
create table usuario2 (
id_usuario int identity ,
Nombre varchar(50)
)

-- Opciones para el identity 
-- 1. Esto nos va a decir desde donde se inicio el conteo desde que numero 
select IDENT_seed ('usuario2')
-- 2. Esto nos va a decir cuanto se esta incrementando el valor inicial 
select IDENT_incr ('usuario2')
-- 3. Esto nos va decir hasta donde esta el incremento 
select IDENT_CURRENT ('Usuario2')
/* 4. para cambiar el incremento solo se debe hacer que al final de identity en la creación de la tabla se ponga () dentro de este parentesis se pone primero el numero de donde se va 
iniciar y despues de en cuanto en cuanto el se va a ir incrementando
*/
create table usuario3 (
id_usuario int identity(58,3) ,
Nombre varchar(50)
)


create table libros 
(
id_libro int identity primary key,
nombre varchar(50) not null,
precio_venta int not null,
precio_compra float not null
)

insert into libros values('El Lobo',115,95.23);
insert into libros values('Caperucita Roja',236,189.25);
insert into libros values('Programación en Java',78,50.36);
insert into libros values('Programando desde cero con C',115,95.23);
insert into libros values('SQL Server 2000',454,365.56);
insert into libros values('El Codigo Da Vinci',232,199.98);
insert into libros values('Aura',147,112.31);
insert into libros values('100 Años de Soledad',166,124.23);
insert into libros values('La Fisica es Divertida',168,123.32);
insert into libros values('Calculo Integral',456,289.56);
insert into libros values('Las 20 Lenguas del Dragon',345,234.42);
insert into libros values('Narnia',100,89.36);

-- Operadores aritmeticos con operaciones simples


--En la sguiente consulta se sacara las gananacias generadas restando restando el precio con el que se compra por el que vende si se quiere se pone nombre oara ver el nombre

select precio_venta - precio_compra from libros

-- En la siguiente consulta se utilizara where para ver mas especificamente la ganacia de un libro en especifico 

select id_libro,nombre,precio_venta - precio_compra from libros
where id_libro = 1

-- En la siguiente consulta veremos cuanto dinero se necesita para comprar una cantidad de libros cuanto no sale en total todos los libro

select id_libro,nombre,precio_compra * 10 from libros

-- Ahora lo vamos a hacer con uno en especifico utilizando where 

select nombre,precio_compra * 10 from libros
where id_libro = 12

-- Los operadores se pueden utilizar para actualizar datos de una columna 

update libros set precio_venta = precio_venta + (precio_venta - 100)
where id_libro = 10

-- Concatenación y alias 

-- Concatenación 

-- En esta siguiente consulta le uniremos a los datos una palabra o una oración

select 'Libros ' +  nombre from libros

--Alias 

-- Este se pone para un alias al nombre de la columna momentananeo con la consulta 

select id_libro as numero_de_libros_asignados from libros

