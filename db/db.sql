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
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    id bigint NOT NULL,
    name character varying(256),
    additional_information character varying(256)
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id bigint NOT NULL,
    country character varying(256)
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: director; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.director (
    id bigint NOT NULL,
    name character varying(256),
    additional_information character varying(256)
);


ALTER TABLE public.director OWNER TO postgres;

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
-- Name: movie_actor_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_actor_link (
    movie_id bigint NOT NULL,
    actor_id bigint NOT NULL
);


ALTER TABLE public.movie_actor_link OWNER TO postgres;

--
-- Name: movie_country_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_country_link (
    movie_id bigint NOT NULL,
    country_id bigint NOT NULL
);


ALTER TABLE public.movie_country_link OWNER TO postgres;

--
-- Name: movie_director_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_director_link (
    movie_id bigint NOT NULL,
    director_id bigint NOT NULL
);


ALTER TABLE public.movie_director_link OWNER TO postgres;

--
-- Name: movie_genre_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_genre_link (
    movie_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


ALTER TABLE public.movie_genre_link OWNER TO postgres;

--
-- Name: movie_image_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_image_link (
    id bigint NOT NULL,
    url character varying(256) NOT NULL
);


ALTER TABLE public.movie_image_link OWNER TO postgres;

--
-- Name: movie_rating_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_rating_link (
    movie_id bigint NOT NULL,
    rating_id bigint NOT NULL,
    value character varying(30)
);


ALTER TABLE public.movie_rating_link OWNER TO postgres;

--
-- Name: movie_video_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_video_link (
    id bigint NOT NULL,
    url character varying(256) NOT NULL
);


ALTER TABLE public.movie_video_link OWNER TO postgres;

--
-- Name: movie_year_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_year_link (
    movie_id bigint NOT NULL,
    year_id bigint NOT NULL
);


ALTER TABLE public.movie_year_link OWNER TO postgres;

--
-- Name: rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rating (
    id bigint NOT NULL,
    rating character varying(30)
);


ALTER TABLE public.rating OWNER TO postgres;

--
-- Name: year; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.year (
    id bigint NOT NULL,
    year integer,
    url character varying(256)
);


ALTER TABLE public.year OWNER TO postgres;

--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actor (id, name, additional_information) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, country) FROM stdin;
\.


--
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.director (id, name, additional_information) FROM stdin;
\.


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
-- Data for Name: movie_actor_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_actor_link (movie_id, actor_id) FROM stdin;
\.


--
-- Data for Name: movie_country_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_country_link (movie_id, country_id) FROM stdin;
\.


--
-- Data for Name: movie_director_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_director_link (movie_id, director_id) FROM stdin;
\.


--
-- Data for Name: movie_genre_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_genre_link (movie_id, genre_id) FROM stdin;
\.


--
-- Data for Name: movie_image_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_image_link (id, url) FROM stdin;
\.


--
-- Data for Name: movie_rating_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_rating_link (movie_id, rating_id, value) FROM stdin;
\.


--
-- Data for Name: movie_video_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_video_link (id, url) FROM stdin;
\.


--
-- Data for Name: movie_year_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_year_link (movie_id, year_id) FROM stdin;
\.


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rating (id, rating) FROM stdin;
\.


--
-- Data for Name: year; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.year (id, year, url) FROM stdin;
\.


--
-- Name: actor actor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pk PRIMARY KEY (id);


--
-- Name: country country_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pk PRIMARY KEY (id);


--
-- Name: director director_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_pk PRIMARY KEY (id);


--
-- Name: genre genre_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pk PRIMARY KEY (id);


--
-- Name: movie_actor_link movie_actor_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor_link
    ADD CONSTRAINT movie_actor_link_pk PRIMARY KEY (movie_id, actor_id);


--
-- Name: movie_country_link movie_country_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_country_link
    ADD CONSTRAINT movie_country_link_pk PRIMARY KEY (movie_id, country_id);


