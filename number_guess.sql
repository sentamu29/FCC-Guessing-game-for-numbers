--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: game_results; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_results (
    id integer NOT NULL,
    username character varying(22) NOT NULL,
    attempts integer NOT NULL,
    target_number integer NOT NULL,
    result_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.game_results OWNER TO freecodecamp;

--
-- Name: game_results_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_results_id_seq OWNER TO freecodecamp;

--
-- Name: game_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_results_id_seq OWNED BY public.game_results.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
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
-- Name: game_results id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_results ALTER COLUMN id SET DEFAULT nextval('public.game_results_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: game_results; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1719235387657', 2, 313);
INSERT INTO public.users VALUES (1, 'user_1719235387658', 5, 202);
INSERT INTO public.users VALUES (18, 'user_1719236612190', 2, 142);
INSERT INTO public.users VALUES (4, 'user_1719235573692', 2, 187);
INSERT INTO public.users VALUES (17, 'user_1719236612191', 5, 404);
INSERT INTO public.users VALUES (3, 'user_1719235573693', 5, 534);
INSERT INTO public.users VALUES (6, 'user_1719235743973', 2, 194);
INSERT INTO public.users VALUES (20, 'user_1719239887667', 2, 597);
INSERT INTO public.users VALUES (5, 'user_1719235743974', 5, 192);
INSERT INTO public.users VALUES (19, 'user_1719239887668', 5, 116);
INSERT INTO public.users VALUES (8, 'user_1719236054064', 2, 902);
INSERT INTO public.users VALUES (7, 'user_1719236054065', 5, 84);
INSERT INTO public.users VALUES (10, 'user_1719236255570', 2, 234);
INSERT INTO public.users VALUES (22, 'user_1719239906225', 2, 181);
INSERT INTO public.users VALUES (9, 'user_1719236255571', 5, 67);
INSERT INTO public.users VALUES (21, 'user_1719239906226', 5, 621);
INSERT INTO public.users VALUES (12, 'user_1719236324465', 2, 361);
INSERT INTO public.users VALUES (11, 'user_1719236324466', 5, 162);
INSERT INTO public.users VALUES (24, 'user_1719240000301', 2, 309);
INSERT INTO public.users VALUES (14, 'user_1719236404087', 2, 435);
INSERT INTO public.users VALUES (13, 'user_1719236404088', 5, 6);
INSERT INTO public.users VALUES (23, 'user_1719240000302', 5, 168);
INSERT INTO public.users VALUES (16, 'user_1719236496878', 2, 414);
INSERT INTO public.users VALUES (15, 'user_1719236496879', 5, 181);
INSERT INTO public.users VALUES (27, 'user_1719240872449', 2, 121);
INSERT INTO public.users VALUES (26, 'user_1719240872450', 5, 439);
INSERT INTO public.users VALUES (25, 'moses sentamu', 3, 8);
INSERT INTO public.users VALUES (28, 'user_1719241172025', 0, NULL);
INSERT INTO public.users VALUES (29, 'user_1719241172024', 0, NULL);
INSERT INTO public.users VALUES (30, 'user_1719241490706', 0, NULL);
INSERT INTO public.users VALUES (31, 'user_1719241490705', 0, NULL);


--
-- Name: game_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_results_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 31, true);


--
-- Name: game_results game_results_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_results
    ADD CONSTRAINT game_results_pkey PRIMARY KEY (id);


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

