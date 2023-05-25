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
genero CHAR(1) NOT NULL,
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
distanciaEntrenamiento INTEGER NOT NULL,
fechaEntrenamiento DATE NOT NULL,
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
distanciaEvento INT NOT NULL,
PRIMARY KEY (codigoEvento)
);

-- Table Categoria

CREATE TABLE Categoria (
nombreCategoria CHAR(50) NOT NULL,
PRIMARY KEY (nombreCategoria)
);

-- Table Tiene historial

CREATE TABLE Tiene_historial (
codigoCorredor INTEGER NOT NULL,
codigoEntrenamiento INTEGER NOT NULL,
PRIMARY KEY (codigoCorredor, codigoEntrenamiento)
);

-- Add keys for table Tiene historial

ALTER TABLE Tiene_historial ADD CONSTRAINT Relationship1 FOREIGN KEY (codigoCorredor) REFERENCES Corredor (codigoCorredor);
ALTER TABLE Tiene_historial ADD CONSTRAINT Relationship2 FOREIGN KEY (codigoEntrenamiento) REFERENCES Entrenamiento (codigo);

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
codigoCorredor INTEGER NOT NULL,
codigoLiga INTEGER NOT NULL,
codigoClub INTEGER NOT NULL,
PRIMARY KEY (codigoCorredor, codigoLiga)
);

-- Add keys for table Representa

ALTER TABLE Representa ADD CONSTRAINT Relationship17 FOREIGN KEY (codigoCorredor) REFERENCES Corredor (codigoCorredor);
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

INSERT INTO Corredor (codigoCorredor, nombre, estatura, Peso, fechaNac, genero) VALUES
(1, 'Juan Perez', 1.75, 70, '1990-01-01', 'M'),
(2, 'Maria Rodriguez', 1.60, 55, '1995-05-05', 'F'),
(3, 'Carlos Sanchez', 1.85, 80, '1985-11-11', 'M'),
(4, 'Laura Gomez', 1.70, 60, '1998-03-03', 'F'),
(5, 'Pedro Hernandez', 1.80, 75, '1992-07-07', 'M'),
(6, 'Ana Torres', 1.65, 58, '1993-09-09', 'F'),
(7, 'Luisa Martinez', 1.68, 63, '1991-02-02', 'F'),
(8, 'Jorge Garcia', 1.76, 73, '1988-04-04', 'M'),
(9, 'Diego Fernandez', 1.90, 85, '1987-06-06', 'M'),
(10, 'Sofia Ramirez', 1.62, 50, '1997-08-08', 'F');

-- Tabla Liga

INSERT INTO Liga (codigoLiga, nombre) VALUES
(1, 'Liga de Atletismo de Madrid'),
(2, 'Liga de Atletismo de Barcelona');

-- Tabla Evento

INSERT INTO Evento (codigoEvento, nombre, fecha, codigoLiga, distanciaEvento) VALUES (1, 'Carrera de 10 km', '2023-05-01', 1, 10);
INSERT INTO Evento (codigoEvento, nombre, fecha, codigoLiga, distanciaEvento) VALUES (2, 'Media maraton', '2023-05-02', 1, 5);
INSERT INTO Evento (codigoEvento, nombre, fecha, codigoLiga, distanciaEvento) VALUES (3, 'Carrera de 5km', '2023-05-03', 2, 8);
INSERT INTO Evento (codigoEvento, nombre, fecha, codigoLiga, distanciaEvento) VALUES (4, 'Carrera de 15km', '2023-05-04', NULL, 3);
INSERT INTO Evento (codigoEvento, nombre, fecha, codigoLiga, distanciaEvento) VALUES (5, 'Maraton', '2023-05-05', NULL, 2);

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

INSERT INTO Representa (codigoCorredor, codigoLiga, codigoClub) VALUES
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

INSERT INTO Entrenamiento (codigo, distanciaEntrenamiento, fechaEntrenamiento) VALUES
(1, 5, '2023-04-01'),
(2, 10, '2023-04-02'),
(3, 15, '2023-04-03'),
(4, 20, '2023-04-04'),
(5, 25, '2023-04-05');

-- Tabla Tiene_historial

INSERT INTO Tiene_historial (codigoCorredor, codigoEntrenamiento) VALUES
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

ALTER TABLE Participa ADD numParticipacion INTEGER NOT NULL;
UPDATE Participa SET numParticipacion = 1 WHERE codigoCorredor = 1 AND codigoEvento = 1;
UPDATE Participa SET numParticipacion = 2 WHERE codigoCorredor = 2 AND codigoEvento = 1;
UPDATE Participa SET numParticipacion = 3 WHERE codigoCorredor = 3 AND codigoEvento = 1;