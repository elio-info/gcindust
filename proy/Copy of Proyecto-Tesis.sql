CREATE TABLE `Experto` (
  `ID_experto` int PRIMARY KEY,
  `id_persona` integer UNIQUE NOT NULL,
  `Cargo` varchar(255),
  `Anios_experiencia` int,
  `Grado_cientifico` varchar(255),
  `coeficiente_conocimiento` decimal,
  `coeficiente_argumentacion` decimal,
  `indice_experticidad` decimal,
  `aceptado` boolean
);

CREATE TABLE `Grupo_Experto` (
  `id_grupo` int PRIMARY KEY,
  `id_proyecto` integer UNIQUE NOT NULL,
  `cantidad_expertos` int,
  `proporcion_errores` decimal,
  `nivel_confianza` decimal
);

CREATE TABLE `Proyecto` (
  `id_proyecto` integer PRIMARY KEY,
  `Nombre_del_proyecto` varchar(255),
  `nombre_responsable` varchar(255),
  `dia_solicitud` datetime,
  `cronograma` text,
  `presupuesto` decimal,
  `tiempo_estimado` int,
  `id_empresa` integer UNIQUE NOT NULL,
  `aprobado_consejo` boolean,
  `aprobado_rector` boolean,
  `aprobado_direcccion` boolean
);

CREATE TABLE `Proyecto_Experto` (
  `id_proyecto` integer UNIQUE NOT NULL,
  `id_experto` integer UNIQUE NOT NULL
);

CREATE TABLE `Empresa` (
  `id_empresa` integer PRIMARY KEY,
  `nombre` varchar(255),
  `responsable` varchar(255),
  `direccion` varchar(255),
  `telefono` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `Persona` (
  `id` integer PRIMARY KEY,
  `nombre` varchar(255),
  `apellido` varchar(255),
  `id_departamento` int UNIQUE NOT NULL,
  `plan_de_trabajo` text,
  `usuario` varchar(255) UNIQUE NOT NULL,
  `contrasena` varchar(255) NOT NULL
);

CREATE TABLE `Departamento` (
  `id_departamento` integer PRIMARY KEY,
  `nombre` varchar(255)
);

CREATE TABLE `Cronograma_Actividad` (
  `id_cronograma` integer PRIMARY KEY,
  `id_proyecto` integer,
  `resultado_planificado` text,
  `entidad_responsable` integer,
  `actividad_principal` text,
  `inicio` date,
  `termino` date,
  `indicadores` text
);

CREATE TABLE `Cronograma_Actividad_Experto` (
  `id_cronograma` integer UNIQUE NOT NULL,
  `id_proyecto` integer UNIQUE NOT NULL,
  `id_experto` integer UNIQUE NOT NULL
);

CREATE TABLE `Grados_Cientificos` (
  `id` integer PRIMARY KEY,
  `nombre` varchar(255)
);

CREATE TABLE `Encuesta_Experto` (
  `id_experto` integer UNIQUE NOT NULL,
  `cargo_actual` text,
  `anos_experiencia` integer,
  `clasificaion_profesional` integer UNIQUE NOT NULL,
  `p1_grado_conocimiento` integer,
  `p2_influencia_analisis_teorico` int,
  `p2_influencia_experiencia_obtenida` int,
  `p2_influencia_trabajos_nacionales` int,
  `p2_influencia_trabajos_extranjeros` int,
  `p2_influencia_conocimiento_estado_extranjero` int,
  `p2_influencia_intuicion` int,
  `estado_encuesta` string
);

CREATE TABLE `TormentaIdeas` (
  `id_tormenta` int,
  `id_experto` int,
  `idea` string,
  `id_idea` int,
  `puntuacion` int,
  `votacion` bool,
  `prioridad` int
);

CREATE TABLE `Listado_TormentaIdeas` (
  `id_proyecto` int,
  `id_tormenta` int,
  `estado_tormenta` bool
);

CREATE TABLE `Encuesta_Satisfaccion` (
  `id_proyecto` int,
  `id_pregunta` int,
  `pregunta` text,
  `formato_calificacion` text
);

CREATE TABLE `Encuesta_Satisfaccion_Aplicacion` (
  `id_proyecto` int,
  `id_pregunta` int,
  `evaluacion` text,
  `id_persona` int,
  `estado_encuesta_satisfaccion` text
);

ALTER TABLE `Experto` ADD FOREIGN KEY (`Grado_cientifico`) REFERENCES `Grados_Cientificos` (`id`);

ALTER TABLE `Grupo_Experto` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Proyecto_Experto` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Proyecto_Experto` ADD FOREIGN KEY (`id_experto`) REFERENCES `Experto` (`ID_experto`);

ALTER TABLE `Cronograma_Actividad` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Cronograma_Actividad_Experto` ADD FOREIGN KEY (`id_cronograma`) REFERENCES `Cronograma_Actividad` (`id_proyecto`);

ALTER TABLE `Cronograma_Actividad_Experto` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

ALTER TABLE `Cronograma_Actividad_Experto` ADD FOREIGN KEY (`id_experto`) REFERENCES `Experto` (`ID_experto`);

ALTER TABLE `Encuesta_Experto` ADD FOREIGN KEY (`id_experto`) REFERENCES `Experto` (`ID_experto`);

ALTER TABLE `Encuesta_Experto` ADD FOREIGN KEY (`clasificaion_profesional`) REFERENCES `Grados_Cientificos` (`id`);

ALTER TABLE `Persona` ADD FOREIGN KEY (`id`) REFERENCES `Experto` (`id_persona`);

ALTER TABLE `Persona` ADD FOREIGN KEY (`id_departamento`) REFERENCES `Departamento` (`id_departamento`);

ALTER TABLE `Proyecto` ADD FOREIGN KEY (`id_empresa`) REFERENCES `Empresa` (`id_empresa`);
