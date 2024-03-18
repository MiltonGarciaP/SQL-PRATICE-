create table roles (
idRol int primary key identity(1,1) ,
Nombre varchar(15) not null

)




create table Clientes (
nombreUsuario varchar(20) primary key,
Nombre varchar(15) ,
Apellido varchar (20) ,
Telefono varchar(60) ,
CorreoElectronico varchar (40),
Direccion varchar (max)  
)


create table Usuarios (
nombreUsuario varchar(20) primary key,
contrase�a varchar(6),
IdRol int
)








create table Calificaciones (
idCalificacion int primary key identity(1,1),
idLibro int, 
nombreUsuario varchar(20),
Calificaci�n int

)



create table Libros (
idLibro int primary key identity (1,1),
Nombre varchar(30),
Precio decimal ,
Autor Varchar(30),
A�o date,
Editorial varchar(max),
NumeroPaginas int,
Idioma varchar(15),
IdCategoria int,
Imagen image 
)

create table categoria (
IdCategoria int primary key identity (1,1),
Categoria_Libro varchar(25)
)

create table Ventas (
Codigo_Factura varchar(200) primary key ,
Fecha date default getdate (),
Monto decimal not null ,
nombreUsuario varchar(20) not null, 
NumTarjeta varchar(10) not null,
Fecha_Venc varchar(10) not null ,
CV int check (cv >= 100 and cv < 1000) not null

foreign key (nombreUsuario) references Clientes (nombreUsuario)
)

create table Detalle_Venta(
Codigo_detalle varchar(200) primary key,
Codigo_Factura varchar(200) not null,
Idlibro int not null ,
Cantidad int not null
precio int not null

foreign key (Codigo_Factura) references Ventas (Codigo_Factura),
foreign key (Idlibro) references Libros (Idlibro)
)




