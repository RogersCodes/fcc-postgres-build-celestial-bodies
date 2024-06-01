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
-- Name: comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comets (
    comets_id integer NOT NULL,
    name character varying(255) NOT NULL,
    shape text,
    speed integer NOT NULL,
    has_nucleus boolean DEFAULT true,
    moon_id integer
);


ALTER TABLE public.comets OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comet_id_seq OWNED BY public.comets.comets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter integer,
    temperature numeric,
    description text,
    has_stars boolean DEFAULT true
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
    name character varying(255) NOT NULL,
    color character varying(255),
    description text NOT NULL,
    has_dust boolean DEFAULT true,
    shape character varying(255),
    planet_id integer
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
    name character varying(255) NOT NULL,
    has_people boolean DEFAULT false,
    number_of_people integer,
    description text,
    star_id integer
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
    name character varying(255) NOT NULL,
    temperature numeric,
    size integer,
    has_magnetic_field boolean DEFAULT true,
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
-- Name: comets comets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets ALTER COLUMN comets_id SET DEFAULT nextval('public.comets_comet_id_seq'::regclass);


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
-- Data for Name: comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comets VALUES (1, 'Chiron', 'Circular', 4000, true, 16);
INSERT INTO public.comets VALUES (2, 'Biela', 'Rectangular', 5000, false, 16);
INSERT INTO public.comets VALUES (3, 'Halley', 'Prism', 6000, true, 16);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 11000, 350, 'near Milky Way', true);
INSERT INTO public.galaxy VALUES (2, 'Black', 2000, 400, 'Evil Eye', false);
INSERT INTO public.galaxy VALUES (3, 'Bode', 34000, 200, 'Ursa Major', true);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 120000, 500, 'Looks like one', true);
INSERT INTO public.galaxy VALUES (5, 'Cigar', 890000, 700, 'Ursa Ayo', true);
INSERT INTO public.galaxy VALUES (6, 'Comet', 45000, 564, 'So far', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 'Grey', 'Visible at night', true, 'Oval', 4);
INSERT INTO public.moon VALUES (2, 'Spo', 'Light cream', 'Looks small', false, 'Circular', 4);
INSERT INTO public.moon VALUES (3, 'Rebo', 'Green', 'Uniquely designed', true, 'Round', 4);
INSERT INTO public.moon VALUES (4, 'Limo', 'Purple', 'Looks weird', false, 'Triangular', 4);
INSERT INTO public.moon VALUES (5, 'Maye', 'Brown', 'Dimly lit', false, 'Spherical', 4);
INSERT INTO public.moon VALUES (6, 'Grengo', 'White', 'Bright at night', true, 'Block', 4);
INSERT INTO public.moon VALUES (7, 'Soup', 'Red', 'Looks like a galaxy', true, 'flat', 4);
INSERT INTO public.moon VALUES (8, 'Beaver', 'Light Brown', 'Seen at night', true, 'Rectangular', 4);
INSERT INTO public.moon VALUES (9, 'Lysithea', 'Grey', 'Like Dark Matter', true, 'Square', 4);
INSERT INTO public.moon VALUES (10, 'Deimos', 'Cream', 'Appeas as ice', true, 'pyramid', 4);
INSERT INTO public.moon VALUES (12, 'Ganymede', 'Blue', 'Looks funny', true, 'Circle', 4);
INSERT INTO public.moon VALUES (15, 'Meko', 'Indigo', 'intricate design', true, 'spear', 4);
INSERT INTO public.moon VALUES (16, 'Neyo', 'Indica', 'Extraordinary', true, 'Octagon', 4);
INSERT INTO public.moon VALUES (17, 'Seya', 'Pink', 'Out of range', true, 'Nonagon', 4);
INSERT INTO public.moon VALUES (18, 'Bayo', 'Jungle', 'Newly discovered', true, 'Pentagon', 4);
INSERT INTO public.moon VALUES (19, 'Felo', 'Monochrome', 'Seen recently', false, 'Decagon', 4);
INSERT INTO public.moon VALUES (20, 'Vera', 'Light Purple', 'Located in Kenya', true, 'Rhombus', 4);
INSERT INTO public.moon VALUES (21, 'Valo', 'Pumpkin', 'Huge one', true, 'Hexagon', 4);
INSERT INTO public.moon VALUES (22, 'Malu', 'Tangerine', 'Last seen in Jupiter', false, 'Heart', 4);
INSERT INTO public.moon VALUES (23, 'Jamo', 'Merigold', 'Visible at Mars', true, 'Cylinder', 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 70000000, 'Humans live here', 4);
INSERT INTO public.planet VALUES (2, 'Mercury', false, 0, 'No life', 4);
INSERT INTO public.planet VALUES (3, 'Venus', false, 0, 'No sign of life', 4);
INSERT INTO public.planet VALUES (4, 'Mars', true, 6790, 'Aliens are present', 5);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 0, 'No life', 5);
INSERT INTO public.planet VALUES (6, 'Uranus', false, 0, 'No living being', 5);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 0, 'No human or alien', 5);
INSERT INTO public.planet VALUES (8, 'Pluto', false, 0, 'Non-existent', 4);
INSERT INTO public.planet VALUES (9, 'Nebula', false, 0, 'No thing lives', 4);
INSERT INTO public.planet VALUES (10, 'Zeinith', true, 2000, 'Some aliens', 4);
INSERT INTO public.planet VALUES (11, 'Valhalla', true, 50000, 'Vikings live here', 4);
INSERT INTO public.planet VALUES (12, 'Heaven', true, 60900, 'After life', 4);
INSERT INTO public.planet VALUES (13, 'Death Star', true, 3000, 'Rebels', 4);
INSERT INTO public.planet VALUES (14, 'Sayun', true, 89000, 'Spirits live', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alya', 600, 8900, false, 1);
INSERT INTO public.star VALUES (2, 'Alzri', 300, 45000, true, 1);
INSERT INTO public.star VALUES (3, 'Aurelius', 450, 908000, false, 1);
INSERT INTO public.star VALUES (4, 'Aga', 300, 56000, true, 1);
INSERT INTO public.star VALUES (5, 'Mako', 400, 67000, false, 1);
INSERT INTO public.star VALUES (6, 'Raye', 100, 15000, true, 1);
INSERT INTO public.star VALUES (7, 'Seg', 600, 21000, true, 1);


--
-- Name: comets_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comets comets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_name_key UNIQUE (name);


--
-- Name: comets comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comets_id);


--
-- Name: galaxy galaxy_name_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_description_key UNIQUE (name, description);


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
-- Name: moon moon_shape_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_shape_key UNIQUE (shape);


--
-- Name: planet planet_name_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_description_key UNIQUE (name, description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_size_key UNIQUE (name, size);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: comets fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--




