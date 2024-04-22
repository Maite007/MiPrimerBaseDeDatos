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
-- Name: extras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extras (
    id integer NOT NULL,
    logrosid integer
);


ALTER TABLE public.extras OWNER TO postgres;

--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    cantidaddelikes integer,
    logrosid integer
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login (
    id integer NOT NULL,
    usuarioid integer
);


ALTER TABLE public.login OWNER TO postgres;

--
-- Name: logros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logros (
    id integer NOT NULL,
    titulo character varying(30),
    fecha date,
    area character varying(10),
    descripcion character varying(250)
);


ALTER TABLE public.logros OWNER TO postgres;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombreusuario character varying(30),
    fnacimiento date,
    correo character varying(50),
    contrasenia character varying(100),
    logrosid integer
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Data for Name: extras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.extras (id, logrosid) FROM stdin;
1	1
2	2
3	3
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (id, cantidaddelikes, logrosid) FROM stdin;
1	50	2
2	200	1
3	20	3
\.


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login (id, usuarioid) FROM stdin;
1	1
2	2
3	3
\.


--
-- Data for Name: logros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logros (id, titulo, fecha, area, descripcion) FROM stdin;
1	Historias de exito	2024-04-20	Personal	Historias de exito de tipo personal
2	Noticias	2024-04-20	Deportivas	Deportes mas destacados
3	Proyectos	2024-04-20	Laboral	Trabajos por hora
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombreusuario, fnacimiento, correo, contrasenia, logrosid) FROM stdin;
1	Maria	2000-02-03	maria@email.com	rbQ43btj5	2
2	Pedro	1995-01-15	pedro@email.com	645ty3jhnb2	3
3	Jose	2000-08-05	jose@email.com	rbQ43btj5	1
\.


--
-- Name: extras extras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extras
    ADD CONSTRAINT extras_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);


--
-- Name: logros logros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logros
    ADD CONSTRAINT logros_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: extras extras_logrosid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extras
    ADD CONSTRAINT extras_logrosid_fkey FOREIGN KEY (logrosid) REFERENCES public.logros(id);


--
-- Name: likes likes_logrosid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_logrosid_fkey FOREIGN KEY (logrosid) REFERENCES public.logros(id);


--
-- Name: login login_usuarioid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_usuarioid_fkey FOREIGN KEY (usuarioid) REFERENCES public.usuarios(id);


--
-- Name: usuarios usuarios_logrosid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_logrosid_fkey FOREIGN KEY (logrosid) REFERENCES public.logros(id);


--
-- PostgreSQL database dump complete
--

