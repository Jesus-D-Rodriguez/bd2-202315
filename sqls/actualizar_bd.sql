/*
Created: 08/04/2020
Modified: 12/04/2023 11:50 PM
Project: Videorental Project
Model: Videorental
Company: Quest Software, Inc.
Author: Radim Mario Tkacik
Database: MariaDB
*/

-- Table Corredor

CREATE TABLE Corredor (
codigoCorredor INTEGER NOT NULL,
nombre CHAR(50) NOT NULL,
estatura FLOAT NOT NULL,
Peso FLOAT NOT NULL,
fechaNac DATE NOT NULL,
PRIMARY KEY (codigoCorredor)
);

-- Table Liga

CREATE TABLE Liga (
codigoLiga INTEGER NOT NULL,
nombre CHAR(50) NOT NULL,
PRIMARY KEY (codigoLiga)
);

-- Table Entrenamiento

CREATE TABLE Entrenamiento (
codigo INTEGER NOT NULL,
PRIMARY KEY (codigo)
);

-- Add unique key for table Entrenamiento

ALTER TABLE Entrenamiento ADD CONSTRAINT codigo UNIQUE (codigo);

-- Table Club

CREATE TABLE Club (
codigoClub INTEGER NOT NULL,
PRIMARY KEY (codigoClub)
);

-- Table Tipo

CREATE TABLE Tipo (
Nombre CHAR(50) NOT NULL,
PRIMARY KEY (Nombre)
);

-- Table Evento

CREATE TABLE Evento (
codigoEvento INTEGER NOT NULL,
nombre CHAR(50) NOT NULL,
fecha DATE NOT NULL,
PRIMARY KEY (codigoEvento)
);

-- Table Categoria

CREATE TABLE Categoria (
nombreCategoria CHAR(50) NOT NULL,
PRIMARY KEY (nombreCategoria)
);

-- Table Tiene historial

CREATE TABLE Tiene_historial (
codigo INTEGER NOT NULL,
Attribute1 INTEGER NOT NULL,
PRIMARY KEY (codigo)
);

-- Add keys for table Tiene historial

ALTER TABLE Tiene_historial ADD CONSTRAINT Relationship1 FOREIGN KEY (codigo) REFERENCES Corredor (codigoCorredor);
ALTER TABLE Tiene_historial ADD CONSTRAINT Relationship2 FOREIGN KEY (Attribute1) REFERENCES Entrenamiento (codigo);

-- Table Tiene tipo

CREATE TABLE Tiene_tipo (
codigo INTEGER NOT NULL,
Nombre CHAR(50) NOT NULL,
PRIMARY KEY (codigo)
);

-- Add keys for table Tiene tipo

ALTER TABLE Tiene_tipo ADD CONSTRAINT Relationship8 FOREIGN KEY (codigo) REFERENCES Entrenamiento (codigo);
ALTER TABLE Tiene_tipo ADD CONSTRAINT Relationship9 FOREIGN KEY (Nombre) REFERENCES Tipo (Nombre);

-- Table Representa

CREATE TABLE Representa (
codigo INTEGER NOT NULL,
codigoLiga INTEGER NOT NULL,
codigoClub INTEGER NOT NULL,
PRIMARY KEY (codigo, codigoLiga)
);

-- Add keys for table Representa

ALTER TABLE Representa ADD CONSTRAINT Relationship17 FOREIGN KEY (codigo) REFERENCES Corredor (codigoCorredor);
ALTER TABLE Representa ADD CONSTRAINT Relationship18 FOREIGN KEY (codigoLiga) REFERENCES Liga (codigoLiga);
ALTER TABLE Representa ADD CONSTRAINT Relationship19 FOREIGN KEY (codigoClub) REFERENCES Club (codigoClub);

-- Table Participa

CREATE TABLE Participa (
codigoCorredor INTEGER NOT NULL,
codigoEvento INTEGER NOT NULL,
nombreCategoria CHAR(50) NOT NULL,
tiempo FLOAT NOT NULL,
PRIMARY KEY (codigoCorredor, codigoEvento, nombreCategoria)
);

-- Add keys for table Participa

