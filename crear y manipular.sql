create database Crear_y_manipular

create table Cliente 
(
Idcliente int primary key,
NombreCliente varchar(50),
Balance int not null,
Telefono varchar (50)
)

create table cuenta 
(
IDcliente int not null,
IDcuenta int primary key,
Nombredecuenta varchar (50),
Balance int not null,
Tipodecuenta varchar (50)
)

create table pagos 
(
IDcuenta int not null,
IDPago int  primary key ,
Monto int not null
)

insert into cliente values (1,'Carlos',1000,'8096508815')
insert into cliente values (2,'Pedro',100,'8297258932')

insert into cuenta values (1,1,'Cuenta1',0,'Debito')
insert into cuenta values (1,2,'cuenta2',1000,'credito')
insert into cuenta values (2,3,'Cuenta3',100,'Debito')

insert into pagos values (1,1,100)
insert into pagos values (1,2,100)
insert into pagos values (2,3,300)

update cuenta set Balance = 500
where IDcuenta = 1

update cuenta set Balance = 1000
where IDcuenta = 2

update Cliente set Balance = 1500
where Idcliente = 1


select Monto from pagos 
where IDcuenta = 1

Select Monto,IDcuenta from pagos 

select * from Cliente join cuenta on Cliente.Idcliente = cuenta.IDcliente


-- Algebra Relacional 
/*
  σ>10∧codigo<500
*/