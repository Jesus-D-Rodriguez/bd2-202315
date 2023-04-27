-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2023 a las 00:55:21
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

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `nombreCategoria` char(50) NOT NULL,
  PRIMARY KEY (`nombreCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `club`
--

DROP TABLE IF EXISTS `club`;
CREATE TABLE IF NOT EXISTS `club` (
  `codigoClub` int(11) NOT NULL,
  PRIMARY KEY (`codigoClub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corredor`
--

DROP TABLE IF EXISTS `corredor`;
CREATE TABLE IF NOT EXISTS `corredor` (
  `codigoCorredor` int(11) NOT NULL,
  `nombre` char(50) NOT NULL,
  `estatura` float NOT NULL,
  `Peso` float NOT NULL,
  `fechaNac` date NOT NULL,
  PRIMARY KEY (`codigoCorredor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamiento`
--

DROP TABLE IF EXISTS `entrenamiento`;
CREATE TABLE IF NOT EXISTS `entrenamiento` (
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

DROP TABLE IF EXISTS `evento`;
CREATE TABLE IF NOT EXISTS `evento` (
  `codigoEvento` int(11) NOT NULL,
  `nombre` char(50) NOT NULL,
  `fecha` date NOT NULL,
  `codigoLiga` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigoEvento`),
  KEY `FK_Evento_Liga` (`codigoLiga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liga`
--

DROP TABLE IF EXISTS `liga`;
CREATE TABLE IF NOT EXISTS `liga` (
  `codigoLiga` int(11) NOT NULL,
  `nombre` char(50) NOT NULL,
  PRIMARY KEY (`codigoLiga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participa`
--

DROP TABLE IF EXISTS `participa`;
CREATE TABLE IF NOT EXISTS `participa` (
  `codigoCorredor` int(11) NOT NULL,
  `codigoEvento` int(11) NOT NULL,
  `nombreCategoria` char(50) NOT NULL,
  `tiempo` float NOT NULL,
  PRIMARY KEY (`codigoCorredor`,`codigoEvento`,`nombreCategoria`),
  KEY `Relationship21` (`codigoEvento`),
  KEY `Relationship22` (`nombreCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representa`
--

DROP TABLE IF EXISTS `representa`;
CREATE TABLE IF NOT EXISTS `representa` (
  `codigo` int(11) NOT NULL,
  `codigoLiga` int(11) NOT NULL,
  `codigoClub` int(11) NOT NULL,
  PRIMARY KEY (`codigo`,`codigoLiga`),
  KEY `Relationship18` (`codigoLiga`),
  KEY `Relationship19` (`codigoClub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiene_historial`
--

DROP TABLE IF EXISTS `tiene_historial`;
CREATE TABLE IF NOT EXISTS `tiene_historial` (
  `codigo` int(11) NOT NULL,
  `Attribute1` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `Relationship2` (`Attribute1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiene_tipo`
--

DROP TABLE IF EXISTS `tiene_tipo`;
CREATE TABLE IF NOT EXISTS `tiene_tipo` (
  `codigo` int(11) NOT NULL,
  `Nombre` char(50) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `Relationship9` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE IF NOT EXISTS `tipo` (
  `Nombre` char(50) NOT NULL,
  PRIMARY KEY (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
