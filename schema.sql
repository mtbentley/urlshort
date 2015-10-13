--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: archives; Type: TABLE; Schema: public; Owner: pgsql; Tablespace: 
--

CREATE TABLE archives (
    uid character varying(10),
    url character varying,
    saved_at timestamp(6) without time zone DEFAULT now()
);


ALTER TABLE public.archives OWNER TO pgsql;

--
-- Name: links; Type: TABLE; Schema: public; Owner: pgsql; Tablespace: 
--

CREATE TABLE links (
    id integer NOT NULL,
    uid character varying(10) NOT NULL,
    url character varying NOT NULL,
    created_at timestamp(6) without time zone DEFAULT now(),
    archive character varying
);


ALTER TABLE public.links OWNER TO pgsql;

--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: pgsql
--

CREATE SEQUENCE links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.links_id_seq OWNER TO pgsql;

--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pgsql
--

ALTER SEQUENCE links_id_seq OWNED BY links.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pgsql
--

ALTER TABLE ONLY links ALTER COLUMN id SET DEFAULT nextval('links_id_seq'::regclass);


--
-- Name: links_pkey; Type: CONSTRAINT; Schema: public; Owner: pgsql; Tablespace: 
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: uuid; Type: CONSTRAINT; Schema: public; Owner: pgsql; Tablespace: 
--

ALTER TABLE ONLY links
    ADD CONSTRAINT uuid UNIQUE (uid);


--
-- Name: archives_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pgsql
--

ALTER TABLE ONLY archives
    ADD CONSTRAINT archives_uid_fkey FOREIGN KEY (uid) REFERENCES links(uid);


--
-- Name: public; Type: ACL; Schema: -; Owner: pgsql
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM pgsql;
GRANT ALL ON SCHEMA public TO pgsql;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

