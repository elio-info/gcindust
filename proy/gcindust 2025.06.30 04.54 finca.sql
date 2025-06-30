-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2025 at 01:55 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gcindust`
--

-- --------------------------------------------------------

--
-- Table structure for table `departamento_entidad`
--

CREATE TABLE IF NOT EXISTS `departamento_entidad` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(255) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `departamento_entidad`
--

INSERT INTO `departamento_entidad` (`id_departamento`, `nombre_departamento`) VALUES
(1, 'Industrial'),
(2, 'Calidad');

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(255) NOT NULL,
  `responsable_empresa` varchar(255) DEFAULT NULL,
  `direccion_empresa` varchar(255) DEFAULT NULL,
  `telefono_empresa` varchar(255) DEFAULT NULL,
  `email_empresa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nombre_empresa`, `responsable_empresa`, `direccion_empresa`, `telefono_empresa`, `email_empresa`) VALUES
(1, 'La Cochita', 'Concha', 'Barrio La Cochita', '487699098', 'lc@pinar.pri');

-- --------------------------------------------------------

--
-- Table structure for table `grados_cientificos`
--

CREATE TABLE IF NOT EXISTS `grados_cientificos` (
  `id_gradocientifico` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_gradocientifico` varchar(255) NOT NULL,
  PRIMARY KEY (`id_gradocientifico`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `grados_cientificos`
--

INSERT INTO `grados_cientificos` (`id_gradocientifico`, `nombre_gradocientifico`) VALUES
(1, 'Doctor Dr.'),
(2, 'Master Ms.');

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `id_persona` varchar(11) NOT NULL,
  `nombre_persona` varchar(255) NOT NULL,
  `apellido_persona` varchar(255) DEFAULT NULL,
  `departamento_persona` int(11) NOT NULL,
  `plan_de_trabajo_persona` text,
  `usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rango` int(11) DEFAULT '2' COMMENT 'rango trabajador de los proyectos',
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `departamento_persona` (`departamento_persona`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre_persona`, `apellido_persona`, `departamento_persona`, `plan_de_trabajo_persona`, `usuario`, `contrasena`, `rango`) VALUES
('1', 'werwer', 'werwer', 1, NULL, 'ww', 'ww', 2);

-- --------------------------------------------------------

--
-- Table structure for table `persona_rango`
--

CREATE TABLE IF NOT EXISTS `persona_rango` (
  `id_rango` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rango` varchar(50) COLLATE utf16_spanish_ci NOT NULL COMMENT 'nombre del rango dentro del sitio',
  `Desc` text COLLATE utf16_spanish_ci NOT NULL COMMENT 'explicacion',
  PRIMARY KEY (`id_rango`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci COMMENT='aqui se definen los rangos d los usuarios dentro del sistema,no en proyectos' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `persona_rango`
--

INSERT INTO `persona_rango` (`id_rango`, `nombre_rango`, `Desc`) VALUES
(1, 'agente', 'sera la persona destinada a todo el proceso de administracion del sitio'),
(2, 'experto', 'seran lostrabajadores del proyecto:expertos y lideres de proyectos');

-- --------------------------------------------------------

--
-- Table structure for table `proyecto`
--

CREATE TABLE IF NOT EXISTS `proyecto` (
  `id_proyecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` varchar(255) NOT NULL,
  `nombre_responsable_proyecto` varchar(255) NOT NULL,
  `dia_solicitud_proyecto` datetime DEFAULT NULL,
  `presupuesto_proyecto` decimal(10,0) DEFAULT NULL,
  `tiempo_estimado_proyecto` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado_proyecto` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_proyecto`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `proyecto`
--

INSERT INTO `proyecto` (`id_proyecto`, `nombre_proyecto`, `nombre_responsable_proyecto`, `dia_solicitud_proyecto`, `presupuesto_proyecto`, `tiempo_estimado_proyecto`, `id_empresa`, `estado_proyecto`) VALUES
(1, 'Calidad mayonesa Conchita', 'Paco', '2025-06-24 00:00:00', '12000', 25, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `proyecto_estados`
--

CREATE TABLE IF NOT EXISTS `proyecto_estados` (
  `id_estado_proyecto` int(11) NOT NULL,
  `nombre_estado_proyecto` varchar(50) COLLATE utf16_spanish_ci NOT NULL,
  PRIMARY KEY (`id_estado_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `proyecto_estados`
--

INSERT INTO `proyecto_estados` (`id_estado_proyecto`, `nombre_estado_proyecto`) VALUES
(1, 'Propuesto'),
(2, 'Denegado'),
(3, 'Aceptado');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_persona`
--
CREATE TABLE IF NOT EXISTS `vw_persona` (
`id_persona` varchar(11)
,`nombre_persona` varchar(255)
,`apellido_persona` varchar(255)
,`departamento_persona` int(11)
,`plan_de_trabajo_persona` text
,`usuario` varchar(255)
,`contrasena` varchar(255)
,`id_departamento` int(11)
,`nombre_departamento` varchar(255)
,`rango` int(11)
,`nombre_rango` varchar(50)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_pry`
--
CREATE TABLE IF NOT EXISTS `vw_pry` (
`id_proyecto` int(11)
,`nombre_proyecto` varchar(255)
,`nombre_responsable_proyecto` varchar(255)
,`dia_solicitud_proyecto` datetime
,`presupuesto_proyecto` decimal(10,0)
,`tiempo_estimado_proyecto` int(11)
,`id_empresa` int(11)
,`nombre_empresa` varchar(255)
,`direccion_empresa` varchar(255)
,`email_empresa` varchar(255)
,`responsable_empresa` varchar(255)
,`telefono_empresa` varchar(255)
,`estado_proyecto` int(2)
,`id_estado_proyecto` int(11)
,`nombre_estado_proyecto` varchar(50)
);
-- --------------------------------------------------------

--
-- Structure for view `vw_persona`
--
DROP TABLE IF EXISTS `vw_persona`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_persona` AS select `prs`.`id_persona` AS `id_persona`,`prs`.`nombre_persona` AS `nombre_persona`,`prs`.`apellido_persona` AS `apellido_persona`,`prs`.`departamento_persona` AS `departamento_persona`,`prs`.`plan_de_trabajo_persona` AS `plan_de_trabajo_persona`,`prs`.`usuario` AS `usuario`,`prs`.`contrasena` AS `contrasena`,`dp`.`id_departamento` AS `id_departamento`,`dp`.`nombre_departamento` AS `nombre_departamento`,`prs`.`rango` AS `rango`,`rng`.`nombre_rango` AS `nombre_rango` from ((`persona` `prs` left join `departamento_entidad` `dp` on((`dp`.`id_departamento` = `prs`.`departamento_persona`))) left join `persona_rango` `rng` on((`rng`.`id_rango` = `prs`.`rango`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_pry`
--
DROP TABLE IF EXISTS `vw_pry`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pry` AS select `pry`.`id_proyecto` AS `id_proyecto`,`pry`.`nombre_proyecto` AS `nombre_proyecto`,`pry`.`nombre_responsable_proyecto` AS `nombre_responsable_proyecto`,`pry`.`dia_solicitud_proyecto` AS `dia_solicitud_proyecto`,`pry`.`presupuesto_proyecto` AS `presupuesto_proyecto`,`pry`.`tiempo_estimado_proyecto` AS `tiempo_estimado_proyecto`,`pry`.`id_empresa` AS `id_empresa`,`emp`.`nombre_empresa` AS `nombre_empresa`,`emp`.`direccion_empresa` AS `direccion_empresa`,`emp`.`email_empresa` AS `email_empresa`,`emp`.`responsable_empresa` AS `responsable_empresa`,`emp`.`telefono_empresa` AS `telefono_empresa`,`pry`.`estado_proyecto` AS `estado_proyecto`,`prye`.`id_estado_proyecto` AS `id_estado_proyecto`,`prye`.`nombre_estado_proyecto` AS `nombre_estado_proyecto` from ((`proyecto` `pry` left join `proyecto_estados` `prye` on((`prye`.`id_estado_proyecto` = `pry`.`estado_proyecto`))) left join `empresa` `emp` on((`emp`.`id_empresa` = `pry`.`id_empresa`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
