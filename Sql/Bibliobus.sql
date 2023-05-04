-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."Socios"
(
    id_socio serial,
    nombres character varying,
    direccion character varying,
    PRIMARY KEY (id_socio)
);

CREATE TABLE IF NOT EXISTS public.libros
(
    id_libro serial,
    id_tema integer,
    titulo character varying,
    autor character varying,
    "numEjemplares" numeric,
    PRIMARY KEY (id_libro)
);

CREATE TABLE IF NOT EXISTS public."Temas"
(
    id_tema serial,
    nombre character varying,
    PRIMARY KEY (id_tema)
);

CREATE TABLE IF NOT EXISTS public.socios_libros
(
    id_prestamo serial,
    fecha_prestamo date,
    fecha_devolucion date,
    id_socio integer,
    id_libro integer,
    PRIMARY KEY (id_prestamo)
);

ALTER TABLE IF EXISTS public.libros
    ADD CONSTRAINT fk_libro_tema FOREIGN KEY (id_tema)
    REFERENCES public."Temas" (id_tema) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.socios_libros
    ADD CONSTRAINT fk_prestamo_socios FOREIGN KEY (id_socio)
    REFERENCES public."Socios" (id_socio) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.socios_libros
    ADD CONSTRAINT fk_prestamo_libro FOREIGN KEY (id_libro)
    REFERENCES public.libros (id_libro) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;