CREATE TABLE `Persona` (
  `id_persona` integer PRIMARY KEY,
  `nombre` varchar(255),
  `apellido` varchar(255),
  `departamento` varchar(255),
  `plan_de_trabajo` text,
  `usuario` varchar(255),
  `contrasena` varchar(255) NOT NULL
);

CREATE TABLE `Experto` (
  `id_experto` int PRIMARY KEY,
  `id_persona` int NOT NULL,
  `Cargo` varchar(255),
  `Anios_experiencia` int,
  `Grado_cientifico` int,
  `coeficiente_conocimiento` decimal,
  `coeficiente_argumentacion` decimal,
  `indice_experticidad` decimal,
  `estado_encuesta` null
);

CREATE TABLE `Grupo_Experto` (
  `id_grupo` int PRIMARY KEY,
  `id_proyecto` int NOT NULL,
  `nombre_grupo` varchar(255),
  `cantidad_expertos` int,
  `proporcion_errores` decimal,
  `nivel_confianza` decimal
);

CREATE TABLE `Listado_Grupo_Experto` (
  `id_proyecto` int NOT NULL,
  `id_grupo` int NOT NULL,
  `id_experto` int NOT NULL,
  `estado` bool
);

CREATE TABLE `Proyecto` (
  `id_proyecto` int PRIMARY KEY,
  `id_empresa` int NOT NULL,
  `nombre_del_proyecto` varchar(255),
  `nombre_responsable` varchar(255),
  `dia_solicitud` datetime,
  `cronograma` text,
  `presupuesto` decimal,
  `tiempo_estimado` int,
  `estado_aprobado` boolean
);

CREATE TABLE `Aprobaciones_Proyecto` (
  `id_proyecto` int PRIMARY KEY,
  `aprobado_consejo` boolean,
  `aprobado_rector` boolean,
  `aprobado_direccion` boolean
);

CREATE TABLE `Proyecto_Experto` (
  `id_proyecto` int NOT NULL,
  `id_experto` int NOT NULL,
  PRIMARY KEY (`id_proyecto`, `id_experto`)
);