ALTER TABLE Participa ADD CONSTRAINT Relationship20 FOREIGN KEY (codigoCorredor) REFERENCES Corredor (codigoCorredor);
ALTER TABLE Participa ADD CONSTRAINT Relationship21 FOREIGN KEY (codigoEvento) REFERENCES Evento (codigoEvento);
ALTER TABLE Participa ADD CONSTRAINT Relationship22 FOREIGN KEY (nombreCategoria) REFERENCES Categoria (nombreCategoria);

ALTER TABLE Evento ADD codigoLiga INTEGER NOT NULL;

ALTER TABLE Evento ADD CONSTRAINT FK_Evento_Liga FOREIGN KEY (codigoLiga) REFERENCES Liga (codigoLiga);
ALTER TABLE Evento MODIFY codigoLiga INTEGER NULL;

-- Tabla Corredor

INSERT INTO Corredor (codigoCorredor, nombre, estatura, Peso, fechaNac) VALUES
(1, 'Juan Perez', 1.75, 70, '1990-01-01'),
(2, 'Maria Rodriguez', 1.60, 55, '1995-05-05'),
(3, 'Carlos Sanchez', 1.85, 80, '1985-11-11'),
(4, 'Laura Gomez', 1.70, 60, '1998-03-03'),
(5, 'Pedro Hernandez', 1.80, 75, '1992-07-07'),
(6, 'Ana Torres', 1.65, 58, '1993-09-09'),
(7, 'Luisa Martinez', 1.68, 63, '1991-02-02'),
(8, 'Jorge Garcia', 1.76, 73, '1988-04-04'),
(9, 'Diego Fernandez', 1.90, 85, '1987-06-06'),
(10, 'Sofia Ramirez', 1.62, 50, '1997-08-08');

-- Tabla Liga

INSERT INTO Liga (codigoLiga, nombre) VALUES
(1, 'Liga de Atletismo de Madrid'),
(2, 'Liga de Atletismo de Barcelona');

-- Tabla Evento

INSERT INTO Evento (codigoEvento, nombre, fecha, codigoLiga) VALUES (1, 'Carrera de 10 km', '2023-05-01', 1);
INSERT INTO Evento (codigoEvento, nombre, fecha, codigoLiga) VALUES (2, 'Media maraton', '2023-05-02', 1);
INSERT INTO Evento (codigoEvento, nombre, fecha, codigoLiga) VALUES (3, 'Carrera de 5km', '2023-05-03', 2);
INSERT INTO Evento (codigoEvento, nombre, fecha, codigoLiga) VALUES (4, 'Carrera de 15km', '2023-05-04', NULL);
INSERT INTO Evento (codigoEvento, nombre, fecha, codigoLiga) VALUES (5, 'Maraton', '2023-05-05', NULL);

-- Tabla Categoria

INSERT INTO Categoria (nombreCategoria) VALUES
('Juvenil'),
('Senior'),
('Master 30'),
('Master 40'),
('Master 50');

-- Tabla Club

INSERT INTO Club (codigoClub) VALUES
(1),
(2),
(3),
(4),
(5);

-- Tabla Representa

INSERT INTO Representa (codigo, codigoLiga, codigoClub) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5);

-- Tabla Participa

INSERT INTO Participa (codigoCorredor, codigoEvento, nombreCategoria, tiempo) VALUES
(1, 1, 'Juvenil', 45.5),
(2, 1, 'Senior', 50.2),
(3, 1, 'Master 30', 42.1),
(4, 2, 'Master 40', 85.3),
(5, 2, 'Master 50', 120),
(6, 3, 'Juvenil', 20),
(7, 3, 'Senior', 25),
(8, 4, 'Master 30', 63.5),
(9, 4, 'Master 40', 77.8),
(10, 5, 'Senior', 180);

-- Tabla Entrenamiento

INSERT INTO Entrenamiento (codigo) VALUES
(1),
(2),
(3),
(4),
(5);

-- Tabla Tiene_historial

INSERT INTO Tiene_historial (codigo, Attribute1) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Tabla Tipo

INSERT INTO Tipo (Nombre) VALUES
('Fuerza'),
('Cardiovascular'),
('Flexibilidad'),
('Resistencia'),
('Velocidad');

-- Tabla Tiene_tipo

INSERT INTO Tiene_tipo (codigo, Nombre) VALUES
(1, 'Fuerza'),
(2, 'Cardiovascular'),
(3, 'Flexibilidad'),
(4, 'Resistencia'),
(5, 'Velocidad');