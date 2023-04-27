-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2023 a las 00:56:50
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `nombreCategoria` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`nombreCategoria`) VALUES
('Juvenil'),
('Master 30'),
('Master 40'),
('Master 50'),
('Senior');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `club`
--

CREATE TABLE `club` (
  `codigoClub` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `club`
--

INSERT INTO `club` (`codigoClub`) VALUES
(1),
(2),
(3),
(4),
(5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corredor`
--

CREATE TABLE `corredor` (
  `codigoCorredor` int(11) NOT NULL,
  `nombre` char(50) NOT NULL,
  `estatura` float NOT NULL,
  `Peso` float NOT NULL,
  `fechaNac` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `corredor`
--

INSERT INTO `corredor` (`codigoCorredor`, `nombre`, `estatura`, `Peso`, `fechaNac`) VALUES
(1, 'Juan Perez', 1.75, 70, '1990-01-01'),
(2, 'Maria Rodriguez', 1.6, 55, '1995-05-05'),
(3, 'Carlos Sanchez', 1.85, 80, '1985-11-11'),
(4, 'Laura Gomez', 1.7, 60, '1998-03-03'),
(5, 'Pedro Hernandez', 1.8, 75, '1992-07-07'),
(6, 'Ana Torres', 1.65, 58, '1993-09-09'),
(7, 'Luisa Martinez', 1.68, 63, '1991-02-02'),
(8, 'Jorge Garcia', 1.76, 73, '1988-04-04'),
(9, 'Diego Fernandez', 1.9, 85, '1987-06-06'),
(10, 'Sofia Ramirez', 1.62, 50, '1997-08-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamiento`
--

CREATE TABLE `entrenamiento` (
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `entrenamiento`
--

INSERT INTO `entrenamiento` (`codigo`) VALUES
(1),
(2),
(3),
(4),
(5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `codigoEvento` int(11) NOT NULL,
  `nombre` char(50) NOT NULL,
  `fecha` date NOT NULL,
  `codigoLiga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`codigoEvento`, `nombre`, `fecha`, `codigoLiga`) VALUES
(1, 'Carrera de 10 km', '2023-05-01', 1),
(2, 'Media maraton', '2023-05-02', 1),
(3, 'Carrera de 5km', '2023-05-03', 2),
(4, 'Carrera de 15km', '2023-05-04', NULL),
(5, 'Maraton', '2023-05-05', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liga`
--

CREATE TABLE `liga` (
  `codigoLiga` int(11) NOT NULL,
  `nombre` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `liga`
--

INSERT INTO `liga` (`codigoLiga`, `nombre`) VALUES
(1, 'Liga de Atletismo de Madrid'),
(2, 'Liga de Atletismo de Barcelona');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participa`
--

CREATE TABLE `participa` (
  `codigoCorredor` int(11) NOT NULL,
  `codigoEvento` int(11) NOT NULL,
  `nombreCategoria` char(50) NOT NULL,
  `tiempo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `participa`
--

INSERT INTO `participa` (`codigoCorredor`, `codigoEvento`, `nombreCategoria`, `tiempo`) VALUES
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representa`
--

CREATE TABLE `representa` (
  `codigo` int(11) NOT NULL,
  `codigoLiga` int(11) NOT NULL,
  `codigoClub` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `representa`
--

INSERT INTO `representa` (`codigo`, `codigoLiga`, `codigoClub`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiene_historial`
--

CREATE TABLE `tiene_historial` (
  `codigo` int(11) NOT NULL,
  `Attribute1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tiene_historial`
--

INSERT INTO `tiene_historial` (`codigo`, `Attribute1`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiene_tipo`
--

CREATE TABLE `tiene_tipo` (
  `codigo` int(11) NOT NULL,
  `Nombre` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tiene_tipo`
--

INSERT INTO `tiene_tipo` (`codigo`, `Nombre`) VALUES
(2, 'Cardiovascular'),
(3, 'Flexibilidad'),
(1, 'Fuerza'),
(4, 'Resistencia'),
(5, 'Velocidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `Nombre` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`Nombre`) VALUES
('Cardiovascular'),
('Flexibilidad'),
('Fuerza'),
('Resistencia'),
('Velocidad');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`nombreCategoria`);

--
-- Indices de la tabla `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`codigoClub`);

--
-- Indices de la tabla `corredor`
--
ALTER TABLE `corredor`
  ADD PRIMARY KEY (`codigoCorredor`);

--
-- Indices de la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`codigoEvento`),
  ADD KEY `FK_Evento_Liga` (`codigoLiga`);

--
-- Indices de la tabla `liga`
--
ALTER TABLE `liga`
  ADD PRIMARY KEY (`codigoLiga`);

--
-- Indices de la tabla `participa`
--
ALTER TABLE `participa`
  ADD PRIMARY KEY (`codigoCorredor`,`codigoEvento`,`nombreCategoria`),
  ADD KEY `Relationship21` (`codigoEvento`),
  ADD KEY `Relationship22` (`nombreCategoria`);

--
-- Indices de la tabla `representa`
--
ALTER TABLE `representa`
  ADD PRIMARY KEY (`codigo`,`codigoLiga`),
  ADD KEY `Relationship18` (`codigoLiga`),
  ADD KEY `Relationship19` (`codigoClub`);

--
-- Indices de la tabla `tiene_historial`
--
ALTER TABLE `tiene_historial`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `Relationship2` (`Attribute1`);

--
-- Indices de la tabla `tiene_tipo`
--
ALTER TABLE `tiene_tipo`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `Relationship9` (`Nombre`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`Nombre`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `FK_Evento_Liga` FOREIGN KEY (`codigoLiga`) REFERENCES `liga` (`codigoLiga`);

--
-- Filtros para la tabla `participa`
--
ALTER TABLE `participa`
  ADD CONSTRAINT `Relationship20` FOREIGN KEY (`codigoCorredor`) REFERENCES `corredor` (`codigoCorredor`),
  ADD CONSTRAINT `Relationship21` FOREIGN KEY (`codigoEvento`) REFERENCES `evento` (`codigoEvento`),
  ADD CONSTRAINT `Relationship22` FOREIGN KEY (`nombreCategoria`) REFERENCES `categoria` (`nombreCategoria`);

--
-- Filtros para la tabla `representa`
--
ALTER TABLE `representa`
  ADD CONSTRAINT `Relationship17` FOREIGN KEY (`codigo`) REFERENCES `corredor` (`codigoCorredor`),
  ADD CONSTRAINT `Relationship18` FOREIGN KEY (`codigoLiga`) REFERENCES `liga` (`codigoLiga`),
  ADD CONSTRAINT `Relationship19` FOREIGN KEY (`codigoClub`) REFERENCES `club` (`codigoClub`);

--
-- Filtros para la tabla `tiene_historial`
--
ALTER TABLE `tiene_historial`
  ADD CONSTRAINT `Relationship1` FOREIGN KEY (`codigo`) REFERENCES `corredor` (`codigoCorredor`),
  ADD CONSTRAINT `Relationship2` FOREIGN KEY (`Attribute1`) REFERENCES `entrenamiento` (`codigo`);

--
-- Filtros para la tabla `tiene_tipo`
--
ALTER TABLE `tiene_tipo`
  ADD CONSTRAINT `Relationship8` FOREIGN KEY (`codigo`) REFERENCES `entrenamiento` (`codigo`),
  ADD CONSTRAINT `Relationship9` FOREIGN KEY (`Nombre`) REFERENCES `tipo` (`Nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