CREATE TABLE `Empresa` (
  `id_empresa` int PRIMARY KEY,
  `nombre` varchar(255),
  `responsable` varchar(255),
  `direccion` varchar(255),
  `telefono` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `Grados_Cientificos` (
  `id_grado_cientifico` int PRIMARY KEY,
  `nombre` varchar(255)
);

CREATE TABLE `Encuesta_Experto` (
  `id_experto` int PRIMARY KEY,
  `clasificacion_profesional` int,
  `cargo_actual` text,
  `anos_experiencia` int,
  `p1_grado_conocimiento` int,
  `p2_influencia_analisis_teorico` int,
  `p2_influencia_experiencia_obtenida` int,
  `p2_influencia_trabajos_nacionales` int,
  `p2_influencia_trabajos_extranjeros` int,
  `p2_influencia_conocimiento_estado_extranjero` int,
  `p2_influencia_intuicion` int,
  `estado_encuesta` boolean
);

CREATE TABLE `TormentaIdeas` (
  `id_tormenta` int PRIMARY KEY,
  `id_idea` int NOT NULL,
  `id_proyecto` int NOT NULL,
  `estado` boolean
);

CREATE TABLE `Listado_TormentaIdeas` (
  `id_proyecto` int NOT NULL,
  `id_tormenta` int NOT NULL,
  PRIMARY KEY (`id_proyecto`, `id_tormenta`)
);

CREATE TABLE `Ideas_TormentaIdeas` (
  `id_idea` int PRIMARY KEY,
  `id_proyecto` int NOT NULL,
  `id_tormenta` int NOT NULL,
  `id_persona` int NOT NULL,
  `estado` bool
);

CREATE TABLE `Votacion_Ideas_TormentaIdeas` (
  `id_idea` int NOT NULL,
  `id_proyecto` int NOT NULL,
  `id_tormenta` int NOT NULL,
  `id_persona` int NOT NULL,
  `prioridad` int,
  `puntuacion` int
);

CREATE TABLE `Encuesta_Satisfaccion` (
  `id_pregunta` int PRIMARY KEY,
  `id_proyecto` int,
  `pregunta` text,
  `formato_calificacion` text
);

CREATE TABLE `Evaluacion_Encuesta_Satisfaccion` (
  `id_proyecto` int,
  `id_pregunta` int,
  `id_persona` int,
  `fecha` date,
  `evaluacion` int,
  `estado_encuesta_satisfaccion` bool
);

CREATE TABLE `Lista_chequeo` (
  `id_lista_chequeo` int PRIMARY KEY,
  `id_proyecto` int NOT NULL,
  `nombre` varchar(255),
  `fecha_confeccion` date,
  `fecha_cierre` date,
  `estado` varchar(255)
);

CREATE TABLE `Acapite` (
  `id_acapite` int PRIMARY KEY,
  `id_lista_chequeo` int NOT NULL,
  `id_pregunta` int NOT NULL,
  `nombre_acapite` varchar(255)
);

CREATE TABLE `Lista_chequeo_pregunta` (
  `id_pregunta` int PRIMARY KEY,
  `id_lista_chequeo` int NOT NULL,
  `id_acapite` int NOT NULL,
  `pregunta` text
);

CREATE TABLE `Lista_chequeo_respuesta` (
  `id_respuesta` int PRIMARY KEY,
  `id_pregunta` int NOT NULL,
  `id_persona` int NOT NULL,
  `id_acapite` int NOT NULL,
  `id_lista_chequeo` int NOT NULL,
  `respuesta` boolean,
  `fecha_respuesta` date,
  `valor_respuesta` int
);

CREATE TABLE `Acapite_respuestas` (
  `id_lista_chequeo` int NOT NULL,
  `id_acapite` int NOT NULL,
  `fecha_acapite_respuesta` date,
  `porcentaje_cumplimiento_general` decimal
);

CREATE TABLE `Cumplimineto_lista_chequeo` (
  `id_lista_chequeo` integer NOT NULL,
  `fecha` date,
  `porcentaje` decimal
);

ALTER TABLE `Experto` ADD FOREIGN KEY (`id_persona`) REFERENCES `Persona` (`id_persona`);

ALTER TABLE `Experto` ADD FOREIGN KEY (`Grado_cientifico`) REFERENCES `Grados_Cientificos` (`id_grado_cientifico`);

ALTER TABLE `Grupo_Experto` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Listado_Grupo_Experto` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Listado_Grupo_Experto` ADD FOREIGN KEY (`id_grupo`) REFERENCES `Grupo_Experto` (`id_grupo`);

ALTER TABLE `Listado_Grupo_Experto` ADD FOREIGN KEY (`id_experto`) REFERENCES `Experto` (`id_experto`);

ALTER TABLE `Proyecto` ADD FOREIGN KEY (`id_empresa`) REFERENCES `Empresa` (`id_empresa`);

ALTER TABLE `Aprobaciones_Proyecto` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Proyecto_Experto` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Proyecto_Experto` ADD FOREIGN KEY (`id_experto`) REFERENCES `Experto` (`id_experto`);

ALTER TABLE `Encuesta_Experto` ADD FOREIGN KEY (`id_experto`) REFERENCES `Experto` (`id_experto`);

ALTER TABLE `Encuesta_Experto` ADD FOREIGN KEY (`clasificacion_profesional`) REFERENCES `Grados_Cientificos` (`id_grado_cientifico`);

ALTER TABLE `TormentaIdeas` ADD FOREIGN KEY (`id_idea`) REFERENCES `Ideas_TormentaIdeas` (`id_idea`);

ALTER TABLE `TormentaIdeas` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Listado_TormentaIdeas` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Listado_TormentaIdeas` ADD FOREIGN KEY (`id_tormenta`) REFERENCES `TormentaIdeas` (`id_tormenta`);

ALTER TABLE `Ideas_TormentaIdeas` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Ideas_TormentaIdeas` ADD FOREIGN KEY (`id_tormenta`) REFERENCES `TormentaIdeas` (`id_tormenta`);

ALTER TABLE `Ideas_TormentaIdeas` ADD FOREIGN KEY (`id_persona`) REFERENCES `Persona` (`id_persona`);

ALTER TABLE `Votacion_Ideas_TormentaIdeas` ADD FOREIGN KEY (`id_idea`) REFERENCES `Ideas_TormentaIdeas` (`id_idea`);

ALTER TABLE `Votacion_Ideas_TormentaIdeas` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Votacion_Ideas_TormentaIdeas` ADD FOREIGN KEY (`id_tormenta`) REFERENCES `Listado_TormentaIdeas` (`id_tormenta`);

ALTER TABLE `Votacion_Ideas_TormentaIdeas` ADD FOREIGN KEY (`id_persona`) REFERENCES `Persona` (`id_persona`);

ALTER TABLE `Encuesta_Satisfaccion` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Evaluacion_Encuesta_Satisfaccion` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Evaluacion_Encuesta_Satisfaccion` ADD FOREIGN KEY (`id_pregunta`) REFERENCES `Encuesta_Satisfaccion` (`id_pregunta`);

ALTER TABLE `Evaluacion_Encuesta_Satisfaccion` ADD FOREIGN KEY (`id_persona`) REFERENCES `Persona` (`id_persona`);

ALTER TABLE `Lista_chequeo` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Acapite` ADD FOREIGN KEY (`id_lista_chequeo`) REFERENCES `Lista_chequeo` (`id_lista_chequeo`);

ALTER TABLE `Acapite` ADD FOREIGN KEY (`id_pregunta`) REFERENCES `Lista_chequeo_pregunta` (`id_pregunta`);

ALTER TABLE `Lista_chequeo_pregunta` ADD FOREIGN KEY (`id_lista_chequeo`) REFERENCES `Lista_chequeo` (`id_lista_chequeo`);

ALTER TABLE `Lista_chequeo_pregunta` ADD FOREIGN KEY (`id_acapite`) REFERENCES `Acapite` (`id_acapite`);

ALTER TABLE `Lista_chequeo_respuesta` ADD FOREIGN KEY (`id_pregunta`) REFERENCES `Lista_chequeo_pregunta` (`id_pregunta`);

ALTER TABLE `Lista_chequeo_respuesta` ADD FOREIGN KEY (`id_persona`) REFERENCES `Persona` (`id_persona`);

ALTER TABLE `Lista_chequeo_respuesta` ADD FOREIGN KEY (`id_acapite`) REFERENCES `Acapite` (`id_acapite`);

ALTER TABLE `Lista_chequeo_respuesta` ADD FOREIGN KEY (`id_lista_chequeo`) REFERENCES `Lista_chequeo` (`id_lista_chequeo`);

ALTER TABLE `Acapite_respuestas` ADD FOREIGN KEY (`id_lista_chequeo`) REFERENCES `Lista_chequeo` (`id_lista_chequeo`);

ALTER TABLE `Acapite_respuestas` ADD FOREIGN KEY (`id_acapite`) REFERENCES `Acapite` (`id_acapite`);

ALTER TABLE `Cumplimineto_lista_chequeo` ADD FOREIGN KEY (`id_lista_chequeo`) REFERENCES `Lista_chequeo` (`id_lista_chequeo`);
