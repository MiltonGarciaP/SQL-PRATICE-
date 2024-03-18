create database SellPoint

use sellPoint

create table GruposEntidades (
IdGrupoEntidad int identity (1,1) primary key NOT NULL ,
Descripcion varchar(120) NOT NULL ,
Comentario varchar(max),
Status varchar(10) default 'Activa'
check (Status = 'Activa' or Status = 'Inactiva' ),
Noeliminable bit default 0,
FechaRegistro date default getdate());

create table TiposEntidades(
IdTipoEntidad int identity (1,1) primary key NOT NULL,
Descripcion varchar(120) NOT NULL,
IdGrupoEntidad int ,
Comentario varchar(max),
Status varchar(10) default 'Activa'
check (Status = 'Activa' or Status = 'Inactiva' ),
Noeliminable bit default 0,
FechaRegistro date default getdate()

CONSTRAINT GrupoE_TipoE FOREIGN KEY(IdGrupoEntidad)
REFERENCES GruposEntidades(IdGrupoEntidad));

create table Entidades (
IdEntidad int identity (1,1) primary key NOT NULL,
Descripcion varchar(120) NOT NULL,
Direccion varchar(max) NOT NULL,
Localidad varchar(40) NOT NULL,
TipoEntidad varchar(9) default 'Juridica'
check (TipoEntidad = 'Fisica' or TipoEntidad = 'Juridica' ),
TipoDocumento varchar(9) default 'RNC'
check ( TipoDocumento='RNC' or TipoDocumento='Cédula' or TipoDocumento='Pasaporte' ),
NumeroDocumento BIGINT NOT NULL,
Telefono varchar(60) NOT NULL,
urlPaginaWeb varchar(120),
urlFacebook varchar(120),
urlInstagram varchar(120),
urlTwitter varchar(120),
urlTiktok varchar(120),
IdGrupoEntidad int  ,
IdTipoEntidad int ,
LimiteCredito int 
check (LimiteCredito >= 0),
UserNameEntidad varchar (60)NOT NULL,
PassworEntidad varchar (30) NOT NULL,
RollUserEntidad varchar (10) default 'User'
check (RollUserEntidad = 'Admin' or RollUserEntidad = 'Supervisor' or RollUserEntidad = 'User' ),
Comentario varchar (max),
Status varchar(10) default 'Activa'
check (Status = 'Activa' or Status = 'Inactiva' ),
Noeliminable bit default 0,
FechaRegistro date default getdate()

CONSTRAINT GrupoE_E FOREIGN KEY(IdGrupoEntidad)
REFERENCES GruposEntidades(IdGrupoEntidad),

CONSTRAINT TipoE_E FOREIGN KEY (IdTipoEntidad)
REFERENCES  TiposEntidades(IdTipoEntidad));

INSERT INTO GruposEntidades VALUES ('Descripcion Grupo Entidad 1','Entidad de prueba Program 0.1 Grupo Entidad','Activa',1,default);
INSERT INTO GruposEntidades VALUES ('Descripcion Grupo Entidad 2','Entidad de prueba Program 0.1 Grupo Entidad','Inactiva',0,default);
INSERT INTO GruposEntidades VALUES ('Descripcion Grupo Entidad 3','Entidad de prueba Program 0.1 Grupo Entidad','Inactiva',1,default);
INSERT INTO GruposEntidades VALUES ('Descripcion Grupo Entidad 4','Entidad de prueba Program 0.1 Grupo Entidad','Activa',0,default);

INSERT INTO TiposEntidades VALUES ('Descripcion Tipo Entidad 1',1,'Entidad de prueba Program 0.1 Tipo Entidad','Activa',1,default);
INSERT INTO TiposEntidades VALUES ('Descripcion Tipo Entidad 2',1,'Entidad de prueba Program 0.1 Tipo Entidad','Inactiva',0,default);
INSERT INTO TiposEntidades VALUES ('Descripcion Tipo Entidad 3',1,'Entidad de prueba Program 0.1 Tipo Entidad','Activa',1,default);
INSERT INTO TiposEntidades VALUES ('Descripcion Tipo Entidad 4',2,'Entidad de prueba Program 0.1 Tipo Entidad','Inactiva',0,default);
INSERT INTO TiposEntidades VALUES ('Descripcion Tipo Entidad 5',2,'Entidad de prueba Program 0.1 Tipo Entidad','Inactiva',1,default);
INSERT INTO TiposEntidades VALUES ('Descripcion Tipo Entidad 6',2,'Entidad de prueba Program 0.1 Tipo Entidad','Activa',0,default);
INSERT INTO TiposEntidades VALUES ('Descripcion Tipo Entidad 7',3,'Entidad de prueba Program 0.1 Tipo Entidad','Inactiva',1,default);
INSERT INTO TiposEntidades VALUES ('Descripcion Tipo Entidad 8',3,'Entidad de prueba Program 0.1 Tipo Entidad','Inactiva',0,default);
INSERT INTO TiposEntidades VALUES ('Descripcion Tipo Entidad 9',3,'Entidad de prueba Program 0.1 Tipo Entidad','Activa',1,default);
INSERT INTO TiposEntidades VALUES ('Descripcion Tipo Entidad 10',4,'Entidad de prueba Program 0.1 Tipo Entidad','Inactiva',0,default);
INSERT INTO TiposEntidades VALUES ('Descripcion Tipo Entidad 11',4,'Entidad de prueba Program 0.1 Tipo Entidad','Inactiva',1,default);
INSERT INTO TiposEntidades VALUES ('Descripcion Tipo Entidad 12',4,'Entidad de prueba Program 0.1 Tipo Entidad','Activa',0,default);

INSERT INTO Entidades VALUES ('Usuario de prueba Admin num 1','Calle Usuario Admin num 1','Localidad Usuario Admin 1',
default,default,'40218365800','8094241649','https://www.microsoft.com/es-es/sql-server/sql-server-downloads?SilentAuth=1&wa=wsignin1.0',
'https://www.facebook.com','https://www.instagram.com/?hl=es-la','https://twitter.com/?lang=es',
'https://www.tiktok.com/es//',1,1,15,'Admin','Admin','Admin','Comentario 0','Activa',1,default);

select * from GruposEntidades
select * from TiposEntidades
select * from Entidades

-- Creacion de los indices 
create index Idescripcion
on GruposEntidades (Descripcion)
-----------------------------------
create index I_Descripcion
on TiposEntidades(Descripcion)
-----------------------------------
create index I_descripcion_TipoEntidad_TipoDocumento_NumeroDocumento
on Entidades(Descripcion,TipoEntidad,TipoDocumento,NumeroDocumento)
