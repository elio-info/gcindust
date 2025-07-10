-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 10-07-2025 a las 02:43:15
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
-- Estructura de tabla para la tabla `acapite`
--

DROP TABLE IF EXISTS `acapite`;
CREATE TABLE IF NOT EXISTS `acapite` (
  `id_acapite` int(11) NOT NULL,
  `id_lista_chequeo` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `nombre_acapite` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_acapite`),
  KEY `id_lista_chequeo` (`id_lista_chequeo`),
  KEY `id_pregunta` (`id_pregunta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acapite_respuestas`
--

DROP TABLE IF EXISTS `acapite_respuestas`;
CREATE TABLE IF NOT EXISTS `acapite_respuestas` (
  `id_lista_chequeo` int(11) NOT NULL,
  `id_acapite` int(11) NOT NULL,
  `fecha_acapite_respuesta` date DEFAULT NULL,
  `porcentaje_cumplimiento_general` decimal(10,0) DEFAULT NULL,
  KEY `id_lista_chequeo` (`id_lista_chequeo`),
  KEY `id_acapite` (`id_acapite`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprobaciones_proyecto`
--

DROP TABLE IF EXISTS `aprobaciones_proyecto`;
CREATE TABLE IF NOT EXISTS `aprobaciones_proyecto` (
  `id_proyecto` int(11) NOT NULL,
  `aprobado_consejo` tinyint(1) DEFAULT NULL,
  `aprobado_rector` tinyint(1) DEFAULT NULL,
  `aprobado_direccion` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cumplimineto_lista_chequeo`
--

DROP TABLE IF EXISTS `cumplimineto_lista_chequeo`;
CREATE TABLE IF NOT EXISTS `cumplimineto_lista_chequeo` (
  `id_lista_chequeo` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `porcentaje` decimal(10,0) DEFAULT NULL,
  KEY `id_lista_chequeo` (`id_lista_chequeo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento_entidad`
--

DROP TABLE IF EXISTS `departamento_entidad`;
CREATE TABLE IF NOT EXISTS `departamento_entidad` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(255) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento_entidad`
--

INSERT INTO `departamento_entidad` (`id_departamento`, `nombre_departamento`) VALUES
(1, 'Industrial'),
(2, 'Calidad'),
(3, 'Atencion al Hombre');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nombre_empresa`, `responsable_empresa`, `direccion_empresa`, `telefono_empresa`, `email_empresa`) VALUES
(1, 'sdfg', 'un sato perro', 'ss dfg   sdefgdsfg', '3453', 'rtr@tt.mp'),
(5, 'ddd', 'dddd', 'dddfjfjdf, fidiudjd', '2234234234', 'wer@rr.ll'),
(4, 'qwq', 'weqweqwqwe', 'qweqwqweqweqweqwe', 'q22', '2222@dd.com'),
(6, 'La Cochita', 'Concha', 'Barrio La Cochita', '487699098', 'lc@pinar.pri'),
(2, 'Perdularias', 'Totica', 'Rumbo a las yagrumas', '55776677', 'sutotica@r.co'),
(3, 'qqqqq', 'qqqqqq', 'qqqqqq', '333333333', 'er@df.cv');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta_experto`
--

DROP TABLE IF EXISTS `encuesta_experto`;
CREATE TABLE IF NOT EXISTS `encuesta_experto` (
  `id_experto` varchar(11) NOT NULL,
  `clasificacion_profesional` int(11) DEFAULT NULL,
  `cargo_actual` text,
  `anos_experiencia` int(11) DEFAULT NULL,
  `p1_grado_conocimiento` int(11) DEFAULT NULL,
  `p2_influencia_analisis_teorico` int(11) DEFAULT NULL,
  `p2_influencia_experiencia_obtenida` int(11) DEFAULT NULL,
  `p2_influencia_trabajos_nacionales` int(11) DEFAULT NULL,
  `p2_influencia_trabajos_extranjeros` int(11) DEFAULT NULL,
  `p2_influencia_conocimiento_estado_extranjero` int(11) DEFAULT NULL,
  `p2_influencia_intuicion` int(11) DEFAULT NULL,
  `estado_encuesta` tinyint(1) NOT NULL DEFAULT '0',
  `id_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id_experto`,`id_grupo`),
  KEY `clasificacion_profesional` (`clasificacion_profesional`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `encuesta_experto`
--

INSERT INTO `encuesta_experto` (`id_experto`, `clasificacion_profesional`, `cargo_actual`, `anos_experiencia`, `p1_grado_conocimiento`, `p2_influencia_analisis_teorico`, `p2_influencia_experiencia_obtenida`, `p2_influencia_trabajos_nacionales`, `p2_influencia_trabajos_extranjeros`, `p2_influencia_conocimiento_estado_extranjero`, `p2_influencia_intuicion`, `estado_encuesta`, `id_grupo`) VALUES
('2334', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
('e2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
('2334', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2),
('e2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2),
('e3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta_satisfaccion`
--

DROP TABLE IF EXISTS `encuesta_satisfaccion`;
CREATE TABLE IF NOT EXISTS `encuesta_satisfaccion` (
  `id_pregunta` int(11) NOT NULL,
  `id_proyecto` int(11) DEFAULT NULL,
  `pregunta` text,
  `formato_calificacion` text,
  PRIMARY KEY (`id_pregunta`),
  KEY `id_proyecto` (`id_proyecto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_encuesta_satisfaccion`
--

DROP TABLE IF EXISTS `evaluacion_encuesta_satisfaccion`;
CREATE TABLE IF NOT EXISTS `evaluacion_encuesta_satisfaccion` (
  `id_proyecto` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `evaluacion` int(11) DEFAULT NULL,
  `estado_encuesta_satisfaccion` tinyint(1) DEFAULT NULL,
  KEY `id_proyecto` (`id_proyecto`),
  KEY `id_pregunta` (`id_pregunta`),
  KEY `id_persona` (`id_persona`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experto`
--

DROP TABLE IF EXISTS `experto`;
CREATE TABLE IF NOT EXISTS `experto` (
  `id_experto` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `Cargo` varchar(255) DEFAULT NULL,
  `Anios_experiencia` int(11) DEFAULT NULL,
  `Grado_cientifico` int(11) DEFAULT NULL,
  `coeficiente_conocimiento` decimal(10,0) DEFAULT NULL,
  `coeficiente_argumentacion` decimal(10,0) DEFAULT NULL,
  `indice_experticidad` decimal(10,0) DEFAULT NULL,
  `estado_encuesta` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_experto`),
  KEY `id_persona` (`id_persona`),
  KEY `Grado_cientifico` (`Grado_cientifico`)
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grados_cientificos`
--

INSERT INTO `grados_cientificos` (`id_gradocientifico`, `nombre_gradocientifico`) VALUES
(1, 'Doctor Dr.'),
(2, 'Master Ms.'),
(4, 'Especialista Esp.'),
(5, 'Ingeniero Ing.'),
(6, 'Licenciado Lic.'),
(7, 'Tecnico Tec.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_proyecto`
--

DROP TABLE IF EXISTS `grupos_proyecto`;
CREATE TABLE IF NOT EXISTS `grupos_proyecto` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `id_proyecto` int(11) NOT NULL,
  `nombre_grupo` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci DEFAULT NULL,
  `cantidad_expertos` int(11) DEFAULT NULL,
  `proporcion_errores` decimal(10,0) DEFAULT NULL,
  `nivel_confianza` decimal(10,0) DEFAULT NULL,
  `estado` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_grupo`),
  KEY `id_proyecto` (`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='empieza con datos nulos, despues se llena';

--
-- Volcado de datos para la tabla `grupos_proyecto`
--

INSERT INTO `grupos_proyecto` (`id_grupo`, `id_proyecto`, `nombre_grupo`, `cantidad_expertos`, `proporcion_errores`, `nivel_confianza`, `estado`) VALUES
(1, 3, 'jffurjfjj', NULL, NULL, NULL, 1),
(2, 3, 'sdgfsdgrr', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_experto`
--

DROP TABLE IF EXISTS `grupo_experto`;
CREATE TABLE IF NOT EXISTS `grupo_experto` (
  `id_grupo` int(11) NOT NULL,
  `id_experto` int(11) NOT NULL COMMENT 'experto asociado',
  `nombre_grupo` varchar(255) DEFAULT NULL,
  `cantidad_expertos` int(11) DEFAULT NULL,
  `proporcion_errores` decimal(10,0) DEFAULT NULL,
  `nivel_confianza` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_grupo`),
  KEY `id_proyecto` (`id_experto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ideas_tormentaideas`
--

DROP TABLE IF EXISTS `ideas_tormentaideas`;
CREATE TABLE IF NOT EXISTS `ideas_tormentaideas` (
  `id_idea` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_tormenta` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_idea`),
  KEY `id_proyecto` (`id_proyecto`),
  KEY `id_tormenta` (`id_tormenta`),
  KEY `id_persona` (`id_persona`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listado_grupo_experto`
--

DROP TABLE IF EXISTS `listado_grupo_experto`;
CREATE TABLE IF NOT EXISTS `listado_grupo_experto` (
  `id_proyecto` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_experto` varchar(11) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`,`id_grupo`,`id_experto`),
  KEY `id_grupo` (`id_grupo`),
  KEY `id_experto` (`id_experto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `listado_grupo_experto`
--

INSERT INTO `listado_grupo_experto` (`id_proyecto`, `id_grupo`, `id_experto`, `estado`) VALUES
(3, 1, 'e2', 0),
(3, 1, '2334', 0),
(3, 2, '2334', 0),
(3, 2, 'e2', 0),
(3, 2, 'e3', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listado_tormentaideas`
--

DROP TABLE IF EXISTS `listado_tormentaideas`;
CREATE TABLE IF NOT EXISTS `listado_tormentaideas` (
  `id_proyecto` int(11) NOT NULL,
  `id_tormenta` int(11) NOT NULL,
  PRIMARY KEY (`id_proyecto`,`id_tormenta`),
  KEY `id_tormenta` (`id_tormenta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_chequeo`
--

DROP TABLE IF EXISTS `lista_chequeo`;
CREATE TABLE IF NOT EXISTS `lista_chequeo` (
  `id_lista_chequeo` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `fecha_confeccion` date DEFAULT NULL,
  `fecha_cierre` date DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_lista_chequeo`),
  KEY `id_proyecto` (`id_proyecto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_chequeo_pregunta`
--

DROP TABLE IF EXISTS `lista_chequeo_pregunta`;
CREATE TABLE IF NOT EXISTS `lista_chequeo_pregunta` (
  `id_pregunta` int(11) NOT NULL,
  `id_lista_chequeo` int(11) NOT NULL,
  `id_acapite` int(11) NOT NULL,
  `pregunta` text,
  PRIMARY KEY (`id_pregunta`),
  KEY `id_lista_chequeo` (`id_lista_chequeo`),
  KEY `id_acapite` (`id_acapite`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_chequeo_respuesta`
--

DROP TABLE IF EXISTS `lista_chequeo_respuesta`;
CREATE TABLE IF NOT EXISTS `lista_chequeo_respuesta` (
  `id_respuesta` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_acapite` int(11) NOT NULL,
  `id_lista_chequeo` int(11) NOT NULL,
  `respuesta` tinyint(1) DEFAULT NULL,
  `fecha_respuesta` date DEFAULT NULL,
  `valor_respuesta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_respuesta`),
  KEY `id_pregunta` (`id_pregunta`),
  KEY `id_persona` (`id_persona`),
  KEY `id_acapite` (`id_acapite`),
  KEY `id_lista_chequeo` (`id_lista_chequeo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id_persona` varchar(11) NOT NULL,
  `nombre_persona` varchar(255) NOT NULL,
  `apellido_persona` varchar(255) DEFAULT NULL,
  `departamento_persona` int(11) NOT NULL,
  `rango` int(11) NOT NULL DEFAULT '2' COMMENT 'rango de trabajador',
  `plan_de_trabajo_persona` text,
  `usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `departamento_persona` (`departamento_persona`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre_persona`, `apellido_persona`, `departamento_persona`, `rango`, `plan_de_trabajo_persona`, `usuario`, `contrasena`) VALUES
('1', 'werwer', 'werwer', 1, 1, NULL, 'rey', '123'),
('123', 'i1', 'de ind', 1, 2, NULL, 'inv1', '123'),
('2334', 'exp1', 'exp1ero', 2, 3, NULL, 'exp1', '123'),
('cal1', 'c1', 'cali', 2, 2, NULL, 'cal1', '123'),
('cl1', 'wwwerrrwerrwer', 'werwererrr', 2, 4, NULL, 'cl1', '123'),
('e2', 'werrwer', 'werwerr', 2, 3, NULL, 'exp2', '123'),
('e3', 'wwweer', 'wererrr', 2, 3, NULL, 'exp3', '123'),
('of4i3o4if3o', 'werrwr', 'werwerwr', 2, 2, NULL, 'rrr', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_rango`
--

DROP TABLE IF EXISTS `persona_rango`;
CREATE TABLE IF NOT EXISTS `persona_rango` (
  `id_rango` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rango` varchar(50) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL COMMENT 'nombre del rango dentro del sitio',
  `Desc` text CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL COMMENT 'explicacion',
  PRIMARY KEY (`id_rango`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='aqui se definen los rangos d los usuarios dentro del sistema,no en proyectos';

--
-- Volcado de datos para la tabla `persona_rango`
--

INSERT INTO `persona_rango` (`id_rango`, `nombre_rango`, `Desc`) VALUES
(1, 'administrador', 'sera la persona destinada a todo el proceso de administracion del sitio'),
(2, 'investigador', 'Es el encargado de dar los permisos a todos los usuarios de los proyectos subordinados . \r\nPermite el inicio de la Selección de expertos, así como la selección de los mismos. \r\nPermite el inicio de la confección de la encuesta de satisfacción del cliente, la aplicación de la misma, así como de la lista de chequeo. \r\nEl investigador monitorea cada proceso que se realiza.'),
(3, 'experto', 'seran los trabajadores del proyecto:expertos y lideres de proyectos'),
(4, 'clientes', 'responder encuesta o lista de chequeo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE IF NOT EXISTS `proyecto` (
  `id_proyecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` varchar(255) NOT NULL,
  `responsable_proyecto` varchar(11) NOT NULL COMMENT 'jefe del proyecto y viene de persona',
  `dia_solicitud_proyecto` datetime DEFAULT NULL,
  `presupuesto_proyecto` decimal(10,0) DEFAULT NULL,
  `tiempo_estimado_proyecto` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado_proyecto` enum('Propuesto','Denegado','Aceptado') DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`,`responsable_proyecto`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id_proyecto`, `nombre_proyecto`, `responsable_proyecto`, `dia_solicitud_proyecto`, `presupuesto_proyecto`, `tiempo_estimado_proyecto`, `id_empresa`, `estado_proyecto`) VALUES
(1, 'Calidad mayonesa Conchita', '123', '2025-06-24 00:00:00', '12000', 25, 1, 'Aceptado'),
(2, 'sdfg', '123', '2025-07-01 00:00:00', '22', 22, 2, 'Denegado'),
(3, 'fgtrff', 'cal1', '2025-07-05 00:00:00', '23233', 33333, 3, 'Aceptado'),
(4, 'ffddf', 'cal1', '2025-07-02 00:00:00', '2222', 1122, 3, 'Denegado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_estados`
--

DROP TABLE IF EXISTS `proyecto_estados`;
CREATE TABLE IF NOT EXISTS `proyecto_estados` (
  `id_estado_proyecto` int(11) NOT NULL,
  `nombre_estado_proyecto` varchar(50) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  PRIMARY KEY (`id_estado_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `proyecto_estados`
--

INSERT INTO `proyecto_estados` (`id_estado_proyecto`, `nombre_estado_proyecto`) VALUES
(1, 'Propuesto'),
(2, 'Denegado'),
(3, 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_experto`
--

DROP TABLE IF EXISTS `proyecto_experto`;
CREATE TABLE IF NOT EXISTS `proyecto_experto` (
  `id_proyecto` int(11) NOT NULL,
  `id_experto` int(11) NOT NULL,
  PRIMARY KEY (`id_proyecto`,`id_experto`),
  KEY `id_experto` (`id_experto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tormentaideas`
--

DROP TABLE IF EXISTS `tormentaideas`;
CREATE TABLE IF NOT EXISTS `tormentaideas` (
  `id_tormenta` int(11) NOT NULL,
  `id_idea` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_tormenta`),
  KEY `id_idea` (`id_idea`),
  KEY `id_proyecto` (`id_proyecto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votacion_ideas_tormentaideas`
--

DROP TABLE IF EXISTS `votacion_ideas_tormentaideas`;
CREATE TABLE IF NOT EXISTS `votacion_ideas_tormentaideas` (
  `id_idea` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_tormenta` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  KEY `id_idea` (`id_idea`),
  KEY `id_proyecto` (`id_proyecto`),
  KEY `id_tormenta` (`id_tormenta`),
  KEY `id_persona` (`id_persona`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_grppry`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vw_grppry`;
CREATE TABLE IF NOT EXISTS `vw_grppry` (
`id_grupo` int(11)
,`id_proyecto` int(11)
,`nombre_grupo` varchar(255)
,`cantidad_expertos` int(11)
,`proporcion_errores` decimal(10,0)
,`nivel_confianza` decimal(10,0)
,`estado` int(2)
,`nombre_proyecto` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_lgx_persona`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vw_lgx_persona`;
CREATE TABLE IF NOT EXISTS `vw_lgx_persona` (
`id_proyecto` int(11)
,`id_grupo` int(11)
,`id_experto` varchar(11)
,`estado` tinyint(1)
,`nombre_persona` varchar(511)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_lgx_persona_enc`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vw_lgx_persona_enc`;
CREATE TABLE IF NOT EXISTS `vw_lgx_persona_enc` (
`id_proyecto` int(11)
,`id_grupo` int(11)
,`id_experto` varchar(11)
,`estado` tinyint(1)
,`nombre_persona` varchar(511)
,`clasificacion_profesional` int(11)
,`cargo_actual` text
,`p1_grado_conocimiento` int(11)
,`p2_influencia_analisis_teorico` int(11)
,`anos_experiencia` int(11)
,`p2_influencia_experiencia_obtenida` int(11)
,`p2_influencia_trabajos_nacionales` int(11)
,`p2_influencia_trabajos_extranjeros` int(11)
,`p2_influencia_conocimiento_estado_extranjero` int(11)
,`p2_influencia_intuicion` int(11)
,`estado_encuesta` tinyint(1)
,`nombre_grupo` varchar(255)
,`nombre_proyecto` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_mostrargrupoexpproy`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vw_mostrargrupoexpproy`;
CREATE TABLE IF NOT EXISTS `vw_mostrargrupoexpproy` (
`id_proyecto` int(11)
,`id_grupo` int(11)
,`id_experto` varchar(11)
,`estado` tinyint(1)
,`nombre_persona` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_persona`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vw_persona`;
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
-- Estructura Stand-in para la vista `vw_pry`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vw_pry`;
CREATE TABLE IF NOT EXISTS `vw_pry` (
`responsable_proyecto` varchar(11)
,`id_proyecto` int(11)
,`nombre_proyecto` varchar(255)
,`nombre_responsable_proyecto` varchar(255)
,`apellido_persona` varchar(255)
,`dia_solicitud_proyecto` datetime
,`presupuesto_proyecto` decimal(10,0)
,`tiempo_estimado_proyecto` int(11)
,`id_empresa` int(11)
,`nombre_empresa` varchar(255)
,`direccion_empresa` varchar(255)
,`email_empresa` varchar(255)
,`responsable_empresa` varchar(255)
,`telefono_empresa` varchar(255)
,`estado_proyecto` enum('Propuesto','Denegado','Aceptado')
,`id_estado_proyecto` int(11)
,`nombre_estado_proyecto` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_grppry`
--
DROP TABLE IF EXISTS `vw_grppry`;

DROP VIEW IF EXISTS `vw_grppry`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_grppry`  AS SELECT `gp`.`id_grupo` AS `id_grupo`, `gp`.`id_proyecto` AS `id_proyecto`, `gp`.`nombre_grupo` AS `nombre_grupo`, `gp`.`cantidad_expertos` AS `cantidad_expertos`, `gp`.`proporcion_errores` AS `proporcion_errores`, `gp`.`nivel_confianza` AS `nivel_confianza`, `gp`.`estado` AS `estado`, `pry`.`nombre_proyecto` AS `nombre_proyecto` FROM (`grupos_proyecto` `gp` left join `proyecto` `pry` on((`pry`.`id_proyecto` = `gp`.`id_proyecto`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_lgx_persona`
--
DROP TABLE IF EXISTS `vw_lgx_persona`;

DROP VIEW IF EXISTS `vw_lgx_persona`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_lgx_persona`  AS SELECT `lgx`.`id_proyecto` AS `id_proyecto`, `lgx`.`id_grupo` AS `id_grupo`, `lgx`.`id_experto` AS `id_experto`, `lgx`.`estado` AS `estado`, concat(`prs`.`nombre_persona`,' ',`prs`.`apellido_persona`) AS `nombre_persona` FROM (`listado_grupo_experto` `lgx` left join `persona` `prs` on((`prs`.`id_persona` = `lgx`.`id_experto`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_lgx_persona_enc`
--
DROP TABLE IF EXISTS `vw_lgx_persona_enc`;

DROP VIEW IF EXISTS `vw_lgx_persona_enc`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_lgx_persona_enc`  AS SELECT `lgx`.`id_proyecto` AS `id_proyecto`, `lgx`.`id_grupo` AS `id_grupo`, `lgx`.`id_experto` AS `id_experto`, `lgx`.`estado` AS `estado`, concat(`prs`.`nombre_persona`,' ',`prs`.`apellido_persona`) AS `nombre_persona`, `enc_xp`.`clasificacion_profesional` AS `clasificacion_profesional`, `enc_xp`.`cargo_actual` AS `cargo_actual`, `enc_xp`.`p1_grado_conocimiento` AS `p1_grado_conocimiento`, `enc_xp`.`p2_influencia_analisis_teorico` AS `p2_influencia_analisis_teorico`, `enc_xp`.`anos_experiencia` AS `anos_experiencia`, `enc_xp`.`p2_influencia_experiencia_obtenida` AS `p2_influencia_experiencia_obtenida`, `enc_xp`.`p2_influencia_trabajos_nacionales` AS `p2_influencia_trabajos_nacionales`, `enc_xp`.`p2_influencia_trabajos_extranjeros` AS `p2_influencia_trabajos_extranjeros`, `enc_xp`.`p2_influencia_conocimiento_estado_extranjero` AS `p2_influencia_conocimiento_estado_extranjero`, `enc_xp`.`p2_influencia_intuicion` AS `p2_influencia_intuicion`, `enc_xp`.`estado_encuesta` AS `estado_encuesta`, `gp`.`nombre_grupo` AS `nombre_grupo`, `gp`.`nombre_proyecto` AS `nombre_proyecto` FROM (((`listado_grupo_experto` `lgx` left join `persona` `prs` on((`prs`.`id_persona` = `lgx`.`id_experto`))) left join `encuesta_experto` `enc_xp` on(((`enc_xp`.`id_experto` = `lgx`.`id_experto`) and (`enc_xp`.`id_grupo` = `lgx`.`id_grupo`)))) left join `vw_grppry` `gp` on(((`gp`.`id_grupo` = `lgx`.`id_grupo`) and (`gp`.`id_proyecto` = `lgx`.`id_proyecto`)))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_mostrargrupoexpproy`
--
DROP TABLE IF EXISTS `vw_mostrargrupoexpproy`;

DROP VIEW IF EXISTS `vw_mostrargrupoexpproy`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_mostrargrupoexpproy`  AS SELECT `lgexp`.`id_proyecto` AS `id_proyecto`, `lgexp`.`id_grupo` AS `id_grupo`, `lgexp`.`id_experto` AS `id_experto`, `lgexp`.`estado` AS `estado`, `persona`.`nombre_persona` AS `nombre_persona` FROM ((`listado_grupo_experto` `lgexp` left join `experto` on((`experto`.`id_experto` = `lgexp`.`id_experto`))) left join `persona` on((`persona`.`id_persona` = `experto`.`id_persona`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_persona`
--
DROP TABLE IF EXISTS `vw_persona`;

DROP VIEW IF EXISTS `vw_persona`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_persona`  AS SELECT `prs`.`id_persona` AS `id_persona`, `prs`.`nombre_persona` AS `nombre_persona`, `prs`.`apellido_persona` AS `apellido_persona`, `prs`.`departamento_persona` AS `departamento_persona`, `prs`.`plan_de_trabajo_persona` AS `plan_de_trabajo_persona`, `prs`.`usuario` AS `usuario`, `prs`.`contrasena` AS `contrasena`, `dp`.`id_departamento` AS `id_departamento`, `dp`.`nombre_departamento` AS `nombre_departamento`, `prs`.`rango` AS `rango`, `rng`.`nombre_rango` AS `nombre_rango` FROM ((`persona` `prs` left join `departamento_entidad` `dp` on((`dp`.`id_departamento` = `prs`.`departamento_persona`))) left join `persona_rango` `rng` on((`rng`.`id_rango` = `prs`.`rango`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_pry`
--
DROP TABLE IF EXISTS `vw_pry`;

DROP VIEW IF EXISTS `vw_pry`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pry`  AS SELECT `pry`.`responsable_proyecto` AS `responsable_proyecto`, `pry`.`id_proyecto` AS `id_proyecto`, `pry`.`nombre_proyecto` AS `nombre_proyecto`, `prs`.`nombre_persona` AS `nombre_responsable_proyecto`, `prs`.`apellido_persona` AS `apellido_persona`, `pry`.`dia_solicitud_proyecto` AS `dia_solicitud_proyecto`, `pry`.`presupuesto_proyecto` AS `presupuesto_proyecto`, `pry`.`tiempo_estimado_proyecto` AS `tiempo_estimado_proyecto`, `pry`.`id_empresa` AS `id_empresa`, `emp`.`nombre_empresa` AS `nombre_empresa`, `emp`.`direccion_empresa` AS `direccion_empresa`, `emp`.`email_empresa` AS `email_empresa`, `emp`.`responsable_empresa` AS `responsable_empresa`, `emp`.`telefono_empresa` AS `telefono_empresa`, `pry`.`estado_proyecto` AS `estado_proyecto`, `prye`.`id_estado_proyecto` AS `id_estado_proyecto`, `prye`.`nombre_estado_proyecto` AS `nombre_estado_proyecto` FROM (((`proyecto` `pry` left join `proyecto_estados` `prye` on((`prye`.`id_estado_proyecto` = `pry`.`estado_proyecto`))) left join `empresa` `emp` on((`emp`.`id_empresa` = `pry`.`id_empresa`))) left join `persona` `prs` on((`prs`.`id_persona` = `pry`.`responsable_proyecto`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
