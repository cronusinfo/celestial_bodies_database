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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    galaxy_types text NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL
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
    is_spherical boolean,
    has_life boolean,
    distance_from_earth numeric NOT NULL,
    planet_type text NOT NULL,
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
    name character varying(30),
    has_life boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    planet_types text NOT NULL,
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
    name character varying(30),
    description text,
    distance_from_earth numeric NOT NULL,
    age_in_millions_of_years integer,
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
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    universe_id integer NOT NULL,
    galaxy_id integer,
    moon_id integer,
    star_id integer,
    planet_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_universe_id_seq OWNED BY public.universe.universe_id;


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
-- Name: universe universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN universe_id SET DEFAULT nextval('public.universe_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (11, 'Andromeda', 'Spiral', 'Majestic spiral galaxy', true);
INSERT INTO public.galaxy VALUES (12, 'Triangulum', 'Spiral', 'Cosmic beauty', false);
INSERT INTO public.galaxy VALUES (13, 'Messier 87', 'Elliptical', 'Giant elliptical galaxy', false);
INSERT INTO public.galaxy VALUES (14, 'Whirlpool', 'Spiral', 'Twisting beauty', true);
INSERT INTO public.galaxy VALUES (15, 'Centaurus A', 'Elliptical', 'Active galaxy', false);
INSERT INTO public.galaxy VALUES (16, 'Milky Way', 'Barred Spiral', 'Home to Earth', true);
INSERT INTO public.galaxy VALUES (17, 'Pinwheel', 'Spiral', 'Beautiful spiral galaxy', false);
INSERT INTO public.galaxy VALUES (18, 'Sombrero', 'Spiral', 'Hat-shaped galaxy', false);
INSERT INTO public.galaxy VALUES (19, 'Cartwheel', 'Ring', 'Ring galaxy', true);
INSERT INTO public.galaxy VALUES (20, 'Bode''s Galaxy', 'Irregular', 'Satellite of the Milky Way', false);
INSERT INTO public.galaxy VALUES (21, 'Messier 101', 'Spiral', 'Grand design spiral galaxy', true);
INSERT INTO public.galaxy VALUES (22, 'Antennae', 'Irregular', 'Colliding galaxies', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (41, 'Luna', true, true, 384400, 'Terrestrial', 36);
INSERT INTO public.moon VALUES (42, 'Phobos', true, false, 9380, 'Terrestrial', 26);
INSERT INTO public.moon VALUES (43, 'Deimos', true, false, 23460, 'Terrestrial', 27);
INSERT INTO public.moon VALUES (44, 'Europa', true, true, 628000000, 'Gas Giant', 28);
INSERT INTO public.moon VALUES (45, 'Ganymede', true, true, 628000000, 'Gas Giant', 29);
INSERT INTO public.moon VALUES (46, 'Callisto', true, true, 628000000, 'Gas Giant', 30);
INSERT INTO public.moon VALUES (47, 'Io', true, false, 628000000, 'Gas Giant', 31);
INSERT INTO public.moon VALUES (48, 'Titan', true, true, 1200000000, 'Gas Giant', 32);
INSERT INTO public.moon VALUES (49, 'Enceladus', true, true, 1400000000, 'Gas Giant', 33);
INSERT INTO public.moon VALUES (50, 'Mimas', true, false, 1500000000, 'Gas Giant', 34);
INSERT INTO public.moon VALUES (51, 'Miranda', true, false, 2700000000, 'Ice Giant', 35);
INSERT INTO public.moon VALUES (52, 'Ariel', true, false, 2700000000, 'Ice Giant', 36);
INSERT INTO public.moon VALUES (53, 'Triton', true, false, 4400000000, 'Ice Giant', 25);
INSERT INTO public.moon VALUES (54, 'Charon', true, false, 5900000000, 'Dwarf', 26);
INSERT INTO public.moon VALUES (55, 'Nereid', true, false, 4600000000, 'Ice Giant', 27);
INSERT INTO public.moon VALUES (56, 'Rhea', true, false, 1500000000, 'Gas Giant', 28);
INSERT INTO public.moon VALUES (57, 'Umbriel', true, false, 2700000000, 'Ice Giant', 29);
INSERT INTO public.moon VALUES (58, 'Titania', true, false, 2700000000, 'Ice Giant', 30);
INSERT INTO public.moon VALUES (59, 'Oberon', true, false, 2700000000, 'Ice Giant', 31);
INSERT INTO public.moon VALUES (60, 'Pluto Moon', true, false, 1500000000, 'Gas Giant', 32);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'Mercury', true, 5, 'Terrestrial', 13);
INSERT INTO public.planet VALUES (26, 'Venus', false, 5, 'Terrestrial', 14);
INSERT INTO public.planet VALUES (27, 'Earth', true, 5, 'Terrestrial', 15);
INSERT INTO public.planet VALUES (28, 'Mars', false, 5, 'Terrestrial', 16);
INSERT INTO public.planet VALUES (29, 'Jupiter', false, 5, 'Gas Giant', 17);
INSERT INTO public.planet VALUES (30, 'Saturn', false, 5, 'Gas Giant', 18);
INSERT INTO public.planet VALUES (31, 'Uranus', false, 5, 'Ice Giant', 19);
INSERT INTO public.planet VALUES (32, 'Neptune', false, 5, 'Ice Giant', 20);
INSERT INTO public.planet VALUES (33, 'Pluto', false, 5, 'Dwarf', 21);
INSERT INTO public.planet VALUES (34, 'Ceres', false, 5, 'Dwarf', 22);
INSERT INTO public.planet VALUES (35, 'Eris', false, 5, 'Dwarf', 23);
INSERT INTO public.planet VALUES (36, 'Earthlings', true, 5, 'Terrestrial', 24);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (13, 'Sirius', 'Brightest star, part of Canis Major', 8.6, 200, 11);
INSERT INTO public.star VALUES (14, 'Alpha Centauri', 'Closest star system to Earth', 4.37, 6400, 12);
INSERT INTO public.star VALUES (15, 'Betelgeuse', 'Red supergiant in Orion', 642.5, 8, 13);
INSERT INTO public.star VALUES (16, 'Proxima Centauri', 'Closest known star to the Sun', 4.24, 4850, 14);
INSERT INTO public.star VALUES (17, 'Vega', 'Bright star in Lyra constellation', 25.3, 455, 15);
INSERT INTO public.star VALUES (18, 'Alpha Canis Majoris (Sirius)', 'Brightest star in the night sky', 8.6, 200, 16);
INSERT INTO public.star VALUES (19, 'Alpha Lyrae (Vega)', 'Fifth-brightest star in the night sky', 25.3, 455, 17);
INSERT INTO public.star VALUES (20, 'Alpha Orionis (Betelgeuse)', 'Red supergiant in Orion constellation', 642.5, 8, 18);
INSERT INTO public.star VALUES (21, 'Alpha Centauri A', 'Primary component of the Alpha Centauri system', 4.37, 6400, 19);
INSERT INTO public.star VALUES (22, 'Alpha Centauri B', 'Secondary component of the Alpha Centauri system', 4.37, 6400, 20);
INSERT INTO public.star VALUES (23, 'Tau Ceti', 'Sun-like star with known exoplanets', 11.9, 5800, 21);
INSERT INTO public.star VALUES (24, 'Arcturus', 'Brightest star in the northern celestial hemisphere', 36.7, 7100, 22);


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES (4, 16, 41, 14, 36, 'Solar system');
INSERT INTO public.universe VALUES (8, 17, 46, 24, 25, 'Kepler-186');
INSERT INTO public.universe VALUES (9, 17, 46, 24, 25, 'Gliese 581 System');
INSERT INTO public.universe VALUES (15, 18, 48, 15, 35, 'Proxima Centauri System');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 22, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 60, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 24, true);


--
-- Name: universe_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_universe_id_seq', 15, true);


--
-- Name: star constraint_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT constraint_name UNIQUE (name);


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
-- Name: moon name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name UNIQUE (name);


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
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_name_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_constraint UNIQUE (name);


--
-- Name: universe universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_name_key UNIQUE (name);


--
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (universe_id);


--
-- Name: universe fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: universe fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: universe fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: universe fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

