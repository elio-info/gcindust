CREATE TABLE "Experto" (
  "ID_experto" int PRIMARY KEY,
  "id_persona" integer UNIQUE NOT NULL,
  "Cargo" varchar,
  "Anios_experiencia" int,
  "Grado_cientifico" int,
  "coeficiente_conocimiento" decimal,
  "coeficiente_argumentacion" decimal,
  "indice_experticidad" decimal,
  "estado_encuesta" null
);

CREATE TABLE "Grupo_Experto" (
  "id_grupo" int PRIMARY KEY,
  "id_proyecto" integer NOT NULL,
  "nombre_grupo" varchar,
  "cantidad_expertos" int,
  "proporcion_errores" decimal,
  "nivel_confianza" decimal
);

CREATE TABLE "Listado_Grupo_Experto" (
  "id_proyecto" integer NOT NULL,
  "id_grupo" integer,
  "ID_experto" integer,
  "estado" bool
);

CREATE TABLE "Proyecto" (
  "id_proyecto" integer PRIMARY KEY,
  "Nombre_del_proyecto" varchar,
  "nombre_responsable" varchar,
  "dia_solicitud" datetime,
  "cronograma" text,
  "presupuesto" decimal,
  "tiempo_estimado" int,
  "id_empresa" integer NOT NULL,
  "estado_aprobado" boolean
);

CREATE TABLE "Aprobaciones_Proyecto" (
  "id_proyecto" integer PRIMARY KEY,
  "aprobado_consejo" boolean,
  "aprobado_rector" boolean,
  "aprobado_direccion" boolean
);

CREATE TABLE "Proyecto_Experto" (
  "id_proyecto" integer NOT NULL,
  "id_experto" integer NOT NULL,
  PRIMARY KEY ("id_proyecto", "id_experto")
);

CREATE TABLE "Empresa" (
  "id_empresa" integer PRIMARY KEY,
  "nombre" varchar,
  "responsable" varchar,
  "direccion" varchar,
  "telefono" varchar,
  "email" varchar
);

CREATE TABLE "Persona" (
  "id" integer PRIMARY KEY,
  "nombre" varchar,
  "apellido" varchar,
  "departamento" varchar,
  "plan_de_trabajo" text,
  "usuario" varchar UNIQUE NOT NULL,
  "contrasena" varchar NOT NULL
);

CREATE TABLE "Cronograma_Actividad" (
  "id_cronograma" integer PRIMARY KEY,
  "id_proyecto" integer,
  "resultado_planificado" text,
  "entidad_responsable" integer,
  "actividad_principal" text,
  "inicio" date,
  "termino" date,
  "indicadores" text
);

CREATE TABLE "Cronograma_Actividad_Experto" (
  "id_cronograma" integer NOT NULL,
  "id_proyecto" integer NOT NULL,
  "id_experto" integer NOT NULL,
  PRIMARY KEY ("id_cronograma", "id_proyecto", "id_experto")
);

