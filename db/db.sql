--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0 (Debian 12.0-2.pgdg100+1)
-- Dumped by pg_dump version 12.0

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
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id bigint NOT NULL,
    name character varying(256),
    url character varying(256)
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie (
    id bigint NOT NULL,
    url character varying(256),
    name character varying(256),
    is_premiere boolean,
    age_rank character varying(4),
    native_film_name character varying(256),
    poster_url character varying(256),
    duration character varying(256),
    showing_end_date character varying(30),
    description character varying(8160)
);


ALTER TABLE public.movie OWNER TO postgres;

--
-- Name: movie_genre_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_genre_link (
    movie_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


ALTER TABLE public.movie_genre_link OWNER TO postgres;

--
-- Name: movie_year_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_year_link (
    movie_id bigint NOT NULL,
    year_id bigint NOT NULL
);


ALTER TABLE public.movie_year_link OWNER TO postgres;

--
-- Name: year; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.year (
    id bigint NOT NULL,
    data integer,
    url character varying(256)
);


ALTER TABLE public.year OWNER TO postgres;

--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (id, name, url) FROM stdin;
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie (id, url, name, is_premiere, age_rank, native_film_name, poster_url, duration, showing_end_date, description) FROM stdin;
\.


--
-- Data for Name: movie_genre_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_genre_link (movie_id, genre_id) FROM stdin;
\.


--
-- Data for Name: movie_year_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_year_link (movie_id, year_id) FROM stdin;
\.


--
-- Data for Name: year; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.year (id, data, url) FROM stdin;
\.


--
-- Name: genre genre_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pk PRIMARY KEY (id);


--
-- Name: movie_genre_link movie_genre_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre_link
    ADD CONSTRAINT movie_genre_link_pk PRIMARY KEY (movie_id, genre_id);


--
-- Name: movie movie_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pk PRIMARY KEY (id);


--
-- Name: movie_year_link movie_year_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_year_link
    ADD CONSTRAINT movie_year_link_pk PRIMARY KEY (movie_id, year_id);


--
-- Name: year year_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.year
    ADD CONSTRAINT year_pk PRIMARY KEY (id);


--
-- Name: genre_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX genre_id_uindex ON public.genre USING btree (id);


--
-- Name: movie_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX movie_id_uindex ON public.movie USING btree (id);


--
-- Name: year_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX year_id_uindex ON public.year USING btree (id);


--
-- Name: movie_genre_link movie_genre_link_genre_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre_link
    ADD CONSTRAINT movie_genre_link_genre_id_fk FOREIGN KEY (genre_id) REFERENCES public.genre(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: movie_genre_link movie_genre_link_movie_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre_link
    ADD CONSTRAINT movie_genre_link_movie_id_fk FOREIGN KEY (movie_id) REFERENCES public.movie(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: movie_year_link movie_year_link_movie_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_year_link
    ADD CONSTRAINT movie_year_link_movie_id_fk FOREIGN KEY (movie_id) REFERENCES public.movie(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: movie_year_link movie_year_link_year_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_year_link
    ADD CONSTRAINT movie_year_link_year_id_fk FOREIGN KEY (year_id) REFERENCES public.year(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

