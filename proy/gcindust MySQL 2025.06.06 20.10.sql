-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-06-2025 a las 00:53:35
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gcindust`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento_entidad`
--

DROP TABLE IF EXISTS `departamento_entidad`;
CREATE TABLE IF NOT EXISTS `departamento_entidad` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(255) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento_entidad`
--

INSERT INTO `departamento_entidad` (`id_departamento`, `nombre_departamento`) VALUES
(1, 'Industrial'),
(2, 'Calidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(255) NOT NULL,
  `responsable_empresa` varchar(255) DEFAULT NULL,
  `direccion_empresa` varchar(255) DEFAULT NULL,
  `telefono_empresa` varchar(255) DEFAULT NULL,
  `email_empresa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados_cientificos`
--

DROP TABLE IF EXISTS `grados_cientificos`;
CREATE TABLE IF NOT EXISTS `grados_cientificos` (
  `id_gradocientifico` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_gradocientifico` varchar(255) NOT NULL,
  PRIMARY KEY (`id_gradocientifico`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grados_cientificos`
--

INSERT INTO `grados_cientificos` (`id_gradocientifico`, `nombre_gradocientifico`) VALUES
(1, 'Doctor Dr.'),
(2, 'Master Ms.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_persona` varchar(255) NOT NULL,
  `apellido_persona` varchar(255) DEFAULT NULL,
  `departamento_persona` int(11) NOT NULL,
  `plan_de_trabajo_persona` text,
  `usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `departamento_persona` (`departamento_persona`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE IF NOT EXISTS `proyecto` (
  `id_proyecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` varchar(255) NOT NULL,
  `nombre_responsable_proyecto` varchar(255) NOT NULL,
  `dia_solicitud_proyecto` datetime DEFAULT NULL,
  `presupuesto_proyecto` decimal(10,0) DEFAULT NULL,
  `tiempo_estimado_proyecto` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado_proyecto` enum('Propuesto','Denegado','Aceptado') DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