--
-- Name: movie_director_link movie_director_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director_link
    ADD CONSTRAINT movie_director_link_pk PRIMARY KEY (movie_id, director_id);


--
-- Name: movie_genre_link movie_genre_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre_link
    ADD CONSTRAINT movie_genre_link_pk PRIMARY KEY (movie_id, genre_id);


--
-- Name: movie_image_link movie_picture_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_image_link
    ADD CONSTRAINT movie_picture_link_pk PRIMARY KEY (id, url);


--
-- Name: movie movie_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pk PRIMARY KEY (id);


--
-- Name: movie_rating_link movie_rating_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_rating_link
    ADD CONSTRAINT movie_rating_link_pk PRIMARY KEY (movie_id, rating_id);


--
-- Name: movie_video_link movie_video_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_video_link
    ADD CONSTRAINT movie_video_link_pk PRIMARY KEY (id, url);


--
-- Name: movie_year_link movie_year_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_year_link
    ADD CONSTRAINT movie_year_link_pk PRIMARY KEY (movie_id, year_id);


--
-- Name: rating rating_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pk PRIMARY KEY (id);


--
-- Name: year year_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.year
    ADD CONSTRAINT year_pk PRIMARY KEY (id);


--
-- Name: actor_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX actor_id_uindex ON public.actor USING btree (id);


--
-- Name: country_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX country_id_uindex ON public.country USING btree (id);


--
-- Name: director_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX director_id_uindex ON public.director USING btree (id);


--
-- Name: genre_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX genre_id_uindex ON public.genre USING btree (id);


--
-- Name: movie_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX movie_id_uindex ON public.movie USING btree (id);


--
-- Name: rating_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX rating_id_uindex ON public.rating USING btree (id);


--
-- Name: year_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX year_id_uindex ON public.year USING btree (id);


--
-- Name: movie_actor_link movie_actor_link_actor_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor_link
    ADD CONSTRAINT movie_actor_link_actor_id_fk FOREIGN KEY (actor_id) REFERENCES public.actor(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: movie_actor_link movie_actor_link_movie_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor_link
    ADD CONSTRAINT movie_actor_link_movie_id_fk FOREIGN KEY (movie_id) REFERENCES public.movie(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: movie_country_link movie_country_link_country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_country_link
    ADD CONSTRAINT movie_country_link_country_id_fk FOREIGN KEY (country_id) REFERENCES public.country(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: movie_country_link movie_country_link_movie_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_country_link
    ADD CONSTRAINT movie_country_link_movie_id_fk FOREIGN KEY (movie_id) REFERENCES public.movie(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: movie_director_link movie_director_link_director_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director_link
    ADD CONSTRAINT movie_director_link_director_id_fk FOREIGN KEY (director_id) REFERENCES public.director(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: movie_director_link movie_director_link_movie_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director_link
    ADD CONSTRAINT movie_director_link_movie_id_fk FOREIGN KEY (movie_id) REFERENCES public.movie(id) ON UPDATE RESTRICT ON DELETE CASCADE;


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
-- Name: movie_image_link movie_picture_link_movie_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_image_link
    ADD CONSTRAINT movie_picture_link_movie_id_fk FOREIGN KEY (id) REFERENCES public.movie(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: movie_rating_link movie_rating_link_movie_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_rating_link
    ADD CONSTRAINT movie_rating_link_movie_id_fk FOREIGN KEY (movie_id) REFERENCES public.movie(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: movie_rating_link movie_rating_link_rating_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_rating_link
    ADD CONSTRAINT movie_rating_link_rating_id_fk FOREIGN KEY (rating_id) REFERENCES public.rating(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: movie_video_link movie_video_link_movie_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_video_link
    ADD CONSTRAINT movie_video_link_movie_id_fk FOREIGN KEY (id) REFERENCES public.movie(id) ON UPDATE RESTRICT ON DELETE CASCADE;


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

