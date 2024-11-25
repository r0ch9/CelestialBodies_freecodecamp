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
-- Name: celestial_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_event (
    celestial_event_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    description text NOT NULL,
    is_recurring boolean NOT NULL
);


ALTER TABLE public.celestial_event OWNER TO freecodecamp;

--
-- Name: celestial_event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_event_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_event_event_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_event_event_id_seq OWNED BY public.celestial_event.celestial_event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size numeric NOT NULL,
    type text NOT NULL,
    has_supermassive_blackhole boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    distance_from_planet integer NOT NULL,
    is_habitable boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer,
    diameter integer NOT NULL,
    has_rings boolean NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    mass numeric NOT NULL,
    is_main_sequence boolean NOT NULL
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
-- Name: celestial_event celestial_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event ALTER COLUMN celestial_event_id SET DEFAULT nextval('public.celestial_event_event_id_seq'::regclass);


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
-- Data for Name: celestial_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_event VALUES (1, 'Solar Eclipse', 1, 'A solar eclipse visible from Earth', true);
INSERT INTO public.celestial_event VALUES (2, 'Supernova 1987A', 6, 'A supernova event in the Large Magellanic Cloud', false);
INSERT INTO public.celestial_event VALUES (3, 'Andromeda Collision', 2, 'Future collision with Milky Way galaxy', false);
INSERT INTO public.celestial_event VALUES (4, 'Triangulum Meteor Shower', 3, 'Annual meteor shower in Triangulum', true);
INSERT INTO public.celestial_event VALUES (5, 'Sombrero Galactic Storm', 4, 'Rare storm in Sombrero galaxy', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 110000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 50000, 'Elliptical', true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 70000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 14000, 'Irregular', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 384400, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 9377, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 23459, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 421700, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 671034, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 1070400, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 1882700, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 1221870, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 237948, false);
INSERT INTO public.moon VALUES (10, 'Triton', 7, 354800, false);
INSERT INTO public.moon VALUES (11, 'Miranda', 8, 129390, false);
INSERT INTO public.moon VALUES (12, 'Oberon', 8, 582600, false);
INSERT INTO public.moon VALUES (13, 'Titania', 8, 436300, false);
INSERT INTO public.moon VALUES (14, 'Umbriel', 8, 266000, false);
INSERT INTO public.moon VALUES (15, 'Ariel', 8, 191020, false);
INSERT INTO public.moon VALUES (16, 'Proxima Centauri Moon I', 9, 15000, false);
INSERT INTO public.moon VALUES (17, 'Alpha Centauri Bb Moon I', 9, 20000, false);
INSERT INTO public.moon VALUES (18, 'Betelgeuse I Moon I', 10, 300000, false);
INSERT INTO public.moon VALUES (19, 'Betelgeuse II Moon I', 11, 350000, false);
INSERT INTO public.moon VALUES (20, 'Rigel I Moon I', 12, 400000, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, false);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 6779, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 139820, true);
INSERT INTO public.planet VALUES (4, 'Venus', 1, 12104, false);
INSERT INTO public.planet VALUES (5, 'Mercury', 1, 4879, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 116460, true);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 49244, true);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 50724, true);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', 3, 5800, false);
INSERT INTO public.planet VALUES (10, 'Betelgeuse I', 4, 150000, true);
INSERT INTO public.planet VALUES (11, 'Betelgeuse II', 4, 130000, true);
INSERT INTO public.planet VALUES (12, 'Rigel I', 5, 140000, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2.0, true);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 0.1, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 20.0, false);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 18.0, false);
INSERT INTO public.star VALUES (6, 'Vega', 3, 2.1, true);


--
-- Name: celestial_event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_event_event_id_seq', 5, true);


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
-- Name: celestial_event celestial_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_name_key UNIQUE (name);


--
-- Name: celestial_event celestial_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_pkey PRIMARY KEY (celestial_event_id);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: celestial_event celestial_event_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

