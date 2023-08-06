--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 8, 4);
INSERT INTO public.games VALUES (2, 8, 2);
INSERT INTO public.games VALUES (3, 8, 10);
INSERT INTO public.games VALUES (4, 9, 1);
INSERT INTO public.games VALUES (5, 8, 1);
INSERT INTO public.games VALUES (6, 8, 11);
INSERT INTO public.games VALUES (7, 10, 734);
INSERT INTO public.games VALUES (8, 10, 841);
INSERT INTO public.games VALUES (9, 11, 715);
INSERT INTO public.games VALUES (10, 11, 155);
INSERT INTO public.games VALUES (11, 10, 477);
INSERT INTO public.games VALUES (12, 10, 246);
INSERT INTO public.games VALUES (13, 10, 318);
INSERT INTO public.games VALUES (14, 12, 971);
INSERT INTO public.games VALUES (15, 12, 636);
INSERT INTO public.games VALUES (16, 13, 464);
INSERT INTO public.games VALUES (17, 13, 395);
INSERT INTO public.games VALUES (18, 12, 715);
INSERT INTO public.games VALUES (19, 12, 870);
INSERT INTO public.games VALUES (20, 12, 225);
INSERT INTO public.games VALUES (21, 14, 388);
INSERT INTO public.games VALUES (22, 14, 295);
INSERT INTO public.games VALUES (23, 15, 530);
INSERT INTO public.games VALUES (24, 15, 206);
INSERT INTO public.games VALUES (25, 14, 30);
INSERT INTO public.games VALUES (26, 14, 207);
INSERT INTO public.games VALUES (27, 14, 209);
INSERT INTO public.games VALUES (28, 16, 107);
INSERT INTO public.games VALUES (29, 16, 94);
INSERT INTO public.games VALUES (30, 17, 610);
INSERT INTO public.games VALUES (31, 17, 493);
INSERT INTO public.games VALUES (32, 16, 434);
INSERT INTO public.games VALUES (33, 16, 375);
INSERT INTO public.games VALUES (34, 16, 887);
INSERT INTO public.games VALUES (35, 18, 32);
INSERT INTO public.games VALUES (36, 18, 957);
INSERT INTO public.games VALUES (37, 19, 377);
INSERT INTO public.games VALUES (38, 19, 632);
INSERT INTO public.games VALUES (39, 18, 107);
INSERT INTO public.games VALUES (40, 18, 835);
INSERT INTO public.games VALUES (41, 18, 565);
INSERT INTO public.games VALUES (42, 20, 102);
INSERT INTO public.games VALUES (43, 20, 397);
INSERT INTO public.games VALUES (44, 21, 334);
INSERT INTO public.games VALUES (45, 21, 256);
INSERT INTO public.games VALUES (46, 20, 357);
INSERT INTO public.games VALUES (47, 20, 438);
INSERT INTO public.games VALUES (48, 20, 274);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (8, 'Bob');
INSERT INTO public.users VALUES (9, 'George');
INSERT INTO public.users VALUES (10, 'user_1691336262347');
INSERT INTO public.users VALUES (11, 'user_1691336262346');
INSERT INTO public.users VALUES (12, 'user_1691336330260');
INSERT INTO public.users VALUES (13, 'user_1691336330259');
INSERT INTO public.users VALUES (14, 'user_1691336377254');
INSERT INTO public.users VALUES (15, 'user_1691336377253');
INSERT INTO public.users VALUES (16, 'user_1691336385492');
INSERT INTO public.users VALUES (17, 'user_1691336385491');
INSERT INTO public.users VALUES (18, 'user_1691336427772');
INSERT INTO public.users VALUES (19, 'user_1691336427771');
INSERT INTO public.users VALUES (20, 'user_1691336440284');
INSERT INTO public.users VALUES (21, 'user_1691336440283');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 48, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games fk_user; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

