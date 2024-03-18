create database TrabajoFinall

Use TrabajoFinall

create table Estudiante (
Matricula_Estudiante int not null,
Nombre_E varchar(20),
Apellido_E varchar(20),
Id_materia int not null,
Grupo_de_materia Varchar(2),
Trimestre_Cursando varchar (2)

)


create table Profesor (
Matricula_Profesor int not null,
Nombre_P varchar(20),
Apellido_P varchar(20),
Id_materia int not null,
Nombre_Materia Varchar(50),
Grupo_de_materia Varchar(2)

)


create table Materia (
Id_materia int not null,
Nombre_materia Varchar(25),

)

insert into Estudiante values (202010676,'Milton','Garcia',101,'G1','T1')
insert into Estudiante values (202010676,'Milton','Garcia',102,'G2','T1')
insert into Estudiante values (202010676,'Milton','Garcia',104,'G1','T1')
insert into Estudiante values (202020153,'Pedro','Castillo',102,'G1','T3')
insert into Estudiante values (202020153,'Pedro','Castillo',101,'G2','T3')
insert into Estudiante values (202089651,'Julian','Aybar',103,'G1','T4')
insert into Estudiante values (202089651,'Julian','Aybar',101,'G2','T4')
insert into Estudiante values (202089651,'Julian','Aybar',102,'G2','T4')
insert into Estudiante values (202000058,'Arbelo','Viciny',105,'G1','T2')
insert into Estudiante values (202000058,'Arbelo','Viciny',101,'G3','T2')
insert into Estudiante values (202000058,'Arbelo','Viciniy',103,'G2','T2')
insert into Estudiante values (202069853,'Francisco','Concepción',102,'G1','T1')
insert into Estudiante values (202069853,'Francisco','Concepción',104,'G1','T1')
insert into Estudiante values (202025637,'Pedro','Mariñe',102,'G2','T2')
insert into Estudiante values (202025637,'Pedro','Mariñe',103,'G2','T2')
insert into Estudiante values (202056984,'Rogelio','Nuñez',101,'G3','T4')
insert into Estudiante values (202056984,'Rogelio','Nuñez',103,'G1','T4')
insert into Estudiante values (202042687,'Luis','Garcia',102,'G1','T1')
insert into Estudiante values (202084629,'Samuel','Encarnación',102,'G2','T2')
insert into Estudiante values (202010235,'Fabio','Payero',105,'G1','T3')
insert into Estudiante values (202085235,'Fiorrella','del Sol',104,'G1','T4')
insert into Estudiante values (202045632,'Jensin','Tejeda',103,'G2','T2')
insert into Estudiante values (202012569,'Sergio','Ramos',102,'G2','T2')
insert into Estudiante values (202012569,'Sergio','Ramos',105,'G1','T2')
insert into Estudiante values (202012569,'Sergio','Ramos',104,'G1','T2')
insert into Estudiante values (202074133,'Josue','Peguero',103,'G1','T1')
insert into Estudiante values (202095487,'Enmanuel','Diaz',104,'G1','T2')
insert into Estudiante values (202036589,'Angel','Di maria',101,'G3','T1')

insert into Profesor values (202010676,'Milton','Garcia',101,'Matematica','G1')
insert into Profesor values (202010676,'Manuel','Perez',102,'Español','G1')
insert into Profesor values (202010676,'Pedro','Nuñez',103,'Base de datos','G1')
insert into Profesor values (202010676,'Samuel','Payero',104,'Sociales','G1')
insert into Profesor values (202010676,'Roberto','Aquino',105,'Etica','G1')
insert into Profesor values (202010676,'Daniel','Castillo',101,'Matematica','G2')
insert into Profesor values (202010676,'Maria','Sanchez',102,'Español','G2')
insert into Profesor values (202010676,'Maria','Sanchez',103,'Base de datos','G2')
insert into Profesor values (202010676,'Trinidad','Sanchez',102,'Español','G3')
insert into Profesor values (202010676,'Julia','Sunday',101,'Matematica','G3')

--crear un script que inserte todas las asignaturas ofrecidas 
insert into Materia values(101,'Matematica')
insert into Materia values(102,'Español')
insert into Materia values(103,'Base de datos')
insert into Materia values(104,'Sociales')
insert into Materia values(105,'Etica')

-- Reporte de estudiantes por profesor.
SELECT Nombre_E,Apellido_E,Nombre_P,Apellido_P,Nombre_Materia
FROM Profesor
LEFT JOIN Estudiante
ON Estudiante.Grupo_de_materia = profesor.Grupo_de_materia;

-- Reporte de estudiantes por materia.
SELECT Nombre_E,Nombre_materia
FROM materia
LEFT JOIN Estudiante
ON Estudiante.id_materia= materia.Id_materia;

--listado de estudiantes que han tomado la materia de base de datos este trimestre (T1) o el trimestre pasado (T4)
select Matricula_Estudiante,Nombre_e,Nombre_materia from Estudiante 
JOIN Materia 
on estudiante.Id_materia=materia.id_materia
where Nombre_materia='Base de datos' and Trimestre_Cursando='T1' or Trimestre_Cursando='T4'

--crea un script que elimine los estudiantes que estén inactivos y no tengan clase este trimestre en este estaremos eliminando los del trimestre antepasado
create procedure Eliminar_inativos as delete from Estudiante where Trimestre_Cursando = 'T2' and Trimestre_Cursando = 'T3' and Trimestre_Cursando = 'T4'
exec Eliminar_inativos


