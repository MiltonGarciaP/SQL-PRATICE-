-- Crear la base de datos Ciencia_DATOS
CREATE DATABASE Ciencia_DATOS;
GO

-- Usar la base de datos Ciencia_DATOS
USE Ciencia_DATOS;
GO

-- Crear la tabla Universidades
CREATE TABLE Universidades (
    Nombre_Univ NVARCHAR(100),
    Comunidad NVARCHAR(35),
    Plazas INTEGER,
    PRIMARY KEY (Nombre_Univ),
    UNIQUE (Nombre_Univ, Comunidad)
);

-- Crear la tabla Estudiantes
CREATE TABLE Estudiantes (
    ID INTEGER,
    Nombre_Est NVARCHAR(100),
    Nota REAL,
    Valor INTEGER,
    PRIMARY KEY (ID),
    UNIQUE (ID)
);

-- Crear la tabla Solicitudes
CREATE TABLE Solicitudes (
    ID INTEGER,
    Nombre_Univ NVARCHAR(100),
    Carrera NVARCHAR(100),
    Decision CHAR(35),
    PRIMARY KEY (ID, Nombre_Univ, Carrera),
    FOREIGN KEY (ID) REFERENCES Estudiantes(ID),
    FOREIGN KEY (Nombre_Univ) REFERENCES Universidades(Nombre_Univ),
    UNIQUE (ID, Nombre_Univ, Carrera)
);

-- Insertar datos en la tabla Estudiantes
INSERT INTO Estudiantes VALUES
(123, 'Aquino', 8.9, 1000),
(234, 'Felix', 8.6, 1500),
(345, 'Haxel', 8.5, 500)
-- ... otras inserciones ...

-- Insertar datos en la tabla Universidades
INSERT INTO Universidades VALUES
('Instituto Tecnologico de las Americas ITLA', 'Santo Domingo', 36000),
('ITLA', 'Santo Domingo', 21000)
-- ... otras inserciones ...

-- Insertar datos en la tabla Solicitudes
INSERT INTO Solicitudes VALUES
(123, 'Instituto Tecnologico de las Americas ITLA', 'Bases de Datos I', 'Si'),
(123, 'Instituto Tecnologico de las Americas ITLA', 'Ciencia de Datos', 'No'),
(123, 'Instituto Tecnologico de las Americas ITLA', 'Informatica', 'Si'),
(123, 'ITLA', 'Computos', 'Si')
-- ... otras inserciones ...
