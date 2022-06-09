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
-- Name: bh; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.bh (
    bh_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.bh OWNER TO freecodecamp;

--
-- Name: bh_bh_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.bh_bh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bh_bh_id_seq OWNER TO freecodecamp;

--
-- Name: bh_bh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.bh_bh_id_seq OWNED BY public.bh.bh_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    shape character varying(15),
    distance_from_mw_in_millions_lightyears numeric(6,2),
    coage_in_billion_years numeric(4,2)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    has_atmosphere boolean,
    year_discovered integer,
    mass_in_percentage_of_planet_mass numeric(4,2),
    planet_id integer NOT NULL
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
    name character varying(30),
    has_life boolean,
    description text,
    year_discovered integer,
    star_id integer NOT NULL
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
    name character varying(30),
    year_discovered integer,
    galaxy_id integer NOT NULL,
    distance_from_center_in_kpc numeric(4,2),
    colucolor character varying(15)
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
-- Name: bh bh_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.bh ALTER COLUMN bh_id SET DEFAULT nextval('public.bh_bh_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: bh; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.bh VALUES (1, '1', 1);
INSERT INTO public.bh VALUES (2, '2', 2);
INSERT INTO public.bh VALUES (3, '3', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 'spiral', 0.00, 13.61);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 956, 'spiral', 2.50, 13.10);
INSERT INTO public.galaxy VALUES (3, 'Canis Major', 2003, 'elliptical', 0.20, 2.20);
INSERT INTO public.galaxy VALUES (4, 'G1', 2000, 'elliptical', 10.00, 10.00);
INSERT INTO public.galaxy VALUES (5, 'G2', 2000, 'elliptical', 10.00, 12.00);
INSERT INTO public.galaxy VALUES (6, 'G3', 2000, 'elliptical', 10.00, 15.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '1', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, '2', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, '3', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (4, '4', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (5, '5', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (6, '6', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (7, '7', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (8, '7\8', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (9, '9', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (10, '10', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (11, '11', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (12, '13', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (13, '131', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (14, '1311', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (15, '1321', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (16, '121', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (17, '1211', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (18, '1212', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (19, '31', NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (20, '32', NULL, NULL, NULL, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'P1', false, 'NAH', 1991, 1);
INSERT INTO public.planet VALUES (2, 'P2', false, 'NAH', 1991, 1);
INSERT INTO public.planet VALUES (3, 'P3', false, 'NAH', 1991, 1);
INSERT INTO public.planet VALUES (4, 'P4', false, 'NAH', 1991, 1);
INSERT INTO public.planet VALUES (5, 'P5', false, 'NAH', 1991, 1);
INSERT INTO public.planet VALUES (6, 'P6', true, 'NAH', 1991, 2);
INSERT INTO public.planet VALUES (7, 'P7', true, 'NAH', 1991, 2);
INSERT INTO public.planet VALUES (8, 'P8', true, 'NAH', 1991, 2);
INSERT INTO public.planet VALUES (9, 'P9', true, 'NAH', 1991, 2);
INSERT INTO public.planet VALUES (10, 'P10', true, 'NAH', 1991, 2);
INSERT INTO public.planet VALUES (11, 'P11', true, 'N1AH', 1991, 3);
INSERT INTO public.planet VALUES (12, 'P12', true, 'N1AH', 1991, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, 8.00, 'Yellow');
INSERT INTO public.star VALUES (2, 'Polaris', NULL, 1, 8.00, 'White');
INSERT INTO public.star VALUES (3, 'S1', 1222, 2, 6.00, 'Blue');
INSERT INTO public.star VALUES (4, 'S2', 1023, 2, 3.00, 'White');
INSERT INTO public.star VALUES (5, 'S3', 1919, 3, 5.00, 'White');
INSERT INTO public.star VALUES (6, 'S4', 1891, 1, 12.00, 'Blue');


--
-- Name: bh_bh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.bh_bh_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: bh bh_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.bh
    ADD CONSTRAINT bh_name_key UNIQUE (name);


--
-- Name: bh bh_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.bh
    ADD CONSTRAINT bh_pkey PRIMARY KEY (bh_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: moon name_uniquem; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_uniquem UNIQUE (name);


--
-- Name: planet name_uniquep; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_uniquep UNIQUE (name);


--
-- Name: star name_uniques; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_uniques UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: bh bh_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.bh
    ADD CONSTRAINT bh_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_in_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_in_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_in_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_in_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_in_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_in_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

