create table Ordenesdearticulos(
Id_orden int not null,
Fecha date,
Id_cliente int not null,
Nombre_cliente varchar not null,
Ciudad varchar(20),
ID_art int not null,
Nom_art varchar not null,
Cant int not null,
Marca_de_producto varchar not null,
Precio int not null 
)


insert Ordenesdearticulos values (1478,23/03/21,101,'Pedro','Santo domingo',8963,8963,'Pelota de beisbol',165,15000,'Rawling Original')
insert Ordenesdearticulos values (4563,24/02/18,102,'Carlos','Santiago',9632,9852,'Bate de aluminio',2,4000,'Under Armour')
insert Ordenesdearticulos values (3578,25/03/14,'Robertico','San Pedro',2698,7532,'Bate de Madera',1,10000,'Marucci')
insert Ordenesdearticulos values (7896,24/07/19,'Pedrito','Bani',7896,8965,'Guantillas de beisbol',1,1555,'Nike')
insert Ordenesdearticulos values (7896,24/07/19,'Pedrito','Bani',4898,6425,'Malla ',5,1000,'Nike')
insert Ordenesdearticulos values (7896,24/07/19,'Pedrito','Bani',3899,5965,'Zapatos o zapatillas para jugar beisbol',50,20000,'Nike')
insert Ordenesdearticulos values (7896,24/07/19,'Pedrito','Bani',4810,5642,'Medias',100,5000,'Nike')
insert Ordenesdearticulos values (7896,24/07/19,'Pedrito','Bani',2896,1265,'Cascos',50,17000,'Nike')

-- En este ejercicio utilize el primer metodo de normalización