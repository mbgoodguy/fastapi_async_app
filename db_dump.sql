--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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
-- Name: notes; Type: TABLE; Schema: public; Owner: hello_fastapi
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    title character varying(50),
    description character varying(50),
    created_date timestamp without time zone NOT NULL
);


ALTER TABLE public.notes OWNER TO hello_fastapi;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: hello_fastapi
--

CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO hello_fastapi;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hello_fastapi
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: hello_fastapi
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: hello_fastapi
--

COPY public.notes (id, title, description, created_date) FROM stdin;
1	Note1	desc 1	2024-03-16 13:23:02.20898
\.


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hello_fastapi
--

SELECT pg_catalog.setval('public.notes_id_seq', 1, true);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: hello_fastapi
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

