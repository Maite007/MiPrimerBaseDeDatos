--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor (
    id integer NOT NULL,
    nombre character varying(30),
    apellido character varying(30),
    email character varying(30)
);


ALTER TABLE public.autor OWNER TO postgres;

--
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentario (
    id integer NOT NULL,
    comentario character varying(250),
    libroid integer,
    lectorid integer
);


ALTER TABLE public.comentario OWNER TO postgres;

--
-- Name: editorial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editorial (
    "Id" integer NOT NULL,
    nombre character varying(30),
    pais character varying(30),
    "estado " character varying(30),
    ciudad character varying(30),
    telefono character varying(30)
);


ALTER TABLE public.editorial OWNER TO postgres;

--
-- Name: favorito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorito (
    id integer NOT NULL,
    libroid integer,
    lectorid integer
);


ALTER TABLE public.favorito OWNER TO postgres;

--
-- Name: lector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lector (
    id integer NOT NULL,
    nombre character varying(30),
    apellido character varying(30),
    email character varying(30),
    password character varying(15)
);


ALTER TABLE public.lector OWNER TO postgres;

--
-- Name: libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro (
    id integer NOT NULL,
    titulo character varying(50),
    isbn character varying(30),
    resena character varying(250),
    "numPagina" integer,
    calificacion integer,
    editorialid integer
);


ALTER TABLE public.libro OWNER TO postgres;

--
-- Name: libroautor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libroautor (
    id integer NOT NULL,
    libroid integer,
    autorid integer
);


ALTER TABLE public.libroautor OWNER TO postgres;

--
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autor (id, nombre, apellido, email) FROM stdin;
1	Sofia	Segovia	sofiaSegovia@email.com
2	Guillermo	Del Toro	guillermo@email.com
3	Chuck	Hogan	chuckhogan@email.com
4	Carlos	Muñoz	carlosmuñoz@email.com
\.


--
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentario (id, comentario, libroid, lectorid) FROM stdin;
\.


--
-- Data for Name: editorial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editorial ("Id", nombre, pais, "estado ", ciudad, telefono) FROM stdin;
1	Lumen	Mexico	Edo Mexico	Texcoco	5538678400
2	Alinaza de novelas	Mexico	Nuevo León	Monterrey	5538678450
3	Eutelequia	Mexico	Jalisco	Guadalajara	5216698773
\.


--
-- Data for Name: favorito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorito (id, libroid, lectorid) FROM stdin;
\.


--
-- Data for Name: lector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lector (id, nombre, apellido, email, password) FROM stdin;
\.


--
-- Data for Name: libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro (id, titulo, isbn, resena, "numPagina", calificacion, editorialid) FROM stdin;
3	978-84-938256-5-2	El pensador vagabundo	El pensador vagabundo. Estudios sobre Walter Benjamin	384	5	3
1	973-3-16-148410	El murmullo de las abejas	El murmullo de las abejas el descubrimiento literario del año. La autora que despierta la historia de Mexico y recupera su lugar en nuestros corazones	488	5	1
2	533-4-32-3229	Los seres huecos	Una agente del FBI novata y un heroe extraordinario	500	5	2
\.


--
-- Data for Name: libroautor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libroautor (id, libroid, autorid) FROM stdin;
1	1	1
2	1	2
\.


--
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id);


--
-- Name: comentario comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id);


--
-- Name: editorial editorial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editorial
    ADD CONSTRAINT editorial_pkey PRIMARY KEY ("Id");


--
-- Name: favorito favorito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT favorito_pkey PRIMARY KEY (id);


--
-- Name: lector lector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lector
    ADD CONSTRAINT lector_pkey PRIMARY KEY (id);


--
-- Name: libro libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_pkey PRIMARY KEY (id);


--
-- Name: libroautor libroautor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libroautor
    ADD CONSTRAINT libroautor_pkey PRIMARY KEY (id);


--
-- Name: comentario comentario_lectorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_lectorid_fkey FOREIGN KEY (lectorid) REFERENCES public.lector(id) MATCH FULL;


--
-- Name: comentario comentario_libroid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_libroid_fkey FOREIGN KEY (libroid) REFERENCES public.libro(id) MATCH FULL;


--
-- Name: favorito favorito_lectorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT favorito_lectorid_fkey FOREIGN KEY (lectorid) REFERENCES public.lector(id);


--
-- Name: favorito favorito_libroid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT favorito_libroid_fkey FOREIGN KEY (libroid) REFERENCES public.libro(id);


--
-- Name: libro libro_editorialid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_editorialid_fkey FOREIGN KEY (editorialid) REFERENCES public.editorial("Id") MATCH FULL;


--
-- Name: libroautor libroautor_autorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libroautor
    ADD CONSTRAINT libroautor_autorid_fkey FOREIGN KEY (autorid) REFERENCES public.autor(id);


--
-- Name: libroautor libroautor_libroid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libroautor
    ADD CONSTRAINT libroautor_libroid_fkey FOREIGN KEY (libroid) REFERENCES public.libro(id);


--
-- PostgreSQL database dump complete
--