CREATE TABLE "Grados_Cientificos" (
  "id" integer PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "Encuesta_Experto" (
  "id_experto" integer PRIMARY KEY,
  "cargo_actual" text,
  "anos_experiencia" integer,
  "clasificacion_profesional" integer,
  "p1_grado_conocimiento" integer,
  "p2_influencia_analisis_teorico" int,
  "p2_influencia_experiencia_obtenida" int,
  "p2_influencia_trabajos_nacionales" int,
  "p2_influencia_trabajos_extranjeros" int,
  "p2_influencia_conocimiento_estado_extranjero" int,
  "p2_influencia_intuicion" int,
  "estado_encuesta" boolean
);

CREATE TABLE "TormentaIdeas" (
  "id_proyecto" integer,
  "id_idea" int PRIMARY KEY,
  "id_tormenta" int,
  "id_experto" int,
  "idea" text,
  "puntuacion" int,
  "votacion" boolean,
  "prioridad" int,
  "estado" boolean
);

CREATE TABLE "Listado_TormentaIdeas" (
  "id_proyecto" int,
  "id_tormenta" int PRIMARY KEY,
  PRIMARY KEY ("id_proyecto", "id_tormenta")
);

CREATE TABLE "Encuesta_Satisfaccion" (
  "id_proyecto" int,
  "id_pregunta" int PRIMARY KEY,
  "pregunta" text,
  "formato_calificacion" text,
  PRIMARY KEY ("id_proyecto", "id_pregunta")
);

CREATE TABLE "Encuesta_Satisfaccion_Aplicacion" (
  "id_proyecto" int,
  "id_pregunta" int,
  "evaluacion" text,
  "id_persona" int,
  "estado_encuesta_satisfaccion" text,
  PRIMARY KEY ("id_proyecto", "id_pregunta", "id_persona")
);

CREATE TABLE "Lista_chequeo" (
  "id_lista" integer PRIMARY KEY,
  "id_proyecto" integer NOT NULL,
  "nombre" varchar NOT NULL,
  "fecha_confeccion" date NOT NULL,
  "fecha_cierre" date,
  "estado" varchar
);

CREATE TABLE "Acapite" (
  "id_lista" integer NOT NULL,
  "id_acapite" integer PRIMARY KEY,
  "nombre_acapite" varchar
);

CREATE TABLE "Lista_chequeo_pregunta" (
  "id_pregunta" integer PRIMARY KEY,
  "id_lista" integer NOT NULL,
  "pregunta" text NOT NULL,
  "id_acapite" integer
);

CREATE TABLE "Lista_chequeo_respuesta" (
  "id_respuesta" integer PRIMARY KEY,
  "id_pregunta" integer NOT NULL,
  "id_persona" integer NOT NULL,
  "id_acapite" integer NOT NULL,
  "respuesta" boolean NOT NULL,
  "fecha_respuesta" date NOT NULL
);

CREATE TABLE "Acapite_respuestas" (
  "id_lista" integer NOT NULL,
  "id_acapite" integer NOT NULL,
  "fecha_acapite" date NOT NULL,
  "porcentaje_cumplimiento_general" decimal
);

CREATE TABLE "Cumplimineto_lista_chequeo" (
  "id_lista" integer NOT NULL,
  "fecha" date,
  "porcentaje" decimal
);

ALTER TABLE "Experto" ADD FOREIGN KEY ("Grado_cientifico") REFERENCES "Grados_Cientificos" ("id");

ALTER TABLE "Grupo_Experto" ADD FOREIGN KEY ("id_proyecto") REFERENCES "Proyecto" ("id_proyecto");

ALTER TABLE "Listado_Grupo_Experto" ADD FOREIGN KEY ("id_proyecto") REFERENCES "Proyecto" ("id_proyecto");

ALTER TABLE "Proyecto" ADD FOREIGN KEY ("id_empresa") REFERENCES "Empresa" ("id_empresa");

ALTER TABLE "Aprobaciones_Proyecto" ADD FOREIGN KEY ("id_proyecto") REFERENCES "Proyecto" ("id_proyecto");

ALTER TABLE "Proyecto_Experto" ADD FOREIGN KEY ("id_proyecto") REFERENCES "Proyecto" ("id_proyecto");

ALTER TABLE "Proyecto_Experto" ADD FOREIGN KEY ("id_experto") REFERENCES "Experto" ("ID_experto");

ALTER TABLE "Cronograma_Actividad" ADD FOREIGN KEY ("id_proyecto") REFERENCES "Proyecto" ("id_proyecto");

ALTER TABLE "Cronograma_Actividad" ADD FOREIGN KEY ("entidad_responsable") REFERENCES "Empresa" ("id_empresa");

ALTER TABLE "Cronograma_Actividad_Experto" ADD FOREIGN KEY ("id_cronograma") REFERENCES "Cronograma_Actividad" ("id_cronograma");

ALTER TABLE "Cronograma_Actividad_Experto" ADD FOREIGN KEY ("id_proyecto") REFERENCES "Proyecto" ("id_proyecto");

ALTER TABLE "Cronograma_Actividad_Experto" ADD FOREIGN KEY ("id_experto") REFERENCES "Experto" ("ID_experto");

ALTER TABLE "Encuesta_Experto" ADD FOREIGN KEY ("id_experto") REFERENCES "Experto" ("ID_experto");

ALTER TABLE "Encuesta_Experto" ADD FOREIGN KEY ("clasificacion_profesional") REFERENCES "Grados_Cientificos" ("id");

ALTER TABLE "TormentaIdeas" ADD FOREIGN KEY ("id_experto") REFERENCES "Experto" ("ID_experto");

ALTER TABLE "Listado_TormentaIdeas" ADD FOREIGN KEY ("id_proyecto") REFERENCES "Proyecto" ("id_proyecto");

ALTER TABLE "Encuesta_Satisfaccion" ADD FOREIGN KEY ("id_proyecto") REFERENCES "Proyecto" ("id_proyecto");

ALTER TABLE "Encuesta_Satisfaccion_Aplicacion" ADD FOREIGN KEY ("id_proyecto") REFERENCES "Proyecto" ("id_proyecto");

ALTER TABLE "Encuesta_Satisfaccion_Aplicacion" ADD FOREIGN KEY ("id_pregunta") REFERENCES "Encuesta_Satisfaccion" ("id_pregunta");

ALTER TABLE "Encuesta_Satisfaccion_Aplicacion" ADD FOREIGN KEY ("id_persona") REFERENCES "Persona" ("id");

ALTER TABLE "Lista_chequeo" ADD FOREIGN KEY ("id_proyecto") REFERENCES "Proyecto" ("id_proyecto");

ALTER TABLE "Acapite" ADD FOREIGN KEY ("id_lista") REFERENCES "Lista_chequeo" ("id_lista");

ALTER TABLE "Lista_chequeo_pregunta" ADD FOREIGN KEY ("id_lista") REFERENCES "Lista_chequeo" ("id_lista");

ALTER TABLE "Lista_chequeo_respuesta" ADD FOREIGN KEY ("id_pregunta") REFERENCES "Lista_chequeo_pregunta" ("id_pregunta");

ALTER TABLE "Lista_chequeo_respuesta" ADD FOREIGN KEY ("id_persona") REFERENCES "Persona" ("id");

ALTER TABLE "Lista_chequeo_respuesta" ADD FOREIGN KEY ("id_acapite") REFERENCES "Acapite" ("id_acapite");

ALTER TABLE "Acapite_respuestas" ADD FOREIGN KEY ("id_lista") REFERENCES "Lista_chequeo" ("id_lista");

ALTER TABLE "Acapite_respuestas" ADD FOREIGN KEY ("id_acapite") REFERENCES "Acapite" ("id_acapite");

ALTER TABLE "Cumplimineto_lista_chequeo" ADD FOREIGN KEY ("id_lista") REFERENCES "Lista_chequeo" ("id_lista");

ALTER TABLE "Persona" ADD FOREIGN KEY ("id") REFERENCES "Experto" ("id_persona");
