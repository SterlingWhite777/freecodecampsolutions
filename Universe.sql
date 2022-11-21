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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    lifedetected boolean,
    name character varying,
    team text,
    threat_level integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: linktable; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.linktable (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    linktable_id integer NOT NULL,
    name character varying
);


ALTER TABLE public.linktable OWNER TO freecodecamp;

--
-- Name: linktable_linktable_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.linktable_linktable_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.linktable_linktable_seq OWNER TO freecodecamp;

--
-- Name: linktable_linktable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.linktable_linktable_seq OWNED BY public.linktable.linktable_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    distance_from_planet integer,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    purged boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    distance_from_star integer,
    name character varying NOT NULL,
    star_id integer NOT NULL,
    moon_count integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    planet_count integer,
    cleanse_coverage numeric(4,1),
    lifedetected boolean NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: linktable linktable_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linktable ALTER COLUMN linktable_id SET DEFAULT nextval('public.linktable_linktable_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (7, true, 'andromeda', 'echo', 3);
INSERT INTO public.galaxy VALUES (8, false, 'black eye', 'delta', 0);
INSERT INTO public.galaxy VALUES (9, true, 'Circinus', 'Foxtrot', 6);
INSERT INTO public.galaxy VALUES (10, false, 'Butterfly', 'Bravo', 0);
INSERT INTO public.galaxy VALUES (11, true, 'Cigar', 'Alpha', 1);
INSERT INTO public.galaxy VALUES (12, true, 'Comet', 'Halo', 9);


--
-- Data for Name: linktable; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.linktable VALUES (9, 5, 10, 12, 1, NULL);
INSERT INTO public.linktable VALUES (12, 9, 2, 2, 2, NULL);
INSERT INTO public.linktable VALUES (12, 9, 2, 1, 3, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 12000, 'HR-23', 2, false);
INSERT INTO public.moon VALUES (2, 1305, 'HR-24', 2, false);
INSERT INTO public.moon VALUES (3, 14032, 'HR-276', 10, true);
INSERT INTO public.moon VALUES (4, 13032, 'HR-277', 10, true);
INSERT INTO public.moon VALUES (5, 18032, 'HR-279', 10, true);
INSERT INTO public.moon VALUES (6, 68032, 'HR-278', 10, true);
INSERT INTO public.moon VALUES (7, 61032, 'HR-231', 10, true);
INSERT INTO public.moon VALUES (8, 11032, 'HR-230', 10, true);
INSERT INTO public.moon VALUES (9, 17032, 'HR-239', 10, true);
INSERT INTO public.moon VALUES (10, 56032, 'HR-291', 10, true);
INSERT INTO public.moon VALUES (11, 24032, 'HR-292', 10, true);
INSERT INTO public.moon VALUES (12, 32032, 'HR-293', 10, true);
INSERT INTO public.moon VALUES (13, 42032, 'HR-294', 10, true);
INSERT INTO public.moon VALUES (14, 36012, 'HR-295', 10, true);
INSERT INTO public.moon VALUES (15, 76012, 'HR-296', 10, true);
INSERT INTO public.moon VALUES (16, 29012, 'HR-297', 10, true);
INSERT INTO public.moon VALUES (17, 30012, 'HR-212', 10, true);
INSERT INTO public.moon VALUES (18, 17412, 'HR-215', 10, true);
INSERT INTO public.moon VALUES (19, 18412, 'HR-216', 10, true);
INSERT INTO public.moon VALUES (20, 21412, 'HR-217', 10, true);
INSERT INTO public.moon VALUES (21, 61412, 'HR-218', 10, true);
INSERT INTO public.moon VALUES (22, 68412, 'HR-219', 10, true);
INSERT INTO public.moon VALUES (23, 20412, 'HR-220', 10, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 12345, 'Lido', 6, 1);
INSERT INTO public.planet VALUES (2, 500, 'Roth', 9, 2);
INSERT INTO public.planet VALUES (4, 45832, 'Ronna', 5, 6);
INSERT INTO public.planet VALUES (5, 67002, 'Terniana', 5, 0);
INSERT INTO public.planet VALUES (6, 9245, 'Gorgoth', 5, 2);
INSERT INTO public.planet VALUES (7, 51238, 'Willow-q', 5, 1);
INSERT INTO public.planet VALUES (8, 12872, 'Willowx-x', 5, 0);
INSERT INTO public.planet VALUES (9, 34921, 'Asoc', 5, 6);
INSERT INTO public.planet VALUES (10, 91234, 'Illuminerium', 5, 22);
INSERT INTO public.planet VALUES (11, 23412, 'EW-21', 5, 0);
INSERT INTO public.planet VALUES (12, 12394, 'Urawone', 9, 4);
INSERT INTO public.planet VALUES (13, 145203, 'Shadowine', 9, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 4, 32.7, true, 'cerberus', 7);
INSERT INTO public.star VALUES (5, 32, 100.0, true, 'Etna', 9);
INSERT INTO public.star VALUES (6, 2, 58.3, true, 'Daemon', 12);
INSERT INTO public.star VALUES (7, 12, 100.0, false, 'Disaranoth', 10);
INSERT INTO public.star VALUES (8, 23, 100.0, false, 'Quarth', 10);
INSERT INTO public.star VALUES (9, 87, 12.3, true, 'Leviathon', 12);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: linktable_linktable_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.linktable_linktable_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: linktable linktable_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linktable
    ADD CONSTRAINT linktable_name_key UNIQUE (name);


--
-- Name: linktable linktable_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linktable
    ADD CONSTRAINT linktable_pkey PRIMARY KEY (linktable_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: linktable linktable_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linktable
    ADD CONSTRAINT linktable_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: linktable linktable_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linktable
    ADD CONSTRAINT linktable_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: linktable linktable_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linktable
    ADD CONSTRAINT linktable_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: linktable linktable_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linktable
    ADD CONSTRAINT linktable_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

