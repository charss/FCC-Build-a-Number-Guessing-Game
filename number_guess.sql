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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(100) NOT NULL,
    best_game integer DEFAULT 0,
    games_played integer DEFAULT 1
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Charles', 1, 1);
INSERT INTO public.users VALUES (4, 'user_1652629385524', 0, 1);
INSERT INTO public.users VALUES (3, 'user_1652629385525', 0, 1);
INSERT INTO public.users VALUES (5, 'YANNAH', 0, 1);
INSERT INTO public.users VALUES (45, 'user_1652630677546', 280, 2);
INSERT INTO public.users VALUES (17, 'user_1652630323382', 326, 2);
INSERT INTO public.users VALUES (7, 'user_1652629596107', 0, 1);
INSERT INTO public.users VALUES (29, 'user_1652630505185', 208, 2);
INSERT INTO public.users VALUES (6, 'user_1652629596108', 0, 1);
INSERT INTO public.users VALUES (16, 'user_1652630323383', 445, 5);
INSERT INTO public.users VALUES (9, 'user_1652629730517', 0, 2);
INSERT INTO public.users VALUES (8, 'user_1652629730518', 0, 5);
INSERT INTO public.users VALUES (44, 'user_1652630677547', 124, 5);
INSERT INTO public.users VALUES (28, 'user_1652630505186', 545, 5);
INSERT INTO public.users VALUES (11, 'user_1652629973475', 5, 2);
INSERT INTO public.users VALUES (19, 'user_1652630348702', 506, 2);
INSERT INTO public.users VALUES (18, 'user_1652630348703', 163, 5);
INSERT INTO public.users VALUES (10, 'user_1652629973476', 4, 5);
INSERT INTO public.users VALUES (13, 'user_1652629986977', 231, 2);
INSERT INTO public.users VALUES (31, 'user_1652630508681', 546, 2);
INSERT INTO public.users VALUES (21, 'user_1652630358006', 640, 2);
INSERT INTO public.users VALUES (12, 'user_1652629986978', 535, 5);
INSERT INTO public.users VALUES (47, 'user_1652630745622', 272, 2);
INSERT INTO public.users VALUES (20, 'user_1652630358007', 36, 5);
INSERT INTO public.users VALUES (30, 'user_1652630508682', 226, 5);
INSERT INTO public.users VALUES (15, 'user_1652630190070', 251, 2);
INSERT INTO public.users VALUES (14, 'user_1652630190071', 250, 5);
INSERT INTO public.users VALUES (46, 'user_1652630745623', 8, 5);
INSERT INTO public.users VALUES (23, 'user_1652630368242', 603, 2);
INSERT INTO public.users VALUES (22, 'user_1652630368243', 292, 5);
INSERT INTO public.users VALUES (33, 'user_1652630512991', 301, 2);
INSERT INTO public.users VALUES (25, 'user_1652630422902', 529, 2);
INSERT INTO public.users VALUES (32, 'user_1652630512992', 219, 5);
INSERT INTO public.users VALUES (24, 'user_1652630422903', 141, 5);
INSERT INTO public.users VALUES (27, 'user_1652630431123', 874, 2);
INSERT INTO public.users VALUES (35, 'user_1652630553487', 71, 2);
INSERT INTO public.users VALUES (26, 'user_1652630431124', 24, 5);
INSERT INTO public.users VALUES (34, 'user_1652630553488', 79, 5);
INSERT INTO public.users VALUES (2, 'yannah', 9, 6);
INSERT INTO public.users VALUES (37, 'user_1652630646671', 406, 2);
INSERT INTO public.users VALUES (36, 'user_1652630646672', 331, 5);
INSERT INTO public.users VALUES (39, 'user_1652630653915', 654, 2);
INSERT INTO public.users VALUES (38, 'user_1652630653916', 75, 5);
INSERT INTO public.users VALUES (41, 'user_1652630660693', 87, 2);
INSERT INTO public.users VALUES (40, 'user_1652630660694', 82, 5);
INSERT INTO public.users VALUES (43, 'user_1652630665890', 648, 2);
INSERT INTO public.users VALUES (42, 'user_1652630665891', 57, 5);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 47, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

