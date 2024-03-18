create database Practica 

create table usuario 
(

id_usuario int not null,
nombre varchar(30) not null,
edad int not null 

)

insert usuario values (1,'David',22)
insert usuario values (2,'Tatiana',24)
insert usuario values (3,'Miguel',21)
insert usuario values (4,'Karla',20)
insert usuario values (5,'Maria',19)
insert usuario values (6,'Nancy',23)

create table usuario2 (
id_usuario int identity ,
Nombre varchar(50)
)

insert usuario2 values ('Milton')
insert usuario2 values ('Pedro')
insert usuario2 values ('Roberto')
insert usuario2 values ('Laura')
insert usuario2 values ('Saul')
insert usuario2 values ('Robertico')
insert usuario2 values ('Manuel')
insert usuario2 values ('Pablo')
insert usuario2 values ('Daniel')
insert usuario2 values ('Noelle')
insert usuario2 values ('Cartagena')

create table usuario3 (
id_usuario int identity ,
Nombre varchar(50)
)

select * from usuario2