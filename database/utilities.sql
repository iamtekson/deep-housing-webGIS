--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: boundary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boundary (
    gid integer NOT NULL,
    area double precision,
    geom public.geometry(MultiPolygon,4326)
);


ALTER TABLE public.boundary OWNER TO postgres;

--
-- Name: boundary_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boundary_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boundary_gid_seq OWNER TO postgres;

--
-- Name: boundary_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boundary_gid_seq OWNED BY public.boundary.gid;


--
-- Name: boundarybuilding; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boundarybuilding (
    gid integer NOT NULL,
    geom public.geometry(MultiLineString,4326)
);


ALTER TABLE public.boundarybuilding OWNER TO postgres;

--
-- Name: boundarybuilding_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boundarybuilding_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boundarybuilding_gid_seq OWNER TO postgres;

--
-- Name: boundarybuilding_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boundarybuilding_gid_seq OWNED BY public.boundarybuilding.gid;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: drainage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drainage (
    gid integer NOT NULL,
    line_type character varying(50),
    p_dia_mm integer,
    geom public.geometry(MultiLineString,4326)
);


ALTER TABLE public.drainage OWNER TO postgres;

--
-- Name: drainage_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drainage_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drainage_gid_seq OWNER TO postgres;

--
-- Name: drainage_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drainage_gid_seq OWNED BY public.drainage.gid;


--
-- Name: electrical; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.electrical (
    gid integer NOT NULL,
    line_type character varying(50),
    cable_type character varying(50),
    p_material character varying(50),
    p_dia_mm character varying(50),
    phase_c double precision,
    c_dia_mm integer,
    c_material character varying(50),
    geom public.geometry(MultiLineString,4326)
);


ALTER TABLE public.electrical OWNER TO postgres;

--
-- Name: electrical_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.electrical_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.electrical_gid_seq OWNER TO postgres;

--
-- Name: electrical_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.electrical_gid_seq OWNED BY public.electrical.gid;


--
-- Name: house; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.house (
    gid integer NOT NULL,
    house_type character varying(50),
    area_sq_m_ bigint,
    curr_resid character varying(50),
    permanent character varying(50),
    plot_no bigint,
    geom public.geometry(MultiPolygon,4326)
);


ALTER TABLE public.house OWNER TO postgres;

--
-- Name: house_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.house_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.house_gid_seq OWNER TO postgres;

--
-- Name: house_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.house_gid_seq OWNED BY public.house.gid;


--
-- Name: issue_issue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_issue (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    issue_header character varying(50) NOT NULL,
    issue_body character varying(5000) NOT NULL,
    issue_date timestamp with time zone NOT NULL,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    location public.geometry(Point,4326)
);


ALTER TABLE public.issue_issue OWNER TO postgres;

--
-- Name: issue_issue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issue_issue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_issue_id_seq OWNER TO postgres;

--
-- Name: issue_issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issue_issue_id_seq OWNED BY public.issue_issue.id;


--
-- Name: man hole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."man hole" (
    gid integer NOT NULL,
    geom public.geometry(Point,4326)
);


ALTER TABLE public."man hole" OWNER TO postgres;

--
-- Name: man hole_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."man hole_gid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."man hole_gid_seq" OWNER TO postgres;

--
-- Name: man hole_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."man hole_gid_seq" OWNED BY public."man hole".gid;


--
-- Name: outlet_valve; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outlet_valve (
    gid integer NOT NULL,
    __gid integer,
    geom public.geometry(Point,4326)
);


ALTER TABLE public.outlet_valve OWNER TO postgres;

--
-- Name: outlet_valve_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.outlet_valve_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.outlet_valve_gid_seq OWNER TO postgres;

--
-- Name: outlet_valve_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.outlet_valve_gid_seq OWNED BY public.outlet_valve.gid;


--
-- Name: park; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.park (
    gid integer NOT NULL,
    geom public.geometry(MultiPolygon,4326)
);


ALTER TABLE public.park OWNER TO postgres;

--
-- Name: park_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.park_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.park_gid_seq OWNER TO postgres;

--
-- Name: park_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.park_gid_seq OWNED BY public.park.gid;


--
-- Name: road; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.road (
    gid integer NOT NULL,
    road_type character varying(50),
    road_typ_1 character varying(50),
    geom public.geometry(MultiLineString,4326)
);


ALTER TABLE public.road OWNER TO postgres;

--
-- Name: road_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.road_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.road_gid_seq OWNER TO postgres;

--
-- Name: road_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.road_gid_seq OWNED BY public.road.gid;


--
-- Name: sanitary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sanitary (
    gid integer NOT NULL,
    type character varying(30),
    pipe_mat character varying(50),
    diamr_mm_ integer,
    trench_dep character varying(50),
    geom public.geometry(MultiLineString,4326)
);


ALTER TABLE public.sanitary OWNER TO postgres;

--
-- Name: sanitary_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sanitary_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sanitary_gid_seq OWNER TO postgres;

--
-- Name: sanitary_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sanitary_gid_seq OWNED BY public.sanitary.gid;


--
-- Name: sanitary_junction_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sanitary_junction_point (
    gid integer NOT NULL,
    junction_p character varying(50),
    geom public.geometry(Point,4326)
);


ALTER TABLE public.sanitary_junction_point OWNER TO postgres;

--
-- Name: sanitary_junction_point_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sanitary_junction_point_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sanitary_junction_point_gid_seq OWNER TO postgres;

--
-- Name: sanitary_junction_point_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sanitary_junction_point_gid_seq OWNED BY public.sanitary_junction_point.gid;


--
-- Name: sewer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sewer (
    gid integer NOT NULL,
    type character varying(50),
    pipe_type character varying(50),
    p_diam_mm_ bigint,
    geom public.geometry(MultiLineString,4326)
);


ALTER TABLE public.sewer OWNER TO postgres;

--
-- Name: sewer_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sewer_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sewer_gid_seq OWNER TO postgres;

--
-- Name: sewer_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sewer_gid_seq OWNED BY public.sewer.gid;


--
-- Name: sewer_junction_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sewer_junction_points (
    gid integer NOT NULL,
    man_hole character varying(50),
    geom public.geometry(Point,4326)
);


ALTER TABLE public.sewer_junction_points OWNER TO postgres;

--
-- Name: sewer_junction_points_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sewer_junction_points_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sewer_junction_points_gid_seq OWNER TO postgres;

--
-- Name: sewer_junction_points_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sewer_junction_points_gid_seq OWNED BY public.sewer_junction_points.gid;


--
-- Name: street; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.street (
    gid integer NOT NULL,
    power_watt integer,
    pol_height integer,
    name character varying(50),
    geom public.geometry(Point,4326)
);


ALTER TABLE public.street OWNER TO postgres;

--
-- Name: street_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.street_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.street_gid_seq OWNER TO postgres;

--
-- Name: street_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.street_gid_seq OWNED BY public.street.gid;


--
-- Name: swimmingpool; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.swimmingpool (
    gid integer NOT NULL,
    name character varying(50),
    geom public.geometry(MultiPolygon,4326)
);


ALTER TABLE public.swimmingpool OWNER TO postgres;

--
-- Name: swimmingpool_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.swimmingpool_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.swimmingpool_gid_seq OWNER TO postgres;

--
-- Name: swimmingpool_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.swimmingpool_gid_seq OWNED BY public.swimmingpool.gid;


--
-- Name: telephone_internet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.telephone_internet (
    gid integer NOT NULL,
    line_type character varying(50),
    cabel_type character varying(50),
    p_material character varying(50),
    p_dia_mm integer,
    geom public.geometry(MultiLineString,4326)
);


ALTER TABLE public.telephone_internet OWNER TO postgres;

--
-- Name: telephone_internet_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.telephone_internet_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telephone_internet_gid_seq OWNER TO postgres;

--
-- Name: telephone_internet_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.telephone_internet_gid_seq OWNED BY public.telephone_internet.gid;


--
-- Name: temple; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temple (
    gid integer NOT NULL,
    geom public.geometry(MultiPolygon,4326)
);


ALTER TABLE public.temple OWNER TO postgres;

--
-- Name: temple_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temple_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temple_gid_seq OWNER TO postgres;

--
-- Name: temple_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temple_gid_seq OWNED BY public.temple.gid;


--
-- Name: water_network; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.water_network (
    gid integer NOT NULL,
    line_type character varying(50),
    pip_dia_in double precision,
    geom public.geometry(MultiLineString,4326)
);


ALTER TABLE public.water_network OWNER TO postgres;

--
-- Name: water_network_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.water_network_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.water_network_gid_seq OWNER TO postgres;

--
-- Name: water_network_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.water_network_gid_seq OWNED BY public.water_network.gid;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: boundary gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boundary ALTER COLUMN gid SET DEFAULT nextval('public.boundary_gid_seq'::regclass);


--
-- Name: boundarybuilding gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boundarybuilding ALTER COLUMN gid SET DEFAULT nextval('public.boundarybuilding_gid_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: drainage gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drainage ALTER COLUMN gid SET DEFAULT nextval('public.drainage_gid_seq'::regclass);


--
-- Name: electrical gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.electrical ALTER COLUMN gid SET DEFAULT nextval('public.electrical_gid_seq'::regclass);


--
-- Name: house gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house ALTER COLUMN gid SET DEFAULT nextval('public.house_gid_seq'::regclass);


--
-- Name: issue_issue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_issue ALTER COLUMN id SET DEFAULT nextval('public.issue_issue_id_seq'::regclass);


--
-- Name: man hole gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."man hole" ALTER COLUMN gid SET DEFAULT nextval('public."man hole_gid_seq"'::regclass);


--
-- Name: outlet_valve gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outlet_valve ALTER COLUMN gid SET DEFAULT nextval('public.outlet_valve_gid_seq'::regclass);


--
-- Name: park gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.park ALTER COLUMN gid SET DEFAULT nextval('public.park_gid_seq'::regclass);


--
-- Name: road gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.road ALTER COLUMN gid SET DEFAULT nextval('public.road_gid_seq'::regclass);


--
-- Name: sanitary gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sanitary ALTER COLUMN gid SET DEFAULT nextval('public.sanitary_gid_seq'::regclass);


--
-- Name: sanitary_junction_point gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sanitary_junction_point ALTER COLUMN gid SET DEFAULT nextval('public.sanitary_junction_point_gid_seq'::regclass);


--
-- Name: sewer gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sewer ALTER COLUMN gid SET DEFAULT nextval('public.sewer_gid_seq'::regclass);


--
-- Name: sewer_junction_points gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sewer_junction_points ALTER COLUMN gid SET DEFAULT nextval('public.sewer_junction_points_gid_seq'::regclass);


--
-- Name: street gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.street ALTER COLUMN gid SET DEFAULT nextval('public.street_gid_seq'::regclass);


--
-- Name: swimmingpool gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.swimmingpool ALTER COLUMN gid SET DEFAULT nextval('public.swimmingpool_gid_seq'::regclass);


--
-- Name: telephone_internet gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telephone_internet ALTER COLUMN gid SET DEFAULT nextval('public.telephone_internet_gid_seq'::regclass);


--
-- Name: temple gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temple ALTER COLUMN gid SET DEFAULT nextval('public.temple_gid_seq'::regclass);


--
-- Name: water_network gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_network ALTER COLUMN gid SET DEFAULT nextval('public.water_network_gid_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add sewer	7	add_sewer
26	Can change sewer	7	change_sewer
27	Can delete sewer	7	delete_sewer
28	Can view sewer	7	view_sewer
29	Can add boundary	8	add_boundary
30	Can change boundary	8	change_boundary
31	Can delete boundary	8	delete_boundary
32	Can view boundary	8	view_boundary
33	Can add boundarybuilding	9	add_boundarybuilding
34	Can change boundarybuilding	9	change_boundarybuilding
35	Can delete boundarybuilding	9	delete_boundarybuilding
36	Can view boundarybuilding	9	view_boundarybuilding
37	Can add drainage	11	add_drainage
38	Can change drainage	11	change_drainage
39	Can delete drainage	11	delete_drainage
40	Can view drainage	11	view_drainage
41	Can add drainage outlet valve	10	add_drainageoutletvalve
42	Can change drainage outlet valve	10	change_drainageoutletvalve
43	Can delete drainage outlet valve	10	delete_drainageoutletvalve
44	Can view drainage outlet valve	10	view_drainageoutletvalve
45	Can add park	17	add_park
46	Can change park	17	change_park
47	Can delete park	17	delete_park
48	Can view park	17	view_park
49	Can add road	12	add_road
50	Can change road	12	change_road
51	Can delete road	12	delete_road
52	Can view road	12	view_road
53	Can add sanitary	14	add_sanitary
54	Can change sanitary	14	change_sanitary
55	Can delete sanitary	14	delete_sanitary
56	Can view sanitary	14	view_sanitary
57	Can add sanitary junction point	13	add_sanitaryjunctionpoint
58	Can change sanitary junction point	13	change_sanitaryjunctionpoint
59	Can delete sanitary junction point	13	delete_sanitaryjunctionpoint
60	Can view sanitary junction point	13	view_sanitaryjunctionpoint
61	Can add sewer junction points	18	add_sewerjunctionpoints
62	Can change sewer junction points	18	change_sewerjunctionpoints
63	Can delete sewer junction points	18	delete_sewerjunctionpoints
64	Can view sewer junction points	18	view_sewerjunctionpoints
65	Can add street	15	add_street
66	Can change street	15	change_street
67	Can delete street	15	delete_street
68	Can view street	15	view_street
69	Can add swimmingpool	19	add_swimmingpool
70	Can change swimmingpool	19	change_swimmingpool
71	Can delete swimmingpool	19	delete_swimmingpool
72	Can view swimmingpool	19	view_swimmingpool
73	Can add temple	20	add_temple
74	Can change temple	20	change_temple
75	Can delete temple	20	delete_temple
76	Can view temple	20	view_temple
77	Can add water network	16	add_waternetwork
78	Can change water network	16	change_waternetwork
79	Can delete water network	16	delete_waternetwork
80	Can view water network	16	view_waternetwork
81	Can add electrical	21	add_electrical
82	Can change electrical	21	change_electrical
83	Can delete electrical	21	delete_electrical
84	Can view electrical	21	view_electrical
85	Can add house	22	add_house
86	Can change house	22	change_house
87	Can delete house	22	delete_house
88	Can view house	22	view_house
89	Can add telephone internet	23	add_telephoneinternet
90	Can change telephone internet	23	change_telephoneinternet
91	Can delete telephone internet	23	delete_telephoneinternet
92	Can view telephone internet	23	view_telephoneinternet
93	Can add man hole	24	add_manhole
94	Can change man hole	24	change_manhole
95	Can delete man hole	24	delete_manhole
96	Can view man hole	24	view_manhole
97	Can add outlet valve	25	add_outletvalve
98	Can change outlet valve	25	change_outletvalve
99	Can delete outlet valve	25	delete_outletvalve
100	Can view outlet valve	25	view_outletvalve
101	Can add issue	26	add_issue
102	Can change issue	26	change_issue
103	Can delete issue	26	delete_issue
104	Can view issue	26	view_issue
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$ReY1ZnG0HlrU$VBVYpXupMcFeyMxKx/2VUx4i2rNat9QE7dR6nRctzME=	2019-09-13 14:59:30.221405+05:45	t	tekson				t	t	2019-08-08 10:03:56.632962+05:45
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: boundary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boundary (gid, area, geom) FROM stdin;
1	31502.5	0106000020E610000001000000010300000001000000830000008070A3779FFE544000CA8B6ED6403C4000056894A0FE544000C99F4FD4403C4000F99433A2FE5440001B750CD0403C400092E53CA2FE544000493C7CD0403C408016EBD9A2FE5440000B407DCE403C40800D3794A3FE5440008EBD8ECB403C408007F01FA4FE54400044973AC9403C4080BCABAEA2FE5440007554F0BD403C4080C97073A1FE5440004DEACAB3403C4000B57919A1FE54400044A0E5B0403C400028D0B6A0FE54400079B2BEAD403C4000560DF79FFE544000B2579EA7403C40002B69429FFE5440002E2E09A2403C4000E2B9349FFE5440007C8393A1403C400098A9C39EFE5440002E58C79D403C40804EB8A69EFE544000309F3B9D403C40006039499EFE544000C9652D9B403C4080F52AC59DFE54400085244698403C40006D232A9DFE544000066DDA94403C40006254329CFE54400031A0628F403C408096031B9CFE5440002AECDE8E403C408042A43A9BFE5440001C2F0E8A403C400052A8329BFE5440006051E289403C4080A2472E9BFE5440002444CA89403C4080F7851A9BFE54400080B85D89403C4000F6711E9AFE544000FE9C6984403C40001B00FF99FE5440004C6DCB83403C4000D74C9399FE544000EEA0AD81403C4000D5910B99FE544000EFB68A7F403C40806C95F398FE544000B9B54D7F403C40805C928298FE544000D8472E7E403C40005D41B297FE54400063751C7C403C4080B1B1C899FE5440004A930B72403C400000A33398FE54400037D2006F403C4080F42EDD99FE5440008CCDAE66403C400063EEB696FE544000D20EC166403C4000DB0D4796FE5440000C477167403C4080B448D395FE54400031C57068403C400085F25995FE54400072F36F69403C40803522FC94FE544000F6BCD26B403C40003823FA94FE5440002584426C403C4000AFA64F93FE5440005B08366D403C4080575D4193FE54400089B63E6D403C4080CF3ECC92FE544000C7DF856D403C4000B9216991FE544000D507406E403C408097678490FE544000E0EEB76E403C4000FE34988FFE5440006863226F403C40007395328EFE544000F3FDE96F403C4000299AC28DFE544000AB122770403C40809BDC568CFE5440000A7AED70403C4000407DEE8BFE5440008D562571403C400068777E8AFE544000DF4EEA71403C408097EA108AFE5440002C0B3472403C40009C7C2489FE544000D52DD372403C400091CD4A88FE544000F1535173403C40803AC14D87FE5440007DF8E373403C400058306D86FE544000F67E7674403C4080ABAF7885FE54400096071675403C40005A249384FE54400067238775403C408032150984FE5440006449E475403C400075450283FE544000EA76DA76403C400072768E82FE544000A9985B77403C4080E1598A81FE544000DAA17D78403C4080D6BBC180FE544000696B5479403C4000FFE7CA7FFE54400056AE5C7A403C4000B607FB7EFE5440008A01367B403C4000F566817DFE54400082CCC07C403C40000DA22F7DFE544000F404187D403C408059C32A7CFE544000D8472E7E403C4000414BC07BFE544000FED89F7E403C40000B5A837BFE54400065E6D87E403C4000D893067BFE544000B9B54D7F403C4080190C9D79FE544000EA29A080403C400077C57879FE5440003BB5BF80403C40003D791E78FE54400025D6EC81403C408028075778FE544000A8294083403C40802FEB3579FE544000BB98A487403C4080442A1C7AFE544000D596038D403C40001837987AFE5440003665E88F403C4000C201A97BFE54400073AB3C97403C40004D30F07BFE54400015D32A99403C40801D46727CFE54400034E5B19C403C40006548D17CFE5440000B5A289F403C4080D8CCA97DFE544000081CC5A4403C4080CA23047EFE54400076851CA7403C4000585C3B7EFE544000F36386A8403C400094098D7EFE5440004773AFAA403C408091C3167FFE5440009E7EE0AD403C40806706E37FFE54400084748BB2403C4080E9C4F67FFE544000E7A1F9B2403C4080703F0280FE544000A4AF39B3403C40809DCF4E80FE5440006FEDE4B4403C400064F10F81FE54400063932DB9403C4000BCB92181FE544000A58C92B9403C4000539D5981FE5440009F93D4BA403C4000782EC781FE544000C81442BD403C40807DADE181FE544000A360D8BD403C400068627582FE5440007D420BC0403C40806CA24483FE544000F231E1C2403C4000E594C383FE5440006BDA9DC4403C4000B3A6E683FE54400006B118C5403C408048676384FE54400045AD17C7403C40003513CB84FE54400035EE30C9403C40005099F885FE544000DE814BCF403C4000A27B0586FE54400087808CCF403C400004FA3187FE544000435E78D5403C408040C59987FE5440004B6074D5403C4080C58EFC89FE544000AF7A40D5403C4000F0950E8AFE54400025442AD5403C4080221DDC8AFE544000B0062DD4403C400041D6DB8BFE54400082EA4FD3403C40000322CA8CFE544000D6DF81D2403C40805D899C8DFE5440002504FAD1403C40807DA1C38DFE544000E0C5E0D1403C40000530A68EFE544000157C4ED1403C40006B34728FFE5440008A8ABDD0403C40801DDC4291FE544000916D73CF403C400090701692FE5440003C2608CE403C40000040F792FE544000775487CC403C4000C28BD893FE544000E0AD05CB403C40801E39B594FE54400088C30CCA403C4080ACB57D95FE5440005D9F2AC9403C4000327C7F96FE5440004C061CC8403C4000E88DC397FE544000D9D5C7C6403C4080F105CF98FE544000893AE0CD403C40802F8CBE99FE544000E81D4FD5403C4080ED346A9AFE5440003711A7DA403C40001CFCD99AFE5440004D3255DE403C408033C6939CFE544000845616DC403C40800AEB429EFE5440009F9102D9403C408070A3779FFE544000CA8B6ED6403C40
\.


--
-- Data for Name: boundarybuilding; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boundarybuilding (gid, geom) FROM stdin;
1	0105000020E610000003010000010200000009000000DC565D4193FE5440B08AB63E6D403C4044AEA64F93FE5440005C08366D403C40203823FA94FE5440402584426C403C40703422FC94FE544020F7BCD26B403C404484F25995FE5440F071F36F69403C4050CB9D0096FE5440C04E5F936A403C40F857695F98FE54400059F2586F403C40A4B1B1C899FE54404048930B72403C40205D41B297FE54404062751C7C403C4001020000000300000034B9216991FE5440E0D107406E403C40ACCF3ECC92FE544000C6DF856D403C40DC565D4193FE5440B08AB63E6D403C4001020000000300000014FE34988FFE5440406A63226F403C40E097678490FE5440C0DCEEB76E403C4034B9216991FE5440E0D107406E403C400102000000030000000C289AC28DFE5440F0A7122770403C40DC7295328EFE544070F3FDE96F403C4014FE34988FFE5440406A63226F403C4001020000000300000034407DEE8BFE5440208C562571403C40C09ADC568CFE5440400C7AED70403C400C289AC28DFE5440F0A7122770403C400102000000030000008C97EA108AFE5440E02C0B3472403C401467777E8AFE544030DC4EEA71403C4034407DEE8BFE5440208C562571403C400102000000030000009890CD4A88FE5440A0EF535173403C405C9B7C2489FE5440E0D12DD372403C408C97EA108AFE5440E02C0B3472403C400102000000030000005C57306D86FE544080F67E7674403C40E839C14D87FE5440107CF8E373403C409890CD4A88FE5440A0EF535173403C40010200000003000000A059249384FE54402069238775403C40A8AAAF7885FE54400093071675403C405C57306D86FE544080F67E7674403C40010200000002000000A059249384FE54402069238775403C408C149D1B85FE5440F083A42281403C400102000000040000003C71768E82FE5440A0A7985B77403C40F874450283FE544050EC76DA76403C403432150984FE5440D06449E475403C40A059249384FE54402069238775403C4001020000000300000008D6BBC180FE544080696B5479403C4080E1598A81FE544000D9A17D78403C403C71768E82FE5440A0A7985B77403C40010200000002000000CCCA6DF791FE544020D7A53E79403C4034B9216991FE5440E0D107406E403C40010200000006000000CCCA6DF791FE544020D7A53E79403C40DC6A139D93FE5440404BC85078403C40604B73B093FE5440205C402678403C40205974C393FE5440700DFCC077403C404801C9C493FE544000627F6677403C40DC565D4193FE5440B08AB63E6D403C40010200000003000000C8B507FB7EFE5440B08A01367B403C40F8FEE7CA7FFE54407055AE5C7A403C4008D6BBC180FE544080696B5479403C40010200000002000000F4CE9F1F90FE544010A095587A403C4014FE34988FFE5440406A63226F403C40010200000002000000F4CE9F1F90FE544010A095587A403C40CCCA6DF791FE544020D7A53E79403C40010200000002000000181ECF4E8EFE5440508A1D647B403C400C289AC28DFE5440F0A7122770403C40010200000002000000181ECF4E8EFE5440508A1D647B403C40F4CE9F1F90FE544010A095587A403C400102000000030000009C0CA22F7DFE544020F204187D403C4008F566817DFE5440A082CCC07C403C40C8B507FB7EFE5440B08A01367B403C400102000000020000002CD1E5698CFE5440505277807C403C4034407DEE8BFE5440208C562571403C40010200000004000000205D41B297FE54404062751C7C403C40B4D4910B99FE5440E0F0B68A7F403C40DCD54C9399FE544020EEA0AD81403C40E4F4711E9AFE544090FA9C6984403C40010200000006000000205D41B297FE54404062751C7C403C40486D843997FE5440C013BE217E403C4060136C6997FE5440A0FC176081403C406CB9539997FE54400073E60885403C40F4663DC597FE5440C01DBA5787403C40081C5B1E98FE5440108A434F89403C40010200000003000000140A5A837BFE5440F062E6D87E403C403C404BC07BFE544040FFD89F7E403C409C0CA22F7DFE544020F204187D403C400102000000020000008CB4F7978AFE54407069F79B7D403C408C97EA108AFE5440E02C0B3472403C400102000000030000008CB4F7978AFE54407069F79B7D403C402CD1E5698CFE5440505277807C403C40181ECF4E8EFE5440508A1D647B403C4001020000000200000048E0FAC988FE5440D0E4A9C27E403C409890CD4A88FE5440A0EF535173403C4001020000000200000048E0FAC988FE5440D0E4A9C27E403C408CB4F7978AFE54407069F79B7D403C40010200000002000000A09C3F3D90FE54404073A9217E403C408405766E8EFE544010F0B2267F403C400102000000030000008477C57879FE5440F03CB5BF80403C401C190C9D79FE544000E829A080403C40140A5A837BFE5440F062E6D87E403C400102000000040000008477C57879FE5440F03CB5BF80403C40C4D22B807AFE5440904567528C403C40FC3B34547CFE5440209098428A403C40140A5A837BFE5440F062E6D87E403C400102000000030000008405766E8EFE544010F0B2267F403C40BC681D2E8EFE544040DA23517F403C406058369E8CFE5440C0FE5A4980403C40010200000002000000D8F526EE86FE544020294DFB7F403C405C57306D86FE544080F67E7674403C40010200000002000000D8F526EE86FE544020294DFB7F403C4048E0FAC988FE5440D0E4A9C27E403C400102000000020000006058369E8CFE5440C0FE5A4980403C403045C1C98AFE5440A03F1F6C81403C400102000000030000008C149D1B85FE5440F083A42281403C40946D170D86FE544060DA2C8F80403C40D8F526EE86FE544020294DFB7F403C400102000000020000003045C1C98AFE5440A03F1F6C81403C40543270FE88FE54405016378982403C400102000000020000007C894F6A83FE5440305E03F882403C403C71768E82FE5440A0A7985B77403C400102000000030000007C894F6A83FE5440305E03F882403C408C589C0785FE544070AEDB2E81403C408C149D1B85FE5440F083A42281403C400102000000030000007C894F6A83FE5440305E03F882403C407C817DA482FE544040522CA683403C40BC776DA581FE5440D03EECB084403C40010200000003000000543270FE88FE54405016378982403C404C99DFC088FE544000876DAF82403C40A841C02A87FE544050EB42B483403C40010200000002000000A841C02A87FE544050EB42B483403C405C90375885FE5440A0FCE4DF84403C40010200000002000000BC776DA581FE5440D03EECB084403C4008D6BBC180FE544080696B5479403C400102000000030000005C90375885FE5440A0FCE4DF84403C40E431151085FE5440D013390E85403C409023898483FE544050C269B486403C40010200000003000000E4F4711E9AFE544090FA9C6984403C4054F7851A9BFE5440C07EB85D89403C4008A2472E9BFE5440702444CA89403C40010200000002000000A47968E47FFE544080751BB586403C40C8B507FB7EFE5440B08A01367B403C40010200000002000000A47968E47FFE544080751BB586403C40BC776DA581FE5440D03EECB084403C400102000000020000009023898483FE544050C269B486403C4024DC1EC981FE5440B013B28D88403C400102000000020000007006DD7294FE54402006DBE185403C4008EBD0B392FE544050DC144D87403C400102000000080000007006DD7294FE54402006DBE185403C4098F85E0F96FE5440C059E6C784403C40D83A924E97FE54406075B5908C403C406C693B5E97FE5440304F7BF28C403C4004C5E75A97FE5440E09348568D403C404C18484597FE544010EB1AB08D403C40E4F38B2F97FE5440B02BE4C18D403C40B0B3E1FF94FE54401072E08B8F403C40010200000002000000E80232187EFE5440C09E4E9788403C409C0CA22F7DFE544020F204187D403C40010200000002000000E80232187EFE5440C09E4E9788403C40A47968E47FFE544080751BB586403C4001020000000200000024DC1EC981FE5440B013B28D88403C40C8A72A4282FE5440E0E871EA8E403C4001020000000700000024DC1EC981FE5440B013B28D88403C401410CA0C81FE5440405EB65689403C4054407D997EFE544080A243108C403C40A43CB0827EFE5440D06470348C403C40A0BDA17D7EFE544070663F738C403C4048D85E817EFE5440C0F53BC78C403C40BC22E8657FFE5440F0292EEE91403C4001020000000400000008EBD0B392FE544050DC144D87403C40043D3BA992FE54406087DA9F86403C408463DD2192FE5440D01E95177D403C4018841C3D90FE544090A6701F7E403C4001020000000200000008EBD0B392FE544050DC144D87403C40800BF43993FE5440400461E290403C4001020000000200000070D201D490FE544050F6267C87403C40108AEDA092FE54402019C71086403C40010200000003000000FC3B34547CFE5440209098428A403C4014C93FDF7DFE5440B055F9D288403C40E80232187EFE5440C09E4E9788403C400102000000030000008405766E8EFE544010F0B2267F403C40E0D10F0F8FFE544070D1E50389403C404C3D15D490FE544010CC937B87403C40010200000002000000081C5B1E98FE5440108A434F89403C40E4F4711E9AFE544090FA9C6984403C40010200000002000000081C5B1E98FE5440108A434F89403C4070A59C1E99FE5440002933F78E403C40010200000002000000C40C29468DFE5440906CCF978A403C406058369E8CFE5440C0FE5A4980403C4001020000000300000008A2472E9BFE5440702444CA89403C40D895031B9CFE5440C028ECDE8E403C40246254329CFE5440B02EA0628F403C4001020000000200000058D09B7A8BFE5440707755F98B403C403045C1C98AFE5440A03F1F6C81403C4001020000000300000058D09B7A8BFE5440707755F98B403C40702CFBD18BFE5440E0EA81B58B403C40C40C29468DFE5440906CCF978A403C4001020000000200000058D09B7A8BFE5440707755F98B403C4014C63E298CFE54401094AE6496403C40010200000002000000E8C43CB089FE544070A6295D8D403C40543270FE88FE54405016378982403C40010200000002000000E8C43CB089FE544070A6295D8D403C4058D09B7A8BFE5440707755F98B403C40010200000002000000C8A72A4282FE5440E0E871EA8E403C40C065008E82FE544010BED9E692403C40010200000006000000D01637987AFE5440403665E88F403C4060442A1C7AFE544060D696038D403C400C30EB3579FE5440F0BA98A487403C40F027075778FE544000A5294083403C40C43C791E78FE54400022D6EC81403C408477C57879FE5440F03CB5BF80403C40010200000004000000D01637987AFE5440403665E88F403C40A07DB72B7DFE5440E07CDC6A8D403C40F01F9E5D7DFE5440E004BCAA8D403C40441310757EFE5440905D94DF93403C40010200000002000000E414AAE787FE5440C07698BF8E403C40A841C02A87FE544050EB42B483403C40010200000002000000E414AAE787FE5440C07698BF8E403C40E8C43CB089FE544070A6295D8D403C400102000000020000005CC7461B86FE5440E069FD2490403C405C90375885FE5440A0FCE4DF84403C400102000000020000005CC7461B86FE5440E069FD2490403C40E414AAE787FE5440C07698BF8E403C4001020000000200000070A59C1E99FE5440002933F78E403C4008A2472E9BFE5440702444CA89403C4001020000000200000000A533FF94FE5440F0C9F27F8F403C407006DD7294FE54402006DBE185403C40010200000002000000246254329CFE5440B02EA0628F403C40C06B232A9DFE544000086DDA94403C40010200000002000000BC22E8657FFE5440F0292EEE91403C40C8A72A4282FE5440E0E871EA8E403C400102000000020000006CF8D84684FE5440505CA09091403C409023898483FE544050C269B486403C400102000000020000006CF8D84684FE5440505CA09091403C405CC7461B86FE5440E069FD2490403C40010200000002000000800BF43993FE5440400461E290403C406099C8FF94FE5440100B288A8F403C40010200000002000000C065008E82FE544010BED9E692403C406CF8D84684FE5440505CA09091403C40010200000002000000C065008E82FE544010BED9E692403C40F8C3E7B682FE5440B06F3C0D95403C40010200000002000000441310757EFE5440905D94DF93403C40F8261F617FFE54401019152399403C4001020000000200000080BBBE7A91FE5440805F553B92403C4030830AD590FE544030D4DA7C87403C4001020000000200000080BBBE7A91FE5440805F553B92403C40800BF43993FE5440400461E290403C40010200000003000000806760BC8FFE5440302C01A993403C40E0D10F0F8FFE544070D1E50389403C40C40C29468DFE5440906CCF978A403C40010200000002000000806760BC8FFE5440302C01A993403C4080BBBE7A91FE5440805F553B92403C40010200000004000000F012232495FE54409035AB6393403C40047E6E7893FE5440B0D9DFC294403C40485C398E92FE5440F0D7308395403C40B80D02F392FE5440505F0ECA9B403C40010200000002000000F8C3E7B682FE5440B06F3C0D95403C403865796280FE5440909DE8BA97403C40010200000002000000F8C3E7B682FE5440B06F3C0D95403C40B470EC5683FE5440E05261769D403C40010200000002000000640AABEF8DFE5440609DC4FE94403C40C40C29468DFE5440906CCF978A403C40010200000002000000640AABEF8DFE5440609DC4FE94403C40806760BC8FFE5440302C01A993403C40010200000003000000F01BC5119AFE544090D4B55394403C401C371B009AFE5440607552F193403C4070A59C1E99FE5440002933F78E403C40010200000002000000F01BC5119AFE544090D4B55394403C40246254329CFE5440B02EA0628F403C40010200000002000000F01BC5119AFE544090D4B55394403C40DC8E26139BFE5440F03758ED99403C40010200000003000000C06B232A9DFE544000086DDA94403C4090F52AC59DFE5440F080244698403C40E45F39499EFE5440C0C7652D9B403C400102000000020000003865796280FE5440909DE8BA97403C40BC22E8657FFE5440F0292EEE91403C400102000000090000003865796280FE5440909DE8BA97403C4018BCBA6981FE54406044F3B59D403C40386A4B8781FE54401040E5619E403C408034F19681FE5440D0BEBAB59E403C405001EFA881FE5440D0C867CD9E403C40E8C4B9BD81FE5440D0C867CD9E403C40607A5D0582FE5440F0B7FD909E403C4084FA574282FE5440B07EE1689E403C40B470EC5683FE5440E05261769D403C40010200000002000000E872D05C8AFE5440609BB1DF97403C40E8C43CB089FE544070A6295D8D403C40010200000002000000080EE85C8AFE544040A221E197403C40E872D05C8AFE5440609BB1DF97403C400102000000030000006434F55C8AFE5440A0A4EEE197403C4014C63E298CFE54401094AE6496403C40640AABEF8DFE5440609DC4FE94403C40010200000003000000404D30F07BFE5440C014D32A99403C4044C101A97BFE54407073AB3C97403C40D01637987AFE5440403665E88F403C40010200000002000000404D30F07BFE5440C014D32A99403C40441310757EFE5440905D94DF93403C40010200000003000000F8261F617FFE54401019152399403C40B4434DF47FFE544020523C6B9C403C4060CEE95380FE5440E045968D9E403C40010200000002000000E02DE6EA8EFE5440D040AE3C98403C40F847444F8FFE5440B04C539B9E403C40010200000005000000FC1CD31A98FE5440F072A0AE97403C40B02FE5AC97FE5440D020A26291403C40C035A8AA97FE5440D04F235891403C4078D803A697FE54401025995491403C40F012232495FE54409035AB6393403C400102000000020000008CC73E9B88FE5440909C413F99403C40E414AAE787FE5440C07698BF8E403C400102000000020000008CC73E9B88FE5440909C413F99403C40E872D05C8AFE5440609BB1DF97403C4001020000000200000010B36CD186FE544050BC1DAB9A403C405CC7461B86FE5440E069FD2490403C4001020000000200000010B36CD186FE544050BC1DAB9A403C408CC73E9B88FE5440909C413F99403C40010200000002000000E8F46E8C95FE5440103FF2B799403C40F012232495FE54409035AB6393403C40010200000002000000E8F46E8C95FE5440103FF2B799403C40FC1CD31A98FE5440F072A0AE97403C40010200000002000000E8F46E8C95FE5440103FF2B799403C40B80D02F392FE5440505F0ECA9B403C40010200000002000000DC8E26139BFE5440F03758ED99403C40C06B232A9DFE544000086DDA94403C40010200000003000000DC8E26139BFE5440F03758ED99403C40141542AB9BFE5440E001993C9D403C40A03B26109CFE5440B00948569F403C40010200000002000000A8A82F0485FE544090D8AE259C403C406CF8D84684FE5440505CA09091403C40010200000002000000A8A82F0485FE544090D8AE259C403C4010B36CD186FE544050BC1DAB9A403C40010200000003000000B80D02F392FE5440505F0ECA9B403C4030A42E4B93FE5440C014E047A1403C40C459015893FE5440E034A42AA2403C40010200000002000000B470EC5683FE5440E05261769D403C40A8A82F0485FE544090D8AE259C403C40010200000004000000E45F39499EFE5440C0C7652D9B403C40084EB8A69EFE544050319F3B9D403C40B897A9C39EFE5440F02A58C79D403C40E8E1B9349FFE5440407A8393A1403C400102000000090000008CE6FFBC88FE5440006146319D403C40A0A778208BFE5440F010183A9B403C4088EE3C318BFE544050108E2F9B403C40689558418BFE5440B00EF03E9B403C40D0E8934F8BFE5440E049A7629B403C40405CF7598BFE544030FDC8889B403C4080425E608BFE544030EFA0A89B403C4058DD1C638BFE5440F04796BD9B403C4028F132B88BFE544080AF7581A1403C400102000000020000008CE6FFBC88FE5440006146319D403C4038F1472889FE5440A0DD3194A3403C40010200000008000000E8ED7AEE91FE544020E190BD9C403C406C188E8C91FE544070B8C01597403C40A8F93B8691FE5440409790CC96403C400CD7E88191FE5440B0F8AA9896403C402C64EC7A91FE54400094687396403C40A08FCC6D91FE544010A2E95A96403C40808064F68EFE544030D97B3598403C40E02DE6EA8EFE5440D040AE3C98403C4001020000000300000060CEE95380FE5440E045968D9E403C40B885D4E180FE5440905D8AB8A1403C409063884681FE54409090C114A4403C40010200000003000000F06348D17CFE5440D00A5A289F403C40B81C46727CFE54400034E5B19C403C40404D30F07BFE5440C014D32A99403C40010200000002000000F06348D17CFE5440D00A5A289F403C40F8261F617FFE54401019152399403C4001020000000200000000ECEE2F86FE5440D0650B359F403C408CE6FFBC88FE5440006146319D403C40010200000002000000F847444F8FFE5440B04C539B9E403C40E8ED7AEE91FE544020E190BD9C403C40010200000002000000F847444F8FFE5440B04C539B9E403C40700415B18FFE5440004A81D0A4403C400102000000030000006049BA8598FE544030CEE8109E403C4040628A7D98FE544010C41B8B9D403C40FC1CD31A98FE5440F072A0AE97403C4001020000000C000000A48119C48CFE544060EED06AA0403C40CC9729808CFE5440A051764E9B403C40748CC97B8CFE5440D02B34FA9A403C408CA79C7A8CFE544090B456C99A403C404892CD7B8CFE544070DB3EA79A403C40786122808CFE54406078D5779A403C405CA2DA848CFE5440103DBB629A403C405417328B8CFE54405041E9509A403C409CA0A6948CFE5440F0AEE23F9A403C4060D5129D8CFE544060C8A1389A403C40340094A68CFE5440905D72309A403C40E02DE6EA8EFE5440D040AE3C98403C40010200000002000000A48119C48CFE544060EED06AA0403C40F847444F8FFE5440B04C539B9E403C40010200000002000000A48119C48CFE544060EED06AA0403C404CE304298DFE5440801C32F3A6403C40010200000002000000A03B26109CFE5440B00948569F403C40E45F39499EFE5440C0C7652D9B403C40010200000004000000A03B26109CFE5440B00948569F403C4024C97B899CFE544090A7E9DCA1403C4074204EE39CFE5440E0D02D9EA4403C40646CECF49CFE544060FCD630A5403C40010200000002000000683E85F595FE5440D0B38118A0403C40E8F46E8C95FE5440103FF2B799403C40010200000002000000683E85F595FE5440D0B38118A0403C406049BA8598FE544030CEE8109E403C4001020000000300000028F132B88BFE544080AF7581A1403C40F00A54B88BFE5440E0E65A81A1403C40501183528CFE544030BCB9EEAA403C40010200000002000000C459015893FE5440E034A42AA2403C40683E85F595FE5440D0B38118A0403C40010200000002000000C459015893FE5440E034A42AA2403C40F09050B093FE5440B0F65244A8403C400102000000080000009063884681FE54409090C114A4403C40807144FD81FE544070E4295DA8403C40CCDF99A782FE5440D0D5E35DAC403C4068D744AC82FE5440C0AD5B96AC403C40A03745AA82FE5440F0A04EBEAC403C4020A63BA282FE5440E06BEDFAAC403C40F47D1A9A82FE5440600D5127AD403C4064E8C4F67FFE544070E6A1F9B2403C4001020000000200000018BAC54F92FE5440B0FBB99AA2403C40E8ED7AEE91FE544020E190BD9C403C40010200000003000000E8E1B9349FFE5440407A8393A1403C40C02969429FFE5440902C2E09A2403C4088560DF79FFE544040B1579EA7403C4001020000000200000038F1472889FE5440A0DD3194A3403C4028F132B88BFE544080AF7581A1403C4001020000000200000038F1472889FE5440A0DD3194A3403C400422408E89FE544040D829A6A9403C40010200000002000000ECD7CCA97DFE5440600A1CC5A4403C40F06348D17CFE5440D00A5A289F403C40010200000002000000ECD7CCA97DFE5440600A1CC5A4403C4060CEE95380FE5440E045968D9E403C40010200000002000000700415B18FFE5440004A81D0A4403C4018BAC54F92FE5440B0FBB99AA2403C40010200000002000000700415B18FFE5440004A81D0A4403C4008CA017C90FE544010C75EB1B1403C40010200000003000000FCF7E0EB98FE5440A0F8FD8EA4403C40941FC2B798FE5440F0738D42A1403C406049BA8598FE544030CEE8109E403C40010200000002000000646CECF49CFE544060FCD630A5403C40E8E1B9349FFE5440407A8393A1403C40010200000002000000646CECF49CFE544060FCD630A5403C40040DEBAF9DFE5440509D7145AB403C400102000000020000004CE304298DFE5440801C32F3A6403C40700415B18FFE5440004A81D0A4403C400102000000020000004CE304298DFE5440801C32F3A6403C40C034E8EE8DFE544070627BC2B3403C40010200000002000000C811275896FE5440B0178862A6403C40683E85F595FE5440D0B38118A0403C40010200000002000000C811275896FE5440B0178862A6403C40FCF7E0EB98FE5440A0F8FD8EA4403C400102000000020000000C59F4B886FE544000F7B531A8403C4000ECEE2F86FE5440D0650B359F403C400102000000020000000C59F4B886FE544000F7B531A8403C40704697E884FE5440806E36C2A9403C40010200000002000000F09050B093FE5440B0F65244A8403C40C811275896FE5440B0178862A6403C40010200000002000000F09050B093FE5440B0F65244A8403C40E4C8071D94FE54406051A2E7AE403C40010200000003000000704697E884FE5440806E36C2A9403C40BCDF146384FE5440B0DC3095A0403C4000ECEE2F86FE5440D0650B359F403C40010200000007000000704697E884FE5440806E36C2A9403C40ECDA83A883FE5440109C0DBDAA403C40383CA27683FE544030A825C5A9403C4080FDCD5482FE54400052B4EDA2403C40C808D14E82FE5440D0D8D8A5A2403C4044F2CA5A82FE5440D0B9152EA2403C4094520D6384FE54406000AC94A0403C4001020000000200000088560DF79FFE544040B1579EA7403C40D027D0B6A0FE54402079B2BEAD403C400102000000020000000422408E89FE544040D829A6A9403C40B43E2AC389FE5440806B8ECCAC403C40010200000004000000C093098D7EFE5440604473AFAA403C4098575C3B7EFE544020F16386A8403C4014CA23047EFE54400074851CA7403C40ECD7CCA97DFE5440600A1CC5A4403C40010200000002000000C093098D7EFE5440604473AFAA403C409063884681FE54409090C114A4403C40010200000002000000144F74F486FE544050BF37C1AB403C400C59F4B886FE544000F7B531A8403C40010200000002000000144F74F486FE544050BF37C1AB403C400422408E89FE544040D829A6A9403C400102000000020000001809274D99FE5440A04EFDB6AA403C40FCF7E0EB98FE5440A0F8FD8EA4403C40010200000004000000B43E2AC389FE5440806B8ECCAC403C40F49CD0508CFE5440C081F6EFAA403C40501183528CFE544030BCB9EEAA403C40F4FA09EA8CFE5440705205BCB4403C40010200000003000000B43E2AC389FE5440806B8ECCAC403C4088591D648AFE544040F95A61B6403C40F0E54B688AFE5440B00140A6B6403C40010200000002000000040DEBAF9DFE5440509D7145AB403C4088560DF79FFE544040B1579EA7403C40010200000003000000040DEBAF9DFE5440509D7145AB403C4098A77BD99DFE54409073719FAC403C4094485E5F9EFE5440D0862918B1403C400102000000020000003C8C8BBC96FE544070B94AC9AC403C40C811275896FE5440B0178862A6403C400102000000020000003C8C8BBC96FE544070B94AC9AC403C401809274D99FE5440A04EFDB6AA403C4001020000000200000044CD99489BFE5440A01D71DBAC403C400C96578999FE5440B0DBE45BAE403C4001020000001100000044CD99489BFE5440A01D71DBAC403C40B023C1819CFE544050134BDBAB403C4090F0F58A9CFE544050AAA2E5AB403C4054FEB0949CFE544060A7EBFDAB403C409CD2ED9A9CFE5440108DE40BAC403C4028C200A39CFE5440303F5E22AC403C40304E5BBF9CFE5440D01ECBE5AC403C40D44C13D59CFE544050A12E8DAD403C40C0FBCAFB9CFE5440A0ED22D2AE403C4088C6113B9DFE544060D126DEB0403C40C86A9E659DFE5440D07CCB39B2403C4054EDE79F9DFE544000CB372BB4403C407413E99C9DFE5440F073498BB4403C406CB60F889DFE5440208715EDB4403C40CC20E0779DFE54402009DF17B5403C408CF4A9D59BFE54409070842DB6403C4044CD99489BFE5440A01D71DBAC403C400102000000030000000C96578999FE5440B0DBE45BAE403C409CD6B27D99FE5440409984C9AD403C401809274D99FE5440A04EFDB6AA403C40010200000003000000D027D0B6A0FE54402079B2BEAD403C4040B57919A1FE54405045A0E5B0403C4028C97073A1FE5440B04CEACAB3403C40010200000002000000E4C8071D94FE54406051A2E7AE403C403C8C8BBC96FE544070B94AC9AC403C40010200000003000000E4C8071D94FE54406051A2E7AE403C40DCF64D5D94FE544050CC49D4B2403C4070F9C58394FE5440F011B12AB5403C400102000000020000007820931493FE5440A0C1F796AF403C4018BAC54F92FE5440B0FBB99AA2403C4001020000000400000064E8C4F67FFE544070E6A1F9B2403C40046706E37FFE54409082748BB2403C402891C3167FFE5440A09B7EE0AD403C40C093098D7EFE5440604473AFAA403C4001020000000200000008CA017C90FE544010C75EB1B1403C407820931493FE5440A0C1F796AF403C40010200000002000000EC7899AF99FE5440602A3309B1403C400C96578999FE5440B0DBE45BAE403C40010200000002000000EC7899AF99FE5440602A3309B1403C40287B1E149AFE54402099F6B5B7403C4001020000000200000094485E5F9EFE5440D0862918B1403C40D027D0B6A0FE54402079B2BEAD403C4001020000000400000094485E5F9EFE5440D0862918B1403C403C099FE39EFE544000C3EC82B5403C40A0E127269FFE544070D1476FB7403C4028C97073A1FE5440B04CEACAB3403C40010200000003000000989CCF4E80FE5440906EEDE4B4403C4098703F0280FE544030A2AF39B3403C4064E8C4F67FFE544070E6A1F9B2403C40010200000008000000989CCF4E80FE5440906EEDE4B4403C4068A799EE82FE54402042DC3CAF403C405C9D851383FE5440C0B69605AF403C4008AEC53E83FE544090EAC24AAF403C4014B1CBC483FE5440C0BC1AB7B2403C407427869484FE544000450835B7403C40D869B99284FE5440E034EB38B7403C4018772EC781FE5440C0C91442BD403C40010200000002000000C034E8EE8DFE544070627BC2B3403C4008CA017C90FE544010C75EB1B1403C40010200000002000000C034E8EE8DFE544070627BC2B3403C40F0989D538EFE544040B3341CBA403C40010200000002000000D8E74E1F97FE5440507A7415B3403C403C8C8BBC96FE544070B94AC9AC403C40010200000002000000D8E74E1F97FE5440507A7415B3403C40EC7899AF99FE5440602A3309B1403C40010200000003000000F4FA09EA8CFE5440705205BCB4403C40181400E98CFE54400072D0BCB4403C40F0E54B688AFE5440B00140A6B6403C40010200000002000000F4FA09EA8CFE5440705205BCB4403C40E0ED1F4F8DFE54403009DBD9BA403C4001020000001000000028C97073A1FE5440B04CEACAB3403C4074BCABAEA2FE5440407354F0BD403C402807F01FA4FE54404040973AC9403C40700D3794A3FE5440A08BBD8ECB403C40F015EBD9A2FE5440800A407DCE403C401492E53CA2FE5440004B3C7CD0403C40E4F89433A2FE5440E01C750CD0403C4074046894A0FE5440C0C69F4FD4403C407470A3779FFE544060CB8B6ED6403C407009EB429EFE5440B09E9102D9403C400033C6939CFE544040825616DC403C40301BFCD99AFE5440004B3255DE403C400CED346A9AFE5440F03311A7DA403C40582F8CBE99FE544010E71D4FD5403C4014F105CF98FE5440A0863AE0CD403C4054E78DC397FE544030D9D5C7C6403C4001020000000200000070F9C58394FE5440F011B12AB5403C40D8E74E1F97FE5440507A7415B3403C4001020000000500000070F9C58394FE5440F011B12AB5403C40D07909E494FE5440306D2004BB403C40E8AFABF494FE544000209F5ABB403C40A05C4B0A95FE544020D58A82BB403C40EC08B38597FE5440B00FD79CB9403C40010200000002000000F0E54B688AFE5440B00140A6B6403C40B0D7E8C487FE5440702B2EAAB8403C40010200000002000000F0E54B688AFE5440B00140A6B6403C407CE08CC68AFE5440E03E0FB7BC403C40010200000003000000BCDCA69484FE544060A3C134B7403C406C0D821685FE5440807E9E2BBA403C404C8965AE85FE54400050A0D0BD403C400102000000020000004026327F93FE5440A0E23F1DB6403C407820931493FE5440A0C1F796AF403C4001020000000D0000004026327F93FE5440A0E23F1DB6403C40F0272EDC93FE544050BF97C5BB403C403027EAD193FE5440C0471F56BC403C40687A44B093FE5440E048328DBC403C40AC8306038FFE544020F6233CC0403C4034CD1DE98EFE5440C0EE1E34C0403C40989E7DD48EFE5440D0F14323C0403C4054FF27C18EFE544020A4ABFABF403C40B05498B78EFE54407017DBCBBF403C4098CFB2B08EFE5440404663A8BF403C4094301BAB8EFE544000DBAD7FBF403C409042E8A58EFE544020D3A04CBF403C40F0989D538EFE544040B3341CBA403C40010200000002000000B0D7E8C487FE5440702B2EAAB8403C40144F74F486FE544050BF37C1AB403C40010200000002000000287B1E149AFE54402099F6B5B7403C405C1BB1D59BFE54409068FD2DB6403C40010200000002000000F0989D538EFE544040B3341CBA403C404026327F93FE5440A0E23F1DB6403C40010200000002000000EC08B38597FE5440B00FD79CB9403C40D8E74E1F97FE5440507A7415B3403C40010200000002000000EC08B38597FE5440B00FD79CB9403C40287B1E149AFE54402099F6B5B7403C40010200000008000000E0ED1F4F8DFE54403009DBD9BA403C4008556DA48DFE54403059D32CC0403C40B8E540A88DFE5440C0F22A72C0403C403C2826AA8DFE54409034FAECC0403C40ECFE4AA18DFE5440802D7C2DC1403C4010C4DA968DFE5440A0607153C1403C4034F01A8B8DFE5440B0EE2A7EC1403C40A4D7352D8BFE5440F0F55B52C3403C40010200000002000000AC7BCA729BFE544090775D3CBA403C4080062EFA9BFE5440408305E2C2403C40010200000008000000AC7BCA729BFE544090775D3CBA403C405026C2479DFE5440B0C571D0B8403C40286C15519DFE5440103D35C9B8403C4020AD215C9DFE5440E0EC60CBB8403C409C4775609DFE5440507660F1B8403C4098F66B639DFE5440F0430D22B9403C40208D06E09DFE544080659320C1403C4080062EFA9BFE5440408305E2C2403C4001020000000400000018772EC781FE5440C0C91442BD403C4048529D5981FE5440B09E93D4BA403C4044BBB92181FE5440F0A58C92B9403C40989CCF4E80FE5440906EEDE4B4403C400102000000020000007CE08CC68AFE5440E03E0FB7BC403C40E0ED1F4F8DFE54403009DBD9BA403C400102000000020000007CE08CC68AFE5440E03E0FB7BC403C40A4D7352D8BFE5440F0F55B52C3403C40010200000002000000309FDB8899FE544010EF36CCBB403C40AC7BCA729BFE544090775D3CBA403C40010200000002000000309FDB8899FE544010EF36CCBB403C4080215B129AFE5440500F4CA5C4403C400102000000020000004C8965AE85FE54400050A0D0BD403C405C6CA24483FE544040F331E1C2403C400102000000030000004C8965AE85FE54400050A0D0BD403C408487EE7386FE544070446C15C2403C40B44342E986FE5440D0589DD5C4403C400102000000040000002820872488FE544080CCFCA6BE403C40A42FE11588FE544080C805D8BD403C40D4B204D087FE544050374E5AB9403C40B0D7E8C487FE5440702B2EAAB8403C400102000000020000002820872488FE544080CCFCA6BE403C407CE08CC68AFE5440E03E0FB7BC403C400102000000020000005CD0BBAD97FE5440C067FA4FBD403C40309FDB8899FE544010EF36CCBB403C400102000000020000005CD0BBAD97FE5440C067FA4FBD403C40D0F0A53B98FE5440402FBD58C6403C40010200000002000000808513E495FE5440C0887CC5BE403C405CD0BBAD97FE5440C067FA4FBD403C40010200000002000000808513E495FE5440C0887CC5BE403C4050327C7F96FE5440904B061CC8403C4001020000000200000030C9FA2494FE544060083729C0403C40808513E495FE5440C0887CC5BE403C4001020000000200000030C9FA2494FE544060083729C0403C407CFA24B594FE54403062770ACA403C400102000000040000005C6CA24483FE544040F331E1C2403C402068627582FE5440407F420BC0403C407C7DADE181FE544030A060D8BD403C4018772EC781FE5440C0C91442BD403C40010200000002000000BC35C34692FE5440300AD493C1403C4030C9FA2494FE544060083729C0403C40010200000002000000BC35C34692FE5440300AD493C1403C40ECFF3FF792FE544090765487CC403C40010200000005000000A4D7352D8BFE5440F0F55B52C3403C40D8F48BBD88FE544090F64734C5403C40CC309C9D88FE5440905F64FCC4403C405047A29188FE5440C0F58CACC4403C402820872488FE544080CCFCA6BE403C40010200000003000000C0B93E7E90FE5440B0CDFE0FC3403C40A0753C5891FE5440404EC852C2403C40BC35C34692FE5440300AD493C1403C40010200000002000000C0B93E7E90FE5440B0CDFE0FC3403C40F81CDC4291FE5440A0916D73CF403C4001020000000200000080062EFA9BFE5440408305E2C2403C4080215B129AFE5440500F4CA5C4403C40010200000002000000B44342E986FE5440D0589DD5C4403C40C43413CB84FE5440B033EE30C9403C40010200000005000000B44342E986FE5440D0589DD5C4403C4044CD765F87FE5440C08BCA42C7403C404049098F87FE544020BB4C3AC8403C40BCA248BA87FE544040DA0FB2C8403C4008452FEC87FE5440C01EDD15C9403C40010200000004000000946B34728FFE544060888ABDD0403C40C48CAFA38EFE544070509E75C4403C404027AB828FFE544080F4B8C0C3403C40C0B93E7E90FE5440B0CDFE0FC3403C4001020000000200000080215B129AFE5440500F4CA5C4403C40D0F0A53B98FE5440402FBD58C6403C40010200000002000000588E89E88CFE5440A094CBCBC5403C40C48CAFA38EFE544070509E75C4403C40010200000002000000588E89E88CFE5440A094CBCBC5403C40FC5D899C8DFE5440D02204FAD1403C4001020000000200000004A03B1B8BFE544030EB773DC7403C40588E89E88CFE5440A094CBCBC5403C4001020000000200000004A03B1B8BFE544030EB773DC7403C404040D6DB8BFE54408083EA4FD3403C40010200000002000000D0F0A53B98FE5440402FBD58C6403C4054E78DC397FE544030D9D5C7C6403C4001020000000200000054E78DC397FE544030D9D5C7C6403C4050327C7F96FE5440904B061CC8403C4001020000000200000030F5ED5289FE5440405C39A5C8403C4004A03B1B8BFE544030EB773DC7403C4001020000000200000030F5ED5289FE5440405C39A5C8403C4068EF950E8AFE5440F022442AD5403C40010200000004000000C43413CB84FE5440B033EE30C9403C408C48676384FE54404043AD17C7403C40D4B2A6E683FE5440C002B118C5403C405C6CA24483FE544040F331E1C2403C4001020000000600000008452FEC87FE5440C01EDD15C9403C40E427711288FE544060AEBE51C9403C407436402F88FE544050EC2362C9403C408888424C88FE5440B03EB05AC9403C40B09C519388FE5440202CFA2DC9403C4030F5ED5289FE5440405C39A5C8403C4001020000000700000008452FEC87FE5440C01EDD15C9403C40E07ED2FA87FE544070EB89B9C9403C403CCF7BFD87FE5440C0BF3859CA403C40E07ED2FA87FE5440905242EECA403C4038FC87E587FE5440E0DFB658CB403C4080793DD087FE5440A06D2BC3CB403C40E0A17B0586FE5440F085808CCF403C4001020000000500000050327C7F96FE5440904B061CC8403C40C0ABB57D95FE5440405E9F2AC9403C40C41D39B594FE54404085C30CCA403C408CC28BD893FE544040E2AD05CB403C40ECFF3FF792FE544090765487CC403C40010200000003000000ECFF3FF792FE544090765487CC403C40B48F701692FE5440C03B2608CE403C40F81CDC4291FE5440A0916D73CF403C40010200000003000000E0A17B0586FE5440F085808CCF403C40C44F99F885FE544080DC814BCF403C40C43413CB84FE5440B033EE30C9403C40010200000002000000F81CDC4291FE5440A0916D73CF403C40946B34728FFE544060888ABDD0403C40010200000003000000946B34728FFE544060888ABDD0403C407C0430A68EFE5440A0157C4ED1403C40FC5D899C8DFE5440D02204FAD1403C40010200000003000000FC5D899C8DFE5440D02204FAD1403C40500222CA8CFE544090D4DF81D2403C404040D6DB8BFE54408083EA4FD3403C400102000000030000004040D6DB8BFE54408083EA4FD3403C40E4211DDC8AFE544070B2062DD4403C4068EF950E8AFE5440F022442AD5403C4001020000000500000068EF950E8AFE5440F022442AD5403C40ACC58EFC89FE544040AD7A40D5403C408040C59987FE5440D04B6074D5403C405803FA3187FE544030445E78D5403C40E0A17B0586FE5440F085808CCF403C40
2	0105000020E6100000010000000102000000020000002F830AD590FE544009D4DA7C87403C401A841C3D90FE544090A6701F7E403C40
3	0105000020E6100000010000000102000000020000002C2A401690FE544010A7293CAB403C4080BE148C8DFE54409028CB5CAD403C40
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-08-08 10:14:59.426269+05:45	2	Boundary object (2)	1	[{"added": {}}]	8	1
2	2019-08-08 10:15:16.824132+05:45	2	Boundary object (2)	3		8	1
3	2019-08-08 10:15:33.686954+05:45	3	Boundary object (3)	1	[{"added": {}}]	8	1
4	2019-08-08 10:15:47.015293+05:45	3	Boundary object (3)	3		8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	shapefiles	sewer
8	shapefiles	boundary
9	shapefiles	boundarybuilding
10	shapefiles	drainageoutletvalve
11	shapefiles	drainage
12	shapefiles	road
13	shapefiles	sanitaryjunctionpoint
14	shapefiles	sanitary
15	shapefiles	street
16	shapefiles	waternetwork
17	shapefiles	park
18	shapefiles	sewerjunctionpoints
19	shapefiles	swimmingpool
20	shapefiles	temple
21	shapefiles	electrical
22	shapefiles	house
23	shapefiles	telephoneinternet
24	shapefiles	manhole
25	shapefiles	outletvalve
26	issue	issue
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-08-07 23:31:17.887361+05:45
2	auth	0001_initial	2019-08-07 23:31:19.400359+05:45
3	admin	0001_initial	2019-08-07 23:31:20.459518+05:45
4	admin	0002_logentry_remove_auto_add	2019-08-07 23:31:20.813764+05:45
5	admin	0003_logentry_add_action_flag_choices	2019-08-07 23:31:20.85375+05:45
6	contenttypes	0002_remove_content_type_name	2019-08-07 23:31:20.969705+05:45
7	auth	0002_alter_permission_name_max_length	2019-08-07 23:31:20.989695+05:45
8	auth	0003_alter_user_email_max_length	2019-08-07 23:31:21.022694+05:45
9	auth	0004_alter_user_username_opts	2019-08-07 23:31:21.058682+05:45
10	auth	0005_alter_user_last_login_null	2019-08-07 23:31:21.102664+05:45
11	auth	0006_require_contenttypes_0002	2019-08-07 23:31:21.114661+05:45
12	auth	0007_alter_validators_add_error_messages	2019-08-07 23:31:21.154647+05:45
13	auth	0008_alter_user_username_max_length	2019-08-07 23:31:21.262606+05:45
14	auth	0009_alter_user_last_name_max_length	2019-08-07 23:31:21.302592+05:45
15	auth	0010_alter_group_name_max_length	2019-08-07 23:31:21.358569+05:45
16	auth	0011_update_proxy_permissions	2019-08-07 23:31:21.398559+05:45
17	sessions	0001_initial	2019-08-07 23:31:21.522512+05:45
20	issue	0001_initial	2019-08-12 12:28:53.400542+05:45
21	issue	0002_auto_20190812_1306	2019-08-12 13:07:05.351918+05:45
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
glispjothtdv8izb5tv1e5a5l9rp322j	NDk2NDYyM2I0ZTIzYmNmODhhNGQ1Mjc5YTgyODVmOGJkMGYwMTNmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MWYxNWRlNmZiMWY5ZDYxZGJiMmVlZThiZWMwYjUzMWM1NDdkOWMyIn0=	2019-08-23 19:20:15.475441+05:45
1au81hc70viqbvzh03pocggfahx3neys	NDk2NDYyM2I0ZTIzYmNmODhhNGQ1Mjc5YTgyODVmOGJkMGYwMTNmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MWYxNWRlNmZiMWY5ZDYxZGJiMmVlZThiZWMwYjUzMWM1NDdkOWMyIn0=	2019-08-27 07:28:00.139627+05:45
isgjojojr6jhdt43rtbj0yagyvagh3h0	NDk2NDYyM2I0ZTIzYmNmODhhNGQ1Mjc5YTgyODVmOGJkMGYwMTNmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MWYxNWRlNmZiMWY5ZDYxZGJiMmVlZThiZWMwYjUzMWM1NDdkOWMyIn0=	2019-09-27 14:59:30.321368+05:45
\.


--
-- Data for Name: drainage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drainage (gid, line_type, p_dia_mm, geom) FROM stdin;
1	Surface Water Collector	200	0105000020E61000000E0000000102000000240000004C09C8AA93FE54402051D67E78403C404802DCA393FE544000BF229178403C4040C532A293FE544010525B9478403C40CC05DE9993FE544000E782A478403C408C8B528F93FE544090BE6EB278403C40B857CD6893FE5440F0F671C978403C40DC4A5C3693FE5440A06694E778403C4018268FFF91FE544040BA41A179403C40546E102A91FE5440C014BC1E7A403C40C028DD6F90FE544070AF2B8C7A403C40CC8B9E6A8FFE5440106BB6257B403C40142FA4838DFE544080E3EC437C403C4000B374688DFE54403034E7537C403C40C817FA6A8CFE5440D0EE6FEC7C403C40C08EB1EB8AFE5440302F15D37D403C4068F86B758AFE54404019411A7E403C409C6DFFC089FE544010BCE9897E403C40EC6D635A88FE54405057D8677F403C400CBB046B87FE5440C0CCFBFB7F403C40349E493886FE5440B048CFB980403C405881F47D85FE544090827E2481403C40F09BD32885FE5440C0023C5581403C40E491C0A984FE5440C0484AE481403C4044193E6984FE544090AEE92C82403C4084D7E83683FE5440F0E2237383403C401871C8FA81FE5440900ECCC384403C407C2DEFF27FFE5440301468ED86403C40087E72B07FFE54404025363487403C4018D9D8F97DFE544070BF4B0789403C40ACD8E2147DFE5440904631F989403C409CB0421F7CFE5440A0FBB1FC8A403C401CCEBF877AFE544000D13AAB8C403C40C8A8E1827AFE5440B05D5FB08C403C40A81920827AFE544050DC2BB18C403C40F88E38807AFE544060F22EB38C403C402038F0427AFE5440D08FB0F88C403C400102000000360000009007143C97FE5440A0A629157D403C40C8C2BCFC96FE5440F04E87547E403C40109457FA96FE54404065036D7E403C40840D47F996FE5440200290867E403C40109457FA96FE5440905D77957E403C4004049D1997FE5440D0E4ADC980403C40B02EB25497FE5440F0B0BA9F84403C4008A6348297FE544070C36E9187403C4048A2338497FE5440C0E428B687403C40889E328697FE5440D01CE9CE87403C40584B978997FE5440B0B975E887403C4060AD97C397FE5440803CC93B89403C40F02D750798FE544000A36DB98A403C40B8E3E55798FE544030EFBB7B8C403C408CB57BA298FE5440D01950198E403C40CCFD841699FE5440E0D6D99490403C40289CE06E99FE5440904F208892403C40C0FEB5C299FE54406011985D94403C4064EF9D139AFE54405050C51D96403C40A0B898829AFE544030CCA98E98403C40FC56F4DA9AFE5440007D3A769A403C40D8C0414F9BFE5440507F2FE89C403C40B8C988AE9BFE5440A06D9FEE9E403C40E8B08B0D9CFE544090278BECA0403C402C915B519CFE54400021D762A2403C4064BE13BD9CFE54402076EBE6A5403C406C6253099DFE54406078E058A8403C40B89ED45A9DFE544060DD34FAAA403C403883AAAD9DFE5440707C2CAAAD403C40200792819EFE5440302DFE72B4403C407C6E46CC9EFE5440B0731ED1B6403C4018FB2ED29EFE544020B60E01B7403C4000843ED59EFE54406066281CB7403C404C691BD79EFE5440504DF238B7403C40A0A03DD79EFE5440001C3240B7403C4018F40ED79EFE544070916D47B7403C4020CD90D69EFE544030B16C4EB7403C4024FCC6D59EFE5440A051F954B7403C40949BB7D49EFE5440F0BFE05AB7403C4014E06AD39EFE5440E047F55FB7403C4070D9EAD19EFE5440D0950F64B7403C40487B57CC9EFE5440304DF972B7403C406C374AC69EFE5440D0A08A7EB7403C40C8F2E2BF9EFE544070998686B7403C40C0BF81729EFE5440901D16FFB7403C400870856C9EFE5440A08E860DB8403C4028112E679EFE5440307E8F1FB8403C40B4DE9D629EFE54400056BD34B8403C40B417F25E9EFE54400059884CB8403C4008B7D75D9EFE544080D86A74B8403C405CF4F95D9EFE544060B78A9CB8403C40244A585F9EFE544030784BC4B8403C40B033526B9EFE5440C0DFA18BB9403C40345181B69EFE5440D049E24BBE403C40010200000040000000A016681696FE54404078298884403C40F49EF10996FE54402037C68084403C4094C158FD95FE544030049D8184403C40106262C195FE5440D0F4EEAC84403C401056090293FE544000BA18B786403C404C5658CB92FE544000554CB686403C40ECDA73C892FE544020C276B386403C40803BB0C592FE544060F207AF86403C40FC861BC392FE5440807116A986403C40A4DDC2C092FE5440C079C0A186403C40482EB2BE92FE5440105A2B9986403C404427EBBC92FE544010462C8F86403C40606A75BB92FE5440809B628486403C40808756BA92FE54406074F77886403C4094C1723592FE54403037B5147E403C404CD4772B92FE5440609D82287D403C4018FC312A92FE544030E6061D7D403C40141A822892FE544090A36E127D403C40E0DA712692FE54402097F6087D403C40E4130D2492FE5440700ED5007D403C401C7F612192FE5440E0A938FA7C403C40AC6C7E1E92FE5440F05247F57C403C40A00E401192FE5440A0AAB0EA7C403C4038EEBF0392FE544050FF34E97C403C406C6EAFF691FE5440A01044EB7C403C40FCE4C3E991FE5440A05648F37C403C4050A8665885FE544080F8FD9484403C40107657877EFE544020FB72C78B403C4014097F7F7EFE544030AD83D68B403C408CA254787EFE544010C244EA8B403C4090BC04727EFE5440F09C3B028C403C400085B66C7EFE5440A07ED31D8C403C4050EA8A687EFE5440E021613C8C403C4004CF9B657EFE5440E0E1265D8C403C40A451E6647EFE544030C1427D8C403C408C8069657EFE5440B0EB6D9D8C403C40445822677EFE5440202DEBBC8C403C40D0B7066A7EFE5440704F01DB8C403C40989C056E7EFE5440305DFFF68C403C40F0A8DD8881FE544040ACBAC29E403C403CD0B68D81FE5440D05CBFD29E403C40944C129381FE544080EEEADF9E403C40F08AD59881FE5440100DFCE99E403C406086FEA081FE544040B365F89E403C401056A2A981FE5440108C45019F403C40343C44B481FE5440A0FE80019F403C40C043C2BE81FE544040439EFA9E403C4068CDCF7D86FE544050AA2F2B9B403C4074D9FA088FFE54404050697994403C4094126E2F97FE54406001EA0A8E403C403C50DC3F97FE5440A06A3EF48D403C400898604F97FE544040E3EBD48D403C40D068B25D97FE544070C784AD8D403C4038D98E6A97FE54400035C17E8D403C40247FA96E97FE5440A012235B8D403C40F0282F7197FE5440C0E73C358D403C404CD80C7297FE5440001D2C0E8D403C40C4073C7197FE5440B0E316E78C403C40DCDBC26E97FE5440E08E23C18C403C4078C5DC6D97FE544020F96BB88C403C40D00FF02496FE5440700F0DC084403C406806EB2096FE544030062FAA84403C4050DC061C96FE5440D0015F9784403C40A016681696FE54404078298884403C4001020000000F000000BC7BEF3B7AFE5440203C8ACF8C403C406015FDD97AFE5440307826288C403C405C13FBE27CFE5440A060B5FB89403C40CCB99CB67EFE5440E0FCD60B88403C402C0588F880FE5440C0F4FDA585403C406C107BCD83FE54404071799F82403C400435DE2585FE54406002842D81403C40F406DF4A87FE544020A426E07F403C401072F80D8CFE5440C070B8F87C403C4064C91B2390FE54406014F08C7A403C404444248C93FE54407076298978403C400CAB0E9593FE544090D9D78178403C40D8E6DC9993FE5440E0C6F77C78403C40A04C709E93FE5440B0AC557578403C40C8ECD8AA93FE5440E08ED76078403C4001020000005F0000005CA7D7B47AFE544050AF07748F403C40E4BEFBB97AFE544060F3EA6E8F403C405C027F907BFE5440B0B29A998E403C40002BDA7A7CFE5440C0F28EB08D403C4080D75EDC7CFE5440D0D7954F8D403C40CC8803157DFE5440D03742178D403C40A430DC1E7DFE544020615B128D403C4044FC92287DFE5440F0533A108D403C403099E42F7DFE5440206E7C148D403C40E02A333D7DFE5440F028111E8D403C40BC408A4A7DFE5440F051922C8D403C40D88823587DFE544040F915438D403C40C84AA3647DFE544090CFE6628D403C40542D1F707DFE5440708657888D403C40348553807DFE5440504171C48D403C40587266867DFE544090880FE38D403C4020F50F8E7DFE54407060AF098E403C409CEB65AE7DFE5440407D7BD48E403C40E86BAD0F7EFE544030AE83FF90403C40A0CBE04B7EFE5440C00EFE5692403C40F0694F5A7EFE544010E455A992403C405C4E22987EFE54404007130A94403C40E0471F4C7FFE5440A040F61198403C4088249A647FFE5440A0B44E9E98403C405C6D5E9E7FFE5440C0337DE999403C401840CFDD7FFE544090EBF7579B403C408CD1230280FE544050B7D6299C403C40CC7334A380FE5440202C44CC9F403C405816EECB80FE5440902A86B7A0403C4010F16F6D81FE5440C0AA815CA4403C40E0D2B5A281FE544000EB3F90A5403C40481762A581FE54405049B29FA5403C40842F2B4382FE5440604D892FA9403C40D8E0B85C82FE544030A235C3A9403C40BCD4797082FE5440A0AD5D35AA403C40B492C79282FE5440E0379BFBAA403C400C77B1B582FE544070255FC5AB403C40747B91CB82FE5440308DC943AC403C40582EEBD982FE544060CBB796AC403C406C44AADC82FE5440900A3DA9AC403C40542ADA3683FE5440F0F5FAA9AE403C405401054C83FE5440E02B3625AF403C4064D8757383FE54400099D30AB0403C407C746E7483FE544010F27A10B0403C408842DC9983FE544040F561EAB0403C40747925B683FE5440009B0E8FB1403C40F42393D783FE5440B052AB51B2403C408CAB1E0284FE5440D03E5B49B3403C40247B9A1C84FE544080B589E3B3403C4084A6093684FE5440A0349C77B4403C401C3F7D5884FE544090D12D40B5403C407CA55A6B84FE5440807201AEB5403C40D867C68284FE5440B0585B36B6403C4078D8FF9584FE5440E0CF46A6B6403C4064E1C2BC84FE544050F77087B7403C40586A08D784FE544090160D20B8403C40202EDD1785FE5440906EA698B9403C4094D5593385FE544050D25138BA403C40EC8BF44F85FE544050E67ADEBA403C401042046B85FE54405073AD7BBB403C40A057ACB585FE5440E0175A2DBD403C4094EAF6BA85FE544010B6164CBD403C4020B58DDE85FE5440B09AD21ABE403C409087031286FE5440D055C045BF403C4094D00E3986FE5440C02F8E28C0403C40A4796B6286FE544000E9D218C1403C40F02F33A286FE54401059518BC2403C40588146C986FE544060DC4D6EC3403C40E01187DE86FE544010B0C1E9C3403C40A055621787FE544060AF0423C5403C4098C9242B87FE54406031E38FC5403C40F0F8DB4187FE5440700F0B0DC6403C400C64B46E87FE5440E03C5129C7403C40143AF77087FE54405078A637C7403C40B4703D8587FE5440700230A0C7403C4004F0B88B87FE544040CF1FB8C7403C40B83B8B9D87FE5440F060EEF9C7403C40848E12E387FE544070CEEDA2C8403C4080D5161188FE5440501021F7C8403C4060EDE63888FE5440F05B620DC9403C40CC0FF93988FE5440804A240DC9403C40F4A44A4888FE54401059E609C9403C40A0A1884A88FE544050636409C9403C4010BB42B888FE544090E6EABDC8403C40184381678BFE5440A0783E9FC6403C403491DD1391FE544030AEA91AC2403C4084A12BB796FE54405038BDB2BD403C400C6E36529DFE544090E25781B8403C40C095E45C9DFE5440C00D847FB8403C405C9CEE669DFE5440D06D6687B8403C40308C676D9DFE544060E362A0B8403C40F88D45729DFE544070971BBFB8403C40CC1902769DFE5440D01344E0B8403C4070509FD39DFE5440505F36F6BE403C40903974D49DFE544080168FEFBE403C40010200000065000000A8F000AC92FE544080C6FDE694403C40745E29AC92FE54402008DEE694403C40D45D90AD92FE54409028C4E594403C407846D0B492FE5440A0F412E094403C409C9A6CB792FE5440503406DE94403C404C8E1A0594FE5440607D07D893403C40900D4B5497FE54403013504591403C4070D3587C97FE544040DD722291403C40FC7B379297FE5440B0C74B1791403C40F88042A897FE5440D08EAC1591403C406C586CB097FE5440807F072391403C401C29F8B797FE544060B54A3591403C40D81BB7BE97FE5440D0D4044C91403C4018517FC497FE544060CBA86691403C406C9C73C797FE54406048046F91403C40246811CA97FE5440C0CA037991403C40D4414ACC97FE5440201D708491403C405CE411CE97FE5440302C0A9191403C40D07B5ECF97FE544060628C9E91403C40409B701098FE544090F2889495403C4014F6773E98FE544080C7EC6B98403C40B49C7A6198FE5440902731959A403C40BC2CEEAF98FE5440E085F0899F403C402C7A808C99FE5440300C1C79AD403C403088B09299FE54404067EFD0AD403C409078D39399FE5440506C77DAAD403C40E07A569599FE544050A31FE3AD403C403C162F9799FE54400013ACEAAD403C408080509999FE54409070E8F0AD403C4050F7AB9B99FE5440C088A9F5AD403C40A8BBAEA099FE5440609B42F7AD403C4070BEB3A599FE5440B07830F6AD403C40385BA4AA99FE544020F577F2AD403C40CC6D416D9AFE544010573051AD403C4094CF7C5B9CFE5440A046DEB7AB403C40F4EB34679CFE5440F0A5B8ACAB403C40C0AE2B739CFE5440F05F1BA7AB403C40E472377F9CFE5440C0FF19A7AB403C409C7C568C9CFE5440605948B4AB403C403458C1989CFE544000EAC2C9AB403C408CAD24A49CFE5440C087F9E6AB403C403029C5AC9CFE54402025D306AC403C40E01D44B49CFE5440D040F72AAC403C40D0B67FBA9CFE544050BDC252AC403C40A8820B6A9DFE5440704FFDFFB1403C40D8951D9D9DFE544010D9C4A6B3403C4038B664A29DFE5440C0FC76CDB3403C405C0847A69DFE5440705CB7F6B3403C40EC4CB1A89DFE5440D08BB921B4403C40FC5B12AA9DFE54403046EF42B4403C40582732AA9DFE5440A08F9864B4403C4094F80FA99DFE54401043F485B4403C40AC50B2A69DFE544070F942A6B4403C40844F849C9DFE5440605028D9B4403C40744757909DFE5440B07B7904B5403C40E4A500839DFE544020950F27B5403C40409986809DFE544080AA7B2DB5403C4024A130759DFE544050497041B5403C40C8F286739DFE544090A75D44B5403C409C9CE2729DFE5440C0F37E45B5403C40003D77709DFE5440B04BC149B5403C404871956F9DFE544050C94E4BB5403C40686B466F9DFE5440D0E5D94BB5403C4018220C4F9CFE54404087D321B6403C4010BF782F95FE5440D08D91BEBB403C40B44FAF1095FE5440C01A80C2BB403C40F4C5660E95FE5440D051D7C0BB403C4010EBC00295FE544050A350B1BB403C40401773F794FE5440103176A0BB403C40DCFBBAEE94FE54408065B890BB403C4018B77BE694FE544050D9547DBB403C40D0ABE0DF94FE54407071EB68BB403C400068F5D994FE544090A06051BB403C40AC7ED1D494FE5440202A1237BB403C40F84BA5D094FE5440B04C9D15BB403C40A8788ECD94FE5440F0A053F2BA403C40ACD3869F94FE544050F3ED18B8403C408491977E94FE5440F0A19407B6403C4070F9DF5494FE544060191970B3403C404C9ABC3594FE544070F87D7BB1403C4000F7011294FE5440F0560543AF403C40F04F46F093FE544060B7E524AD403C404040BDCF93FE5440D020211DAB403C40804D68AD93FE5440F068A2F0A8403C4030AAAD8993FE5440301497AAA6403C40581C256893FE5440D0D14191A4403C4064109D4593FE5440C0572C5FA2403C4018337A2593FE5440105EF470A0403C402427F20293FE5440E05106569E403C40E449CFE292FE544020EAA6509C403C40A84F78C492FE5440707C9E699A403C4058ACBDA092FE54405020912798403C4074583C7E92FE5440A0D525F995403C409494D27D92FE544020A9BBD095403C4004941B7F92FE544010CE9CA895403C40C00A0E8292FE5440D082EB8195403C40C0A6948692FE5440C0B0BF5D95403C4064AA8E8C92FE544090031F3D95403C406C7D299692FE5440A0537F1B95403C406486B1A092FE5440E00AA7FE94403C40A8F000AC92FE544080C6FDE694403C400102000000550000005837595C91FE5440D08F11F695403C40FC65656791FE5440B0B28AF795403C408C61A46C91FE5440B005E3FC95403C40B486A77991FE544000136D0E96403C400C2AB88591FE5440F07EA62896403C40385E7A9091FE54406079C74A96403C40E8299C9991FE544020F8CB7396403C4080F8D7A091FE544000747BA296403C4014430EBF91FE5440A06C608798403C4054E6C8E291FE5440C0C86DC99A403C40A0E01F0192FE5440303676B09C403C40D0BD422192FE5440209ED5B59E403C40C4C9CA4392FE544020AAC3D0A0403C4010A7ED6392FE544000A4FBBEA2403C4004B3758692FE5440E01D11F1A4403C40EC40FEA792FE54405060660AA7403C402CE4B8CB92FE544000B57150A9403C40ECD60DEE92FE5440E06CF07CAB403C40A0E6960E93FE5440A003B584AD403C40AC8D523093FE544040A3D4A2AF403C40FC300D5493FE544090444DDBB1403C402090307393FE5440A065E8CFB3403C404028E89C93FE544000EE6367B6403C40586AD7BD93FE5440603FBD78B8403C403CDECDE993FE544050C1802ABB403C4090856BEE93FE5440C0A18789BB403C40D0816AF093FE5440B08EA9EEBB403C4058C7BBEF93FE54400081DF0DBC403C403058D3ED93FE5440F05C422CBC403C40A47FBDEA93FE5440B0560E49BC403C40181F8EE693FE5440A0E08963BC403C4018AE78E193FE544050E39F80BC403C40340024DB93FE5440A085D89EBC403C40BC43B8D393FE5440501ACCB8BC403C4090FB62CB93FE5440F078DBCDBC403C40F44257C293FE5440E07885DDBC403C40F8ED59008FFE5440D0B53992C0403C40987E90E18EFE5440C0422896C0403C40D8F447DF8EFE5440E0797F94C0403C40F819A2D38EFE544050CBF884C0403C40244654C88EFE544010591E74C0403C40C42A9CBF8EFE5440808D6064C0403C4000E65CB78EFE54406001FD50C0403C40B8DAC1B08EFE54407099933CC0403C40E896D6AA8EFE5440A0C80825C0403C4090ADB2A58EFE54402052BA0AC0403C40E07A86A18EFE5440B07445E9BF403C4090A76F9E8EFE5440F0C8FBC5BF403C40900268708EFE5440501B96ECBC403C406CC0784F8EFE5440F0C93CDBBA403C405828C1258EFE54406041C143B8403C4034C99D068EFE54407020264FB6403C40E425E3E28DFE5440007FAD16B4403C40D87E27C18DFE544060DF8DF8B1403C40246F9EA08DFE5440D048C9F0AF403C40647C497E8DFE5440F0904AC4AD403C4018D98E5A8DFE5440303C3F7EAB403C403C4B06398DFE5440D0F9E964A9403C40483F7E168DFE5440C07FD432A7403C40FC615BF68CFE544010869C44A5403C400856D3D38CFE5440E079AE29A3403C40CC78B0B38CFE544020124F24A1403C408C7E59958CFE544080A4463D9F403C4040DB9E718CFE5440604839FB9C403C405C871D4F8CFE5440B0FDCDCC9A403C407CC3B34E8CFE544020D163A49A403C40ECC2FC4F8CFE544050F6447C9A403C40A439EF528CFE544000AB93559A403C40A4D575578CFE5440C0D867319A403C404CD96F5D8CFE5440A02BC7109A403C40C4E25A668CFE5440D05D60EB99403C406860DE768CFE5440D04E4AD199403C409C70E3878CFE5440708111BD99403C4060F76C808DFE544090C0CEF898403C4074BB77E38EFE5440C0A271E097403C4048D97BBF8FFE5440108AB43297403C404CAD98FD8FFE5440603CA80197403C407067D20C91FE5440B049BD3296403C40B843213B91FE5440D038690F96403C406841F93F91FE5440C03BB70B96403C40FC91104291FE5440C0D71E0A96403C409835DB4F91FE5440F05199FF95403C40B44C0F5A91FE5440B08ED0F795403C40D0776A5B91FE5440F0B3C7F695403C405837595C91FE5440D08F11F695403C4001020000004700000078D9CC218BFE54405098C00B9B403C40E848D8258BFE544000811D0A9B403C408443E8298BFE544090D5BA0A9B403C40CCD3E82D8BFE5440C090950D9B403C400CA8053B8BFE5440A088A5179B403C40CCA784478BFE5440303B752A9B403C40B82709538BFE5440F02779459B403C405438F3598BFE5440A0FB245C9B403C40783AD55F8BFE544070DB12779B403C40C0C885648BFE5440B04985959B403C4030E3E3678BFE5440A006A6B69B403C4028242F308DFE5440F0B1612CB8403C406C99448C8DFE5440B07C5CA2BD403C40FC7F87B08DFE54400056D005C0403C40A0615AB58DFE5440503BF06EC0403C40300B18B68DFE5440A035D797C0403C405CC5A2B58DFE5440F025CFC0C0403C40D84F5DB38DFE54408082BCFAC0403C40D07B95A98DFE544040FF9840C1403C4078C8029C8DFE5440706C2778C1403C40F03E039B8DFE5440F062067DC1403C40F45DD8998DFE5440E0414081C1403C4020BC88988DFE5440C02FBD84C1403C40CCBF1B978DFE5440307D6987C1403C40B07499958DFE544020143689C1403C40C88D508F8DFE5440F069FD90C1403C40503B45C188FE5440405F5063C5403C40686071BC88FE544000107D64C5403C4018789FB788FE5440F0EDE362C5403C40146592AB88FE544050E2BB5DC5403C40D08B789F88FE544060D98552C5403C40A879479888FE5440E08EC049C5403C404063739188FE5440D0972A3DC5403C40DC7E1C8B88FE54401053FF2CC5403C4094B2098588FE544070AF6718C5403C40B82CB57F88FE54400078BF00C5403C408874377B88FE5440608A73E6C4403C4008D8C7B486FE5440007F8C7FA8403C40185B4CB486FE5440E0FB507CA8403C4024CC2AB386FE54407010747AA8403C40881BC5B186FE5440C09A8579A8403C4050B4F0AF86FE5440C09A8579A8403C40CC7469AD86FE54407075407BA8403C408C7C68B183FE544030A27BDBAA403C4004A8B6AE83FE5440604AD0DCAA403C403C6355AB83FE544070BD51DDAA403C40DCF3D4A883FE544050B877DCAA403C4038E446A683FE5440C02446D9AA403C40B0AD9AA283FE544040EBE7CFAA403C40D4F5B79E83FE544070ACAFC5AA403C4090216B9B83FE5440A05335B7AA403C4030267F3C82FE5440A067BEC8A2403C406828193A82FE5440603639B2A2403C40204D193982FE5440300CB9A1A2403C4020AFB53882FE544040FAD090A2403C403C6CF03882FE544060F5DC7FA2403C40EC44C83982FE54408033396FA2403C4044A3383B82FE5440E035405FA2403C409CB3393D82FE544010DD4850A2403C4030AF2B4082FE54402066CD3BA2403C407CF5D54382FE5440408F4529A2403C407830244882FE544060291819A2403C40687CFE4C82FE5440A0F79E0BA2403C403C3D5F4E82FE544060AD0907A2403C40C866ED4F82FE544080107A03A2403C40BCF99C5182FE544090980B01A2403C4018E7896582FE5440B00713E1A1403C4064F5FF6A82FE544090F4CAD9A1403C40B0360BFA82FE5440F0541E66A1403C40E0306B178BFE5440400B60109B403C4078D9CC218BFE54405098C00B9B403C4001020000006D000000943BC27B81FE5440803C20B69E403C400C0C0A7C81FE544060BCBAB79E403C40F061AE7F81FE544040168CCC9E403C407409258181FE544000A9E9D49E403C40BCC3FE8581FE5440E05E20E89E403C40E49D748A81FE5440803304F59E403C402850878B81FE5440200B1EF89E403C4004C69C9181FE5440B0AF80049F403C4040AF769B81FE5440603CF0169F403C4094CAE7A581FE544090CB1B239F403C409CBBE3AD81FE54406023C7219F403C40D06F85BF81FE544090DA1F1B9F403C40048B42CC81FE544050158D119F403C40C48869F681FE5440407DDFF19E403C4084E277F881FE5440B04936F09E403C40CC7379FF81FE544050648DEA9E403C40F08D4F3E82FE5440B091CAB79E403C403C14CC3F82FE5440902B97B69E403C400C91A88582FE5440408F277E9E403C400820566C83FE5440205FCEC39D403C40102E127183FE5440708113C09D403C40E0351B8884FE5440E00240E49C403C4078D29C2886FE544050C1919B9B403C4028E4F1F786FE54407089D0F49A403C40104CD07787FE544080AAF88D9A403C4058D2D5FF88FE544030D7715C99403C40CC8754418AFE544010EB776598403C4034E9ED6F8BFE54405019C07297403C40D0E8BB9893FE5440D00E0E0C91403C402022B65595FE5440A0CFF6AE8F403C40000D742797FE5440B0E05E3A8E403C4064CEDD3597FE5440C0546A338E403C4004DCEC4397FE5440007BEE248E403C400093625197FE544020DB2B0F8E403C40E0FB025E97FE5440806783F28D403C40F872FD6597FE5440E0E64BD98D403C4050A1076D97FE5440F048F2BB8D403C40C08FFF7297FE5440A029049B8D403C402872C87797FE5440C06A20778D403C40D4797D7A97FE5440B07F26468D403C40681D667B97FE5440108B1F148D403C40D4797D7A97FE5440909618E28C403C402872C87797FE544050AB1EB18C403C40CC27523297FE5440E0C5F5098B403C40D86DAA8496FE544040504FCF86403C40080FD62E96FE5440702400AA84403C40946D292696FE544090F31B7B84403C40BC8D232296FE544040C8CE6E84403C40A8B0B81D96FE544020D9E76484403C408C91FF1896FE5440A01A9A5D84403C407C7E101496FE544070220B5984403C40944F950096FE544040FE6C5984403C40F84F35ED95FE5440E0568F6184403C4064E48E5E95FE544030D7E2C984403C40D0E8BB9893FE5440F089932C86403C40E483A77993FE544080EDDD4486403C4084F44F1993FE5440C0A9418D86403C4050DCF00A93FE5440F0D0A49386403C40843060F992FE544030F8079A86403C40845B89EB92FE544030EBE69786403C403829E8D892FE544030F8079A86403C40646E53CF92FE544030EBE69786403C40D02F45CB92FE5440901E139286403C4004D181C792FE5440D0EAAC8986403C40283423C492FE54409015EE7E86403C40988640C192FE54407087207286403C4008A1EDBE92FE544040509C6386403C40487F3ABD92FE54400049C55386403C408439F35292FE5440E0BEBB887F403C406454983C92FE544000D1EF1A7E403C404C567B3292FE5440A0A350197D403C4010A0342E92FE5440C02F04007D403C405CBCF32892FE54400086DBE97C403C40ECEBDC2292FE5440708F6FD77C403C4078331A1C92FE5440506B3FC97C403C402C3ADA1492FE5440B001ADBF7C403C40D89CB2F591FE5440C078B7C27C403C4054AEF9D691FE5440C0D4A0D77C403C40F0336D588DFE5440F048F9707F403C408014A2318DFE5440E0BEBB887F403C40CCF97B8C87FE5440A0F3D5FD82403C40409F46C786FE5440002DDB7983403C4040BDCF5485FE544040A3AB5D84403C404C0B034884FE54405046747285403C4020A91B9382FE5440B08F3F4587403C40349F814981FE5440A03866A588403C400CC85B7E7EFE5440101C79A18B403C40BC77B27B7EFE544010299AA38B403C4068C41F6E7EFE544000D347BF8B403C402C1EAE627EFE5440E051CCE88B403C4060476A5E7EFE5440F0CCCEFD8B403C4068661D5B7EFE544030006F158C403C40308DE0587EFE5440F073F92E8C403C4030BBC4577EFE54409024AC498C403C40084D6A577EFE5440209F047D8C403C40E8C834597EFE5440408FE1AF8C403C40D85B175D7EFE544070C4D6E08C403C407413DEC47FFE544070DB5DE994403C40DCD3092880FE5440808A3D2097403C40D847C5CC80FE5440D00ADFCD9A403C4030F7CDD380FE5440C0FD13F69A403C40082E613681FE544080C08B299D403C40D8F2723B81FE544060F785469D403C40E0197F4381FE5440A01086749D403C40A4151C5E81FE544090F6A50C9E403C40AC02036F81FE5440C03B436D9E403C40E4B0606F81FE544080B95A6F9E403C401831247681FE5440203504969E403C40943BC27B81FE5440803C20B69E403C4001020000004C0000001844E3A799FE5440A00A2E02AE403C409C748BA299FE544060095D04AE403C4068A92E9D99FE5440A0832A03AE403C40ECE6EE9799FE544060129EFEAD403C406815269699FE544010FBF7FAAD403C40EC58899499FE5440100835F6AD403C4058B1239399FE5440B0B575F0AD403C40BCA6FE9199FE5440F039E1E9AD403C406008229199FE54401079A4E2AD403C40BC7DCB8C99FE5440D056A0A7AD403C408C63536098FE5440C0D58C3A9B403C40008C19C997FE544020B04CAA91403C40C454B9C697FE5440A0F2239491403C409CEB82C397FE54406034BD7F91403C401C888ABF97FE544080D8986D91403C408826E9BA97FE5440D00A295E91403C4058B8BDB597FE5440A0139E4D91403C4018BF0EB097FE5440F066094091403C40DC32F7A997FE5440F075AB3591403C40284CBAA497FE5440E028A12E91403C4068EC4A9F97FE5440F079A42A91403C40B865C59997FE5440502FCA2991403C40B47D469497FE544020BB162C91403C40B0FDA0AD92FE544030C905F594403C4018372BA392FE544030C2BB0A95403C40C0DD789992FE5440104D852595403C4084176C9392FE5440D01E673995403C40AC2F0C8E92FE544090B22D5095403C408C206F8992FE5440E0E57B6995403C40A0831B8592FE5440302BF58F95403C40F87A648292FE5440E00FB9B895403C40D0B7348292FE5440C0D2D4DC95403C40B0857D8392FE5440E088940096403C40D069089892FE54405075C45697403C40AC7030D594FE5440501827FFBA403C402C7E86D894FE5440102AF41ABB403C40342BEADC94FE544020384E34BB403C4078683FE294FE54406031934ABB403C40881E64E894FE5440C0B9345DBB403C40A05690F194FE5440D0487275BB403C40040287FB94FE5440D07B0888BB403C40ACC4100695FE5440800D9094BB403C40A49D110C95FE544080415D9CBB403C406CE3431295FE544070C12DA1BB403C403CE68F1895FE5440C025EFA2BB403C4024AC622E95FE5440F05B56A1BB403C4064E85B6E9DFE544030B5C634B5403C40C8EFA9799DFE5440F0700F25B5403C40488E2F849DFE5440F0983F0EB5403C40BC0EA68D9DFE54402079F0F0B4403C40244E5B959DFE5440504C60D4B4403C405822289C9DFE5440B0E455B4B4403C4064A1F3A19DFE5440D0A54691B4403C4098C3A7A39DFE544070A3786FB4403C40448539A49DFE5440D0D00F4DB4403C40FC54A6A39DFE5440E05FA72AB4403C40A4CAF0A19DFE54406080DA08B4403C40D070899E9DFE5440405B3AE9B3403C40D80D997D9DFE5440609FE4D6B2403C400425E3B39CFE5440802A8D57AC403C40C83173B09CFE5440F091683BAC403C402018E9AB9CFE5440A0FFE221AC403C40300164A69CFE544020A4AB0BAC403C40E4D009A09CFE544090FF5AF9AB403C40705792999CFE5440106501E7AB403C4030754F949CFE5440B08C0EDDAB403C40603D228F9CFE544020DD81D1AB403C40246699899CFE544080CB04C9AB403C4050B7D1839CFE5440407CC3C3AB403C40841D4A7B9CFE5440E039BFBCAB403C4008CA497A9CFE5440A09889BBAB403C402CDE2C769CFE5440805F6CBCAB403C4038B3C8719CFE5440802905BEAB403C40B86E886A9CFE5440E03FD8C3AB403C40A4BB00059AFE544030CFBBB4AD403C401844E3A799FE5440A00A2E02AE403C4001020000002700000048EAAFE493FE544060949190BB403C400836E5E493FE5440B0DE5993BB403C40C4DC50E693FE5440F08649C4BB403C40202ABCE493FE54403030B1EEBB403C4090419BE193FE544010EEB217BC403C4008B0FFDC93FE5440C0B5683EBC403C40D04E03D793FE5440F05EF961BC403C401013F0D193FE5440F074E879BC403C400411F3CB93FE5440A08D2F8EBC403C404CDB35C593FE544030E2419EBC403C40FC3AE7BD93FE5440B0DFAFA9BC403C409CEA39B693FE5440B02C2AB0BC403C4094F062028FFE5440008FC45CC0403C40F858C2F98EFE5440403CF35EC0403C4014833FE78EFE544090D1BF5BC0403C4000C60BD58EFE5440A0FCE64DC0403C401C9488C38EFE5440F0DEB235C0403C40C47E2CBC8EFE544040349721C0403C40B425A9B58EFE5440B01D4109C0403C40540825B08EFE5440507440EDBF403C4088C1C0AB8EFE544070BD3ACEBF403C40B84696A88EFE54406057E7ACBF403C408CA9AD5A8CFE5440E0FF77D49A403C4070A0D15A8CFE5440A07888A09A403C409CB6CE5C8CFE54400006356D9A403C40606A3B628CFE5440C0E4BF4B9A403C40548AC2688CFE544080039C2D9A403C402C0F44708CFE5440E0435D139A403C4000259B788CFE5440506B84FD99403C4094689D5B91FE5440A0C1252396403C40F0AF096591FE54404005FE2196403C409480626E91FE54408089E82696403C4028AC697791FE5440309AC43196403C407423E37F91FE544060F8494296403C40F885968791FE544010BC0A5896403C407434A38E91FE54407029A87A96403C40BC59309491FE544000D463A196403C40DC43189891FE544070B936CB96403C4048EAAFE493FE544060949190BB403C4001020000002C000000E89D04C59EFE544030F08C2CBE403C40E0F9C4789EFE5440E08BE196B9403C4060A5F56C9EFE544000A86EC4B8403C4084C2426B9EFE5440103B97A5B8403C406802C26A9EFE544050DD1286B8403C403068766B9EFE544030589E66B8403C40D0F49D719EFE544060447049B8403C40D4CF6F789EFE544040C1BA2EB8403C403C56BB8B9EFE5440A058770BB8403C40C4C5DB9F9EFE5440A0E831ECB7403C402C7EA3BA9EFE5440A0DF9BC3B7403C405482C9C39EFE5440E0F9A2B5B7403C40ACBB82D99EFE5440604AD693B7403C4098C4B7DB9EFE5440E01DD18EB7403C407095BDDD9EFE5440E090AD88B7403C40602A8BDF9EFE5440E0FF8681B7403C403C7A18E19EFE5440B0487D79B7403C40BC8EF1E29EFE5440D0994166B7403C40D80D4AE49EFE544090F85D52B7403C40BC6C09E49EFE5440409B4839B7403C40807617E39EFE544020567720B7403C40248CD8A29EFE544010D1DE0BB5403C40A4D97E579EFE54405035D4A2B2403C4074FDF4169EFE5440805084A0B0403C4084BD2C9A9DFE544050251999AC403C4078B376199DFE544060169879A8403C4034E1AA6F9CFE54400070A008A3403C40401BD8599CFE54408078544EA2403C40D862EE969BFE5440307EBB1A9E403C40809BD3B39AFE54405074046499403C4098DDA02C9AFE544080F5817596403C409C7536AE99FE54403096D6B593403C4000406D4299FE544030901B5891403C40CCCEA7AD98FE544090DB45228E403C406C1F5F9397FE5440701121E787403C40D08B2D9097FE5440A081B5CF87403C40D019408D97FE544090857BBB87403C40682E638B97FE5440B0F50FA487403C400038D25897FE54407025292B84403C4020D7551F97FE54401077108E80403C4058C8DB0297FE54405036148F7E403C40402DA80397FE544080541C7F7E403C404C3AC90597FE5440D0EB136E7E403C403C1A544497FE54408036952C7D403C4001020000004600000004E7D4C69DFE5440401A15FABE403C40D0DE4DA29DFE5440A08D499BBC403C40EC5EF5869DFE544040C4CFC9BA403C40C0476A6A9DFE54404040C1EEB8403C409C85D5699DFE5440103887E0B8403C4084EFD2689DFE544000D2B0D2B8403C40D45F66679DFE544040D672C5B8403C402CD6EE669DFE5440D0B5ACC0B8403C40E8C24A669DFE5440B0453CBCB8403C4030DF7D659DFE5440704F3BB8B8403C4048D18C649DFE54400015C1B4B8403C405C117D639DFE5440D0C9E1B1B8403C4018CA54629DFE5440101DAEAFB8403C40C49B39609DFE54401063BCAAB8403C40F436F35D9DFE544070362FA7B8403C40D83A905B9DFE5440E06A1DA5B8403C40442CF4569DFE544070FD4CA5B8403C4018DB003E9DFE5440404411B6B8403C40186AE3509CFE544000235F78B9403C409CA1D77898FE54400057CD8EBC403C4030286AF492FE5440D0C730D2C0403C406891D58592FE5440102E4236C1403C4058EFEF0891FE544010737165C2403C40483CA43B8EFE5440F07EEC96C4403C40E0C8F2728CFE5440D02CDF00C6403C4060DEC7BA8BFE5440E011758EC6403C40F40EA8BB88FE544080D3A5E6C8403C40582D404A88FE5440106CB935C9403C40ECE9073B88FE5440C0AB4038C9403C40A4F6EC3488FE5440902F8C38C9403C40F4BDDD2E88FE544050008C35C9403C401C3AD12688FE5440D023C731C9403C40E8DBE51E88FE544010BFE62AC9403C4010819F0C88FE5440C0E34F1AC9403C404038F80588FE5440704E000FC9403C40F0B5D2FB87FE544010C8B4FBC8403C40241D1BD987FE5440E035F5B2C8403C409C1360A587FE5440A06ADC3BC8403C40DCDDE29F87FE544070293731C8403C4088F80E9D87FE5440D088E42BC8403C404067E59A87FE544000403D25C8403C4018E80D8287FE5440F00D87C7C7403C40AC4C957D87FE5440702670B1C7403C40D0BD386A87FE5440205D7542C7403C4038AAEE3F87FE54401042D143C6403C40203E6F0C87FE54406000991FC5403C4010AE613586FE544020979D64C0403C40B4E812A084FE5440001CC32FB7403C40209D472983FE544020F420A6AE403C406842888882FE5440A0239113AB403C40A4FEE92282FE5440600D79D2A8403C409C4A915080FE544070A11E519E403C40EC670C8F7DFE5440A0E26C6C8E403C40D8E3C87C7DFE54402039D3078E403C407086FE777DFE5440408204EA8D403C40042934737DFE5440C05E67CF8D403C40B4669D6D7DFE5440B0622DBB8D403C4008C64A687DFE54407066F3A68D403C400056405B7DFE54405095E2848D403C40D0BCEF517DFE544050B3EA748D403C40BCBED2477DFE5440E05703668D403C40D0680A3F7DFE5440A0237F5D8D403C40648C31357DFE544060EFFA548D403C40F4AF582B7DFE5440D05BC9518D403C4020F5C3217DFE544030C8974E8D403C40FCE985157DFE544030D5B8508D403C4044CA240B7DFE544070093D598D403C40F4A4A4FA7CFE5440E06424688D403C40C84C66E27BFE5440808EFD7D8E403C40382AB3B97AFE5440409DF3928F403C4001020000005F000000DC7138938DFE5440E0A02DB1C1403C40782A449C8DFE5440F0A083A1C1403C40A07299A48DFE54405042748CC1403C40182F05AC8DFE5440A0AD8072C1403C4000DD59B28DFE5440500B4854C1403C40FC4D6FB78DFE5440A0083237C1403C408CAE9EBB8DFE5440B07EB61CC1403C401487B4BE8DFE5440F084EAFFC0403C4040F69CC08DFE544010A987E1C0403C40B8B04BC18DFE5440B0B651C2C0403C4074B44CBF8DFE5440C0C92F5DC0403C40240DAFBA8DFE544050E928FEBF403C404099B88E8DFE54406067654CBD403C402457C96D8DFE544000160C3BBB403C4004BF11448DFE5440A08D90A3B8403C40E05FEE248DFE5440906CF5AEB6403C4094BC33018DFE544040CB7C76B4403C40841578DF8CFE5440A02B5D58B2403C40D405EFBE8CFE5440E0949850B0403C4014139A9C8CFE544010DD1924AE403C40D06FDF788CFE544050880EDEAB403C40ECE156578CFE5440E045B9C4A9403C40F8D5CE348CFE544000CCA392A7403C40ACF8AB148CFE544020D26BA4A5403C40B8EC23F28BFE544020C67D89A3403C40840F01D28BFE5440305E1E84A1403C403C15AAB38BFE5440C0F0159D9F403C40F871EF8F8BFE5440A094085B9D403C405071B4708BFE5440C046CB659B403C40E071F8688BFE5440009E0F3B9B403C40BCACC55F8BFE5440109A40159B403C40FCA84D558BFE5440F0CF29F59A403C4044C5C8498BFE5440A00778DB9A403C4084034F478BFE5440404322DA9A403C40E0E5A5458BFE544090023DD99A403C4028C9FA3C8BFE5440504E90D49A403C40685F0F308BFE544090832BD59A403C40C433652D8BFE544020DCD1D59A403C4060A1B3248BFE5440608FF0D79A403C40584592198BFE5440908E69E19A403C405C77FBAB8AFE5440C02616379B403C4044C9A8D187FE5440303B09729D403C409C4CA93D86FE5440504FDFAD9E403C4090D4631486FE5440E02523CE9E403C40F406076283FE5440701DEEEAA0403C40D4F1C66E82FE5440A0B58CAAA1403C40B820B64C82FE5440805F3AC6A1403C40E0AB274582FE5440C024FBD5A1403C40C8DA463E82FE5440C0D419EAA1403C40A0BC3B3882FE544000412102A2403C40E483293382FE54406077851DA2403C40386E382F82FE5440B01B7334A2403C40E428442C82FE5440206BA44DA2403C40A0F3602A82FE5440A0B86C68A2403C406CBE9B2982FE5440A0711484A2403C40F0D0F92982FE54402008DE9FA2403C4068A6782B82FE5440F0050BBBA2403C40D8FE0D2E82FE54409026E1D4A2403C402C9C118D83FE54404054A9BEAA403C40F0900E9383FE54405034BED8AA403C408877E89583FE5440B08F52E5AA403C40388F339983FE5440802B09F0AA403C403083DC9C83FE5440C024A3F8AA403C4090D7CDA083FE544020FEEDFEAA403C40CC67F0A483FE544070C8C402AB403C4038EE2BA983FE544070FA1004AB403C40AC9267AD83FE544070F6CA02AB403C40F89D10B883FE54406004E802AB403C404CDB92C283FE5440207BBDFBAA403C4078B589CB83FE5440B0937EF4AA403C409C4CA93D86FE544020D867FAA8403C4098D171AB86FE54406043ABA1A8403C40CC79C6AC86FE5440809755A2A8403C40C80EF1AC86FE5440F065FEA5A8403C4084E661AD86FE5440D0E91CADA8403C40F4B5E8B786FE5440E0822E56A9403C40E07C55CA86FE5440901B1B7EAA403C40A09088F886FE544000E61E64AD403C40BC07B11687FE544040037E48AF403C402085F1A387FE544050032725B8403C40085659C487FE5440C0E39E2DBA403C40C04FC26688FE544090911A5EC4403C408824A16E88FE544080F682DCC4403C407C5B986F88FE5440E08005ECC4403C4074FA9F7088FE5440208B8FFCC4403C408092637688FE5440C0C9FA1CC5403C4024BC577D88FE544000B66B39C5403C407831518588FE544090523151C5403C40785B628F88FE544030816166C5403C40EC70139A88FE5440E073EB75C5403C4094499EA788FE54401043B581C5403C40C0F06BB588FE5440F0BAAF86C5403C40D0BEBABD88FE5440E0D51A87C5403C40741EFDC588FE544050277E83C5403C40DC7138938DFE5440E0A02DB1C1403C40
2	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000000457F580FE54400000D9DEA1403C400070CE4281FE5440000079A3A0403C40
3	Manhole to Manhole	900	0105000020E6100000010000000102000000020000005C55BCAC93FE544068F347147A403C40540A0A2D90FE5440362DC73F7C403C40
4	Manhole to Manhole	900	0105000020E610000001000000010200000002000000A5B17D2690FE544087ED98317C403C4007DE51AC8CFE54409217AC6C7E403C40
5	Manhole to Manhole	900	0105000020E61000000100000001020000000200000007DE51AC8CFE54409217AC6C7E403C40F4168FC288FE544070FA8E9D80403C40
6	Manhole to Manhole	900	0105000020E610000001000000010200000002000000F4168FC288FE544070FA8E9D80403C40CEFD004385FE5440C51180B282403C40
7	Manhole to Manhole	900	0105000020E610000001000000010200000002000000CEFD004385FE5440C51180B282403C409963BCDA81FE5440894AAA4E86403C40
8	Manhole to Manhole	900	0105000020E6100000010000000102000000020000009963BCDA81FE5440894AAA4E86403C409A108B4C7EFE54409B16B7248A403C40
9	Manhole to Manhole	900	0105000020E6100000010000000102000000030000009A108B4C7EFE54409B16B7248A403C405D6B1FBA7DFE54409E67A43C8C403C40F4957BF27EFE5440CE95258393403C40
10	Manhole to Manhole	900	0105000020E610000001000000010200000002000000F4957BF27EFE5440CE95258393403C40CD7DCE4281FE54405C7079A3A0403C40
11	Manhole to Manhole	900	0105000020E610000001000000010200000002000000CD7DCE4281FE54405C7079A3A0403C405F64D8A483FE544076B78256AE403C40
12	Manhole to Manhole	900	0105000020E6100000010000000102000000020000005F64D8A483FE544076B78256AE403C4068C27D0985FE54402C65D840B6403C40
13	Manhole to Manhole	900	0105000020E61000000100000001020000000200000068C27D0985FE54402C65D840B6403C40AE6020E186FE5440366C13E1C0403C40
14	Manhole to Manhole	900	0105000020E610000001000000010200000002000000AE6020E186FE5440366C13E1C0403C40BE82931B88FE54402AAB80EDC7403C40
15	Manhole to Manhole	900	0105000020E610000001000000010200000002000000BE82931B88FE54402AAB80EDC7403C409518E8598EFE54406063F69CC2403C40
16	Manhole to Manhole	900	0105000020E610000001000000010200000002000000C4B27F409BFE544036004EEC9E403C40AC83D1D297FE54400EAE4DE38E403C40
17	Manhole to Manhole	900	0105000020E610000001000000010200000002000000AC83D1D297FE54400EAE4DE38E403C40116354E691FE5440CF550B5593403C40
18	Manhole to Manhole	900	0105000020E610000001000000010200000002000000116354E691FE5440CF550B5593403C40A738356492FE544061DE50639B403C40
19	Manhole to Manhole	900	0105000020E610000001000000010200000002000000A738356492FE544061DE50639B403C404C72A70893FE54409ACC72E9A5403C40
20	Manhole to Manhole	900	0105000020E6100000010000000102000000020000004C72A70893FE54409ACC72E9A5403C401AE3059993FE5440EE7257FBAE403C40
21	Manhole to Manhole	900	0105000020E6100000010000000102000000020000001AE3059993FE5440EE7257FBAE403C40B74CD97E94FE54402042AB6EBD403C40
22	Manhole to Manhole	900	0105000020E610000001000000010200000003000000D30EF6C897FE5440B11F9BA8BA403C406B718F949CFE5440DCB4D30AB7403C40B827B5139EFE5440538FE1E9B5403C40
23	Manhole to Manhole	900	0105000020E610000001000000010200000002000000B827B5139EFE5440538FE1E9B5403C40C4B27F409BFE544036004EEC9E403C40
24	Manhole to Manhole	900	0105000020E610000001000000010200000002000000B74CD97E94FE54402042AB6EBD403C40D30EF6C897FE5440B11F9BA8BA403C40
25	Manhole to Manhole	900	0105000020E610000001000000010200000002000000B74CD97E94FE54402042AB6EBD403C409518E8598EFE54406063F69CC2403C40
26	Manhole to Manhole	900	0105000020E610000001000000010200000002000000FA7B09978BFE5440E8549B2098403C40B026674B8EFE5440F819B11596403C40
27	Manhole to Manhole	900	0105000020E610000001000000010200000002000000B026674B8EFE5440F819B11596403C40116354E691FE5440CF550B5593403C40
28	Manhole to Manhole	900	0105000020E610000001000000010200000002000000FA7B09978BFE5440E8549B2098403C403B77458F8CFE54406DF6190CA7403C40
29	Manhole to Manhole	900	0105000020E6100000010000000102000000020000003B77458F8CFE54406DF6190CA7403C40FE520B628DFE5440E8B630B7B3403C40
30	Manhole to Manhole	900	0105000020E610000001000000010200000002000000FE520B628DFE5440E8B630B7B3403C40A507C1DC8DFE54401D734817BB403C40
31	Manhole to Manhole	900	0105000020E610000001000000010200000002000000A507C1DC8DFE54401D734817BB403C409518E8598EFE54406063F69CC2403C40
32	Manhole to Manhole	900	0105000020E610000001000000010200000002000000FA7B09978BFE5440E8549B2098403C401AF2A15485FE5440344E00499D403C40
33	Manhole to Manhole	900	0105000020E6100000010000000102000000020000001AF2A15485FE5440344E00499D403C40CD7DCE4281FE54405C7079A3A0403C40
34	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000001530182888FE5440648B15F4BF403C40264C8BF686FE54402268FA5BC1403C40
35	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000067F4561188FE54402B809397BE403C40B8DA3AAF86FE5440B11C4AC1BF403C40
36	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000FCE892B487FE544036716DE2B8403C40FFF750A785FE5440574720CFB9403C40
37	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000FF418B2C87FE5440D9162A46B0403C4088AAAA6C84FE54406AFCD2C5B2403C40
38	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000828F9EC786FE544055666B00AA403C404C96B87483FE5440D4B1D941AD403C40
39	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000095778E8286FE5440F7DB15B1A8403C409F48105C83FE5440B90C19B4AC403C40
40	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000C16369D283FE5440183B82D3AA403C40F608C62B83FE544034067C9EAB403C40
41	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000FBAC249083FE5440D47C3B95AA403C40A8928AEA82FE54404CE67827AA403C40
42	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000959DC40583FE5440D183447FA7403C404271A67582FE54406ECE7A87A7403C40
43	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000737E018E82FE5440CF9FA6C6A4403C40E451590582FE5440F0AFDF01A5403C40
44	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000D284189A81FE54409217CC86A5403C40E46B7ED181FE5440BAF3C3D7A3403C40
45	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000D5D3EB9E82FE54409453C468AB403C40446666A382FE5440F4627D8EA8403C40
46	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000008521F72383FE544052C45163AE403C40BFCDF64083FE5440BD574E18AC403C40
47	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000003EDD79F183FE544090A4A407B3403C40C333F00C84FE54405208EEA5B0403C40
48	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000BC9390BB84FE5440E4C1B6A1B7403C40C8D250BF84FE5440420F689BB4403C40
49	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000002762967985FE54400DD8EAF3BB403C40B9E3FE6B85FE5440D92BFC78B8403C40
50	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000C8EA763F86FE5440CAC1F774C0403C4056DB3D5286FE54408208F7A8BD403C40
51	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000F4F1862C87FE544029C207B6C5403C40385E643E87FE5440B78544F8C2403C40
52	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000094D7739987FE5440B58A1E07C8403C4056801EAB87FE5440F0E12E68C5403C40
53	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000001066CD4988FE5440DB1CC51BC9403C4029E2DE3388FE5440EB93D2D8C7403C40
54	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000884D611489FE54407FC79F87C8403C409016EAF788FE544096EEF131C7403C40
55	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000000F8618EF89FE54409E81F0E2C7403C40E2DEE4D989FE5440C4D99571C6403C40
56	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000C0C116C68AFE544030D9F43FC7403C40708E07AA8AFE54405A406AC0C5403C40
57	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000F4D1E6E889FE5440C141408AC4403C40103F80108AFE5440A63E1A43C6403C40
58	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000079A9C07388FE5440B01D45D1C4403C409B804A6F87FE5440FD1EDE10C4403C40
59	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000D68D82E08AFE5440BCEE0CC1C3403C40D8E424178BFE544026AC8863C5403C40
60	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000316945388CFE54407EB22EB5C2403C40E7DFB1448CFE5440729BD862C4403C40
61	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000002159D0BF8BFE5440DF585571C6403C404F1566BD8BFE5440F07C03D6C4403C40
62	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000F8B861FC8CFE54402D6EB01AC2403C40F03E311C8DFE544002B768ABC3403C40
63	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000D5A8FD978CFE54406AA0FEC7C5403C40C1E89DAB8CFE5440A97A3C0BC4403C40
64	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000FC0C1C9A8DFE544079149FF8C4403C4081952BA48DFE54405D41A937C3403C40
65	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000007F1724E98EFE54409B4741EFC3403C40232362CD8EFE544099E3973BC2403C40
66	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000F5A5129290FE5440A3508943BF403C40C7FC26AB90FE5440C0F3BDA8C0403C40
67	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000662A93A290FE54401F215195C2403C404299F15F90FE5440284528E8C0403C40
68	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000F6EBEFDF91FE5440BCF81698C1403C4094AB9BCC91FE5440FACAACB4BF403C40
69	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000D08C7F7491FE5440854B328EBE403C40FE24D27591FE54402073DAFDBF403C40
70	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000F12E918C92FE5440D9A621B3BD403C409646749292FE54406541DA0DBF403C40
71	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000007B115E1693FE5440BE3672A1C0403C4008656DF592FE5440222E66BABE403C40
72	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000494A793993FE54400D392332BD403C405C411A4C93FE54408DB15071BE403C40
73	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000006546DF1994FE54405A245AD8BF403C40DD80B10394FE5440934483D6BD403C40
74	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000007151768695FE544019FF776BBB403C409BA7F29095FE544058F78C87BC403C40
75	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000ED661AF195FE54400147F367BE403C4032821DE495FE544020AC6C41BC403C40
76	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000E645A32597FE544006A0CB25BA403C405261643197FE5440E46A6828BB403C40
77	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000004C2EFEB897FE5440C6777C09BD403C404F4EB89F97FE5440065861CBBA403C40
78	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000DE4D3D6E99FE5440CAEB995DB8403C40ACC1FD7499FE544090F1CF65B9403C40
79	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000C2B316E599FE544027D77953BB403C40663B61009AFE544044AFB1FCB8403C40
80	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000000C829C3C9BFE54400B5200F3B6403C4023CDE9329BFE5440148D8615B8403C40
81	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000F8BB1C6C9BFE5440C7353417BA403C40F0198EA49BFE54406BF2D2BFB7403C40
82	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000ADF139859CFE54405FF153F1B5403C4024DC227B9CFE54404513001EB7403C40
83	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000643A577F9CFE54406E458A3BB9403C40B25AC8BE9CFE54402C4CFCEAB6403C40
84	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000000F24ECEB9CFE5440E21AAEA4B5403C4072C224F29CFE5440709640C4B6403C40
85	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000266C56349DFE5440E28F10ADB8403C40AC79CB369DFE54405ED47A90B6403C40
86	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000EC170D799DFE544027575974B9403C40BB4FAC739DFE544008B79162B6403C40
87	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000447EE3CA9DFE5440AD2697E1BE403C40CEAE7FAD9DFE5440BAEEF536B6403C40
88	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000006F2136BB9EFE5440609FDF0FBE403C40421FA0CF9DFE54400074391DB6403C40
89	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000F95C5A659EFE5440C7DA52B8B8403C40A047A2F49DFE5440E2A15001B6403C40
90	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000F92956D29EFE54400D525683B7403C40FF07E3FB9DFE544097280628B5403C40
91	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000431ACDB19EFE54403972D6BDB5403C4065EB3EE49DFE5440F035A167B4403C40
92	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000007A5484779EFE54401FB45FE6B3403C405F3A71AD9DFE54400095A1A9B2403C40
93	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000D5F619909DFE5440AB0FC954B3403C4040DD1A929DFE544090E627CBB1403C40
94	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000B813C4B29DFE5440DC652A8EAD403C40745046049DFE544024BFEB48AD403C40
95	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000AE7821CE9CFE54400895FC10AD403C4090A378E89CFE54401A17A766AC403C40
96	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000007D4FF0B09CFE5440C34E8A2CAC403C40AE2049A79CFE5440E8BE2954AA403C40
97	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000D6D741399DFE5440ADF3D0B7A9403C40F09489659CFE5440123A183DA8403C40
98	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000007787E4D899FE5440811E1CD2AD403C40FE1D643D9CFE544053C160F6A6403C40
99	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000D4D8BD5F99FE544051FB0ACEAA403C40372EF4D49BFE544094E473A4A3403C40
100	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000025CCB01499FE5440A8224F1CA6403C40688528FC9AFE54406543ABAC9D403C40
101	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000005B1A4C7F9BFE5440EEB769B99D403C406D4CAFB19AFE54402A4359509C403C40
102	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000725E238598FE54405589922A9D403C40548070D199FE54400BC9873798403C40
103	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000003936D65698FE54405561A7549A403C40DEBA685B99FE544045867D0F96403C40
104	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000012FD130398FE5440F274950695403C407C4998DD98FE5440A4550BC393403C40
105	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000CBD3DB7799FE5440D91BF9A092403C404731649A98FE54402D05BA8892403C40
106	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000FFC6358997FE5440116E962991403C4005DBD28597FE5440D789111D8F403C40
107	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000F5CB5D2D97FE54408DAEA4208E403C407F5D3D0F97FE5440EC2509768F403C40
108	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000008F1A676095FE5440A63B00D492403C4000E2495595FE54408DAE9BC190403C40
109	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000006E6AD40A95FE54405A002BD38F403C40261F58E494FE54406D23581691403C40
110	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000066113D4391FE5440A7D2F8CC92403C40ADD0CC7C91FE5440DE849DA593403C40
111	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000036763DE892FE5440B0614B7A91403C40461C484493FE5440DF6E7E4E92403C40
112	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000009A4EEAC093FE5440DFCA2A1394403C40A6D436B493FE5440385284FA91403C40
113	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000002D3349C792FE5440E2FE96D994403C40E817D9C292FE544092DF99AF92403C40
114	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000024FBF18992FE5440901B1D9996403C40411AEE0B92FE54407C0D0EBD95403C40
115	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000FE46D8B692FE54407155A65999403C407CB1043892FE5440B2FE5A8F98403C40
116	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000000D64603193FE5440AB99D304A1403C40E4C8A8A392FE54409436D8729F403C40
117	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000003680C1C92FE544084E57BB89E403C409720107692FE5440D750D6879C403C40
118	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000D24251F991FE5440C93589929C403C40E4EBA04F92FE544034F929129A403C40
119	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000005CC89E5C92FE544099CDE89AA2403C4061F259B492FE5440BAB34F84A0403C40
120	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000CB4EEA6F92FE54405F0B96E5A3403C409BE888CE92FE5440ACC14631A2403C40
121	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000E59BC47793FE5440429B5267A5403C40C1CFDFEA92FE5440444C9001A4403C40
122	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000C15A160093FE5440541F26F4AC403C40144CD53493FE54404BC1FBAFA8403C40
123	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000001BDACBD593FE544001410241AB403C404247CE4C93FE5440DE298931AA403C40
124	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000035C1BC5A93FE544009A7C19AB2403C409164CCAE93FE5440F8ECD759B0403C40
125	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000765F792794FE544057A4FB5DB0403C40904D0B8493FE5440E90BF0A9AD403C40
126	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000003C5D4FCF93FE54401593C4E4B9403C40FB3E09FA93FE544090E0E214B5403C40
127	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000060A0C8A994FE5440D510FF8CB8403C40DCA2EA1C94FE5440B9505446B7403C40
128	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000F14DE9B68DFE54408A852408C0403C40101D19028EFE5440981FE255BD403C40
129	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000001D9623798EFE544001CE6211BD403C40FC2FBAEC8DFE544037E40E0DBC403C40
130	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000020A7CF548EFE544062F682DABA403C40DA5EB0BE8DFE5440D8A2AE48B9403C40
131	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000B593F23F8DFE54407C3806CAB8403C40A431768D8DFE5440CC563D53B6403C40
132	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000005571EAF98CFE54400D1DED5BB4403C402A48842C8DFE5440FCC7947FB0403C40
133	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000140365A28CFE54406B9E22F0AE403C4004E8DAE28CFE544038EB2C12AC403C40
134	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000DA2F43418CFE544067DCCDD5A8403C40453BD5698CFE54405CB10CCCA4403C40
135	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000006404E18C8DFE544003AA284DAE403C401A7466FE8CFE5440E69D00BAAD403C40
136	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000004AC0FD218DFE5440C0B8628FA7403C40EC6F925E8CFE54405424C81EA4403C40
137	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000006D9621A98CFE5440A5D1BE10A0403C40B2E943088CFE54409666CFEE9E403C40
138	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000094F099568CFE54406469D3DF9A403C405AB2B9B18BFE5440993340BB99403C40
139	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000004850DA6A8DFE54401850302399403C408947E0638DFE5440B0E88DC496403C40
140	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000CC6BF91E8FFE5440CE852EC697403C409918AA278FFE5440F118866D95403C40
141	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000F2F10B9F8FFE5440BD36AD6097403C40605008B78FFE5440A43B100095403C40
142	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000051FC213D90FE54400284B8E596403C40FE5EE03290FE5440216D82A194403C40
143	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000065F4799891FE544073A0F19696403C40384178A791FE54404D8E098593403C40
144	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000E92D70198FFE5440FAAFC08294403C4042B49DDF8EFE5440234088A495403C40
145	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000002BD9719C8DFE544067AF7FAA95403C408C6E76B48DFE544096D1B08796403C40
146	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000006BF7CFC38BFE54409BB4B51F97403C407A73F0E68BFE5440418D42E497403C40
147	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000D95F83238BFE5440959513EC9A403C40BC2E35168BFE5440095FC38A98403C40
148	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000000F5A0B6E89FE54403F4247439C403C40CFE5839789FE5440E8DD1AC699403C40
149	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000069398A0B89FE5440AC52558C9C403C400800310D89FE5440C0BC15389A403C40
150	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000EF926C7C88FE54401B43B3019D403C406AEFAC7A88FE5440E2B0D0B09A403C40
151	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000007F6F65DE86FE54404E34B8479E403C40E43E27FD86FE5440485131EB9B403C40
152	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000005421A41188FE5440F26944009A403C406ACCC00B88FE54404457370C9B403C40
153	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000B02B2C4989FE544019C7361599403C40A09F0B4789FE544074A969089A403C40
154	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000A6F93FE385FE5440E38C8CBA9B403C40A506DAE185FE5440C2B1A2D49C403C40
155	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000EC1AB6B784FE54407D1776A99C403C40C2B26AB684FE544069505FCB9D403C40
156	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000023F9C81683FE544003D941FB9D403C40220DC31483FE54404AFB85239F403C40
157	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000005D71171383FE544075BC5A3AA1403C409802A0D182FE5440A63ED85A9F403C40
158	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000FA1045DA81FE544041A750F79E403C40281F45DB81FE5440FFE0D725A0403C40
159	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000EF6DD97F81FE5440292E75AF9E403C404D47B11F81FE54407C8144DC9F403C40
160	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000006240E17280FE54408C73D0D39E403C40F60D74A080FE544074846C0A9D403C40
161	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000D309464181FE5440B4D02B489D403C40E61FB27A80FE5440CB7B38349C403C40
162	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000DC55450980FE5440A5BDF98A9C403C406AD1D12C80FE54405A506B7A9A403C40
163	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000024A9DAA80FE544059D941E699403C40623FEB0C80FE5440AC5571C599403C40
164	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000886A114480FE5440B1BB719097403C40AB9BB6B17FFE5440689205C097403C40
165	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000025BFF74D7FFE54400553E14D98403C40301FD76E7FFE5440D693A44496403C40
166	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000885EB9897EFE5440BE6B9CD993403C405BAE13967EFE544024DD285C91403C40
167	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000066F6143392FE5440174997847D403C40902A93FA92FE54408A0BC6827A403C40
168	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000995EACD291FE5440169C4BEB7C403C404C6109E991FE54401BF26A2C7B403C40
169	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000804A05BF90FE54407C7886917D403C408189E8D390FE5440BFD449D87B403C40
170	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000072ECE63D8FFE54403624AF6F7E403C407240B8628FFE544047F530AF7C403C40
171	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000A536EC9E8CFE54404089F00E80403C402519CCE48CFE54402AA670487E403C40
172	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000034A4AA5A8BFE54401BD3C8C180403C404FC1B4688BFE5440F019DD217F403C40
173	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000B0FE383A88FE54401FC9FFB182403C40A9E5B54C88FE5440C88FB0E380403C40
174	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000EBA8C13585FE5440F009C19E84403C40F852FD7285FE54407DB4F19582403C40
175	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000019E7496083FE54406241628786403C40E83A8D5C83FE5440080BE5B584403C40
176	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000014C81E7180FE5440469B1AAD89403C40F21E129780FE54406600E2AB87403C40
177	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000CFD7B6957EFE544085C988028E403C40FC15C6E97DFE544062F33A8E8B403C40
178	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000CF2112057DFE5440304D90498D403C405D6B1FBA7DFE54409E67A43C8C403C40
179	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000007B39D5BB7AFE54400852847E8F403C4045B33DD57DFE5440F95362D98B403C40
180	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000064CC60457AFE544058099ADC8C403C40FC15C6E97DFE544062F33A8E8B403C40
181	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000CE5F3C917CFE54407EF2816C8A403C40933D651A7EFE544080FB43DC8A403C40
182	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000080B826077EFE5440974DE5C588403C402411CEB27EFE5440A75261B689403C40
183	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000061B0BB4880FE5440A58F117686403C40B4D9093781FE5440A03D49FF86403C40
184	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000008F98954083FE5440F971644E83403C40B41F2FEB83FE5440B1B2C61E84403C40
185	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000003000000990E741585FE54402726655581403C40EE1743E085FE5440489CEA5482403C408C972BDE85FE54401C49295682403C40
186	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000004173773F87FE5440A409D7FF7F403C402ABD93E987FE54405004AF1E81403C40
187	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000214BDEEE8AFE544098A725BE7D403C40BEF3F9A38BFE5440679FAD007F403C40
188	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000C3887F988CFE5440BC8188B87C403C40EF6512838DFE5440DDCAE6E27D403C40
189	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000BA6E432F8FFE544060EE51317B403C40F7C9A0C78FFE54408A83746E7C403C40
190	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000983FA69291FE544062FDD6C679403C40E0B50B1A92FE544042E8050E7B403C40
191	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000004A2AD5A693FE5440E2D74D7878403C40B5F1459593FE54400F05D5227A403C40
192	Manhole to Manhole	900	0105000020E610000001000000010200000002000000AC83D1D297FE54400EAE4DE38E403C40F2429CD196FE544001C1E1FB7D403C40
193	Manhole to Manhole	900	0105000020E610000001000000010200000002000000F2429CD196FE544001C1E1FB7D403C40D9E7C87996FE5440F938063278403C40
194	Manhole to Manhole	900	0105000020E610000001000000010200000002000000D9E7C87996FE5440F938063278403C40FCE8026498FE5440FBB02EDE6C403C40
195	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000AAE85D6B98FE5440FF85D7C98C403C404AD66A9F97FE5440A13880828B403C40
196	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000002297E88C97FE5440E193F2DB87403C40D6765B5E97FE54409043E43B87403C40
197	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000006B7542D096FE544054BF65C688403C40ECAAFD5497FE5440E64C4E9E86403C40
198	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000667C234C96FE54409818858485403C4009F92B1E97FE5440B205FF0383403C40
199	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000ACB5BAB995FE5440732CC69F84403C404522900897FE5440FF0D709881403C40
200	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000002A0B121397FE5440671C1D0180403C40A2C0DFE796FE54405A6675727F403C40
201	Outlet Valve to Manhole Line	300	0105000020E6100000010000000102000000020000000E7FE20B97FE5440984BA1337E403C40973A6FC696FE54409A54503F7D403C40
202	Outlet Valve to Manhole Line	300	0105000020E610000001000000010200000002000000ECEE623D97FE5440422B23347D403C4092848AB596FE54403CA946227C403C40
203	Manhole to Manhole	900	0105000020E6100000010000000102000000020000005C55BCAC93FE544068F347147A403C40D9E7C87996FE5440F938063278403C40
204	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000058AC6C1993FE544090EC289A86403C40EA589BF394FE5440CE00713879403C40
205	Outlet Valve to Manhole Line	300	0105000020E61000000100000001020000000200000016F275A292FE5440DCB6E0CB84403C40F0A35D4894FE5440A0619CAB79403C40
206	Manhole to Culvert	900	0105000020E610000001000000010200000002000000FCE8026498FE5440FBB02EDE6C403C4026D0E8AE99FE5440B6CD1FBB66403C40
207	Pipe Culvert	\N	0105000020E6100000020000000102000000020000000054E5CF99FE5440000057B266403C400052D92D9AFE5440000026E561403C4001020000000200000000865C8199FE5440000041C766403C400032CCE299FE54400000E39E61403C40
\.


--
-- Data for Name: electrical; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.electrical (gid, line_type, cable_type, p_material, p_dia_mm, phase_c, c_dia_mm, c_material, geom) FROM stdin;
1	Pad fro Trans-II	\N	\N	0	0	0	\N	0105000020E610000001000000010200000006000000001C00D398FE544020009EF771403C40EC02F4E898FE5440B0A2A43072403C40E86CBEDE98FE5440B0A2BD6F72403C40EC8EFBB298FE5440C0A26FFE71403C40F05231BD98FE5440C0A256BF71403C40001C00D398FE544020009EF771403C40
2	Pad for Trans-I	\N	\N	0	0	0	\N	0105000020E61000000100000001020000000500000048C2C7F598FE54405062A74E72403C4044728A2199FE54407062F5BF72403C4040DC541799FE544060620EFF72403C4044FE91EB98FE54407062C08D72403C4048C2C7F598FE54405062A74E72403C40
3	H-pole for Trans-I	\N	\N	0	0	0	\N	0105000020E6100000030000000102000000260000002CE3BBE798FE5440E061E2C072403C402CF0EFE798FE544050CBAEBF72403C408CD91FE898FE5440D0CE13BE72403C4014313DE898FE544040C95DBC72403C40841247E898FE5440C0099ABA72403C4014313DE898FE5440204AD6B872403C408CD91FE898FE5440804420B772403C402CF0EFE798FE5440004885B572403C40B0E9AEE798FE544050D111B472403C40D0BF5EE798FE5440D029D1B272403C4020E201E798FE5440E00FCDB172403C4000239BE698FE5440506A0DB172403C4090A12DE698FE5440400C98B072403C40BCB1BCE598FE5440708670B072403C40D4C14BE598FE5440400C98B072403C406C40DEE498FE5440506A0DB172403C404C8177E498FE5440E00FCDB172403C40A0A31AE498FE5440D029D1B272403C40C079CAE398FE544050D111B472403C40387389E398FE5440004885B572403C40E08959E398FE5440804420B772403C405C323CE398FE5440204AD6B872403C40DC5032E398FE5440C0099ABA72403C405C323CE398FE544040C95DBC72403C40E08959E398FE5440D0CE13BE72403C40387389E398FE544050CBAEBF72403C40C079CAE398FE5440104222C172403C40A0A31AE498FE544090E962C272403C404C8177E498FE5440800367C372403C406C40DEE498FE544000A926C472403C40D4C14BE598FE544020079CC472403C40BCB1BCE598FE5440E08CC3C472403C4090A12DE698FE544020079CC472403C4000239BE698FE544000A926C472403C4020E201E798FE5440800367C372403C40D0BF5EE798FE544090E962C272403C4010AFAAE798FE5440201437C172403C402CE3BBE798FE5440E061E2C072403C400102000000020000002CE3BBE798FE5440E061E2C072403C402C33A90C99FE5440F061B32073403C400102000000260000002C33A90C99FE5440F061B32073403C40D0D5880C99FE54400082872173403C40407E6B0C99FE5440A0873D2373403C40CC9C610C99FE54401047012573403C40407E6B0C99FE54409006C52673403C40D0D5880C99FE5440200C7B2873403C4024BFB80C99FE5440D008162A73403C40B0C5F90C99FE5440907F892B73403C4080EF490D99FE54401027CA2C73403C403CCDA60D99FE54400041CE2D73403C405C8C0D0E99FE544080E68D2E73403C40C40D7B0E99FE5440A044032F73403C40A0FDEB0E99FE544060CA2A2F73403C407CED5C0F99FE5440A044032F73403C40E46ECA0F99FE544080E68D2E73403C40042E311099FE54400041CE2D73403C40B40B8E1099FE54401027CA2C73403C409435DE1099FE5440907F892B73403C401C3C1F1199FE5440D008162A73403C4070254F1199FE5440200C7B2873403C40F47C6C1199FE54409006C52673403C40745E761199FE54401047012573403C40F47C6C1199FE5440A0873D2373403C4070254F1199FE54400082872173403C401C3C1F1199FE54408085EC1F73403C409435DE1099FE5440D00E791E73403C40B40B8E1099FE54405067381D73403C40042E311099FE5440304D341C73403C40E46ECA0F99FE5440D0A7741B73403C407CED5C0F99FE5440C049FF1A73403C40A0FDEB0E99FE5440C0C3D71A73403C40C40D7B0E99FE5440C049FF1A73403C405C8C0D0E99FE5440D0A7741B73403C403CCDA60D99FE5440304D341C73403C4080EF490D99FE54405067381D73403C40B0C5F90C99FE5440D00E791E73403C4024BFB80C99FE54408085EC1F73403C402C33A90C99FE5440F061B32073403C40
4	H-pole for Trans-II	\N	\N	0	0	0	\N	0105000020E610000005000000010200000002000000040C9BAC98FE54400000373B72403C404C78D9AC98FE5440D0F8D83B72403C400102000000260000004C78D9AC98FE5440D0F8D83B72403C40C0AFF8AC98FE5440B0A4263B72403C40209928AD98FE544030A88B3972403C40A8F045AD98FE544090A2D53772403C4018D24FAD98FE544020E3113672403C40A8F045AD98FE544080234E3472403C40209928AD98FE5440101E983272403C40C0AFF8AC98FE54406021FD3072403C4044A9B7AC98FE5440A0AA892F72403C40647F67AC98FE54402003492E72403C40B4A10AAC98FE544030E9442D72403C4094E2A3AB98FE5440B043852C72403C40306136AB98FE5440A0E50F2C72403C405071C5AA98FE5440D05FE82B72403C40688154AA98FE5440A0E50F2C72403C400C00E7A998FE5440B043852C72403C40E04080A998FE544030E9442D72403C40346323A998FE54402003492E72403C405439D3A898FE5440A0AA892F72403C40D83292A898FE54406021FD3072403C40744962A898FE5440101E983272403C40F0F144A898FE544080234E3472403C407C103BA898FE544020E3113672403C40F0F144A898FE544090A2D53772403C40744962A898FE544030A88B3972403C40D83292A898FE5440B0A4263B72403C405439D3A898FE5440701B9A3C72403C40346323A998FE5440F0C2DA3D72403C40E04080A998FE5440E0DCDE3E72403C400C00E7A998FE544060829E3F72403C40688154AA98FE544070E0134072403C405071C5AA98FE544040663B4072403C40306136AB98FE544070E0134072403C4094E2A3AB98FE544060829E3F72403C40B4A10AAC98FE5440E0DCDE3E72403C40647F67AC98FE5440F0C2DA3D72403C4044A9B7AC98FE5440701B9A3C72403C404C78D9AC98FE5440D0F8D83B72403C400102000000020000004C78D9AC98FE5440D0F8D83B72403C40E81B4DD198FE5440F0D47D9A72403C40010200000002000000E81B4DD198FE5440F0D47D9A72403C40045C88D198FE54400000089B72403C40010200000025000000E81B4DD198FE5440F0D47D9A72403C40D0480AD198FE5440B063FC9B72403C40705FDAD098FE54403060979D72403C40EC07BDD098FE5440C0654D9F72403C407826B3D098FE5440402511A172403C40EC07BDD098FE5440B0E4D4A272403C40705FDAD098FE544050EA8AA472403C40D0480AD198FE5440D0E625A672403C404C4F4BD198FE5440805D99A772403C402C799BD198FE54400005DAA872403C40DC56F8D198FE5440201FDEA972403C4008165FD298FE544080C49DAA72403C407097CCD298FE5440C02213AB72403C404C873DD398FE544090A83AAB72403C401C77AED398FE5440C02213AB72403C4090F81BD498FE544080C49DAA72403C40B0B782D498FE5440201FDEA972403C406095DFD498FE54400005DAA872403C4040BF2FD598FE5440805D99A772403C40BCC570D598FE5440D0E625A672403C401CAFA0D598FE544050EA8AA472403C40A006BED598FE5440B0E4D4A272403C4014E8C7D598FE5440402511A172403C40A006BED598FE5440C0654D9F72403C401CAFA0D598FE54403060979D72403C40BCC570D598FE5440B063FC9B72403C4040BF2FD598FE5440F0EC889A72403C406095DFD498FE54407045489972403C40B0B782D498FE5440502B449872403C4090F81BD498FE54400086849772403C401C77AED398FE5440E0270F9772403C404C873DD398FE5440F0A1E79672403C407097CCD298FE5440E0270F9772403C4008165FD298FE54400086849772403C40DC56F8D198FE5440502B449872403C402C799BD198FE54407045489972403C40E81B4DD198FE5440F0D47D9A72403C40
5	Man hole	\N	\N	0	0	0	\N	0105000020E61000000100000001020000000500000034FCED5A96FE544090164CB479403C4047FA538996FE54407D2F079078403C40663A8FD796FE544003B44F5879403C4041F129A496FE5440B0A3F0547A403C4034FCED5A96FE544090164CB479403C40
6	Electrical Room	\N	\N	0	0	0	\N	0105000020E61000000800000001020000000500000000B850FA97FE54400000FF6774403C40005AC01A98FE5440000052C873403C40002C4C5398FE54400000178074403C4000BCDC3298FE54400000C71F75403C4000B850FA97FE54400000FF6774403C4001020000000200000000A6A9C197FE5440000021BA74403C40007C258A98FE54400000FB3E77403C4001020000000400000000A6A9C197FE5440000021BA74403C400028342997FE5440000071C877403C4000EA13F497FE5440000006417A403C40007C258A98FE54400000FB3E77403C40010200000005000000006C625598FE544000006E8475403C40000CD27598FE54400000C1E474403C4000E05DAE98FE54400000869C75403C400070EE8D98FE54400000363C76403C40006C625598FE544000006E8475403C40010200000005000000007C62D797FE54400000C3D776403C40001CD2F797FE54400000143876403C4000F05D3098FE54400000DBEF76403C40007EEE0F98FE54400000898F77403C40007C62D797FE54400000C3D776403C400102000000050000000092CD9B97FE54400000F83977403C4000043DBC97FE544000003EAE76403C40002E3C1A98FE544000005E0B78403C4000BCCCF997FE54400000199778403C400092CD9B97FE54400000F83977403C40010200000004000000007C258A98FE54400000FB3E77403C40006216EB98FE544000008C4D75403C4000A0362098FE54400000F4D472403C4000A6A9C197FE5440000021BA74403C4001020000000500000000567C7297FE5440000000F077403C4000C8EB9297FE54400000486477403C4000F2EAF097FE5440000069C178403C4000807BD097FE54400000224D79403C4000567C7297FE5440000000F077403C40
7	Man hole	\N	\N	0	0	0	\N	0105000020E610000001000000010200000005000000A1ED558B97FE54401A9BCE3672403C4038FD40AF97FE5440D0CF8D5471403C40F68A620F98FE5440D352BE2772403C4044689CE697FE54405BEF651773403C40A1ED558B97FE54401A9BCE3672403C40
8	Utility panel	\N	\N	0	0	0	\N	0105000020E610000001000000010200000005000000005055CA97FE54400000A28D74403C4000C270D497FE54400000C55974403C4000DE8DDF97FE544000006C7C74403C40006C72D597FE544000004BB074403C40005055CA97FE54400000A28D74403C40
9	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000200000001020000000200000011BDBFAF8AFE5440B171F0527D403C40664FCEB18AFE54409CAE3E8C7D403C4001020000000700000011BDBFAF8AFE5440B171F0527D403C400159ABC88AFE5440B1C6A7437D403C40BA4589CA8AFE5440B489327D7D403C40664FCEB18AFE54409CAE3E8C7D403C408DB4F7978AFE54406C69F79B7D403C4014DA5A958AFE5440DB3A7A637D403C4011BDBFAF8AFE5440B171F0527D403C40
10	Junction box	\N	\N	0	0	0	\N	0105000020E610000003000000010200000002000000D89AB4D99DFE54401025089BAB403C405083B3BF9DFE5440F0BAD3C8AB403C40010200000004000000D89AB4D99DFE54401025089BAB403C40C41A68E79DFE544060071C19AC403C4024EB2CCF9DFE544070C1A349AC403C405083B3BF9DFE5440F0BAD3C8AB403C400102000000040000005083B3BF9DFE5440F0BAD3C8AB403C40040DEBAF9DFE5440509D7145AB403C40FC5695CB9DFE5440309B1419AB403C40D89AB4D99DFE54401025089BAB403C40
11	Junction box	\N	\N	0	0	0	\N	0105000020E6100000020000000102000000020000007438852185FE5440F04762959B403C403012992985FE5440C012FA069C403C400102000000070000003083152C85FE5440C09823059C403C40A8A82F0485FE544090D8AE259C403C4080281FFC84FE544020FA4BB29B403C401CECAA2585FE5440307B2D929B403C40D4FA554785FE5440301AA2779B403C40A4F7124F85FE544070C537E89B403C403083152C85FE5440C09823059C403C40
12	Junction box	\N	\N	0	0	0	\N	0105000020E610000002000000010200000002000000181620B988FE544090AA0DAE98403C4004B356C088FE544010D03F2299403C40010200000007000000985867C388FE54403038DA1F99403C408CC73E9B88FE5440909C413F99403C4050B1849388FE544080F89CCB98403C40603C68B888FE5440202D9EAE98403C40A44A88DE88FE5440C0F3919098403C4094917FE688FE54400091680499403C40985867C388FE54403038DA1F99403C40
13	Junction box	\N	\N	0	0	0	\N	0105000020E610000002000000010200000002000000601CB6468CFE5440D0F3A9D295403C407840AD4F8CFE54406091694696403C4001020000000700000034EA9A518CFE544050BFE44496403C4014C63E298CFE54401094AE6496403C409494A2218CFE5440907072F095403C40C881024B8CFE5440C00236CF95403C408C90AD6C8CFE5440C0A1AAB495403C4070EDAB748CFE5440E03E462996403C4034EA9A518CFE544050BFE44496403C40
14	Junction box	\N	\N	0	0	0	\N	0105000020E6100000020000000102000000020000006C0B3DDB8FFE5440F08CFB0F93403C4044C017E48FFE5440C0F1778893403C40010200000007000000B8BB14E48FFE5440C06A7A8893403C40806760BC8FFE5440302C01A993403C400036C4B48FFE5440B008C53493403C40D47089DF8FFE5440E09B870C93403C40987F340190FE5440E03AFCF192403C40086F560990FE54400001F56993403C400CDD1AE48FFE54401065758893403C40
15	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000016A02292FE54400000482679403C400008E30890FE544000002E8980403C40
16	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000CCFE1A92FE54400000962A79403C400088F0E38FFE54400000F44B80403C40
17	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000EC9C1792FE544000007E2C79403C4000CC6A1C8EFE54400000C6B881403C40
18	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000036781292FE54400000652F79403C400068190E8EFE54400000BD6F81403C40
19	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000008A461692FE544000004FFA78403C400038C9D98FFE544000009E3B78403C40
20	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000062D61092FE54400000A6FD78403C400026B3CF8FFE54400000FD4978403C40
21	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000062D61092FE54400000A6FD78403C4000D254B08DFE54400000399379403C40
22	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000A6980D92FE54400000A4FF78403C40009AA3AB8DFE5440000066C179403C40
23	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000FE662392FE544000003DF278403C400016888B92FE54400000623E77403C40
24	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000008A461692FE5440000050FA78403C4000028E7F92FE54400000D62477403C40
25	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000008A461692FE5440000050FA78403C4000221E6491FE544000003A8E77403C40
26	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000FE662392FE544000003DF278403C4000A4457B91FE54400000E76777403C40
27	Junction box	\N	\N	0	0	0	\N	0105000020E61000000200000001020000000500000000CE6DF791FE5440FFFFA63E79403C40009EEF2892FE54400000B82279403C40002CF52692FE5440FFFF0DF078403C4000EA01F591FE5440FFFFC20E79403C4000CE6DF791FE5440FFFFA63E79403C400102000000020000000092011092FE5440FFFFC93079403C4000A6980D92FE5440FFFFA3FF78403C40
28	Junction box	\N	\N	0	0	0	\N	0105000020E61000000200000001020000000500000000BAF7978AFE54400000F89B7D403C4000AEBEC98AFE54400000AF7D7D403C400068ABC88AFE5440FFFFA7437D403C4000E65A958AFE544001007A637D403C4000BAF7978AFE54400000F89B7D403C40010200000002000000003CCEB18AFE544000003F8C7D403C4000C6BFAF8AFE54400000F0527D403C40
29	Junction box	\N	\N	0	0	0	\N	0105000020E6100000010000000102000000080000006FC2603285FE5440DA0BEFCF80403C404892FC4D85FE5440AF39FDC380403C4011518A5085FE5440332C520281403C401E87EB3485FE54402A36301381403C408C149D1B85FE5440EE83A42281403C4002F0871885FE5440B1E285DF80403C4044995F3285FE54404D6F79CF80403C402991CD3485FE54401D82421381403C40
30	Junction box	\N	\N	0	0	0	\N	0105000020E61000000100000001020000000700000000F073BC81FE5440FFFF255184403C4000C8EAD381FE54400000F33A84403C4000262DD881FE54400100D97B84403C40006E6DA581FE5440FFFFEBB084403C4000CEE99F81FE5440FFFF7D6A84403C4000F278BC81FE54400000B65184403C400030D6BE81FE544000005B9684403C40
31	Junction box	\N	\N	0	0	0	\N	0105000020E61000000200000001020000000500000000F074537EFE54400000342694403C4000B2367D7EFE544001001E2995403C4000F663A07EFE54400000E9D694403C40002010757EFE5440010095DF93403C4000EE28537EFE54400100D42694403C4001020000000200000000F6C5677EFE544000002DA494403C4000BA4A887EFE5440FFFF594D94403C40
32	Junction box	\N	\N	0	0	0	\N	0105000020E61000000200000001020000000500000000069B2380FE544001004DFE9E403C40003CE56180FE544000004462A0403C4000C47E9380FE54400000EAF89F403C4000DAE95380FE54400000968D9E403C40006CBE2180FE5440FFFFA4029F403C400102000000020000000036104380FE5440FFFF13B29F403C4000F6F27080FE5440FFFF81339F403C40
33	Junction box	\N	\N	0	0	0	\N	0105000020E6100000020000000102000000050000000054317784FE544000007B73B7403C4000AC53A884FE5440FFFFE372B8403C400050B1C284FE5440FFFFCF41B8403C4000E2A69484FE54400000C434B7403C400054317784FE544000007B73B7403C40010200000002000000001CAE8F84FE5440000085F2B7403C4000C6D8AC84FE5440000026C2B7403C40
34	Junction box	\N	\N	0	0	0	\N	0105000020E610000002000000010200000005000000005074F486FE544001003AC1AB403C4000F48F0887FE544000000700AD403C4000909F2D87FE544001009C00AD403C4000E86F1A87FE5440FFFF76A2AB403C40005074F486FE544001003AC1AB403C400102000000020000000086F0FD86FE544001009B57AC403C4000DCA52387FE5440FFFF904AAC403C40
35	Junction box	\N	\N	0	0	0	\N	0105000020E61000000200000001020000000600000000427A0187FE5440FEFFE354C5403C40004242E986FE544005009DD5C4403C4002E4ABCC86FE544008006C10C5403C40003264FD86FE54400900FE03C6403C4001166B1987FE5440FFFFB1D2C5403C4000427A0187FE5440FEFFE354C5403C400102000000020000000086BDE486FE5440FFFF5588C5403C4000427A0187FE5440FEFFE354C5403C40
36	Junction box	\N	\N	0	0	0	\N	0105000020E6100000020000000102000000050000000054E95989FE5440FFFF771CC9403C40003017A489FE5440000062D9C8403C4000DA859C89FE54400000356BC8403C4000F6ED5289FE5440FFFF38A5C8403C400054E95989FE5440FFFF771CC9403C400102000000020000000080458189FE54400100B6F8C8403C4000E8DA7A89FE54400100C085C8403C40
37	Junction box	\N	\N	0	0	0	\N	0105000020E6100000020000000102000000050000000086AFA38EFE544000009E75C4403C40007A78AC8EFE5440FEFF5AFBC4403C4000CC72F68EFE5440FFFFC4BBC4403C4000D8EBF18EFE5440FFFF2636C4403C400086AFA38EFE544000009E75C4403C400102000000020000000072F0D08EFE5440000004DCC4403C4000202CCA8EFE5440FFFF6756C4403C40
38	Junction box	\N	\N	0	0	0	\N	0105000020E61000000200000001020000000500000000F8714E92FE54400000DF0DC2403C400070869D92FE544000002ACDC1403C4000304F9892FE5440FFFF0056C1403C400028C34692FE54400100D593C1403C4000DA6B4E92FE544001007F0DC2403C4001020000000200000000A42F7492FE54400000FDEEC1403C40000E886E92FE54400100AE75C1403C40
39	Junction box	\N	\N	0	0	0	\N	0105000020E610000002000000010200000005000000008CFFBE9BFE54400000156ABA403C4000167E799BFE54400100E5A9BA403C400074CA729BFE544001005D3CBA403C4000A43DB89BFE5440FFFF7806BA403C40008CFFBE9BFE54400000156ABA403C40010200000002000000000C389C9BFE544000007B8ABA403C40004251969BFE5440FEFFC320BA403C40
40	Junction box	\N	\N	0	0	0	\N	0105000020E610000002000000010200000005000000007E26139BFE5440000058ED99403C400094A2599BFE54400000F3759B403C4000E6B5899BFE5440FFFF94069B403C400024E2489BFE54400000E26A99403C40007E26139BFE5440000058ED99403C4001020000000200000000628E689BFE5440FFFF07349A403C400018A3359BFE5440000070AD9A403C40
41	Junction box	\N	\N	0	0	0	\N	0105000020E610000002000000010200000005000000005EA5C791FE5440000038D99C403C4000F47AEE91FE5440000093BD9C403C4000D625CB91FE544001002EB39A403C40007A9EA891FE54400200D5C49A403C40005EA5C791FE5440000038D99C403C400102000000020000000078A6B891FE54400000C2D79B403C400036AADC91FE544000002AB69B403C40
42	Junction box	\N	\N	0	0	0	\N	0105000020E6100000040000000102000000030000000124653E8CFE54400500D9B3A9403C40000283528CFE54400700BBEEAA403C400022FF088CFE544004005524AB403C40010200000004000000008CADF48BFE544004009B05AA403C40013A5BE18BFE54400300B6C3A8403C4001D6932B8CFE544004004F8DA8403C400124653E8CFE54400500D9B3A9403C40010200000002000000008CADF48BFE544004009B05AA403C400124653E8CFE54400500D9B3A9403C4001020000000200000001B204068CFE5440FFFF8026AB403C40008CADF48BFE544004009B05AA403C40
43	Junction box	\N	\N	0	0	0	\N	0105000020E610000002000000010200000005000000003AB8208DFE5440000000FCBA403C400060DEF88CFE5440FFFF6BB5B8403C40007810298DFE544000004B8CB8403C4000E41F4F8DFE5440FFFFDAD9BA403C40004401238DFE5440FFFF51FABA403C40010200000002000000009AD10E8DFE54400100BDE4B9403C400062C83C8DFE54400000BCBDB9403C40
44	Junction box	\N	\N	0	0	0	\N	0105000020E6100000020000000102000000050000000034FDA491FE54400200F0247E403C400052599991FE54400200E5617D403C400070DD2192FE5440FFFF94177D403C40000E7D2D92FE5440FFFF1DE97D403C400034FDA491FE54400200F0247E403C40010200000002000000000229DE91FE54400000703C7D403C4000F296E791FE5440000059107E403C40
45	Junction box	\N	\N	0	0	0	\N	0105000020E6100000020000000102000000050000000054AF3E98FE54400000BFDF9B403C40005E8E5F98FE5440FFFF57C39B403C400056BA8598FE54400000EB109E403C400074E35F98FE54400000E12E9E403C400062E13F98FE54400100B7DE9B403C4001020000000200000000EA725098FE54400000AD189D403C4000281A7498FE54400000AE009D403C40
46	Junction box	\N	\N	0	0	0	\N	0105000020E61000000200000001020000000500000000AEF74693FE5440FFFFB548B6403C400094791893FE5440FFFFC423B3403C40005A1F4C93FE5440000028FDB2403C400020327F93FE54400000401DB6403C4000644C4693FE5440FFFF3949B6403C400102000000020000000024452F93FE5440FFFFCCCAB4403C40000E936693FE544000008C9BB4403C40
47	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000168ABC88AFE5440FDFFA7437D403C40634F532D8BFE54405FF546767B403C40
48	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000391277BD8AFE54408DAA9A4A7D403C404311BB208BFE5440B9B6CF4B7B403C40
49	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000391277BD8AFE54408DAA9A4A7D403C407A86C75B8AFE5440A8C10C9D7B403C40
50	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000168ABC88AFE5440FDFFA7437D403C402B94F3638AFE5440F9D0BA877B403C40
51	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000001C6BFAF8AFE54400800F0527D403C4076C00A8388FE544021F083AB7C403C40
52	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000391277BD8AFE54408DAA9A4A7D403C40F20B1E8E88FE5440AB6D848A7C403C40
53	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000BA4589CA8AFE5440B789327D7D403C40F1FA2EC48BFE54404B4FAB5082403C40
54	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000006E2F1EC08AFE5440606F8A837D403C40573D89AE8BFE5440E59AF65882403C40
55	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000006E2F1EC08AFE5440606F8A837D403C404FF8E4A78AFE5440E258C8A983403C40
56	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000001A67A6B98AFE54406AD679877D403C402A0906968AFE54408211EB9483403C40
57	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000030000001A67A6B98AFE54406AD679877D403C400E9480BC88FE54402A7EE83685403C40FDBFF5BB88FE54400E99F43685403C40
58	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000013CCEB18AFE544006003F8C7D403C406EE6299088FE54400875572A85403C40
59	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000004992FC4D85FE5440B339FDC380403C401459674186FE54407FD530B47E403C40
60	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000666F654485FE5440AD6A23C880403C400ECA2C3486FE5440FDD397967E403C40
61	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000676F654485FE5440AB6A23C880403C40337F8CA984FE5440401E21397F403C40
62	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000006FC2603285FE5440DD0BEFCF80403C403F544D9884FE5440AF33024A7F403C40
63	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000012518A5085FE5440352C520281403C40C401959C86FE544053E27D3C86403C40
64	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000072152C4785FE54401BBE0A0881403C40AD79AE9086FE5440F805E87586403C40
65	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000008536A3F85FE5440886BC70C81403C409C91B40885FE5440FA7AC57B88403C40
66	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000002A91CD3485FE54402182421381403C408F87F7E284FE54402A18189F88403C40
67	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000676F654485FE5440AB6A23C880403C40DC15340483FE544086522BCD80403C40
68	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000006FC2603285FE5440DD0BEFCF80403C402F11D8DF82FE5440BF723F1481403C40
69	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000C8EAD381FE54400400F33A84403C402CBC9F5581FE5440AABF15D682403C40
70	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000006B00C4CC81FE5440F113B74184403C4030030B3981FE544051C73BE982403C40
71	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000006B00C4CC81FE5440F113B74184403C402D5CB89C7FFE5440D794302C84403C40
72	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000730324C481FE54402507E04984403C40F58ABA787FFE54407E66D75884403C40
73	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000730324C481FE54402507E04984403C40037508B37DFE544079DDF01586403C40
74	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000F073BC81FE5440FEFF255184403C403E4927AB7DFE5440958E6C5986403C40
75	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000F24ACCD681FE54408783D86684403C40C53F1C7F7BFE544096205C378A403C40
76	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000C8EAD381FE54400400F33A84403C40E56D90777BFE5440D18381C989403C40
77	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000002D5B96707EFE54401AD6D3DA94403C40EF5D09B67DFE54404186DF9A93403C40
78	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000004F2DAA757EFE5440C2644FFA94403C404BB44FB77DFE5440F0CC33EA93403C40
79	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000B2367D7EFE544001001E2995403C408E1CCBB47EFE5440CBF5E24F97403C40
80	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000BC97848C7EFE5440E3015A0595403C40C1534CC47EFE5440385BA97C97403C40
81	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000DC0C9F8E7EFE5440FE427A7194403C40114D179D7FFE544097AF46CF8D403C40
82	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000066AF7947EFE5440E3AFB29594403C405A1DD6BC7FFE54407F5986DC8D403C40
83	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000066AF7947EFE5440E3AFB29594403C40712C5A9E80FE54407E049C8694403C40
84	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000001C4E099C7EFE5440E3290EBE94403C40DC2598A180FE5440F75AB9D294403C40
85	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000D8F2CC4880FE54407577DBD29F403C40519564557FFE54404A847EF99E403C40
86	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000D3B0484E80FE54401D5C31F29F403C4042B9C1577FFE5440A47D5E499F403C40
87	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000005F45FB5880FE54400C62532FA0403C401CE8DC6980FE544022CFC265A3403C40
88	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000003CE56180FE5440FDFF4362A0403C40F652B88780FE54400BADB1E9A3403C40
89	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000CB44DE7180FE5440C1BF5640A0403C40A7EA164D81FE5440D2999619A8403C40
90	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000040EBF48080FE544056584A20A0403C40A86B8F6381FE5440921ABE87A8403C40
91	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000023BE0B7F84FE5440A486389CB7403C401BA016E382FE54401911D5B7B5403C40
92	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000054317784FE544002007B73B7403C40844823D982FE544078F75D35B5403C40
93	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000B40B7F84FE54400000399CB7403C4000286DC485FE544000004B63BF403C40
94	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000004300608A84FE5440B1D3FED6B7403C4037F9FFCF84FE54402D5B164EBA403C40
95	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000008E918584FE544000005455B7403C400094DBC284FE544000002135BA403C40
96	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000BCDCA69484FE544063A3C134B7403C406A795AD985FE5440C7F55798BF403C40
97	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000ABBBE6D586FE5440C219683EC5403C40826BCEA786FE5440C148F0FAC6403C40
98	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000DF620E486FE54400F6A1F85C5403C40F65D20C386FE5440CA30A116C7403C40
99	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000F5EC9DA86FE5440919E62F3C4403C40709E22A487FE54409D16A376CD403C40
100	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000003000000B54342E986FE5440D3589DD5C4403C400F2068B987FE54403904C158CD403C403C95AABB87FE5440F9938E58CD403C40
101	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000005966E25589FE54407774B0D7C8403C40077A6CC388FE544012C4F900CB403C40
102	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000054E95989FE54400200781CC9403C40B2AA50D188FE5440871CD02FCB403C40
103	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000004027656989FE5440F734770EC9403C4089E979208AFE5440B5ED87DACA403C40
104	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000180458189FE54400600B6F8C8403C4004EEF1468AFE544034432FDFCA403C40
105	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000005966E25589FE54407774B0D7C8403C40502AD0F68BFE5440FDF23C9DC9403C40
106	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000054E95989FE54400200781CC9403C406D3396D88BFE54406F13EAC7C9403C40
107	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000005966E25589FE54407774B0D7C8403C40729A941D8EFE54405EDA0E71C7403C40
108	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000032B1575A89FE544095F7609FC8403C40E888B9288EFE5440472E110EC7403C40
109	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000497A81BB8EFE54401DAE6EEEC4403C4022F83C078FFE5440367D2EDAC6403C40
110	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000001A261CC78EFE5440D54E75E4C4403C40FBD733268FFE544053EC16B8C6403C40
111	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000D6C7D8A98EFE54401E6B69D3C4403C40640D1AC391FE5440C2C5AAADC3403C40
112	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000068694FA68EFE5440B982929DC4403C40F572B1BF91FE5440A435A663C3403C40
113	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000056A19DB591FE5440E0A3A61D7E403C406771F06F91FE54409B949B457F403C40
114	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000134FDA491FE54400200F0247E403C40A9D17B6691FE5440AC245F0A7F403C40
115	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000056A19DB591FE5440E0A3A61D7E403C403EB58F6093FE54409BD3A05787403C40
116	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000007D2E8BCA91FE54407EB77A147E403C403A4AA68F93FE54401C9E556087403C40
117	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000007D2E8BCA91FE54407EB77A147E403C4043F7E8B895FE54403EACA23C86403C40
118	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000F296E791FE5440070059107E403C4099BD93F295FE5440EBDDFA1D86403C40
119	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000134FDA491FE54400200F0247E403C4021DE1E1398FE54409B137EC67F403C40
120	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000009FB1119F91FE5440E515BEC17D403C4099BA061C98FE5440995DE01A7F403C40
121	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000E6A090F28FFE5440F9DB9C7C93403C4066E827B690FE5440EC59947097403C40
122	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000B98BC3FD8FFE5440ED3D707393403C40D8A5F4CE90FE5440509C686697403C40
123	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000034A0F10590FE5440BA52E43793403C408F73301192FE544071BE887090403C40
124	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000997F340190FE5440E03AFCF192403C40B66D1A0392FE5440448CAF2590403C40
125	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000001A915F38FFE5440806052FE92403C40E25CBC2191FE544080EB18498F403C40
126	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000039F4B6E68FFE54406024210993403C40869B9EFF90FE5440A64C0A2C8F403C40
127	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000AF2699548CFE5440F465D9C795403C40953258A28CFE5440A0A82E9593403C40
128	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000001D8371628CFE5440F050BCBC95403C4044441CB78CFE54400B0F2B9093403C40
129	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000006B13C5718CFE54406BCAF1FE95403C40821872718EFE54408C75629992403C40
130	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000003C31FF6E8CFE54400F437ED695403C40C60BFC678EFE54406520595D92403C40
131	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000191620B988FE544094AA0DAE98403C40C7798DE587FE5440AAA77A2E97403C40
132	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000002ABA8AC388FE5440119CD7A598403C4085A146EA87FE5440C6C860FD96403C40
133	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000002ABA8AC388FE5440119CD7A598403C407B0332F688FE5440D1E953B596403C40
134	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000004DDFFACB88FE5440B120319F98403C401014680789FE54403F8A539F96403C40
135	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000004DDFFACB88FE5440B120319F98403C40DEC897768AFE544034F84D0496403C40
136	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000A44A88DE88FE5440C5F3919098403C40AB36907D8AFE5440DFF8524696403C40
137	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000007538852185FE5440ED4762959B403C40AA11654C84FE54401EDAB04E9A403C40
138	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000063A37E2D85FE54404DBBCA8B9B403C40E181B95684FE54400C9E79039A403C40
139	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000063A37E2D85FE54404DBBCA8B9B403C407B9B9A8485FE5440BE34D64C99403C40
140	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000C401E03885FE544077C908839B403C40CA6B309A85FE54407246943B99403C40
141	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000D5FA554785FE5440371AA2779B403C4022A7151687FE544032A9C93898403C40
142	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000FEB39C4A85FE54409ECE4CA79B403C40E3DD274487FE5440FBF8BB1098403C40
143	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000C8458D4285FE5440057491F29B403C40BDCE462485FE5440D3EA1783A0403C40
144	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000033DE883885FE5440DC12D9FA9B403C40DCC3120C85FE5440236708A2A0403C40
145	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000033DE883885FE5440DC12D9FA9B403C4077A0171E84FE54402228CE93A1403C40
146	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000003083152C85FE5440C39823059C403C40B65A36F683FE54400C204487A1403C40
147	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000001E86F1A87FE5440040077A2AB403C40A035D04987FE5440701D3260A8403C40
148	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000005168531E87FE544001C16EE9AB403C4099A3C85E87FE5440F9D9A8B9A8403C40
149	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000005168531E87FE544001C16EE9AB403C402828362488FE5440D39FF3B4AD403C40
150	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000EB7F432187FE544092530C1FAC403C40D864230A88FE54403ECE15CBAD403C40
151	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000298BC80387FE54404FD2CFB4AB403C400E33A26088FE5440AA899C3FBC403C40
152	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000001E86F1A87FE5440040077A2AB403C40BDABFD6D88FE5440911D9E21BC403C40
153	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000013A5BE18BFE54400300B6C3A8403C40F91CF73C8BFE54400C07AD689F403C40
154	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000007DB89E38BFE5440EB83DC59A9403C4045F737108BFE5440D57CA4AC9F403C40
155	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000007DB89E38BFE5440EB83DC59A9403C409F6D31CD8AFE54401AF74BC8A9403C40
156	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000002D74E0EF8BFE5440667C9EB5A9403C408B5A66908AFE544028EAB12DAA403C40
157	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000013A5BE18BFE54400300B6C3A8403C40E146E2F98CFE5440EB5B1AE69D403C40
158	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000FE5D4D038CFE54402D55D4AAA8403C4071F571228DFE544092BA8CD29D403C40
159	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000001D6932B8CFE544004004F8DA8403C4079A1FD828DFE5440A344AFCBA3403C40
160	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000003AB19B338CFE544072ED010BA9403C4045682EA38DFE5440225CF518A4403C40
161	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000003AB19B338CFE544072ED010BA9403C40EC8E48048EFE544033282062AA403C40
162	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000124653E8CFE54400500D9B3A9403C40E230F91D8EFE54408AB801D8AA403C40
163	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000007DB89E38BFE5440EB83DC59A9403C4046EB83968BFE544065BD4631AE403C40
164	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000008CADF48BFE544004009B05AA403C4032F59CBA8BFE54406FD71E26AE403C40
165	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000379DA3058DFE5440C1BD1C70B9403C40CEDEBF7E8CFE54400FD9F7B6B8403C40
166	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000073BF00FF8CFE54409827190FB9403C409F14A68A8CFE5440BD86DA69B8403C40
167	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000379DA3058DFE5440C1BD1C70B9403C407BD2A5018DFE54408D71CAC5BB403C40
168	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000029AD10E8DFE54400600BDE4B9403C4070B7F4158DFE54405DD7BD5EBC403C40
169	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000007810298DFE544001004B8CB8403C40B682E9138EFE544087D099B5B0403C40
170	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000C45AE22E8DFE544080B471E6B8403C401A0BBB278EFE5440B32AF60BB1403C40
171	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000C45AE22E8DFE544080B471E6B8403C404BE75E6B8EFE54400C283163B5403C40
172	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000004D44C3348DFE5440CE2B8141B9403C40071FE27B8EFE54408E6ADAC5B5403C40
173	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000008FF0692793FE544076746926B4403C400C28E18E92FE5440EFD3FC26AE403C40
174	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000194791893FE54400300C523B3403C40672A33AA92FE544049CBF83DAD403C40
175	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000007C13636193FE5440E12A474AB4403C403E9EA00695FE5440BE1DDE7DB2403C40
176	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000009964215B93FE544043DB43E8B3403C401C6231EE94FE5440657B76F9B1403C40
177	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000009964215B93FE544043DB43E8B3403C407C07077C94FE5440EF36CDC1AB403C40
178	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000025A1F4C93FE5440020028FDB2403C40BAA53E6094FE54402CAC2064AB403C40
179	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000773DFAB291FE54407C4492769B403C40289AC6EC90FE54406636B0DA9A403C40
180	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000024F894AD91FE5440C938FD199B403C40694E7FED90FE54402449557F9A403C40
181	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000007A9EA891FE54400200D5C49A403C40ABE73D6691FE5440756BFD5CA1403C40
182	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000D625CB91FE544006002EB39A403C40BD997A7791FE54407AD5D3E6A1403C40
183	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000D625CB91FE544006002EB39A403C407A35951993FE54409714472698403C40
184	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000C41653D291FE544010FC491D9B403C40C86CC62B93FE5440B0A35F7698403C40
185	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000C41653D291FE544010FC491D9B403C40B645576C93FE54407CA93F7D9D403C40
186	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000009E3928D791FE54409D2CBD649B403C40A2CA907693FE5440A85210E69D403C40
187	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000009F3928D791FE54409D2CBD649B403C4087EC78A893FE5440CF33A84FA2403C40
188	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000136AADC91FE544004002AB69B403C40C6A826A493FE5440671A98EEA2403C40
189	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000162E13F98FE54400900B7DE9B403C40F64F1E5F97FE54400401F6F095403C40
190	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000E9B8F5098FE544029E04CD09B403C409E37406297FE544069DC266A95403C40
191	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000154AF3E98FE54400000BFDF9B403C40676EC99597FE544062D03B449C403C40
192	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000008B8E04398FE5440972FAB289C403C40A2D5BEA797FE5440C43FB7729C403C40
193	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000300000008B8E04398FE5440972FAB289C403C4059D7B12C98FE544050B4EB7F9F403C40996AA93098FE5440A2FE28719F403C40
194	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000DDF5F74B98FE5440F1185ABE9C403C40E9182D3598FE54402A813A74A0403C40
195	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000DDF5F74B98FE5440F1185ABE9C403C40E9E0B79898FE54407E72CED6A6403C40
196	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000EA725098FE54400000AD189D403C4081A70FA798FE544070E488F8A6403C40
197	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000162E13F98FE54400900B7DE9B403C409C637F2599FE5440159B4241AF403C40
198	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000F9B8F5098FE544029E04CD09B403C40B88CF75199FE54404690F936AF403C40
199	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000003E35295C92FE54408EEFA502C2403C4014A08DAA92FE54404D64E3E6C2403C40
200	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000A42F7492FE54400300FDEEC1403C40538A4EC292FE54400F16D2E8C2403C40
201	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000006E7B9E5392FE5440D88C158AC1403C4088737EEC91FE544006CF1CBEBD403C40
202	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000035D0436192FE544011F1BC7FC1403C40126C920892FE544059B6A3A3BD403C40
203	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000002DA6B4E92FE54400C007F0DC2403C405F69821296FE5440D53A7B11C1403C40
204	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000A42F7492FE54400300FDEEC1403C40AA40160E96FE5440C646CCCAC0403C40
205	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000002DA6B4E92FE54400C007F0DC2403C404D70414C98FE544068821BCBBD403C40
206	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000094B6494B92FE544023E3B8DBC1403C40741ECB3F98FE5440A0283486BD403C40
207	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000A2C2BD769BFE544058A0ED7CBA403C40606F53BF96FE544093B8C40FBA403C40
208	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000AC7BCA729BFE544094775D3CBA403C405CB9DCE696FE544080BE70CBB9403C40
209	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000AC7BCA729BFE544094775D3CBA403C40878DEC3099FE544031357FE5B7403C40
210	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000004C2667E9BFE5440D2995A33BA403C40E2E0994A99FE5440BE296196B7403C40
211	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000A2C2BD769BFE544058A0ED7CBA403C4085DBF0C39AFE544023C93F43BB403C40
212	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000001167E799BFE54400400E5A9BA403C4053AF42C69AFE544023A4B88CBB403C40
213	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000A2C2BD769BFE544058A0ED7CBA403C40317C1B4E9CFE5440C28C372ABA403C40
214	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000AC7BCA729BFE544094775D3CBA403C4091295B6E9CFE54406907C3FDB9403C40
215	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000E2F548669BFE54408443A5589B403C40D253DECC99FE544007F4E3F791403C40
216	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000BAF91729BFE5440207D303C9B403C40D6EBEFE199FE544060B25C9C91403C40
217	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000BAF91729BFE5440207D303C9B403C402A1BB1EA9AFE54409F382C9096403C40
218	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000001E6B5899BFE5440FFFF94069B403C40DE608A089BFE54406BB8C59096403C40
219	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000E2F548669BFE54408343A5589B403C4012DF00679CFE544028B7F0F09D403C40
220	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000BAF91729BFE5440207D303C9B403C406400A8759CFE5440CF9728899D403C40
221	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000005283B3BF9DFE5440FABAD3C8AB403C40FE95A6079BFE5440C70118B5AE403C40
222	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000081A35AC69DFE5440331A3500AC403C40DA86B5159BFE544098B7F0FBAE403C40
223	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000081A35AC69DFE5440331A3500AC403C40C16B4D9D9CFE5440D38AB799AE403C40
224	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000005292CE9DFE544003009E44AC403C40DBC7C19C9CFE54400D78D9EDAE403C40
225	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000005292CE9DFE544003009E44AC403C40492332E09CFE54403DA2CBA4A2403C40
226	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000DB532CDB9DFE5440D4F18A2EAC403C405A809BFF9CFE5440E0E30582A2403C40
227	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000DB532CDB9DFE5440D4F18A2EAC403C40B64DB9B79DFE5440BE396F23A8403C40
228	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000C41A68E79DFE544064071C19AC403C40CFEC56D69DFE5440F3AAC730A8403C40
229	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000D99AB4D99DFE54401425089BAB403C400DB8A7319EFE5440D1A44FC8AB403C40
230	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000051CF01DD9DFE5440C5B069B9AB403C40CD98E43C9EFE54407C2EB5FFAB403C40
231	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000051CF01DD9DFE5440C5B069B9AB403C408A9A781D9FFE5440DDA0073AB0403C40
232	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000D0F40CE49DFE5440B62D3AFAAB403C4031F9AF109FFE5440D669755CB0403C40
233	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E610000001000000010200000002000000DB532CDB9DFE5440D4F18A2EAC403C406DC214CA9FFE5440F7088AC6B7403C40
234	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000009C8AAD49DFE5440C818A43EAC403C40A3986BC39FFE544077831F19B8403C40
235	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000002000000A944796496FE54403C8C3BC979403C405834802892FE54402087931779403C40
236	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000200000035FCED5A96FE544094164CB479403C40AD1A3F2792FE5440AD9373F778403C40
237	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000600000001CCFE1A92FE54400200962A79403C40D35DF71B92FE54407333C54279403C40565DB9B890FE5440DF1177147A403C40001AF78D8CFE54408B62548E7C403C40080194BF8AFE5440B7969EA67D403C40347E0EBE8AFE5440DE6FCA847D403C40
238	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000005000000F9264FC58AFE544068BB60807D403C400EBD83C68AFE544073AAD98C7D403C40B22200B18FFE5440F13815A37A403C400065F61592FE5440A2560C3C79403C402D18D01592FE5440FC38822D79403C40
239	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000040000001A67A6B98AFE54406AD679877D403C4076F1ECB98AFE5440695F1AA57D403C40AEA50C4985FE5440D005C51181403C407EAFC04885FE544053A8130781403C40
240	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000040000005F44784C85FE5440FF89CE0481403C40978CA04C85FE5440436D1D0981403C40DF6C20B58AFE5440108D33977D403C40BD9F28B58AFE54407F6E348A7D403C40
241	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000007000000C223204185FE54404E0DBC0B81403C40DE2BE84085FE54407EACE51681403C4046F0D50585FE54400D94D94581403C4020312CFA83FE5440554AB46482403C403E93A6D682FE5440A642C99483403C40B3130CD881FE54400BADADAB84403C40A1A5ABD481FE544017A0837F84403C40
242	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000700000000262DD881FE54400500D97B84403C4000A72CDB81FE54402880D99384403C40C4BA6F1B83FE5440571A1B4883403C403C87F2FB83FE54402E47835E82403C40BB43511A85FE54402C38772981403C407F6D503B85FE5440A7D5221481403C408C92373B85FE5440CCC1570F81403C40
243	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000011000000F73D62CA81FE54407FB1458A84403C403074B3CC81FE5440CDD335B884403C409C81FB5F81FE5440BBEB5B2D85403C407EC9EA6680FE5440432C423886403C4099596E387FFE5440D579FC7387403C40C6B241207EFE54405DB460A188403C40D5E903737DFE54407458005089403C40BC76DB847CFE54404E3244428A403C40F2D774A67CFE54404C57B3A58A403C40A84032E77CFE5440CB31D1518B403C408DA8F8697DFE54407091B88F8D403C4046AD7CD07DFE5440A5F104F38F403C40FFAF5F157EFE5440BE2F927591403C4025E314477EFE5440D876208F92403C406570F1837EFE5440C58DBDD393403C40C37C249D7EFE5440B999226694403C40E20C71917EFE544080AF938194403C40
244	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000019000000C09116C181FE54401F67FE9384403C4061F6C6C181FE54405D3FBDAF84403C404ADC157A81FE54404EE17DFE84403C40FB5947AF80FE54401A1C4FDD85403C40CB915A2C80FE544082E5266D86403C40F757F5C47FFE5440C292F4DB86403C4074CBE9427FFE54400A33E96287403C40D9C50AFE7EFE5440F9D019AA87403C40339D74737EFE54409BE2A23A88403C400003B1347EFE54406A22B07B88403C40CB3CC9D47DFE5440D3793DDF88403C4067F014AE7DFE5440C678A80689403C40EC1527777DFE5440AF9A993E89403C401EBEDBC37CFE5440CC3733F589403C404550207E7CFE5440632BA83E8A403C402FEB33A57CFE5440C71ED7A78A403C40BCE9B7CA7CFE544007DFA20D8B403C4007E4ADDB7CFE544049CDB93B8B403C4090B5C2FB7CFE5440CE1AE8C08B403C40915979097DFE54409DA136FD8B403C4064956D6F7DFE5440ADBD23BD8D403C401B3F30D47DFE54406DA89C1590403C408071A4387EFE5440A20C794892403C40265D3E967EFE544068A0D95494403C4063F56C8C7EFE544061A6F16494403C40
245	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000004000000066AF7947EFE5440E3AFB29594403C40CDAB36A07EFE5440E441138494403C408C407D8180FE54406CE8B8539F403C40B808937980FE5440471BCB649F403C40
246	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000040000006ECC597680FE5440E76B5F529F403C40B434BF7980FE54409C11DE479F403C40060AAF9F7EFE5440F4E68FA294403C403DFA98987EFE5440E0F36CAA94403C40
247	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000007000000F7236A8380FE5440EA29069D9F403C40D2705F8B80FE5440178AFF8D9F403C40116D74FA81FE5440C28D03ECA7403C40A9B658D782FE544046DF52C8AC403C40CEFF035583FE54409B9B3528AF403C40DDA4ADAA84FE5440EB807D3CB7403C40F068659B84FE544057412D5CB7403C40
248	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000D0000000D3F879684FE5440FD15BB3FB7403C40E8285B9D84FE544056F3DC30B7403C40CB9FA03884FE544079A42EC9B4403C404DBAAF9B83FE5440CB21ED35B1403C40E113DD7283FE54400ABB991FB0403C40ADA1DB4C83FE54409A953E18AF403C40C49C4D0883FE54403B1A78E1AD403C40D760429682FE54404118E19EAB403C40AC5060A381FE5440F56A2120A6403C4088849EFA80FE5440D6AABA3AA2403C40F3221AA480FE5440C1E5F53FA0403C402008AD8E80FE5440B13875C29F403C4094E4748B80FE54406C98FACA9F403C40
249	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000050000009AD7F9A084FE544062CF4486B7403C4042CBF2B284FE54409DDB896CB7403C40545320F385FE5440AA05DCF9BE403C408617030087FE54403401D0FCC4403C408F8F89F586FE544068122416C5403C40
250	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000005000000CBD17EEF86FE5440817263F6C4403C40B365F9F386FE5440545005EAC4403C40AB3C02AC85FE5440B46E5578BD403C403D02E1B084FE54403CAE229BB7403C40BEB743A884FE54406D1A60A7B7403C40
251	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000A0000006F6788FB86FE5440092BA635C5403C40771E000687FE5440A0F01F1DC5403C40C711C24B87FE544013170CA0C6403C40523E807F87FE54403701D4BFC7403C405A6D7A9187FE54401CCA4B16C8403C40B99B37BF87FE5440344AF196C8403C40F3C44C0F88FE5440301CEA2CC9403C40D50CC34688FE54406D93EC47C9403C4066CF765E89FE5440892D497FC8403C40D51DD46089FE54407902449AC8403C40
252	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000A00000033B1575A89FE544095F7609FC8403C40F86DC15989FE54409F6FCF8FC8403C409428704D88FE54405B7B7F50C9403C40B5EC1A1D88FE5440816F2C4AC9403C40634557F187FE54405CEAE60EC9403C40F6C709BF87FE5440DFC5C8A5C8403C40CAC0BC9687FE54400053733DC8403C40D3882D7B87FE5440B98594C3C7403C406158EC0487FE54406F36A23EC5403C405B56E3FE86FE5440A6234847C5403C40
253	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000040000000DE2226889FE5440D53B8194C8403C40DF7E086689FE544075D3087AC8403C408248E1B48EFE54408DC20344C4403C4096BBDEB58EFE544066B0DD66C4403C40
254	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000004000000A3D3ACAA8EFE5440EC83F26FC4403C4098B2F5A98EFE54408F87DA5DC4403C405E7B046E89FE544095D51A80C8403C405CA4196F89FE544015D6038FC8403C40
255	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000040000008B485FBE8EFE54409411F85FC4403C40203B86BD8EFE5440E033353DC4403C405549FA5892FE54404FA41C61C1403C408C61915B92FE5440D9B50E84C1403C40
256	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000004000000EAD9FE4E92FE544097F7968DC1403C4057163A4C92FE54401109B17BC1403C40DF77C1C58EFE5440B6D82248C4403C40EC2D74C68EFE544012C76959C4403C40
257	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000600000035D0436192FE544011F1BC7FC1403C40A21E586092FE5440522A455BC1403C40EC0602AE92FE5440CCD9A719C1403C403DDC7D6D97FE5440448E2854BD403C40EB4824819BFE54404B292517BA403C40F0BAD2839BFE5440D495252FBA403C40
258	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000900000004C2667E9BFE5440D2995A33BA403C40346B4F7D9BFE544067A89A27BA403C4061E1B7F89AFE5440CD4C4F91BA403C4068FBDD8D9AFE54409B7D7EE6BA403C40121E3DFB98FE5440557A7A27BC403C4048B802D895FE5440E67DD3A7BE403C4039BF27E493FE5440E7365136C0403C40A70F416A92FE5440C030D663C1403C4075C27C6A92FE544050E5BE78C1403C40
259	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000004000000B808937980FE5440471BCB649F403C400166179681FE54400500511F9F403C40A501F83085FE5440E32AED259C403C40D3D9822F85FE544098F420029C403C40
260	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000004000000F7236A8380FE5440EA29069D9F403C40AF35F4AD81FE5440C7D24C309F403C40B3D9C13685FE5440C9AB772A9C403C40D03D3D3485FE544098F965FE9B403C40
261	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000500000033DE883885FE5440DC12D9FA9B403C406CF3903B85FE5440F3746D1D9C403C405DE5529F87FE54409603CB329A403C40006FF0D288FE5440EB0C503899403C402DD8ECD088FE5440DD54471599403C40
262	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000005000000D9509BC888FE5440E99EC81B99403C40718812C888FE544006FAEE3399403C405633693B88FE54407B55BFA699403C404131B54085FE54409913CD0B9C403C40BDE3223E85FE5440D5C637F69B403C40
263	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000004000000CDF299D788FE54405ED00E1099403C408D4386D988FE54403765D03299403C405D4B0E628CFE5440EB21536796403C406A9E4B5F8CFE5440BA5C1C3A96403C40
264	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000050000006B23D1578CFE54403F40004096403C40E792C7588CFE54409F43D35D96403C4079A826DD8BFE544037ED23BF96403C40F92EC1E088FE5440658D761E99403C40F0F421DF88FE5440F41C2B0A99403C40
265	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000005000000E67163658CFE5440A6CE4F3596403C40043AC1698CFE54408A77646196403C40E71348C88FFE54401B19C9C893403C40D46134F18FFE544005F05EA893403C40533E5BEF8FFE5440BDBF3D7F93403C40
266	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000050000006F7AACE78FFE544005F3888593403C40DF6874E88FFE5440CBC8949E93403C40E60374BC8FFE54403EE34CC293403C4082AC31728CFE54401B6A3A4A96403C400CDF1E6F8CFE54409880A52D96403C40
267	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000005000000E6A090F28FFE5440F9DB9C7C93403C4043DCAB7C90FE5440D53B6DAE94403C4001FE787F91FE54400800113B96403C406FBD3ED791FE5440176175E19A403C4020C1AFCE91FE54405C1A80E79A403C40
268	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000050000008BF220D191FE54404AA69B0B9B403C40831994DB91FE54408DCC4C009B403C4001BEA48191FE544002008B2796403C408701EF7890FE5440D845EA8D94403C40B98BC3FD8FFE5440ED3D707393403C40
269	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000050000007300E8D491FE5440C3A675439B403C402689ADDF91FE544002F8DA389B403C405DFBDB1B92FE544060C08AD29E403C40B97B506893FE5440B1409170B3403C408EF95F5493FE5440967F6F7EB3403C40
270	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000007000000777EDE4E93FE5440FF242F28B3403C4098CA6B5893FE54404114522AB3403C409ACD781093FE54405436D3B0AE403C405D45D89D92FE54408D1E8C51A7403C4040F84D1092FE5440BE8D406C9E403C404FB7C0DE91FE54404D9EA5819B403C4040A182D991FE5440EBCA87879B403C40
271	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000006000000E77163658CFE5440A6CE4F3596403C403CF12D048CFE5440A4BDF7D197403C4000E8926C8BFE544002006BAD9B403C40FD3816138CFE5440B88BF499A6403C4047BA56358CFE54406DBA34D9A8403C40B333C4308CFE5440A30387DEA8403C40
272	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000080000006B23D1578CFE54403F40004096403C40C1090B048CFE5440A0B753A197403C40015C7B688BFE54400600C5A49B403C403E4B64928BFE5440E507CA5C9E403C401733F1C08BFE54403CFDE1B7A1403C4076A549F08BFE5440CC8954A6A4403C400CCA44308CFE544099AB9BB6A8403C40C6A7682E8CFE5440BE1BA0B9A8403C40
273	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000060000004E7330378CFE5440CD510F43A9403C400ED0893B8CFE5440A34A5341A9403C406288D96B8CFE5440BE26AFC0AB403C40AA8719BC8CFE54402DF0430EB1403C40FEE335388DFE54404B130BBFB8403C404E8C132D8DFE54407AB770CAB8403C40
274	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000007000000A4CD783A8CFE54409FCA7076A9403C401B57673D8CFE54402DCADD74A9403C408A7FBF648CFE5440CE0333B9AB403C40C23F538D8CFE54407333FA52AE403C40D77CA5C98CFE544013F27F41B2403C404996F02F8DFE54403D389F99B8403C405223182A8DFE54407D4D3F9CB8403C40
275	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000020000000016A02292FE54400200482679403C403749F9C491FE5440E67CF9577D403C40
276	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000002000000C588F8B491FE5440FFC9DB527D403C4001CCFE1A92FE54400200962A79403C40
277	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000900000000EC9C1792FE544006007E2C79403C4078350C4492FE544033E0B47F79403C40BE33D20994FE544092ACF68D7B403C4001A8952197FE5440080032247F403C400008239E97FE54400200EB8F87403C40131287BF98FE54407F06B5C08D403C404D9C278899FE54402DEC650B92403C4044446B309BFE5440BFF0F1729B403C407A80654D9BFE5440DF84C7319B403C40
278	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000080000000016A02292FE54400200482679403C405F3918D392FE5440B8F49C0C7A403C400206402F97FE54400A0048F67E403C400062FBB597FE5440FEFFDEA187403C40152FE3DA98FE5440C30136F48D403C40D5C987FD9AFE544086D01A089A403C406CE69A329BFE54402F609B2E9B403C4012013E459BFE5440F0FD5B049B403C40
279	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000006000000A1D972519BFE544067A159489B403C4045D75F369BFE54408426A0929B403C40C434D45C9CFE5440A5A98AD7A1403C400050C4939DFE5440FEFF1A99AB403C40713157A79DFE544094439A22AC403C4081A35AC69DFE5440331A3500AC403C40
280	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000800000016239DC29DFE5440368C12E1AB403C4070CE95AB9DFE54400A35FBFAAB403C40ECC0CF8D9DFE5440061C3537AB403C4030E9E0CA9CFE5440598E1DFBA4403C4001E441679CFE544001006DCBA1403C406DD2E4A99BFE54406F4B30A79D403C40FEDB1A4B9BFE5440293778949B403C40C3D45D579BFE54408A3150699B403C40
281	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000002000000009A27A396FE5440000026D278403C4000E6EFBC97FE54400000DCB072403C40
282	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000200000000C0F0B396FE544000001FFD78403C40005A31CB97FE54400000EFD372403C40
283	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000020000000074D46E98FE5440000041AF9C403C4000163E459BFE544000005D049B403C40
284	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E610000001000000010200000002000000002ED06998FE54400000C6619C403C400018A3359BFE5440000070AD9A403C40
285	Primary line	GEN Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E6100000010000000102000000020000000074659B84FE544000002D5CB7403C40005074F486FE544000003AC1AB403C40
286	Primary line	NEA Supply	Galvanised Iron (GI) Pipe	50	3.5	95	'Cu' arm	0105000020E61000000100000001020000000200000000C2F9A084FE544000004686B7403C4000BEC7FB86FE544000006035AC403C40
287	Secondary line	NEA Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E6100000010000000102000000020000000034D46089FE54400000459AC8403C40000A4FD589FE544000005BF7C3403C40
288	Secondary line	GEN Supply	High Density Polyethylene (HDPE) Conduit	25	2	6	'Cu' arm	0105000020E61000000100000001020000000200000000D0226889FE544000008194C8403C40008A18DC89FE54400000C2F5C3403C40
\.


--
-- Data for Name: house; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.house (gid, house_type, area_sq_m_, curr_resid, permanent, plot_no, geom) FROM stdin;
1	Type 1	145	Dr. Rishi Dhakal	Yes	14	0106000020E61000000100000001030000000100000005000000F032E8D079FE5440509538DD81403C40809BF45F7AFE544070568FC189403C4094F71A0C7CFE544010E585DC87403C40048F0E7D7BFE544000242FF87F403C40F032E8D079FE5440509538DD81403C40
2	Type 1	136	Manju Sharma	Yes	13	0106000020E6100000010000000103000000010000000500000068F56BA57BFE544070C1330B80403C4018A525327CFE5440F02BF7C987403C4018A133D37DFE5440007F7FF185403C405024BB387DFE5440106A4E427E403C4068F56BA57BFE544070C1330B80403C40
3	Type 1	140	Kul Bahadur Gurung	No	12	0106000020E61000000100000001030000000100000005000000ACF4EF5C7DFE5440F006D0137E403C4080097EF97DFE5440A0B2D9E885403C4050B922987FFE5440B0561D1384403C40D4F8AEFB7EFE544020D7F53D7C403C40ACF4EF5C7DFE5440F006D0137E403C40
4	Type 1	140	Dr. Anjana R.Karmacharya	Yes	11	0106000020E610000001000000010300000001000000050000009CD786277FFE5440B0D8FF657C403C403C4FF8C37FFE5440C0EE293B84403C40409CB96281FE544070284D6582403C401C18A9C380FE544000481B937A403C409CD786277FFE5440B0D8FF657C403C40
5	Type 1	143	Anup Khadka	Yes	10	0106000020E61000000100000001030000000100000005000000545349F080FE54409081FD727A403C40EC00938B81FE5440B0AE764982403C40F8177C2B83FE544050D14A7280403C4068AF6F9C82FE54404010F48D78403C40545349F080FE54409081FD727A403C40
6	Type 1	144	Dr. Ananda Shrestha	Yes	9	0106000020E6100000010000000103000000010000000500000060B4DFBB82FE5440801BF78778403C40F01CEC4A83FE5440A0DC4D6C80403C408845CAE384FE5440A07A1C9D7E403C40B48F168084FE5440B0ADC8AD76403C4060B4DFBB82FE5440801BF78778403C40
7	Type 1	143	Ganga Koney Gurung	No	8	0106000020E61000000100000001030000000100000005000000349D85BC84FE5440C076758276403C407861021185FE5440F07CE39A7E403C408CBF32C886FE5440D0756A7C7D403C40FC9D936886FE5440F0A93F6B75403C40349D85BC84FE5440C076758276403C40
8	Type 1	145	Digbijaya Koney	No	7	0106000020E6100000010000000103000000010000000500000007F3188E86FE54406F92076375403C4047B795E286FE54408D98757B7D403C405D15C69988FE54408391FC5C7C403C401C51494588FE5440778B8E4474403C4007F3188E86FE54406F92076375403C40
9	Type 1	140	Prasid Pariyar	No	6	0106000020E6100000010000000103000000010000000500000008F1006188FE544010818D5B74403C4070CC5AC388FE5440008AF06A7C403C406013AE6C8AFE5440608082557B403C40E82C590B8AFE54405040754573403C4008F1006188FE544010818D5B74403C40
10	Type 1	143	Jiwan Kumar Gurung	Yes	5	0106000020E610000001000000010300000001000000050000000C193E348AFE5440307B164E73403C40400B61948AFE5440504CEB5E7B403C40643BEB3F8CFE5440507A0B487A403C4024776EEB8BFE544010749D2F72403C400C193E348AFE5440307B164E73403C40
11	Type 1	143	Bimal Sherchan	Yes	4	0106000020E61000000100000001030000000100000005000000381B4C108CFE544010759F4072403C407CDFC8648CFE5440507B0D597A403C40903DF91B8EFE54403074943A79403C40E01842BC8DFE5440E051792971403C40381B4C108CFE544010759F4072403C40
12	Type 1	140	Sonu Kunwar	Yes	3	0106000020E61000000100000001030000000100000005000000A0285DE68DFE544000578E1271403C4068C13A498EFE544070719B2179403C40E84A0AF28FFE54401056830C78403C406CE3C4918FFE5440D0FEC4FB6F403C40A0285DE68DFE544000578E1271403C40
13	Type 1	141	Prabha Shrestha	Yes	2	0106000020E6100000010000000103000000010000000500000034171CB68FFE5440D0C6CAF36F403C40240E941690FE54405023680478403C408C39C9C191FE5440C0C5BFED76403C401072B26391FE5440D00D95DB6E403C4034171CB68FFE5440D0C6CAF36F403C40
14	Type 1	142	Manju Piya	Yes	1	0106000020E610000001000000010300000001000000050000006452838A91FE5440000466C26E403C407C6B7DE991FE5440F075FCD376403C40E834629E93FE5440A04A30B575403C40DC87143693FE5440B09D81AB6D403C406452838A91FE5440000466C26E403C40
15	Type 9	119	Anil Shrestha	Yes	108	0106000020E6100000010000000103000000010000000900000068FE0AC382FE5440D0E97900A3403C40B0AFF5EC82FE5440C08203E1A5403C40A4E6E11383FE544040C615BDA5403C40DC189C4D83FE5440A0BA837AA8403C4008DF2B7E83FE544050E6C355A8403C4058FBC3AE83FE54404086B58DAA403C409CA600CF84FE544030EC3A63A9403C4078E8CC5884FE5440307A7F8DA1403C4068FE0AC382FE5440D0E97900A3403C40
16	Type 3	183	Anita Buddhacharya	No	103	0106000020E61000000100000001030000000100000005000000B5B8B15D88FE544005D3E4D1B7403C4025E273308AFE5440953CA908B6403C4029DF0E9E89FE544045B78CB1AC403C40B5B54CCB87FE5440B54DC87AAE403C40B5B8B15D88FE544005D3E4D1B7403C40
17	Type 3	150	Tankaman Buddhacharya	No	85	0106000020E61000000100000001030000000100000005000000E832642492FE544000EC6C37A8403C4080AC5E3F90FE5440204EE9DBA9403C401C8828A290FE544030CBC956B1403C40C473308A92FE5440B0F4A4A7AF403C40E832642492FE544000EC6C37A8403C40
18	Not assigned	110	\N	\N	102	0106000020E610000001000000010300000001000000050000008CF6EABE88FE5440C0675EE6BD403C40C854DC9E8AFE544060085773BC403C4090B443508AFE5440D07EA4E9B6403C4028754C7088FE5440C0D0415CB8403C408CF6EABE88FE5440C0675EE6BD403C40
19	Community block	281	\N	\N	0	0106000020E61000000100000001030000000100000007000000609C14D89EFE54407004A2DBBC403C401C2DB19B9FFE544040A88EE8C2403C40047F27A2A2FE5440D07FF332BE403C40A8B8C172A1FE5440207B8C27B5403C406CC093D59FFE5440C0F8538EB7403C40C4086237A0FE5440C09699F4BA403C40609C14D89EFE54407004A2DBBC403C40
20	Not assigned	68	\N	\N	0	0106000020E61000000100000001030000000100000005000000B01C22B5A0FE54407064572BCD403C405C16DB40A1FE5440205BFAD9CF403C4014160BDAA2FE5440D0602694CB403C40202F5744A2FE5440007987DDC8403C40B01C22B5A0FE54407064572BCD403C40
21	Appartment block	696	\N	\N	0	0106000020E61000000100000001030000000100000009000000F0090A0699FE5440C0182899C9403C40A0FFF12C9BFE544020995BE8DA403C40400F11DF9EFE5440F06BD413D4403C408C06545B9EFE544090BB591ECF403C40AC9204009DFE5440100B5A15D1403C40AC05693A9CFE54401057AE88CA403C4084D3D0659DFE544070DAA1A9C8403C40A0EC1CD09CFE5440E09188F4C2403C40F0090A0699FE5440C0182899C9403C40
22	Type 2	126	Sunita Buddhacharya	Yes	50	0106000020E610000001000000010300000001000000070000008CF2583889FE54402F7D67C084403C408C4215BD89FE54402F7D4FD48C403C408C0AEF578BFE54402F7DF1948B403C408C3AD1EA8AFE54402F7D911585403C408C12D8358AFE54402F7DEFAF85403C408C02E2218AFE54402F7D77FB83403C408CF2583889FE54402F7D67C084403C40
23	Type 2	126	Sita Koirala	No	54	0106000020E610000001000000010300000001000000070000000020411082FE54400000D28B8A403C400070FD9482FE54400000BA9F92403C400038D72F84FE544000005C6091403C400068B9C283FE54400000FCE08A403C400040C00D83FE544000005A7B8B403C400030CAF982FE54400000E2C689403C400020411082FE54400000D28B8A403C40
24	Type 2	126	Prabin Baniya	Yes	53	0106000020E6100000010000000103000000010000000700000081C959D783FE544097C0901489403C408119165C84FE544097C0782891403C4081E1EFF685FE544097C01AE98F403C408111D28985FE544097C0BA6989403C4081E9D8D484FE544097C018048A403C4081D9E2C084FE544097C0A04F88403C4081C959D783FE544097C0901489403C40
25	Type 2	126	Yashoda Gauchan	Yes	52	0106000020E61000000100000001030000000100000007000000C775ABA085FE54404F01FFAA87403C40C7C5672586FE54404F01E7BE8F403C40C78D41C087FE54404F01897F8E403C40C7BD235387FE54404F01290088403C40C7952A9E86FE54404F01879A88403C40C785348A86FE54404F010FE686403C40C775ABA085FE54404F01FFAA87403C40
26	Type 2	126	Kabita Gurung	Yes	51	0106000020E61000000100000001030000000100000007000000B2F7AA6987FE5440E4588B3D86403C40B24767EE87FE5440E45873518E403C40B20F418989FE5440E45815128D403C40B23F231C89FE5440E458B59286403C40B2172A6788FE5440E458132D87403C40B207345388FE5440E4589B7885403C40B2F7AA6987FE5440E4588B3D86403C40
27	Type 2	126	Manju Shrestha	No	49	0106000020E610000001000000010300000001000000070000008F856B0B8BFE5440CE01166983403C408FD527908BFE5440CE01FE7C8B403C408F9D012B8DFE5440CE01A03D8A403C408FCDE3BD8CFE5440CE0140BE83403C408FA5EA088CFE5440CE019E5884403C408F95F4F48BFE5440CE0126A482403C408F856B0B8BFE5440CE01166983403C40
28	Type 2	126	Arjun Giri	Yes	48	0106000020E6100000010000000103000000010000000700000037E6DCCB8CFE5440135423FF81403C40373699508DFE544013540B138A403C4037FE72EB8EFE54401354ADD388403C40372E557E8EFE544013544D5482403C4037065CC98DFE54401354ABEE82403C4037F665B58DFE54401354333A81403C4037E6DCCB8CFE5440135423FF81403C40
29	Type 2	126	Samjhana Gurung	No	47	0106000020E61000000100000001030000000100000007000000652144A08EFE544053C4388580403C40657100258FFE544053C4209988403C406539DABF90FE544053C4C25987403C406569BC5290FE544053C462DA80403C406541C39D8FFE544053C4C07481403C406531CD898FFE544053C448C07F403C40652144A08EFE544053C4388580403C40
30	Type 2	126	Anju Shrestha	No	46	0106000020E610000001000000010300000001000000070000008E7AB36490FE544045B798207F403C408ECA6FE990FE544045B7803487403C408E92498492FE544045B722F585403C408EC22B1792FE544045B7C2757F403C408E9A326291FE544045B7201080403C408E8A3C4E91FE544045B7A85B7E403C408E7AB36490FE544045B798207F403C40
31	Type 5	106	Ashok K.C	Yes	58	0106000020E6100000010000000103000000010000000700000000E01DC082FE54400000B23593403C400048DE3C83FE54400000D8C99A403C4000E05B3D84FE5440000054DA99403C400088730F84FE54400000D2E796403C400098888D84FE54400000BC6E96403C4000384E4E84FE5440000054FB91403C4000E01DC082FE54400000B23593403C40
32	Type 5	106	Bhawani Devi Shrestha	Yes	59	0106000020E610000001000000010300000001000000070000002B398D8484FE54409D9364D691403C402BA14D0185FE54409D938A6A99403C402B39CB0186FE54409D93067B98403C402BE1E2D385FE54409D93848895403C402BF1F75186FE54409D936E0F95403C402B91BD1286FE54409D93069C90403C402B398D8484FE54409D9364D691403C40
33	Type 5	106	Samir Raj Bhandari	Yes	61	0106000020E6100000010000000103000000010000000700000083DC671588FE5440D5BAC9178F403C408344289288FE5440D5BAEFAB96403C4083DCA59289FE5440D5BA6BBC95403C408384BD6489FE5440D5BAE9C992403C408394D2E289FE5440D5BAD35092403C40833498A389FE5440D5BA6BDD8D403C4083DC671588FE5440D5BAC9178F403C40
34	Type 5	106	Prabha Acharya	Yes	60	0106000020E6100000010000000103000000010000000700000002334F4E86FE5440E1E5716C90403C40029B0FCB86FE5440E1E5970098403C4002338DCB87FE5440E1E5131197403C4002DBA49D87FE5440E1E5911E94403C4002EBB91B88FE5440E1E57BA593403C40028B7FDC87FE5440E1E513328F403C4002334F4E86FE5440E1E5716C90403C40
35	Type 5	106	Dr. Rishi Sherchan	Yes	62	0106000020E610000001000000010300000001000000070000005BD629DF89FE5440C0CB31A38D403C405B3EEA5B8AFE5440C0CB573795403C405BD6675C8BFE5440C0CBD34794403C405B7E7F2E8BFE5440C0CB515591403C405B8E94AC8BFE5440C0CB3BDC90403C405B2E5A6D8BFE5440C0CBD3688C403C405BD629DF89FE5440C0CB31A38D403C40
36	Type 5	106	Sarswoti Shrestha	Yes	63	0106000020E61000000100000001030000000100000007000000872F99A38BFE5440B0BE913E8C403C40879759208CFE5440B0BEB7D293403C40872FD7208DFE5440B0BE33E392403C4087D7EEF28CFE5440B0BEB1F08F403C4087E703718DFE5440B0BE9B778F403C408787C9318DFE5440B0BE33048B403C40872F99A38BFE5440B0BE913E8C403C40
37	Type 5	106	Bimala Buddhacharya	No	65	0106000020E61000000100000001030000000100000007000000DDE1772C8FFE54408CC2596589403C40DD4938A98FFE54408CC27FF990403C40DDE1B5A990FE54408CC2FB0990403C40DD89CD7B90FE54408CC279178D403C40DD99E2F990FE54408CC2639E8C403C40DD39A8BA90FE54408CC2FB2A88403C40DDE1772C8FFE54408CC2596589403C40
38	Type 5	106	Lisa Nalmi	Yes	66	0106000020E610000001000000010300000001000000070000005E8B90F390FE5440237414F687403C405EF3507091FE544023743A8A8F403C405E8BCE7092FE54402374B69A8E403C405E33E64292FE5440237434A88B403C405E43FBC092FE544023741E2F8B403C405EE3C08192FE54402374B6BB86403C405E8B90F390FE5440237414F687403C40
39	Type 5	106	\N	\N	0	0106000020E610000001000000010300000001000000070000005E8B90F390FE5440237414F687403C405EF3507091FE544023743A8A8F403C405E8BCE7092FE54402374B69A8E403C405E33E64292FE5440237434A88B403C405E43FBC092FE544023741E2F8B403C405EE3C08192FE54402374B6BB86403C405E8B90F390FE5440237414F687403C40
40	Type 5	106	Dipendra Koirala	Yes	64	0106000020E61000000100000001030000000100000007000000B28808688DFE5440A1B1F1D98A403C40B2F0C8E48DFE5440A1B1176E92403C40B28846E58EFE5440A1B1937E91403C40B2305EB78EFE5440A1B1118C8E403C40B24073358FFE5440A1B1FB128E403C40B2E038F68EFE5440A1B1939F89403C40B28808688DFE5440A1B1F1D98A403C40
41	Type 6	106	Rana Bhattachan	Yes	37	0106000020E6100000010000000103000000010000000800000000E0ADEA9FFE544000003CB1B5403C4000587359A1FE544000006864B3403C4000004BADA0FE54400000D6F5AD403C400010D9ED9EFE54400000B6D1B0403C4000705A3F9FFE54400000ECB0B3403C400000A9A09FFE544000008232B3403C40001004E99FFE5440000038BBB5403C4000E0ADEA9FFE544000003CB1B5403C40
42	Type 6	106	Prem Kumari Thakali	Yes	38	0106000020E6100000010000000103000000010000000800000033FB66269FFE54404F203FC4AF403C4033732C95A0FE54404F206B77AD403C40331B04E99FFE54404F20D908A8403C40332B92299EFE54404F20B9E4AA403C40338B137B9EFE54404F20EFC3AD403C40331B62DC9EFE54404F208545AD403C40332BBD249FFE54404F203BCEAF403C4033FB66269FFE54404F203FC4AF403C40
43	Type 6	106	Buddhi Kumari Gurung	Yes	39	0106000020E61000000100000001030000000100000008000000FF53C46E9EFE5440F981E7E1A9403C40FFCB89DD9FFE5440F9811395A7403C40FF7361319FFE5440F9818126A2403C40FF83EF719DFE5440F9816102A5403C40FFE370C39DFE5440F98197E1A7403C40FF73BF249EFE5440F9812D63A7403C40FF831A6D9EFE5440F981E3EBA9403C40FF53C46E9EFE5440F981E7E1A9403C40
44	Type 6	106	Dilashma Gharti Magar	No	40	0106000020E610000001000000010300000001000000080000001F72C19E9DFE54405243327CA3403C40E9C393039FFE5440E1188ED4A0403C400BEFF6419EFE54401CDAE3939B403C4070B1DE8E9CFE544095C986DE9E403C4097CDBCEB9CFE5440E664DAA7A1403C40062DDF4A9DFE5440177E4911A1403C409587409D9DFE54400C039486A3403C401F72C19E9DFE54405243327CA3403C40
45	Type 6	106	Purna Kumari Gurung	Yes	41	0106000020E610000001000000010300000001000000080000002CBE8DB99CFE5440A3353D7E9D403C40433B29119EFE5440EB8536719A403C4037D5C1379DFE5440C0910A6C95403C4093D206959BFE5440CA26443299403C40427C8AFE9BFE544023AEE0DE9B403C400CAAB45A9CFE54401961332D9B403C40AFDB3DB89CFE5440C54A07899D403C402CBE8DB99CFE5440A3353D7E9D403C40
46	Type 6	106	Rachana Shakya	No	42	0106000020E6100000010000000103000000010000000800000062A511B69BFE54400AC017E197403C407922AD0D9DFE5440521011D494403C406DBC45349CFE5440271CE5CE8F403C40C9B98A919AFE544031B11E9593403C4078630EFB9AFE54408A38BB4196403C40429138579BFE544080EB0D9095403C40E5C2C1B49BFE54402CD5E1EB97403C4062A511B69BFE54400AC017E197403C40
47	Type 6	106	Nil Bdr. Raut	No	43	0106000020E610000001000000010300000001000000080000003F8382B69AFE5440A2D3EF7F92403C407895180B9CFE5440B474045E8F403C403CE4CF2C9BFE544036C345668A403C40F380D18D99FE544026FCF4458E403C4017F9EEF999FE544022770BEC90403C40C5C968559AFE5440C28DC23490403C40B3353DB59AFE54409A19CE8A92403C403F8382B69AFE5440A2D3EF7F92403C40
48	Type 6	106	Dr. Hemanta Manandhar	Yes	44	0106000020E610000001000000010300000001000000080000004BC2B1B199FE54407045571D8D403C4084D447069BFE544082E66BFB89403C404823FF279AFE54400435AD0385403C40FFBF008998FE5440F46D5CE388403C4023381EF598FE5440F0E872898B403C40D108985099FE544090FF29D28A403C40BF746CB099FE5440688B35288D403C404BC2B1B199FE54407045571D8D403C40
49	Type 7	115	Mina Pradhan	No	45	0106000020E6100000010000000103000000010000000900000000484A0899FE54400000788F7F403C4000A89D8F97FE54400000B82983403C4000F8E5A897FE5440000014C483403C4000E0609597FE54400000E2F383403C40009882D297FE544000008A3685403C4000201DAE97FE54400000A68F85403C400020243B98FE54400000FE7788403C40007071EB99FE54400000865584403C4000484A0899FE54400000788F7F403C40
50	Type 4	120	Niranjan Psd. Shrestha	No	67	0106000020E61000000100000001030000000100000008000000008889D492FE54400000828888403C400028DED592FE54400000D48D88403C4000B0AF5593FE54400000BCA590403C4000F01EDE94FE54400000BA548F403C4000B0C28B94FE544000003E5689403C400060FADD93FE544000007AEB89403C4000E811C093FE544000003CBE87403C40008889D492FE54400000828888403C40
51	Type 4	120	Hem Bdr. Pradhan	No	68	0106000020E61000000100000001030000000100000008000000ACD9F69C94FE54403B8E9FFE86403C40AC794B9E94FE54403B8EF10387403C40AC011D1E95FE54403B8ED91B8F403C40AC418CA696FE54403B8ED7CA8D403C40AC01305496FE54403B8E5BCC87403C40ACB167A695FE54403B8E976188403C40AC397F8895FE54403B8E593486403C40ACD9F69C94FE54403B8E9FFE86403C40
52	Type 3	119	Capt. Lal Bdr. Gurung	Yes	18	0106000020E6100000010000000103000000010000000800000000987CD07DFE5440000078CFA4403C4000187CD17DFE5440000076D3A4403C40008011A37EFE54400000F8B8A9403C400028F92280FE544000005461A6403C400010D1C97FFE54400000C23FA4403C400098394C80FE544000005818A3403C4000C076D37FFE544000009C95A0403C4000987CD07DFE5440000078CFA4403C40
53	Type 3	119	Sabita Poudel Lamichhane	Yes	17	0106000020E6100000010000000103000000010000000800000039AC43097DFE544093A4BDF29E403C40392C430A7DFE544093A4BBF69E403C403994D8DB7DFE544093A43DDCA3403C40393CC05B7FFE544093A49984A0403C40392498027FFE544093A407639E403C4039AC00857FFE544093A49D3B9D403C4039D43D0C7FFE544093A4E1B89A403C4039AC43097DFE544093A4BDF29E403C40
54	Type 3	119	Parbati Chapai	Yes	16	0106000020E610000001000000010300000001000000080000004476092C7CFE5440A8C0E66299403C4044F6082D7CFE5440A8C0E46699403C40445E9EFE7CFE5440A8C0664C9E403C404406867E7EFE5440A8C0C2F49A403C4044EE5D257EFE5440A8C030D398403C404476C6A77EFE5440A8C0C6AB97403C40449E032F7EFE5440A8C00A2995403C404476092C7CFE5440A8C0E66299403C40
55	Type 3	119	Sammarman Buddhacharya	Yes	15	0106000020E61000000100000001030000000100000008000000AC636C697BFE544014E3564793403C40ACE36B6A7BFE544014E3544B93403C40AC4B013C7CFE544014E3D63098403C40ACF3E8BB7DFE544014E332D994403C40ACDBC0627DFE544014E3A0B792403C40AC6329E57DFE544014E3369091403C40AC8B666C7DFE544014E37A0D8F403C40AC636C697BFE544014E3564793403C40
56	Type 3	119	Laxmi Devi Gurung	Yes	19	0106000020E61000000100000001030000000100000008000000FA3A45E57EFE54401C9AF50EAB403C40FABA44E67EFE54401C9AF312AB403C40FA22DAB77FFE54401C9A75F8AF403C40FACAC13781FE54401C9AD1A0AC403C40FAB299DE80FE54401C9A3F7FAA403C40FA3A026181FE54401C9AD557A9403C40FA623FE880FE54401C9A19D5A6403C40FA3A45E57EFE54401C9AF50EAB403C40
57	Type 3	119	Laxmi Gurung	No	20	0106000020E6100000010000000103000000010000000800000018EECC7980FE544092D74DDFB4403C40186ECC7A80FE544092D74BE3B4403C4018D6614C81FE544092D7CDC8B9403C40187E49CC82FE544092D72971B6403C401866217382FE544092D7974FB4403C4018EE89F582FE544092D72D28B3403C401816C77C82FE544092D771A5B0403C4018EECC7980FE544092D74DDFB4403C40
58	Type 3	119	Dr. Eliya Shrestha	Yes	21	0106000020E610000001000000010300000001000000080000004C0B2C5E82FE5440895C89F0BC403C404C8B2B5F82FE5440895C87F4BC403C404CF3C03083FE5440895C09DAC1403C404C9BA8B084FE5440895C6582BE403C404C83805784FE5440895CD360BC403C404C0BE9D984FE5440895C6939BB403C404C33266184FE5440895CADB6B8403C404C0B2C5E82FE5440895C89F0BC403C40
59	Type 10	113	\N	\N	22	0106000020E610000001000000010300000001000000080000007C8E06A383FE5440E04DBF79C2403C40601007A283FE5440E04DBF79C2403C40B4089D7284FE5440B0C87003C7403C40CC91CF0686FE5440300521B1C3403C40684901A585FE5440F07F574EC1403C40E43CDBEF85FE5440D0D8B496C0403C408403118685FE5440B017DB53BE403C407C8E06A383FE5440E04DBF79C2403C40
60	Type 10	113	\N	\N	24	0106000020E61000000100000001030000000100000008000000F3F2B13C85FE544008D9EE70CA403C40D774B23B85FE544008D9EE70CA403C402B6D480C86FE5440D853A0FACE403C4043F67AA087FE5440589050A8CB403C40DFADAC3E87FE5440180B8745C9403C405BA1868987FE5440F863E48DC8403C40FB67BC1F87FE5440D8A20A4BC6403C40F3F2B13C85FE544008D9EE70CA403C40
61	Type 10	139	\N	\N	26	0106000020E6100000010000000103000000010000000A000000741660A087FE544050ED4A95D2403C404C6E0B9F87FE5440902EF09FD2403C40586D595588FE5440E0B9EEFAD1403C4060404D6D88FE544000135EBFD3403C4040B49CC889FE5440007095AAD2403C40F8DD805789FE54400042534ECB403C4008A641DC87FE5440006DFBA2CC403C4064D8E2EE87FE5440907406DDCD403C40649D845887FE5440C066BD6CCE403C40741660A087FE544050ED4A95D2403C40
62	Type 10	113	\N	\N	36	0106000020E61000000100000001030000000100000008000000A096CB9E9BFE544050559A05BB403C40D43E20A09BFE544090963F10BB403C407474E90B9CFE5440305515F2C1403C4014F362BC9DFE54402048758DC0403C402040E4659DFE5440A05A2F30BB403C4020238EBF9CFE5440700B41B5BB403C4098579CA39CFE5440B0995E2BBA403C40A096CB9E9BFE544050559A05BB403C40
63	Type 10	113	\N	\N	35	0106000020E61000000100000001030000000100000008000000699774AA99FE5440B7A3DF74BC403C409D3FC9AB99FE5440F7E4847FBC403C403D7592179AFE544097A35A61C3403C40DDF30BC89BFE54408796BAFCC1403C40E9408D719BFE544007A9749FBC403C40E92337CB9AFE5440D7598624BD403C40615845AF9AFE544017E8A39ABB403C40699774AA99FE5440B7A3DF74BC403C40
64	Type 10	113	\N	\N	34	0106000020E6100000010000000103000000010000000800000012A5B4DC97FE544047E4DB73BE403C40464D09DE97FE54408725817EBE403C40E682D24998FE544027E45660C5403C4086014CFA99FE544017D7B6FBC3403C40924ECDA399FE544097E9709EBE403C40923177FD98FE5440679A8223BF403C400A6685E198FE5440A728A099BD403C4012A5B4DC97FE544047E4DB73BE403C40
65	Type 10	113	\N	\N	33	0106000020E610000001000000010300000001000000080000000F12A20996FE5440BBD80813C0403C4043BAF60A96FE5440FB19AE1DC0403C40E3EFBF7696FE54409BD883FFC6403C40836E392798FE54408BCBE39AC5403C408FBBBAD097FE54400BDE9D3DC0403C408F9E642A97FE5440DB8EAFC2C0403C4007D3720E97FE54401B1DCD38BF403C400F12A20996FE5440BBD80813C0403C40
66	Type 2	106	\N	\N	27	0106000020E610000002000000010300000001000000070000009C4BEAA989FE5440B0C18DE2CB403C4054AC86158AFE5440907DEC0BD3403C4048B7B9A88BFE544020F396BCD1403C4054DAE5518BFE5440B0E7486FCC403C4000A63FA18AFE5440E0F707EFCC403C40584D4A8C8AFE5440505DF31FCB403C409C4BEAA989FE5440B0C18DE2CB403C4001030000000100000004000000B876BDA989FE544070F591DFCB403C409CF8BDA889FE544010EE8FE3CB403C409C4BEAA989FE5440B0C18DE2CB403C40B876BDA989FE544070F591DFCB403C40
67	Type 2	106	\N	\N	28	0106000020E610000002000000010300000001000000070000005A00066B8BFE544043A0545BCA403C401261A2D68BFE5440235CB384D1403C40066CD5698DFE5440B3D15D35D0403C40128F01138DFE544043C60FE8CA403C40BE5A5B628CFE544073D6CE67CB403C401602664D8CFE5440E33BBA98C9403C405A00066B8BFE544043A0545BCA403C4001030000000100000004000000762BD96A8BFE544003D45858CA403C405AADD9698BFE5440A3CC565CCA403C405A00066B8BFE544043A0545BCA403C40762BD96A8BFE544003D45858CA403C40
68	Type 2	106	\N	\N	29	0106000020E61000000200000001030000000100000007000000FC181A3B8DFE5440596815E0C8403C40B479B6A68DFE544039247409D0403C40A884E9398FFE5440C9991EBACE403C40B4A715E38EFE5440598ED06CC9403C4060736F328EFE5440899E8FECC9403C40B81A7A1D8EFE5440F9037B1DC8403C40FC181A3B8DFE5440596815E0C8403C40010300000001000000040000001844ED3A8DFE5440199C19DDC8403C40FCC5ED398DFE5440B99417E1C8403C40FC181A3B8DFE5440596815E0C8403C401844ED3A8DFE5440199C19DDC8403C40
69	Type 2	106	\N	\N	30	0106000020E61000000200000001030000000100000004000000F86704058FFE544023AFEE39C7403C40DCE904048FFE5440C3A7EC3DC7403C40DC3C31058FFE5440637BEA3CC7403C40F86704058FFE544023AFEE39C7403C4001030000000100000007000000DC3C31058FFE5440637BEA3CC7403C40949DCD708FFE544043374966CE403C4088A8000491FE5440D3ACF316CD403C4094CB2CAD90FE544063A1A5C9C7403C40409786FC8FFE544093B16449C8403C40983E91E78FFE54400317507AC6403C40DC3C31058FFE5440637BEA3CC7403C40
70	Type 2	106	\N	\N	31	0106000020E610000002000000010300000001000000070000009AF14CC690FE5440B9EE1EDEC4403C405252E93191FE544099AA7D07CC403C40465D1CC592FE5440292028B8CA403C405280486E92FE5440B914DA6AC5403C40FE4BA2BD91FE5440E92499EAC5403C4056F3ACA891FE5440598A841BC4403C409AF14CC690FE5440B9EE1EDEC4403C4001030000000100000004000000B61C20C690FE5440792223DBC4403C409A9E20C590FE5440191B21DFC4403C409AF14CC690FE5440B9EE1EDEC4403C40B61C20C690FE5440792223DBC4403C40
71	Type 2	106	\N	\N	32	0106000020E6100000020000000103000000010000000400000075D13B8792FE5440071FF243C3403C4059533C8692FE5440A717F047C3403C4059A6688792FE544047EBED46C3403C4075D13B8792FE5440071FF243C3403C400103000000010000000700000059A6688792FE544047EBED46C3403C40110705F392FE544027A74C70CA403C400512388694FE5440B71CF720C9403C401135642F94FE54404711A9D3C3403C40BD00BE7E93FE544077216853C4403C4015A8C86993FE5440E7865384C2403C4059A6688792FE544047EBED46C3403C40
72	Type 13	110	Dal Bdr. Sherchan	Yes	57	0106000020E6100000010000000103000000010000000500000034660CF880FE5440A064805497403C40A054C28981FE5440702675519D403C405463F61A83FE5440F04F50A29B403C4044C232A482FE544030F7776D95403C4034660CF880FE5440A064805497403C40
73	Type 6	106	Dr. Junu Shrestha	Yes	55	0106000020E61000000200000001030000000100000007000000A4FC7C9280FE544080F87B4590403C404C78D01582FE544010E68BB78E403C40DCF95FA381FE5440D0CF131589403C40C4C065A07FFE5440D015A53E8B403C4028C6FACA7FFE5440C01F26888D403C40746F0A5480FE5440006F14038D403C40A4FC7C9280FE544080F87B4590403C40010300000001000000040000003CA7409180FE544080F8C04690403C40644F959280FE544080F8C04690403C40A4FC7C9280FE544080F87B4590403C403CA7409180FE544080F8C04690403C40
74	Type 6	106	Tek Bdr. Shrestha	No	56	0106000020E61000000200000001030000000100000007000000C70C3C1281FE54403C60587296403C406F888F9582FE5440CC4D68E494403C40FF091F2382FE54408C37F0418F403C40E7D0242080FE54408C7D816B91403C404BD6B94A80FE54407C8702B593403C40977FC9D380FE5440BCD6F02F93403C40C70C3C1281FE54403C60587296403C40010300000001000000040000005FB7FF1081FE54403C609D7396403C40875F541281FE54403C609D7396403C40C70C3C1281FE54403C60587296403C405FB7FF1081FE54403C609D7396403C40
75	Type 2	126	Kabita Gurung	Yes	107	0106000020E61000000100000001030000000100000007000000226CB17A84FE54408BF79749A1403C4022BC6DFF84FE54408BF77F5DA9403C402284479A86FE54408BF7211EA8403C4022B4292D86FE54408BF7C19EA1403C40228C307885FE54408BF71F39A2403C40227C3A6485FE54408BF7A784A0403C40226CB17A84FE54408BF79749A1403C40
76	Type 8	181	\N	\N	105	0106000020E61000000100000001030000000100000006000000100E4FA087FE5440B07A17D2AA403C40F422627289FE5440301DCE6AA9403C40ACD0B3D188FE544030D499FB9F403C40C8BBA0FF86FE544020A3BCAEA1403C40F48F4F9F87FE544040911DC6AA403C40100E4FA087FE5440B07A17D2AA403C40
77	Type 3	114	Goma Gurung	Yes	96	0106000020E610000002000000010300000001000000040000007001E35F89FE544080456693A4403C4014B1395D89FE544020E6B898A4403C40747B136089FE544020A09096A4403C407001E35F89FE544080456693A4403C4001030000000100000007000000747B136089FE544020A09096A4403C40A8040BB989FE5440C001C665AA403C40A0003A548BFE5440C0D61D11A9403C40E48CF3368BFE5440F0399332A6403C40347213A08BFE5440201161EDA5403C40800DD17A8BFE54405092DEFEA2403C40747B136089FE544020A09096A4403C40
78	Type 3	107	Pushpa Gurung	Yes	95	0106000020E6100000010000000103000000010000000800000004FC4D3589FE544070CEEEDEA2403C40A8B6D7C58AFE54401026919FA1403C40F45195A08AFE544090ACA3DB9E403C40B82FB30D8BFE5440D0DD89669E403C402C73C5E98AFE5440B0C3499D9B403C401458D3D688FE5440007C665C9D403C4088F44B3989FE5440008D49D4A2403C4004FC4D3589FE544070CEEEDEA2403C40
79	Type 3	122	\N	\N	97	0106000020E61000000100000001030000000100000006000000A0A0AA768AFE54400048E4F7B5403C40505001748AFE544070898902B6403C402CF0AA6D8CFE54409053B758B4403C40443D2C178CFE544060794F96AE403C4054AC86158AFE544000CD2930B0403C40A0A0AA768AFE54400048E4F7B5403C40
80	Type 3	114	Shovita Kunwar	Yes	99	0106000020E610000002000000010300000001000000070000001CA1268A8AFE544032A95EADB6403C40502A1EE38AFE5440D20A947CBC403C4048264D7E8CFE5440D2DFEB27BB403C408CB206618CFE544002436149B8403C40DC9726CA8CFE5440321A2F04B8403C402833E4A48CFE5440629BAC15B5403C401CA1268A8AFE544032A95EADB6403C40010300000001000000040000001827F6898AFE5440924E34AAB6403C40BCD64C878AFE544032EF86AFB6403C401CA1268A8AFE544032A95EADB6403C401827F6898AFE5440924E34AAB6403C40
81	Type 3	114	Suman Jain	Yes	100	0106000020E6100000020000000103000000010000000700000035FCF9E18AFE5440F6D42AFABC403C406985F13A8BFE5440963660C9C2403C40618120D68CFE5440960BB874C1403C40A50DDAB88CFE5440C66E2D96BE403C40F5F2F9218DFE5440F645FB50BE403C40418EB7FC8CFE544026C77862BB403C4035FCF9E18AFE5440F6D42AFABC403C40010300000001000000040000003182C9E18AFE5440567A00F7BC403C40D53120DF8AFE5440F61A53FCBC403C4035FCF9E18AFE5440F6D42AFABC403C403182C9E18AFE5440567A00F7BC403C40
82	Type 3	114	Aruna Gurung	Yes	101	0106000020E6100000020000000103000000010000000400000023FF6C5088FE54408D7957EBBE403C40C7AEC34D88FE54402D1AAAF0BE403C4027799D5088FE54402DD481EEBE403C4023FF6C5088FE54408D7957EBBE403C400103000000010000000700000027799D5088FE54402DD481EEBE403C405B0295A988FE5440CD35B7BDC4403C4053FEC3448AFE5440CD0A0F69C3403C40978A7D278AFE5440FD6D848AC0403C40E76F9D908AFE54402D455245C0403C40330B5B6B8AFE54405DC6CF56BD403C4027799D5088FE54402DD481EEBE403C40
83	Type 3	147	Sujata Guvaju	No	88	0106000020E61000000100000001030000000100000009000000B4BE570A90FE544010CBB80BBF403C409477E53A92FE544040975333BD403C40B894A31492FE544080442BE3BA403C4074A9ADA892FE5440F0B6B678BA403C40CC98158492FE544000DBF360B7403C40CC0BD9B38FFE544000E7E17BB9403C40B4BE570A90FE5440E0136012BF403C40F890010C90FE5440E0136012BF403C40B4BE570A90FE544010CBB80BBF403C40
84	Type 3	90	Narayan Psd. Gurung	Yes	83	0106000020E610000002000000010300000001000000070000008C16DF838FFE5440147B4AFC9D403C40546B8FEC90FE544084EC81B69C403C40281A9CD390FE5440A4E46D3E9A403C4070F0B74491FE5440947A96EE99403C4074561D2591FE5440E4D4E65897403C4014A06D378FFE544004B57AD598403C408C16DF838FFE5440147B4AFC9D403C4001030000000100000004000000B43B9C838FFE5440B4DD86FC9D403C40C065F1838FFE5440B45B86FD9D403C408C16DF838FFE5440147B4AFC9D403C40B43B9C838FFE5440B4DD86FC9D403C40
85	Type 3	90	Reeman Sherchan	Yes	84	0106000020E61000000200000001030000000100000007000000D85260D58FFE5440C05A47E9A3403C40A0A7103E91FE544030CC7EA3A2403C4074561D2591FE544050C46A2BA0403C40BC2C399691FE5440405A93DB9F403C40C0929E7691FE544090B4E3459D403C4060DCEE888FFE5440B09477C29E403C40D85260D58FFE5440C05A47E9A3403C400103000000010000000400000000781DD58FFE544060BD83E9A3403C400CA272D58FFE5440603B83EAA3403C40D85260D58FFE5440C05A47E9A3403C4000781DD58FFE544060BD83E9A3403C40
86	Type 3	147	\N	\N	90	0106000020E6100000010000000103000000010000000900000015C399E08EFE5440F77A9D5AB9403C40F57B271191FE544027473882B7403C401999E5EA90FE544067F40F32B5403C40D5ADEF7E91FE5440D7669BC7B4403C402D9D575A91FE5440E78AD8AFB1403C402D101B8A8EFE5440E796C6CAB3403C4015C399E08EFE5440C7C34461B9403C40599543E28EFE5440C7C34461B9403C4015C399E08EFE5440F77A9D5AB9403C40
87	Type 3	109	Sarita Lalchan	Yes	77	0106000020E610000001000000010300000001000000070000008823E46897FE5440D0251F68B9403C40A4D3130B97FE5440B03E207FB3403C401884131495FE544020244926B5403C408CC2013795FE5440D01AECD4B7403C40A8E1C4AE95FE5440C0B01485B7403C40580DAEDB95FE544020EC8497BA403C408823E46897FE5440D0251F68B9403C40
88	Not assigned	109	\N	\N	78	0106000020E61000000100000001030000000100000007000000CA6F1BFC96FE544007185B0BB3403C40E61F4B9E96FE5440E7305C22AD403C405AD04AA794FE5440571685C9AE403C40CE0E39CA94FE5440070D2878B1403C40EA2DFC4195FE5440F7A25028B1403C409A59E56E95FE544057DEC03AB4403C40CA6F1BFC96FE544007185B0BB3403C40
89	Not assigned	109	\N	\N	79	0106000020E61000000100000001030000000100000007000000D1A14B9D96FE5440BE1199AAAC403C40ED517B3F96FE54409E2A9AC1A6403C4061027B4894FE54400E10C368A8403C40D540696B94FE5440BE066617AB403C40F15F2CE394FE5440AE9C8EC7AA403C40A18B151095FE54400ED8FED9AD403C40D1A14B9D96FE5440BE1199AAAC403C40
90	Not assigned	109	\N	\N	80	0106000020E61000000100000001030000000100000007000000B464803596FE5440F603D54DA6403C40D014B0D795FE5440D61CD664A0403C4044C5AFE093FE54404602FF0BA2403C40B8039E0394FE5440F6F8A1BAA4403C40D422617B94FE5440E68ECA6AA4403C40844E4AA894FE544046CA3A7DA7403C40B464803596FE5440F603D54DA6403C40
91	Not assigned	109	\N	\N	81	0106000020E610000001000000010300000001000000070000009727B5CD95FE5440B1DF0AFD9F403C40B3D7E46F95FE544091F80B149A403C402788E47893FE544001DE34BB9B403C409BC6D29B93FE5440B1D4D7699E403C40B7E5951394FE5440A16A001A9E403C4067117F4094FE544001A6702CA1403C409727B5CD95FE5440B1DF0AFD9F403C40
92	Type 6	109	Mergha Singh Gurung	Yes	82	0106000020E610000001000000010300000001000000070000007AEAE96595FE5440E2FE528899403C40969A190895FE5440C217549F93403C400A4B191193FE544032FD7C4695403C407E89073493FE5440E2F31FF597403C409AA8CAAB93FE5440D28948A597403C404AD4B3D893FE544032C5B8B79A403C407AEAE96595FE5440E2FE528899403C40
93	Type 3	105	\N	\N	91	0106000020E61000000200000001030000000100000007000000802B320D8EFE544000FF185BAD403C406805F1348EFE544030E5A412B0403C40D420B3AE8EFE5440007BCDC2AF403C4060BF98E28EFE5440D00854A9B2403C40AC71D66090FE5440A060F669B1403C40D012020B90FE544090F2D2C8AB403C40802B320D8EFE544000FF185BAD403C40010300000001000000040000006450050D8EFE5440F0040858AD403C403CD2050C8EFE544050FD055CAD403C40802B320D8EFE544000FF185BAD403C406450050D8EFE5440F0040858AD403C40
94	Type 3	105	\N	\N	92	0106000020E61000000200000001030000000100000007000000E4E664A98DFE5440B5075BF2A6403C40CCC023D18DFE5440E5EDE6A9A9403C4038DCE54A8EFE5440B5830F5AA9403C40C47ACB7E8EFE544085119640AC403C40102D09FD8FFE544055693801AB403C4034CE34A78FFE544045FB1460A5403C40E4E664A98DFE5440B5075BF2A6403C4001030000000100000004000000C80B38A98DFE5440A50D4AEFA6403C40A08D38A88DFE5440050648F3A6403C40E4E664A98DFE5440B5075BF2A6403C40C80B38A98DFE5440A50D4AEFA6403C40
95	Type 3	105	\N	\N	93	0106000020E61000000200000001030000000100000007000000A72B9A408DFE5440E8179F85A0403C408F0559688DFE544018FE2A3DA3403C40FB201BE28DFE5440E89353EDA2403C4087BF00168EFE5440B821DAD3A5403C40D3713E948FFE544088797C94A4403C40F7126A3E8FFE5440780B59F39E403C40A72B9A408DFE5440E8179F85A0403C40010300000001000000040000008B506D408DFE5440D81D8E82A0403C4063D26D3F8DFE544038168C86A0403C40A72B9A408DFE5440E8179F85A0403C408B506D408DFE5440D81D8E82A0403C40
96	Type 3	105	Shanti Sherchan	No	94	0106000020E610000002000000010300000001000000070000002B65CCDD8CFE544022FBD6309A403C40133F8B058DFE544052E162E89C403C407F5A4D7F8DFE544022778B989C403C400BF932B38DFE5440F204127F9F403C4057AB70318FFE5440C25CB43F9E403C407B4C9CDB8EFE5440B2EE909E98403C402B65CCDD8CFE544022FBD6309A403C40010300000001000000040000000F8A9FDD8CFE54401201C62D9A403C40E70BA0DC8CFE544072F9C3319A403C402B65CCDD8CFE544022FBD6309A403C400F8A9FDD8CFE54401201C62D9A403C40
97	Type 3	104	Santosh Kumar Gurung	No	71	0106000020E61000000100000001030000000100000008000000CC52689B95FE5440E0CE32FE98403C4098B5462D97FE5440E08582B997403C403892A91297FE5440F07B017095403C407C95D16B97FE5440C0F3213095403C402081384997FE5440B0AB1AF791403C406898E74895FE544020BE4F8693403C40504B669F95FE544000ED3AEE98403C40CC52689B95FE5440E0CE32FE98403C40
98	Type 3	104	Iman Bdr. Gurung	No	72	0106000020E61000000100000001030000000100000008000000689735FF95FE5440B782DE8A9F403C4034FA139197FE5440B7392E469E403C40D4D6767697FE5440C72FADFC9B403C4018DA9ECF97FE544097A7CDBC9B403C40BCC505AD97FE5440875FC68398403C4004DDB4AC95FE5440F771FB129A403C40EC8F330396FE5440D7A0E67A9F403C40689735FF95FE5440B782DE8A9F403C40
99	Type 3	104	Durga Devi Gurung	Yes	73	0106000020E6100000010000000103000000010000000800000085D4006796FE5440D00D58D2A5403C405137DFF897FE5440D0C4A78DA4403C40F11342DE97FE5440E0BA2644A2403C4035176A3798FE5440B0324704A2403C40D902D11498FE5440A0EA3FCB9E403C40211A801496FE544010FD745AA0403C4009CDFE6A96FE5440F02B60C2A5403C4085D4006796FE5440D00D58D2A5403C40
100	Type 3	104	Dil Kumar Gurung	No	74	0106000020E610000001000000010300000001000000080000002119CECA96FE54404C9E6644AC403C40ED7BAC5C98FE54404C55B6FFAA403C408D580F4298FE54405C4B35B6A8403C40D15B379B98FE54402CC35576A8403C4075479E7898FE54401C7B4E3DA5403C40BD5E4D7896FE54408C8D83CCA6403C40A511CCCE96FE54406CBC6E34AC403C402119CECA96FE54404C9E6644AC403C40
101	Type 3	104	Sun Kumari Gurung	Yes	75	0106000020E61000000100000001030000000100000008000000E805F02F97FE544012CA3291B2403C40B468CEC198FE54401281824CB1403C40544531A798FE544022770103AF403C409848590099FE5440F2EE21C3AE403C403C34C0DD98FE5440E2A61A8AAB403C40844B6FDD96FE544052B94F19AD403C406CFEED3397FE544032E83A81B2403C40E805F02F97FE544012CA3291B2403C40
102	Type 3	104	\N	\N	76	0106000020E6100000010000000103000000010000000800000030EB0F9997FE54402C55ACD8B8403C40FC4DEE2A99FE54402C0CFC93B7403C409C2A511099FE54403C027B4AB5403C40E02D796999FE54400C7A9B0AB5403C408419E04699FE5440FC3194D1B1403C40CC308F4697FE54406C44C960B3403C40B4E30D9D97FE54404C73B4C8B8403C4030EB0F9997FE54402C55ACD8B8403C40
103	Type 2	126	Julie Gurung	No	70	0106000020E61000000100000001030000000100000007000000DDEFA9A599FE54400B24EC02AF403C40DD3F662A9AFE54400B24D416B7403C40DD0740C59BFE54400B2476D7B5403C40DD3722589BFE54400B241658AF403C40DD0F29A39AFE54400B2474F2AF403C40DDFF328F9AFE54400B24FC3DAE403C40DDEFA9A599FE54400B24EC02AF403C40
104	Type 10	97	Yamuna Buddhacharya	Yes	69	0106000020E61000000100000001030000000100000008000000D4D0C0E09BFE5440503427E4B5403C40D4D0C0E09BFE5440B04A2DD8B5403C40BC1704549DFE54407057BBC0B4403C40044633F79CFE5440D0B4893BAF403C40A82A717D9CFE544080085B97AF403C40644C7A6B9CFE5440A0A30F34AE403C408088F27E9BFE5440D02CAAFBAE403C40D4D0C0E09BFE5440503427E4B5403C40
105	Grocery	155	\N	\N	110	0106000020E6100000010000000103000000010000000500000034FCED5A96FE544090164CB479403C4048B7509097FE5440301CF35A7C403C40E0297D3099FE5440C09ADFA274403C4038FD40AF97FE5440D0CF8D5471403C4034FCED5A96FE544090164CB479403C40
\.


--
-- Data for Name: issue_issue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_issue (id, first_name, last_name, issue_header, issue_body, issue_date, lat, lng, location) FROM stdin;
1					2019-08-12 12:29:47.421148+05:45	28.251979673418397	83.9760106801986836	\N
2	Tek Bahadur	Kshetri	Your issue title	This is the issue on pipeline.	2019-08-12 12:30:10.105003+05:45	28.252145061535014	83.9764076471328877	\N
3	Bibek	Chand	The problem encountered in Transmission Line 	Transmission lines transmit waves of voltage and current from one end to another. When transporting electricity over long distances, it is necessary to use high voltage so as to minimize loss of energy.  High-voltage transmission lines are akin to “highways” for the propagation of electricity.	2019-08-12 13:01:49.007619+05:45	28.2521214346769298	83.9756244421005391	\N
4	Tek Bahadur	Kshetri	The problem encountered in Transmission Line 	Transmission lines transmit waves of voltage and current from one end to another. When transporting electricity over long distances, it is necessary to use high voltage so as to minimize loss of energy.  High-voltage transmission lines are akin to “highways” for the propagation of electricity, whereas local power lines at lower voltage are like local systems of smaller roads and gallis. Each transmission line has four main parameters, namely resistance, inductance, capacitance and shunt conductance.	2019-08-12 13:10:10.840234+05:45	28.2516630725938285	83.9759302139282369	\N
5	Tek Bahadur	Kshetri	The problem encountered in Transmission Line 	This is the issue on pipeline.	2019-08-12 13:11:29.730927+05:45	28.2524191327063257	83.9776790142059468	\N
6	Dhiraj	Poudel	The problem encountered in Transmission Line  	Transmission lines transmit waves of voltage and current from one end to another. When transporting electricity over long distances, it is necessary to use high voltage so as to minimize loss of energy.  High-voltage transmission lines are akin to “highways” for the propagation of electricity, whereas local power lines at lower voltage are like local systems of smaller roads and gallis. Each transmission line has four main parameters, namely resistance, inductance, capacitance and shunt conductance.	2019-08-12 13:16:23.560379+05:45	28.2523577030222803	83.9771801233291768	\N
7	Dhiraj	Poudel	The Television Cable not working	Transmission lines transmit waves of voltage and current from one end to another. When transporting electricity over long distances, it is necessary to use high voltage so as to minimize loss of energy.  High-voltage transmission lines are akin to “highways” for the propagation of electricity, whereas local power lines at lower voltage are like local systems of smaller roads and gallis. Each transmission line has four main parameters, namely resistance, inductance, capacitance and shunt conductance.	2019-08-12 15:48:38.744845+05:45	28.2522915479383521	83.9776307344436788	\N
8	Tek Bahadur	Kshetri	The problem encountered in Transmission Line  	Transmission lines transmit waves of voltage and current from one end to another. When transporting electricity over long distances, it is necessary to use high voltage so as to minimize loss of energy.  High-voltage transmission lines are akin to “highways” for the propagation of electricity, whereas local power lines at lower voltage are like local systems of smaller roads and gallis. Each transmission line has four main parameters, namely resistance, inductance, capacitance and shunt conductance.	2019-08-13 07:27:19.875924+05:45	28.2525230905525291	83.9775985479355001	\N
9	Hemant	GC	Pipeline Network Error	Transmission lines transmit waves of voltage and current from one end to another. When transporting electricity over long distances, it is necessary to use high voltage so as to minimize loss of energy.  High-voltage transmission lines are akin to “highways” for the propagation of electricity, whereas local power lines at lower voltage are like local systems of smaller roads and gallis. Each transmission line has four main parameters, namely resistance, inductance, capacitance and shunt conductance.	2019-08-13 12:59:23.841195+05:45	28.2523009986671561	83.9772713184356832	\N
10	Hemant	Kshetri	The problem encountered in Transmission Line 	This is the issue on pipeline. sjdfldsjkf	2019-08-13 13:11:05.788203+05:45	28.2521379734781242	83.9779633283615254	\N
11	Tek Bahadur	Kshetri	The problem encountered in Transmission Line 	Transmission lines transmit waves of voltage and current from one end to another. When transporting electricity over long distances, it is necessary to use high voltage so as to minimize loss of energy.  High-voltage transmission lines are akin to “highways” for the propagation of electricity, whereas local power lines at lower voltage are like local systems of smaller roads and gallis. Each transmission line has four main parameters, namely resistance, inductance, capacitance and shunt conductance.	2019-09-11 21:05:38.480507+05:45	28.2528066114360925	83.9764666557312154	\N
12	Tek	Kshetri	dfsjrj;j	sladjfljs lkjs dfj	2019-09-13 13:43:07.635033+05:45	28.2516583472012712	83.9779418706893921	\N
13	Tek	Kshetri	tranisiomfdj	ALDSJFSDLJ	2019-09-13 14:58:22.849583+05:45	28.2525821574654508	83.9772951230406761	\N
\.


--
-- Data for Name: man hole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."man hole" (gid, geom) FROM stdin;
1	0101000020E61000005C55BCAC93FE544068F347147A403C40
2	0101000020E6100000540A0A2D90FE5440362DC73F7C403C40
3	0101000020E610000007DE51AC8CFE54409217AC6C7E403C40
4	0101000020E6100000F4168FC288FE544070FA8E9D80403C40
5	0101000020E6100000CEFD004385FE5440C51180B282403C40
6	0101000020E61000009963BCDA81FE5440894AAA4E86403C40
7	0101000020E61000009A108B4C7EFE54409B16B7248A403C40
8	0101000020E61000001AF2A15485FE5440344E00499D403C40
9	0101000020E6100000FA7B09978BFE5440E8549B2098403C40
10	0101000020E6100000B026674B8EFE5440F819B11596403C40
11	0101000020E6100000116354E691FE5440CF550B5593403C40
12	0101000020E6100000AC83D1D297FE54400EAE4DE38E403C40
13	0101000020E6100000C4B27F409BFE544036004EEC9E403C40
14	0101000020E6100000B827B5139EFE5440538FE1E9B5403C40
15	0101000020E6100000D30EF6C897FE5440B11F9BA8BA403C40
16	0101000020E61000009518E8598EFE54406063F69CC2403C40
17	0101000020E610000068C27D0985FE54402C65D840B6403C40
18	0101000020E61000003B77458F8CFE54406DF6190CA7403C40
19	0101000020E6100000FE520B628DFE5440E8B630B7B3403C40
20	0101000020E6100000A507C1DC8DFE54401D734817BB403C40
21	0101000020E61000001AE3059993FE5440EE7257FBAE403C40
22	0101000020E61000004C72A70893FE54409ACC72E9A5403C40
23	0101000020E6100000A738356492FE544061DE50639B403C40
24	0101000020E6100000F4957BF27EFE5440CE95258393403C40
25	0101000020E6100000CD7DCE4281FE54405C7079A3A0403C40
26	0101000020E61000005F64D8A483FE544076B78256AE403C40
27	0101000020E6100000AE6020E186FE5440366C13E1C0403C40
28	0101000020E6100000BE82931B88FE54402AAB80EDC7403C40
29	0101000020E6100000B74CD97E94FE54402042AB6EBD403C40
30	0101000020E6100000F2429CD196FE544001C1E1FB7D403C40
31	0101000020E6100000D9E7C87996FE5440F938063278403C40
32	0101000020E6100000FCE8026498FE5440FBB02EDE6C403C40
\.


--
-- Data for Name: outlet_valve; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outlet_valve (gid, __gid, geom) FROM stdin;
1	\N	0101000020E61000003C5D4FCF93FE54401593C4E4B9403C40
2	\N	0101000020E610000035C1BC5A93FE544009A7C19AB2403C40
3	\N	0101000020E6100000C15A160093FE5440541F26F4AC403C40
4	\N	0101000020E6100000CB4EEA6F92FE54405F0B96E5A3403C40
5	\N	0101000020E61000005CC89E5C92FE544099CDE89AA2403C40
6	\N	0101000020E610000003680C1C92FE544084E57BB89E403C40
7	\N	0101000020E6100000D24251F991FE5440C93589929C403C40
8	\N	0101000020E610000065F4799891FE544073A0F19696403C40
9	\N	0101000020E610000051FC213D90FE54400284B8E596403C40
10	\N	0101000020E6100000F2F10B9F8FFE5440BD36AD6097403C40
11	\N	0101000020E6100000CC6BF91E8FFE5440CE852EC697403C40
12	\N	0101000020E61000004850DA6A8DFE54401850302399403C40
13	\N	0101000020E610000094F099568CFE54406469D3DF9A403C40
14	\N	0101000020E61000006D9621A98CFE5440A5D1BE10A0403C40
15	\N	0101000020E61000004AC0FD218DFE5440C0B8628FA7403C40
16	\N	0101000020E61000006404E18C8DFE544003AA284DAE403C40
17	\N	0101000020E610000020A7CF548EFE544062F682DABA403C40
18	\N	0101000020E61000001D9623798EFE544001CE6211BD403C40
19	\N	0101000020E6100000F5A5129290FE5440A3508943BF403C40
20	\N	0101000020E6100000D08C7F7491FE5440854B328EBE403C40
21	\N	0101000020E6100000F12E918C92FE5440D9A621B3BD403C40
22	\N	0101000020E6100000494A793993FE54400D392332BD403C40
23	\N	0101000020E6100000C16369D283FE5440183B82D3AA403C40
24	\N	0101000020E6100000FBAC249083FE5440D47C3B95AA403C40
25	\N	0101000020E6100000959DC40583FE5440D183447FA7403C40
26	\N	0101000020E6100000737E018E82FE5440CF9FA6C6A4403C40
27	\N	0101000020E61000005D71171383FE544075BC5A3AA1403C40
28	\N	0101000020E61000007F6F65DE86FE54404E34B8479E403C40
29	\N	0101000020E6100000EF926C7C88FE54401B43B3019D403C40
30	\N	0101000020E610000069398A0B89FE5440AC52558C9C403C40
31	\N	0101000020E61000000F5A0B6E89FE54403F4247439C403C40
32	\N	0101000020E6100000D95F83238BFE5440959513EC9A403C40
33	\N	0101000020E6100000DA2F43418CFE544067DCCDD5A8403C40
34	\N	0101000020E6100000140365A28CFE54406B9E22F0AE403C40
35	\N	0101000020E61000005571EAF98CFE54400D1DED5BB4403C40
36	\N	0101000020E6100000B593F23F8DFE54407C3806CAB8403C40
37	\N	0101000020E6100000F14DE9B68DFE54408A852408C0403C40
38	\N	0101000020E6100000F8B861FC8CFE54402D6EB01AC2403C40
39	\N	0101000020E6100000316945388CFE54407EB22EB5C2403C40
40	\N	0101000020E6100000D68D82E08AFE5440BCEE0CC1C3403C40
41	\N	0101000020E6100000F4D1E6E889FE5440C141408AC4403C40
42	\N	0101000020E610000079A9C07388FE5440B01D45D1C4403C40
43	\N	0101000020E61000001530182888FE5440648B15F4BF403C40
44	\N	0101000020E610000067F4561188FE54402B809397BE403C40
45	\N	0101000020E6100000FCE892B487FE544036716DE2B8403C40
46	\N	0101000020E6100000FF418B2C87FE5440D9162A46B0403C40
47	\N	0101000020E6100000828F9EC786FE544055666B00AA403C40
48	\N	0101000020E610000095778E8286FE5440F7DB15B1A8403C40
49	\N	0101000020E61000007151768695FE544019FF776BBB403C40
50	\N	0101000020E6100000E645A32597FE544006A0CB25BA403C40
51	\N	0101000020E6100000DE4D3D6E99FE5440CAEB995DB8403C40
52	\N	0101000020E61000000C829C3C9BFE54400B5200F3B6403C40
53	\N	0101000020E6100000ADF139859CFE54405FF153F1B5403C40
54	\N	0101000020E61000000F24ECEB9CFE5440E21AAEA4B5403C40
55	\N	0101000020E6100000D5F619909DFE5440AB0FC954B3403C40
56	\N	0101000020E6100000AE7821CE9CFE54400895FC10AD403C40
57	\N	0101000020E61000007D4FF0B09CFE5440C34E8A2CAC403C40
58	\N	0101000020E61000007787E4D899FE5440811E1CD2AD403C40
59	\N	0101000020E6100000D4D8BD5F99FE544051FB0ACEAA403C40
60	\N	0101000020E610000025CCB01499FE5440A8224F1CA6403C40
61	\N	0101000020E6100000725E238598FE54405589922A9D403C40
62	\N	0101000020E61000003936D65698FE54405561A7549A403C40
63	\N	0101000020E610000012FD130398FE5440F274950695403C40
64	\N	0101000020E6100000FFC6358997FE5440116E962991403C40
65	\N	0101000020E61000008F1A676095FE5440A63B00D492403C40
66	\N	0101000020E61000009A4EEAC093FE5440DFCA2A1394403C40
67	\N	0101000020E61000002D3349C792FE5440E2FE96D994403C40
68	\N	0101000020E610000024FBF18992FE5440901B1D9996403C40
69	\N	0101000020E6100000FE46D8B692FE54407155A65999403C40
70	\N	0101000020E61000000D64603193FE5440AB99D304A1403C40
71	\N	0101000020E6100000E59BC47793FE5440429B5267A5403C40
72	\N	0101000020E61000001BDACBD593FE544001410241AB403C40
73	\N	0101000020E6100000765F792794FE544057A4FB5DB0403C40
74	\N	0101000020E610000060A0C8A994FE5440D510FF8CB8403C40
75	\N	0101000020E6100000F95C5A659EFE5440C7DA52B8B8403C40
76	\N	0101000020E6100000F92956D29EFE54400D525683B7403C40
77	\N	0101000020E6100000431ACDB19EFE54403972D6BDB5403C40
78	\N	0101000020E61000007A5484779EFE54401FB45FE6B3403C40
79	\N	0101000020E6100000B813C4B29DFE5440DC652A8EAD403C40
80	\N	0101000020E6100000D6D741399DFE5440ADF3D0B7A9403C40
81	\N	0101000020E61000005B1A4C7F9BFE5440EEB769B99D403C40
82	\N	0101000020E6100000CBD3DB7799FE5440D91BF9A092403C40
83	\N	0101000020E6100000AAE85D6B98FE5440FF85D7C98C403C40
84	\N	0101000020E61000002297E88C97FE5440E193F2DB87403C40
85	\N	0101000020E61000002A0B121397FE5440671C1D0180403C40
86	\N	0101000020E61000000E7FE20B97FE5440984BA1337E403C40
87	\N	0101000020E6100000ECEE623D97FE5440422B23347D403C40
88	\N	0101000020E610000058AC6C1993FE544090EC289A86403C40
89	\N	0101000020E610000016F275A292FE5440DCB6E0CB84403C40
90	\N	0101000020E610000066F6143392FE5440174997847D403C40
91	\N	0101000020E6100000995EACD291FE5440169C4BEB7C403C40
92	\N	0101000020E6100000804A05BF90FE54407C7886917D403C40
93	\N	0101000020E610000072ECE63D8FFE54403624AF6F7E403C40
94	\N	0101000020E6100000A536EC9E8CFE54404089F00E80403C40
95	\N	0101000020E610000034A4AA5A8BFE54401BD3C8C180403C40
96	\N	0101000020E6100000B0FE383A88FE54401FC9FFB182403C40
97	\N	0101000020E6100000EBA8C13585FE5440F009C19E84403C40
98	\N	0101000020E610000019E7496083FE54406241628786403C40
99	\N	0101000020E610000014C81E7180FE5440469B1AAD89403C40
100	\N	0101000020E6100000CFD7B6957EFE544085C988028E403C40
101	\N	0101000020E6100000886A114480FE5440B1BB719097403C40
102	\N	0101000020E6100000024A9DAA80FE544059D941E699403C40
103	\N	0101000020E6100000D309464181FE5440B4D02B489D403C40
104	\N	0101000020E6100000EF6DD97F81FE5440292E75AF9E403C40
105	\N	0101000020E6100000FA1045DA81FE544041A750F79E403C40
106	\N	0101000020E610000023F9C81683FE544003D941FB9D403C40
107	\N	0101000020E6100000EC1AB6B784FE54407D1776A99C403C40
108	\N	0101000020E6100000A6F93FE385FE5440E38C8CBA9B403C40
109	\N	0101000020E61000005421A41188FE5440F26944009A403C40
110	\N	0101000020E6100000B02B2C4989FE544019C7361599403C40
111	\N	0101000020E61000006BF7CFC38BFE54409BB4B51F97403C40
112	\N	0101000020E61000002BD9719C8DFE544067AF7FAA95403C40
113	\N	0101000020E6100000E92D70198FFE5440FAAFC08294403C40
114	\N	0101000020E610000066113D4391FE5440A7D2F8CC92403C40
115	\N	0101000020E610000036763DE892FE5440B0614B7A91403C40
116	\N	0101000020E61000006E6AD40A95FE54405A002BD38F403C40
117	\N	0101000020E6100000F5CB5D2D97FE54408DAEA4208E403C40
118	\N	0101000020E61000006B7542D096FE544054BF65C688403C40
119	\N	0101000020E6100000667C234C96FE54409818858485403C40
120	\N	0101000020E6100000ACB5BAB995FE5440732CC69F84403C40
121	\N	0101000020E61000004A2AD5A693FE5440E2D74D7878403C40
122	\N	0101000020E6100000983FA69291FE544062FDD6C679403C40
123	\N	0101000020E6100000BA6E432F8FFE544060EE51317B403C40
124	\N	0101000020E6100000C3887F988CFE5440BC8188B87C403C40
125	\N	0101000020E6100000214BDEEE8AFE544098A725BE7D403C40
126	\N	0101000020E61000004173773F87FE5440A409D7FF7F403C40
127	\N	0101000020E6100000990E741585FE54402726655581403C40
128	\N	0101000020E61000008F98954083FE5440F971644E83403C40
129	\N	0101000020E610000061B0BB4880FE5440A58F117686403C40
130	\N	0101000020E610000080B826077EFE5440974DE5C588403C40
131	\N	0101000020E6100000CE5F3C917CFE54407EF2816C8A403C40
132	\N	0101000020E610000064CC60457AFE544058099ADC8C403C40
133	\N	0101000020E61000007B39D5BB7AFE54400852847E8F403C40
134	\N	0101000020E6100000CF2112057DFE5440304D90498D403C40
135	\N	0101000020E6100000885EB9897EFE5440BE6B9CD993403C40
136	\N	0101000020E610000025BFF74D7FFE54400553E14D98403C40
137	\N	0101000020E6100000DC55450980FE5440A5BDF98A9C403C40
138	\N	0101000020E61000006240E17280FE54408C73D0D39E403C40
139	\N	0101000020E610000070EF56F580FE54406AA6D7DEA1403C40
140	\N	0101000020E6100000D284189A81FE54409217CC86A5403C40
141	\N	0101000020E6100000D5D3EB9E82FE54409453C468AB403C40
142	\N	0101000020E61000008521F72383FE544052C45163AE403C40
143	\N	0101000020E61000003EDD79F183FE544090A4A407B3403C40
144	\N	0101000020E6100000BC9390BB84FE5440E4C1B6A1B7403C40
145	\N	0101000020E61000002762967985FE54400DD8EAF3BB403C40
146	\N	0101000020E6100000C8EA763F86FE5440CAC1F774C0403C40
147	\N	0101000020E6100000F4F1862C87FE544029C207B6C5403C40
148	\N	0101000020E610000094D7739987FE5440B58A1E07C8403C40
149	\N	0101000020E61000001066CD4988FE5440DB1CC51BC9403C40
150	\N	0101000020E6100000884D611489FE54407FC79F87C8403C40
151	\N	0101000020E61000000F8618EF89FE54409E81F0E2C7403C40
152	\N	0101000020E6100000C0C116C68AFE544030D9F43FC7403C40
153	\N	0101000020E61000002159D0BF8BFE5440DF585571C6403C40
154	\N	0101000020E6100000D5A8FD978CFE54406AA0FEC7C5403C40
155	\N	0101000020E6100000FC0C1C9A8DFE544079149FF8C4403C40
156	\N	0101000020E61000007F1724E98EFE54409B4741EFC3403C40
157	\N	0101000020E6100000662A93A290FE54401F215195C2403C40
158	\N	0101000020E6100000F6EBEFDF91FE5440BCF81698C1403C40
159	\N	0101000020E61000007B115E1693FE5440BE3672A1C0403C40
160	\N	0101000020E61000006546DF1994FE54405A245AD8BF403C40
161	\N	0101000020E6100000ED661AF195FE54400147F367BE403C40
162	\N	0101000020E61000004C2EFEB897FE5440C6777C09BD403C40
163	\N	0101000020E6100000C2B316E599FE544027D77953BB403C40
164	\N	0101000020E6100000F8BB1C6C9BFE5440C7353417BA403C40
165	\N	0101000020E6100000643A577F9CFE54406E458A3BB9403C40
166	\N	0101000020E6100000266C56349DFE5440E28F10ADB8403C40
167	\N	0101000020E6100000EC170D799DFE544027575974B9403C40
168	\N	0101000020E6100000447EE3CA9DFE5440AD2697E1BE403C40
169	\N	0101000020E61000006F2136BB9EFE5440609FDF0FBE403C40
\.


--
-- Data for Name: park; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.park (gid, geom) FROM stdin;
1	0106000020E61000000100000001030000000100000027000000985354859AFE5440A0E05DEDA9403C4088F541059CFE544080C371BDA8403C40A81FDB0A9CFE5440D0DEFCB7A8403C407C5029109CFE5440D0BFFEAEA8403C40200E09159CFE54408088B3A2A8403C4018C159199CFE5440006E6D93A8403C40908EFE1C9CFE544030929281A8403C40E818DF1F9CFE544070599A6DA8403C40F47189229CFE5440D0BAE250A8403C40FC1000249CFE5440A04CD132A8403C40940039249CFE5440C0AC3214A8403C4050BD32239CFE5440503AD7F5A7403C40006E10D99BFE5440F0CBA89AA5403C40D47AD2909BFE5440C04BDF4EA3403C40F42D6DB49AFE544090CB989A9E403C402C89C5F499FE54405018BA8A9A403C4020476DB899FE5440D0D24F4399403C4094B944B499FE544080AFB22899403C40547F7C9A99FE5440C06878F398403C402088E18C99FE5440F02F4FF198403C40E89B587F99FE544090A73FF798403C4050772E7299FE5440C023280599403C40ACBDAD6599FE5440C0C9B91A99403C408CD38F5F99FE5440E0C83C3299403C4088755E5A99FE5440C002124D99403C405425365699FE5440302AA66A99403C4068B52D5399FE5440F0DF568A99403C40205DD25299FE5440D08B2F8F99403C40DC4B594F99FE5440806BB2D499403C40C8A2CD4E99FE544020928C1B9A403C40BCFF5EC799FE544020D2A497A1403C40FC12D0459AFE544040721671A9403C40CC93504F9AFE5440A02F4EABA9403C408C1AF2559AFE54405099C0BAA9403C40884FF45C9AFE544020FB3FC7A9403C40C86119789AFE5440609C0EEBA9403C409408767C9AFE5440407796EEA9403C40203CE8809AFE5440402A5DEFA9403C40985354859AFE5440A0E05DEDA9403C40
2	0106000020E6100000010000000103000000010000004100000074D1D5C486FE544040D27BA0B9403C4098CB97B186FE54400098D045B8403C4010D0E1AE86FE544090B8AE18B8403C4010DCBE9D86FE544050E161FBB6403C4088C4EF9586FE544040B35F79B6403C4040360D9486FE5440F0CCFD59B6403C4024717F8486FE5440D03C0062B5403C40A46CFE6D86FE5440504032FBB3403C408055426A86FE544070F807BDB3403C40405CB66286FE544050F5693FB3403C404C9C2C5A86FE544010CD4BB1B2403C400822FE4C86FE54408014E3D5B1403C4010A4882F86FE544030CB6AF6AF403C408CE41E2E86FE544030086BDFAF403C4070BAE50186FE5440000D0216AD403C4028C760FF85FE5440D020E000AD403C401C1C05FC85FE5440A023B3EDAC403C40D461EAF785FE5440102E02DDAC403C40D0822DF385FE5440B0D742CFAC403C40ECDFEFED85FE544090FAD5C4AC403C402C2441DF85FE5440D06EDCB9AC403C40304254D085FE5440F06887B7AC403C40645C5BC285FE5440F0B12EBEAC403C402C895E6C84FE5440F00B50CCAD403C40541CEE6384FE544080C6A0D3AD403C4080D4EB5B84FE5440407B8AE0AD403C4094A1925484FE54400024AEF2AD403C405497184E84FE5440C0438609AE403C4094906A4B84FE544020473213AE403C40404A284984FE5440D00A751EAE403C404CA2604784FE54403071042BAE403C40CC4F1F4684FE5440F0CF8D38AE403C4090956C4584FE5440F00EB846AE403C40E00B4D4584FE544070F32555AE403C405482C14584FE544070857863AE403C4068FAC64684FE5440E0805171AE403C404C35CF4D84FE5440C07613C3AE403C4014156E8384FE544030CB6AF6AF403C40AC0E70FB84FE5440402F46A6B2403C40AC44122C85FE544070F807BDB3403C401074E76585FE544010EF8308B5403C4058F5B6EE85FE544090B8AE18B8403C409011834E86FE5440C05BC53DBA403C40D871FC8386FE5440B0C14570BB403C4034232B9D86FE5440E0BC9C00BC403C40AC2CFCB386FE54402065F87DBC403C4054CBFAB686FE5440ED60C288BC403C40959A5CBA86FE544095E38691BC403C400FFD0BBE86FE544078E40D98BC403C409965F1C186FE54403AAC2D9CBC403C40C7EDF3C586FE544060DFCB9DBC403C400BF5F9C986FE5440C426DE9CBC403C4080C4E9CD86FE5440B0716A99BC403C404B81E1D086FE54400C552796BC403C40EC5EB0D386FE54401B3D1D91BC403C40C57245D686FE5440B2856A8ABC403C40592E91D886FE5440AA883782BC403C4005BD85DA86FE5440D1AAB578BC403C404E5717DC86FE544055321E6EBC403C40DC893CDD86FE5440C0EDB062BC403C40EDC57CDE86FE5440F93A9A54BC403C4063AD29DF86FE54405BD3E545BC403C40B1DB3EDF86FE54402C5AF336BC403C4014C7BBDE86FE544060062428BC403C4074D1D5C486FE544040D27BA0B9403C40
3	0106000020E61000000100000001030000000100000042000000ACE2773797FE5440E00ADAA06B403C408CBDDA3497FE54403051C8936B403C402470E23197FE544050CEEE846B403C401001E72897FE5440D08E2C706B403C40C09ABF2797FE5440E0C92B6E6B403C402825AE1E97FE544000166E5E6B403C4018C8521E97FE5440307ECF5D6B403C4058C5251297FE5440905E6E536B403C40500E920697FE5440C094D5516B403C40A4184FFD96FE544000166E5E6B403C40082197FC96FE54400048685F6B403C40348336F196FE544010B68F766B403C4024DAD2EB96FE5440B02BB9896B403C401060E0E696FE5440B0F896A46B403C40A49B83D496FE5440503A4F086C403C40FCD75DD296FE5440E0CEF8136C403C40405A7AD096FE5440607B3A1E6C403C402C8227CE96FE5440301327316C403C4044A58DC996FE544090F39F566C403C40EC4731C496FE544020B260796C403C4068F65CC396FE5440701CC17E6C403C400CB86E9296FE5440C00AF6BB6D403C406026A07396FE5440C0F6AC836E403C40FC6A336B96FE544070974ABA6E403C40DCB72B5F96FE5440908398076F403C40E0CCA35C96FE544090FCDB176F403C40803950E495FE5440A07B111D72403C404081658095FE5440D070209F74403C40B086C54B95FE5440C0604AF175403C40241B274995FE544010CDF00D76403C40E462A34795FE5440C08DD62B76403C401C25434795FE5440305C4E4A76403C40948F084895FE5440F0A1A76876403C40302AEF4995FE5440707A328676403C4090F0EB4C95FE544030AD43A276403C406092ED5095FE5440708E38BC76403C408023E65A95FE5440105D81D976403C40BC12EC6595FE5440004AF5EF76403C402C2AB57195FE5440602CFDFE76403C40F411F27D95FE5440C0D3330677403C40A066508A95FE5440A0AF680577403C403489C89595FE5440E08573F276403C40146966A095FE5440C067BFD876403C409C00EBA995FE5440F0E9E4B876403C40DCA636FD95FE5440D070209F74403C4074AA0B5B96FE54403067554172403C400CAAA96096FE5440A07B111D72403C40A07410C396FE54400033C6A16F403C40846A5AC696FE544010628A8C6F403C40E024AACC96FE5440301C6C676F403C40D46BEFED96FE5440C0F6AC836E403C40BC64460297FE5440E0C771F86D403C407895D32997FE54404004B4E96C403C40C0449C2B97FE544000E27DDD6C403C40087FB62D97FE5440109019CF6C403C40B0406B3097FE5440902360BB6C403C40D4D7DB3E97FE5440F01920526C403C40D8BAA74097FE5440D0462C3A6C403C408CA6E64097FE5440808C03306C403C40B095254197FE54402046DA256C403C407C06414197FE5440F00E6C216C403C400CD4DA4097FE5440B005110B6C403C407C23753F97FE54405038C6D46B403C407026CE3C97FE5440A02C8AC26B403C4044FC113997FE5440D08ADCA86B403C40ACE2773797FE5440E00ADAA06B403C40
4	0106000020E61000000100000001030000000100000011000000F42D820294FE54404263E8CB7C403C404E3CB0B993FE5440B91AB2227D403C40D42AEA7E93FE5440D8E048D97D403C402B9A225B93FE5440BD8BE0D37E403C404700CC5393FE5440E29852EC7F403C40265D046A93FE5440F209EDF780403C405CB0699A93FE5440D462F2CD81403C4054D09DDD93FE54401775CD4D82403C400291652994FE5440723E076482403C40A882377294FE5440FB863D0D82403C402294FDAC94FE5440DCC0A65681403C40CB24C5D094FE5440F7150F5C80403C40AFBE1BD894FE5440D2089D437F403C40D061E3C194FE5440C29702387E403C409A0E7E9194FE5440E03EFD617D403C40A2EE494E94FE54409D2C22E27C403C40F42D820294FE54404263E8CB7C403C40
\.


--
-- Data for Name: road; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.road (gid, road_type, road_typ_1, geom) FROM stdin;
1	Street 8	Paved	0105000020E6100000020000000102000000220000004CD96F5D8CFE54409F2BC7109A403C40A7D575578CFE5440C3D867319A403C40A139EF528CFE5440EFAA93559A403C40E7C2FC4F8CFE544033F6447C9A403C4076C3B34E8CFE544020D163A49A403C405C871D4F8CFE5440AFFDCDCC9A403C4040DB9E718CFE54405F4839FB9C403C408C7E59958CFE544081A4463D9F403C40CC78B0B38CFE544022124F24A1403C400856D3D38CFE5440DF79AE29A3403C40FC615BF68CFE544010869C44A5403C40483F7E168DFE5440C07FD432A7403C403C4B06398DFE5440D0F9E964A9403C4018D98E5A8DFE54402F3C3F7EAB403C40647C497E8DFE5440F1904AC4AD403C40246F9EA08DFE5440D048C9F0AF403C40D87E27C18DFE54405FDF8DF8B1403C40E425E3E28DFE5440007FAD16B4403C4034C99D068EFE54406F20264FB6403C405828C1258EFE54405F41C143B8403C406CC0784F8EFE5440EFC93CDBBA403C40900268708EFE5440501B96ECBC403C4090A76F9E8EFE5440F1C8FBC5BF403C40E07A86A18EFE5440AF7445E9BF403C4090ADB2A58EFE54402152BA0AC0403C40E896D6AA8EFE54409FC80825C0403C40B8DAC1B08EFE54407099933CC0403C4000E65CB78EFE54406101FD50C0403C40C42A9CBF8EFE54407F8D6064C0403C40244654C88EFE54400F591E74C0403C40F819A2D38EFE54404FCBF884C0403C40D8F447DF8EFE5440DE797F94C0403C40987E90E18EFE5440C1422896C0403C40F8ED59008FFE5440D1B53992C0403C40010200000021000000DC7138938DFE5440DFA02DB1C1403C40782A449C8DFE5440F0A083A1C1403C40A07299A48DFE54405042748CC1403C40182F05AC8DFE5440A1AD8072C1403C4000DD59B28DFE5440510B4854C1403C40FC4D6FB78DFE5440A1083237C1403C408CAE9EBB8DFE5440B07EB61CC1403C401487B4BE8DFE5440EF84EAFFC0403C4040F69CC08DFE54400FA987E1C0403C40B8B04BC18DFE5440B1B651C2C0403C4074B44CBF8DFE5440BFC92F5DC0403C40240DAFBA8DFE544050E928FEBF403C404099B88E8DFE54406067654CBD403C402457C96D8DFE544000160C3BBB403C4004BF11448DFE5440A08D90A3B8403C40E05FEE248DFE5440906CF5AEB6403C4094BC33018DFE544041CB7C76B4403C40841578DF8CFE5440A12B5D58B2403C40D405EFBE8CFE5440E0949850B0403C4014139A9C8CFE544010DD1924AE403C40D06FDF788CFE544050880EDEAB403C40ECE156578CFE5440E045B9C4A9403C40F8D5CE348CFE5440FFCBA392A7403C40ACF8AB148CFE544020D26BA4A5403C40B8EC23F28BFE54401FC67D89A3403C40840F01D28BFE5440305E1E84A1403C403C15AAB38BFE5440C0F0159D9F403C40F871EF8F8BFE54409F94085B9D403C405071B4708BFE5440BF46CB659B403C40E271F8688BFE5440D89D0F3B9B403C40B5ACC55F8BFE54400C9A40159B403C4000A94D558BFE5440D4CF29F59A403C4044C5C8498BFE5440A00778DB9A403C40
2	Street 9	Paved	0105000020E610000002000000010200000025000000A8F000AC92FE544077C6FDE694403C406086B1A092FE5440B80AA7FE94403C40677D299692FE5440A6537F1B95403C4064AA8E8C92FE544085031F3D95403C40C0A6948692FE5440A9B0BF5D95403C40BA0A0E8292FE5440D582EB8195403C4001941B7F92FE544019CE9CA895403C409194D27D92FE544004A9BBD095403C4078583C7E92FE544095D525F995403C4058ACBDA092FE54404420912798403C40A84F78C492FE5440647C9E699A403C40E449CFE292FE544014EAA6509C403C402427F20293FE5440C35106569E403C4018337A2593FE5440055EF470A0403C4064109D4593FE5440A5572C5FA2403C40581C256893FE5440C5D14191A4403C4030AAAD8993FE5440251497AAA6403C40804D68AD93FE5440E668A2F0A8403C404040BDCF93FE5440C420211DAB403C40F44F46F093FE544046B7E524AD403C4000F7011294FE5440E3560543AF403C404C9ABC3594FE544065F87D7BB1403C4074F9DF5494FE544044191970B3403C408491977E94FE5440E5A19407B6403C40ACD3869F94FE544045F3ED18B8403C40A8788ECD94FE5440E4A053F2BA403C40F84BA5D094FE5440944C9D15BB403C40AC7ED1D494FE5440142A1237BB403C400068F5D994FE544087A06051BB403C40D0ABE0DF94FE54406571EB68BB403C4018B77BE694FE544044D9547DBB403C40DCFBBAEE94FE54407665B890BB403C40401773F794FE5440F53076A0BB403C4010EBC00295FE544036A350B1BB403C40F4C5660E95FE5440C451D7C0BB403C40B44FAF1095FE5440B41A80C2BB403C4010BF782F95FE5440C48D91BEBB403C400102000000240000005837595C91FE5440C58F11F695403C40FC65656791FE5440A6B28AF795403C408C61A46C91FE5440A505E3FC95403C40AC86A77991FE544008136D0E96403C400D2AB88591FE5440F37EA62896403C40375E7A9091FE54406279C74A96403C40E0299C9991FE544019F8CB7396403C4084F8D7A091FE5440F6737BA296403C4014430EBF91FE5440966C608798403C4054E6C8E291FE5440B5C86DC99A403C40A0E01F0192FE5440243676B09C403C40D0BD422192FE5440159ED5B59E403C40C4C9CA4392FE544015AAC3D0A0403C4010A7ED6392FE5440F5A3FBBEA2403C4004B3758692FE5440D51D11F1A4403C40EC40FEA792FE54403560660AA7403C402CE4B8CB92FE5440F6B47150A9403C40ECD60DEE92FE5440D46CF07CAB403C40A0E6960E93FE54409503B584AD403C40AC8D523093FE544036A3D4A2AF403C40FC300D5493FE544076444DDBB1403C402090307393FE54409665E8CFB3403C404028E89C93FE5440F4ED6367B6403C40586AD7BD93FE5440553FBD78B8403C403CDECDE993FE544033C1802ABB403C4090856BEE93FE5440B6A18789BB403C40D0816AF093FE5440968EA9EEBB403C4058C7BBEF93FE5440F580DF0DBC403C403058D3ED93FE5440D45C422CBC403C40A87FBDEA93FE5440A5560E49BC403C40181F8EE693FE544095E08963BC403C4018AE78E193FE544045E39F80BC403C40340024DB93FE54409485D89EBC403C40BC43B8D393FE5440361ACCB8BC403C4090FB62CB93FE5440D478DBCDBC403C40F44257C293FE5440D67885DDBC403C40
3	Street 10	Paved	0105000020E61000000500000001020000000300000010BF782F95FE5440CF8D91BEBB403C4018220C4F9CFE54403E87D321B6403C40686B466F9DFE5440CFE5D94BB5403C40010200000018000000345181B69EFE5440CE49E24BBE403C40B033526B9EFE5440C0DFA18BB9403C40244A585F9EFE54402F784BC4B8403C405BF4F95D9EFE544042B78A9CB8403C4008B7D75D9EFE544091D86A74B8403C40B417F25E9EFE54400159884CB8403C40B3DE9D629EFE5440E455BD34B8403C4028112E679EFE54401B7E8F1FB8403C400770856C9EFE5440968E860DB8403C40C0BF81729EFE54408F1D16FFB7403C40C8F2E2BF9EFE544072998686B7403C4068374AC69EFE5440BAA08A7EB7403C404D7B57CC9EFE5440354DF972B7403C4070D9EAD19EFE5440D0950F64B7403C4010E06AD39EFE5440D147F55FB7403C408B9BB7D49EFE5440DCBFE05AB7403C4024FCC6D59EFE54408A51F954B7403C4017CD90D69EFE544015B16C4EB7403C4019F40ED79EFE544078916D47B7403C409AA03DD79EFE5440161C3240B7403C404C691BD79EFE54404F4DF238B7403C40F7833ED59EFE54403C66281CB7403C4018FB2ED29EFE544020B60E01B7403C40200792819EFE5440302DFE72B4403C40010200000002000000F8ED59008FFE5440D1B53992C0403C40F44257C293FE5440DF7885DDBC403C4001020000000B00000074FA9F7088FE5440208B8FFCC4403C407E92637688FE5440C8C9FA1CC5403C4025BC577D88FE5440F7B56B39C5403C407831518588FE54408F523151C5403C406E5B628F88FE54401F816166C5403C40EC70139A88FE5440E073EB75C5403C408E499EA788FE54401343B581C5403C40C0F06BB588FE5440F0BAAF86C5403C40CABEBABD88FE5440D0D51A87C5403C40741EFDC588FE544050277E83C5403C40DC7138938DFE5440DFA02DB1C1403C4001020000000C00000010BB42B888FE54408FE6EABDC8403C40184381678BFE5440A1783E9FC6403C403491DD1391FE544031AEA91AC2403C4084A12BB796FE54405038BDB2BD403C400C6E36529DFE54408FE25781B8403C40B695E45C9DFE5440B80D847FB8403C40C4F080679DFE5440F0E1B684B8403C40328C676D9DFE544076E362A0B8403C40EE8D45729DFE54407E971BBFB8403C40CC1902769DFE5440D01344E0B8403C4070509FD39DFE5440505F36F6BE403C40903974D49DFE54407F168FEFBE403C40
4	Street 5	Paved	0105000020E610000005000000010200000010000000CC8803157DFE5440D03742178D403C40A430DC1E7DFE544020615B128D403C4044FC92287DFE5440EF533A108D403C403099E42F7DFE5440206E7C148D403C40E02A333D7DFE5440EE28111E8D403C40BC408A4A7DFE5440F051922C8D403C40D88823587DFE544040F915438D403C40C84AA3647DFE54408FCFE6628D403C40542D1F707DFE5440708657888D403C40348553807DFE5440514171C48D403C4020F50F8E7DFE54407060AF098E403C409CEB65AE7DFE5440407D7BD48E403C405C4E22987EFE54404007130A94403C405C6D5E9E7FFE5440C1337DE999403C40E0D2B5A281FE5440FFEA3F90A5403C40CC3A7DDB82FE5440303ACB9FAC403C4001020000000C0000007409258181FE544000A9E9D49E403C40D85B175D7EFE544070C4D6E08C403C40E8C834597EFE54403E8FE1AF8C403C40084D6A577EFE5440209F047D8C403C4030BBC4577EFE54408F24AC498C403C40308DE0587EFE5440F073F92E8C403C4068661D5B7EFE54402F006F158C403C4060476A5E7EFE5440F1CCCEFD8B403C402C1EAE627EFE5440E151CCE88B403C4068C41F6E7EFE5440FFD247BF8B403C40BC77B27B7EFE544010299AA38B403C400CC85B7E7EFE5440101C79A18B403C4001020000003F00000068FAC64684FE5440E0805171AE403C404C35CF4D84FE5440C07613C3AE403C4034232B9D86FE5440E0BC9C00BC403C406ADEE6AE86FE544078CC0A62BC403C40AC2CFCB386FE54402065F87DBC403C400222C0B686FE5440B7570C88BC403C40A1AE67B986FE54407529598FBC403C40CC0BCCBB86FE5440624C6794BC403C40BAFDE9BD86FE544050B4DD97BC403C4045F624C186FE544002AC8B9BBC403C40605AB3C586FE54408D430C9EBC403C402C7769C786FE5440D82DC19DBC403C40832201CA86FE5440742FDA9CBC403C409ADEBFCC86FE544093C6B59ABC403C4080C4E9CD86FE5440B0716A99BC403C40B173AACF86FE54401C2EBA97BC403C40E2C02AD286FE5440001D1A94BC403C4089CE7BD486FE54408CDB498FBC403C40986550D686FE544064FE488ABC403C40E34A85D886FE5440C8E26882BC403C40468233DA86FE54408C447D7ABC403C40C1267FDB86FE5440E9A59472BC403C40F8EFA6DC86FE544043022669BC403C40D44973DD86FE5440077DB860BC403C403C4344DE86FE5440067EB057BC403C4025A68EDE86FE54405A978853BC403C407029EBDE86FE54401B07DC4CBC403C40DB590CDF86FE5440D1A1A249BC403C400AA51DDF86FE54405EC69547BC403C407C2A3CDF86FE5440CD917142BC403C4096BC48DF86FE54406EB4DF3CBC403C40052A43DF86FE5440F5D44738BC403C40A6541EDF86FE5440C98B3631BC403C40A5699CDE86FE544086A81325BC403C40CC1FADDB86FE54408CA4AFDBBB403C40CF4C66C586FE5440E0FB98AEB9403C4098CB97B186FE54400198D045B8403C4040360D9486FE5440F0CCFD59B6403C40A46CFE6D86FE5440504032FBB3403C400822FE4C86FE54408014E3D5B1403C408CE41E2E86FE54402F086BDFAF403C4070BAE50186FE5440FF0C0216AD403C4028C760FF85FE5440D020E000AD403C401C1C05FC85FE5440A223B3EDAC403C40D461EAF785FE5440102E02DDAC403C40D0822DF385FE5440B1D742CFAC403C40ECDFEFED85FE544090FAD5C4AC403C402C2441DF85FE5440D16EDCB9AC403C40304254D085FE5440EF6887B7AC403C40645C5BC285FE5440EFB12EBEAC403C402C895E6C84FE5440F10B50CCAD403C40541CEE6384FE54407FC6A0D3AD403C4080D4EB5B84FE54403F7B8AE0AD403C4094A1925484FE54400024AEF2AD403C405497184E84FE5440C0438609AE403C4094906A4B84FE544021473213AE403C40404A284984FE5440D10A751EAE403C404CA2604784FE54403071042BAE403C40CC4F1F4684FE5440EFCF8D38AE403C4090956C4584FE5440EF0EB846AE403C40E00B4D4584FE544071F32555AE403C405482C14584FE54406F857863AE403C4068FAC64684FE5440E0805171AE403C4001020000000C000000542ADA3683FE5440EFF5FAA9AE403C4078D8FF9584FE5440E0CF46A6B6403C40E01187DE86FE544011B0C1E9C3403C40F0F8DB4187FE5440700F0B0DC6403C40143AF77087FE54404F78A637C7403C40B4703D8587FE5440710230A0C7403C40B83B8B9D87FE5440EF60EEF9C7403C40848E12E387FE54406FCEEDA2C8403C405038FB1088FE544040D917F8C8403C4060EDE63888FE5440F05B620DC9403C40A0A1884A88FE544050636409C9403C4010BB42B888FE54408FE6EABDC8403C4001020000001100000074FA9F7088FE5440208B8FFCC4403C4084E661AD86FE5440CFE91CADA8403C40C80EF1AC86FE5440EE65FEA5A8403C40CC79C6AC86FE5440819755A2A8403C4098D171AB86FE54405F43ABA1A8403C404CDB92C283FE5440207BBDFBAA403C40F89D10B883FE54406104E802AB403C40AC9267AD83FE544070F6CA02AB403C4038EE2BA983FE544071FA1004AB403C40CC67F0A483FE54406FC8C402AB403C4090D7CDA083FE54401EFEEDFEAA403C403083DC9C83FE5440C024A3F8AA403C40388F339983FE54407F2B09F0AA403C408877E89583FE5440B08F52E5AA403C40F0900E9383FE54405034BED8AA403C402C9C118D83FE54404154A9BEAA403C40D8FE0D2E82FE54409026E1D4A2403C40
5	Street 7	Paved	0105000020E610000002000000010200000012000000CC3A7DDB82FE5440303ACB9FAC403C403B8EEADB82FE544074DCDAA1AC403C40177442DC82FE54407F1727A4AC403C4070DC82DC82FE5440431EA2A6AC403C406B44AADC82FE5440900A3DA9AC403C4059BFB7DC82FE5440B136E8ABAC403C4043FCAADC82FE54404E9B93AEAC403C40D04784DC82FE5440BF2F2FB1AC403C40D70393DC82FE54403085F4B5AC403C4013ED6FDC82FE54406D31B3BAAC403C4069F21BDC82FE5440BEE64ABFAC403C40974F99DB82FE5440A2609CC3AC403C40047EEBDA82FE5440CF388AC7AC403C40E4F1BBD382FE5440F16146E8AC403C409C21F5C782FE5440E0935D1FAD403C40C09298B482FE5440B1143B63AD403C4088A6719C82FE5440AF9C1AA3AD403C405CC66F1180FE544051704F4AB3403C4001020000000B000000C01FEA4E80FE5440A127B181B4403C409C20560D81FE54408FAE56D7B2403C40F8F16F6D82FE54401FD209E4AF403C4028C8C6F082FE5440B1B734C6AE403C4048B1FCFA82FE544048AD13B2AE403C40D020BC0583FE5440006013A3AE403C407EB0A91283FE54406171C997AE403C405809E21F83FE54408FAC8095AE403C405A0F422783FE5440B42D3093AE403C40FC53A72E83FE5440C0E2E793AE403C40542ADA3683FE5440EFF5FAA9AE403C40
6	Street 3	Paved	0105000020E6100000040000000102000000080000002872C87797FE5440BF6A20778D403C40CE797D7A97FE5440A47F26468D403C40621D667B97FE5440098B1F148D403C40CE797D7A97FE54406C9618E28C403C402872C87797FE544051AB1EB18C403C40CC27523297FE5440E0C5F5098B403C40D86DAA8496FE544040504FCF86403C40080FD62E96FE5440702400AA84403C40010200000024000000FC12D0459AFE544041721671A9403C40CC93504F9AFE54409F2F4EABA9403C40881AF2559AFE54404899C0BAA9403C40884FF45C9AFE54401FFB3FC7A9403C40C86119789AFE5440609C0EEBA9403C408C08767C9AFE54404E7796EEA9403C401D3CE8809AFE54401A2A5DEFA9403C40985354859AFE54409FE05DEDA9403C4088F541059CFE544080C371BDA8403C40A11FDB0A9CFE5440B2DEFCB7A8403C407B5029109CFE5440C1BFFEAEA8403C401B0E09159CFE54408C88B3A2A8403C4018C159199CFE5440EE6D6D93A8403C40868EFE1C9CFE54400F929281A8403C40E818DF1F9CFE54406F599A6DA8403C40F87189229CFE5440B9BAE250A8403C40F91000249CFE54407A4CD132A8403C40930039249CFE5440B7AC3214A8403C4050BD32239CFE54404F3AD7F5A7403C40D47AD2909BFE5440C04BDF4EA3403C40F42D6DB49AFE54408FCB989A9E403C4020476DB899FE5440D1D24F4399403C4094B944B499FE544081AFB22899403C40547F7C9A99FE5440BF6878F398403C401A88E18C99FE5440D72F4FF198403C40DF9B587F99FE5440A8A73FF798403C404D772E7299FE5440C723280599403C40ACBDAD6599FE5440C0C9B91A99403C4089D38F5F99FE5440D6C83C3299403C408A755E5A99FE54409F02124D99403C404C25365699FE5440322AA66A99403C4068B52D5399FE5440EFDF568A99403C40205DD25299FE5440CE8B2F8F99403C40D74B594F99FE5440876BB2D499403C40C8A2CD4E99FE544020928C1B9A403C40FC12D0459AFE544041721671A9403C40010200000007000000200792819EFE5440302DFE72B4403C40907E494E9CFE5440C0520870A2403C400C864B4A9CFE54403FFBE64CA2403C40DC6325C599FE54408E887E7794403C404C07A38697FE5440115B9BFB87403C408CA7D08097FE5440F0A5AFD387403C407C8AC64097FE544061A0D89383403C40010200000029000000686B466F9DFE5440CFE5D94BB5403C40389986809DFE544069AA7B2DB5403C40744757909DFE5440B07B7904B5403C40854F849C9DFE54405E5028D9B4403C40AC50B2A69DFE544071F942A6B4403C4090F80FA99DFE5440FA42F485B4403C40562732AA9DFE5440798F9864B4403C40FB5B12AA9DFE54404346EF42B4403C40EC4CB1A89DFE5440D18BB921B4403C40540847A69DFE54404B5CB7F6B3403C402EB664A29DFE5440B4FC76CDB3403C40D8951D9D9DFE544010D9C4A6B3403C40D0B67FBA9CFE54404EBDC252AC403C40DE1D44B49CFE5440D140F72AAC403C402A29C5AC9CFE54401225D306AC403C408CAD24A49CFE5440C187F9E6AB403C403158C1989CFE5440F2E9C2C9AB403C40977C568C9CFE54405C5948B4AB403C40E472377F9CFE5440BEFF19A7AB403C40BDAE2B739CFE5440EB5F1BA7AB403C40F0EB34679CFE5440DCA5B8ACAB403C4094CF7C5B9CFE5440A046DEB7AB403C40CC6D416D9AFE544012573051AD403C40385BA4AA99FE54401FF577F2AD403C406EBEB3A599FE5440A77830F6AD403C40A6BBAEA099FE5440619B42F7AD403C4050F7AB9B99FE5440C088A9F5AD403C407C80509999FE54407370E8F0AD403C4036162F9799FE5440FC12ACEAAD403C40E47A569599FE544043A31FE3AD403C408A78D39399FE54405B6C77DAAD403C403088B09299FE54404167EFD0AD403C402C7A808C99FE54402E0C1C79AD403C40B49C7A6198FE5440912731959A403C40409B701098FE544090F2889495403C40D07B5ECF97FE544060628C9E91403C4053E411CE97FE5440172C0A9191403C40CD414ACC97FE5440FE1C708491403C40256811CA97FE54409ECA037991403C406D9C73C797FE54406948046F91403C4018517FC497FE54405ECBA86691403C40
7	Street 6	Paved	0105000020E61000000400000001020000000A00000018517FC497FE54405ECBA86691403C40D31BB7BE97FE5440CFD4044C91403C401629F8B797FE544060B54A3591403C4069586CB097FE5440637F072391403C40F88042A897FE5440D08EAC1591403C40FA7B379297FE54409BC74B1791403C4070D3587C97FE54403FDD722291403C40900D4B5497FE54402F13504591403C404C8E1A0594FE5440607D07D893403C40A8F000AC92FE54407FC6FDE694403C400102000000060000005837595C91FE5440D08F11F695403C404CAD98FD8FFE54405F3CA80197403C409C70E3878CFE5440708111BD99403C406160DE768CFE5440D54E4AD199403C40C4E25A668CFE5440CF5D60EB99403C404CD96F5D8CFE54409F2BC7109A403C4001020000001A0000007409258181FE544000A9E9D49E403C40BBC3FE8581FE5440C75E20E89E403C402150878B81FE54400A0B1EF89E403C4004C69C9181FE5440AFAF80049F403C403DAF769B81FE5440583CF0169F403C4094CAE7A581FE544090CB1B239F403C409CBBE3AD81FE54406023C7219F403C40D06F85BF81FE544091DA1F1B9F403C40C48869F681FE5440407DDFF19E403C400820566C83FE54401F5FCEC39D403C40E0351B8884FE5440E00240E49C403C4078D29C2886FE54404FC1919B9B403C40104CD07787FE54407FAAF88D9A403C4058D2D5FF88FE544030D7715C99403C40CC8754418AFE544011EB776598403C4034E9ED6F8BFE54405119C07297403C402022B65595FE5440A0CFF6AE8F403C40000D742797FE5440AFE05E3A8E403C4069CEDD3597FE5440B2546A338E403C40FCDBEC4397FE5440FF7AEE248E403C40FF92625197FE544010DB2B0F8E403C40E0FB025E97FE54407F6783F28D403C40F972FD6597FE5440CFE64BD98D403C4051A1076D97FE5440E448F2BB8D403C40B68FFF7297FE54409929049B8D403C402872C87797FE5440BF6A20778D403C40010200000014000000D8FE0D2E82FE54409026E1D4A2403C406AA6782B82FE5440EE050BBBA2403C40EBD0F92982FE5440FB07DE9FA2403C4063BE9B2982FE54407A711484A2403C409DF3602A82FE544080B86C68A2403C40E228442C82FE5440066BA44DA2403C40316E382F82FE5440A81B7334A2403C40E483293382FE54405F77851DA2403C4097BC3B3882FE5440FD402102A2403C40C5DA463E82FE5440A3D419EAA1403C40DDAB274582FE5440C924FBD5A1403C40B820B64C82FE5440815F3AC6A1403C40D4F1C66E82FE5440A0B58CAAA1403C40F406076283FE5440701DEEEAA0403C4090D4631486FE5440E02523CE9E403C40584592198BFE54408F8E69E19A403C405DA1B3248BFE5440678FF0D79A403C40685F0F308BFE544090832BD59A403C402AC9FA3C8BFE5440504E90D49A403C4044C5C8498BFE5440A00778DB9A403C40
8	Street 2	Paved	0105000020E6100000030000000102000000090000000CC85B7E7EFE5440101C79A18B403C404C0B034884FE54405046747285403C4040BDCF5485FE54403FA3AB5D84403C40409F46C786FE5440002DDB7983403C40CCF97B8C87FE54409FF3D5FD82403C40F0336D588DFE5440F048F9707F403C4054AEF9D691FE5440BFD4A0D77C403C40D89CB2F591FE5440C078B7C27C403C402C3ADA1492FE5440AF01ADBF7C403C40010200000008000000F88E38807AFE544060F22EB38C403C4018D9D8F97DFE544070BF4B0789403C4044193E6984FE54408EAEE92C82403C40F09BD32885FE5440C1023C5581403C40349E493886FE5440B048CFB980403C4068F86B758AFE54403F19411A7E403C4000B374688DFE54402F34E7537C403C4018268FFF91FE544041BA41A179403C400102000000020000005CA7D7B47AFE544050AF07748F403C40CC8803157DFE5440D03742178D403C40
9	Street 4	Paved	0105000020E61000000200000001020000000A000000043AB39A79FE5440501E6EEC85403C4060BF87767AFE54408017856F8C403C40A02D207F7AFE5440C0FA9BAF8C403C400824347F7AFE5440C65F68B08C403C401986507F7AFE5440072924B18C403C40027F747F7AFE54407FD6C9B18C403C400E019F7F7AFE5440FC8D54B28C403C4085CDCE7F7AFE5440623FC0B28C403C40027E02807AFE544040C309B38C403C40F88E38807AFE544060F22EB38C403C4001020000000500000048027D5D79FE5440D0B8035986403C40947A30377AFE5440B1B9A6B38C403C4050D674AF7AFE544020BD5A768F403C40AA842AB27AFE5440CC9ECF758F403C405CA7D7B47AFE544050AF07748F403C40
10	Street 1	Paved	0105000020E61000000500000001020000001A00000048305C5E99FE5440707292D066403C40A445A7CA98FE54401069357F69403C40EC21C39798FE544040E81B746A403C407C0FE73798FE5440C0CC70296C403C407C754C1898FE5440B01466E66C403C402C521CE497FE5440C05B753C6E403C401CDB19C497FE5440304432106F403C406CA361C197FE54407069B2206F403C4080892A3696FE5440D05BF61879403C408CFBDC2696FE54401055988379403C40A8EA1D2696FE5440E021FD9179403C402845EE2596FE5440B086ABA079403C40402B4F2696FE544070BC4AAF79403C40F0523E2796FE5440805782BD79403C400C16B62896FE5440B05EFCCA79403C404C94AD2A96FE5440605367D779403C4004E9182D96FE5440801E78E279403C401473E92F96FE544060D5EBEB79403C402871063A96FE54408099DB0B7A403C4040A0FE5597FE5440307CF94E7C403C4004B9FBF696FE5440F0E358547E403C40D0BCFCF496FE544010A848747E403C405C8A96F496FE5440C00E6E8F7E403C4044EF62F596FE5440307593AA7E403C4048C2560D97FE5440308B7A6E80403C407C8AC64097FE544060A0D89383403C4001020000002B000000405A7AD096FE5440607B3A1E6C403C4044A58DC996FE544090F39F566C403C40FC6A336B96FE544070974ABA6E403C40B086C54B95FE5440C0604AF175403C40241B274995FE544010CDF00D76403C40E462A34795FE5440C08DD62B76403C401C25434795FE5440305C4E4A76403C40948F084895FE5440F0A1A76876403C40302AEF4995FE5440707A328676403C4090F0EB4C95FE544030AD43A276403C406092ED5095FE5440708E38BC76403C408023E65A95FE5440105D81D976403C40BC12EC6595FE5440004AF5EF76403C402C2AB57195FE5440602CFDFE76403C40F411F27D95FE5440C0D3330677403C40A066508A95FE5440A0AF680577403C403489C89595FE5440E08573F276403C40146966A095FE5440C067BFD876403C409C00EBA995FE5440F0E9E4B876403C40846A5AC696FE544010628A8C6F403C40E024AACC96FE5440301C6C676F403C40087FB62D97FE5440109019CF6C403C40B0406B3097FE5440902360BB6C403C40D4D7DB3E97FE5440F01920526C403C40D8BAA74097FE5440D0462C3A6C403C408CA6E64097FE5440808C03306C403C407C06414197FE5440F00E6C216C403C400CD4DA4097FE5440B005110B6C403C407C23753F97FE54405038C6D46B403C4044FC113997FE5440D08ADCA86B403C402470E23197FE544050CEEE846B403C401001E72897FE5440D08E2C706B403C40C09ABF2797FE5440E0C92B6E6B403C402825AE1E97FE544000166E5E6B403C4018C8521E97FE5440307ECF5D6B403C4058C5251297FE5440905E6E536B403C40500E920697FE5440C094D5516B403C40A4184FFD96FE544000166E5E6B403C40082197FC96FE54400048685F6B403C40348336F196FE544010B68F766B403C4024DAD2EB96FE5440B02BB9896B403C40FCD75DD296FE5440E0CEF8136C403C40405A7AD096FE5440607B3A1E6C403C4001020000001C00000018268FFF91FE544040BA41A179403C408C8B528F93FE544090BE6EB278403C40CC05DE9993FE544000E782A478403C404802DCA393FE544000BF229178403C4004981FAD93FE5440805CA57878403C40E0237FB593FE5440B0D0785B78403C400472C0B693FE54405092675678403C40947433B893FE5440007F3F5278403C4040B9CDB993FE5440D08C1E4F78403C4088B283BB93FE544030491B4D78403C40600B49BD93FE54400037444C78403C40E4FF10BF93FE544000649F4C78403C404CB9CEC093FE5440003F2A4E78403C40CCE5010494FE5440A075A50378403C40A02EA90A94FE544010C8BBD777403C401CEE4D1694FE5440A01C3F7D77403C40941C86F794FE544020A719E071403C40C8298E8F95FE544070B5021E6E403C40A46A5AF595FE544010E2FC896B403C40B094AFF595FE544010E2FC896B403C40C00BB21596FE5440A0F93FB66A403C4008CAF85396FE5440C090A48B69403C40583FD39D96FE5440E027096168403C4030CBB3DB96FE5440808066A967403C40CC0675F296FE5440307DB47467403C4054D2660E97FE544000D7CC4467403C4058295D2397FE544020CF031967403C404490025697FE5440A04EB0B066403C4001020000001D0000002C3ADA1492FE5440B001ADBF7C403C4078331A1C92FE5440506B3FC97C403C40ECEBDC2292FE5440708F6FD77C403C405CBCF32892FE54400086DBE97C403C4010A0342E92FE5440C02F04007D403C404C567B3292FE5440A0A350197D403C406454983C92FE544000D1EF1A7E403C40487F3ABD92FE54400049C55386403C4008A1EDBE92FE544040509C6386403C40988640C192FE54407087207286403C40283423C492FE54409015EE7E86403C4004D181C792FE5440D0EAAC8986403C40D02F45CB92FE5440901E139286403C40646E53CF92FE544030EBE69786403C403829E8D892FE544030F8079A86403C40845B89EB92FE544030EBE69786403C40843060F992FE544030F8079A86403C4050DCF00A93FE5440F0D0A49386403C4084F44F1993FE5440C0A9418D86403C40E483A77993FE544080EDDD4486403C4064E48E5E95FE544030D7E2C984403C40F84F35ED95FE5440E0568F6184403C40944F950096FE544040FE6C5984403C407C7E101496FE544070220B5984403C408C91FF1896FE5440A01A9A5D84403C40A8B0B81D96FE544020D9E76484403C40BC8D232296FE544040C8CE6E84403C40946D292696FE544090F31B7B84403C40080FD62E96FE5440702400AA84403C40010200000012000000285D046A93FE5440F009EDF780403C4064B0699A93FE5440D062F2CD81403C4058D09DDD93FE54401075CD4D82403C400491652994FE5440703E076482403C40AC82377294FE544010873D0D82403C402094FDAC94FE5440E0C0A65681403C40D024C5D094FE5440F0150F5C80403C40B0BE1BD894FE5440D0089D437F403C40D461E3C194FE5440C09702387E403C40980E7E9194FE5440F03EFD617D403C40A4EE494E94FE5440A02C22E27C403C40F82D820294FE54404063E8CB7C403C40543CB0B993FE5440D01AB2227D403C40DC2AEA7E93FE544000E148D97D403C40309A225B93FE5440C08BE0D37E403C40D426E25693FE5440109A5D767F403C405000CC5393FE5440F09852EC7F403C40285D046A93FE5440F009EDF780403C40
11	Main road	Pitched	0105000020E610000003000000010200000004000000ED163A998FFE54409A516AC463403C407434959795FE54407F6D9E4E63403C40D2C999769AFE5440A81037BC62403C404CDA6AAE9FFE5440F393818F61403C40010200000002000000CDC7C2A18FFE5440C91EA27B67403C404490025697FE5440AA4EB0B066403C4001020000000300000049305C5E99FE5440707292D066403C405F02CE8B9DFE544029C3CFB365403C40D4A69FAD9FFE5440FAF3B32565403C40
\.


--
-- Data for Name: sanitary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sanitary (gid, type, pipe_mat, diamr_mm_, trench_dep, geom) FROM stdin;
1	Primary	Galvanized Iron (GI)	0	600	0105000020E61000000100000001020000000200000074AB07F495FE54401019B8D579403C40EC30AFAE98FE5440605105EE67403C40
2	Primary	Galvanized Iron (GI)	0	600	0105000020E61000000100000001020000000400000074AB07F495FE54401019B8D579403C40B4B0E88496FE5440F03C7E9B7E403C407C1B27DD96FE544000951FD383403C403414D69A97FE544090AA4A878F403C40
3	Primary	Galvanized Iron (GI)	0	600	0105000020E6100000010000000102000000030000003414D69A97FE544090AA4A878F403C40681AF0EC99FE544080CF510BAD403C4010FDFAA19CFE544060F54A11AB403C40
4	Primary	Galvanized Iron (GI)	0	600	0105000020E6100000010000000102000000040000003414D69A97FE544090AA4A878F403C40F8679DA59BFE5440204652CCA3403C4010FDFAA19CFE544060F54A11AB403C4078BD2D149EFE54405081B67CB7403C40
5	Primary	Galvanized Iron (GI)	0	600	0105000020E61000000100000001020000000200000078BD2D149EFE54405081B67CB7403C40D4E2F80E88FE5440204C74C8C8403C40
6	Primary	Galvanized Iron (GI)	0	600	0105000020E610000001000000010200000002000000D4E2F80E88FE5440204C74C8C8403C40E00802BE82FE5440C0DE7F2FAB403C40
7	Primary	Galvanized Iron (GI)	0	600	0105000020E610000001000000010200000004000000E00802BE82FE5440C0DE7F2FAB403C40E4E16CE383FE544070668F08AD403C40A81EB44A86FE5440004A1207AC403C40D89DBA3987FE544030DF90C2BC403C40
8	Primary	Galvanized Iron (GI)	0	600	0105000020E610000001000000010200000002000000ECA389B982FE544000C31F23AB403C4018BFB4797DFE544070E1A5CF8B403C40
9	Primary	Galvanized Iron (GI)	0	600	0105000020E61000000100000001020000000400000018BFB4797DFE544070E1A5CF8B403C4064D50D6C86FE54401094718A82403C40C8F8EC9B8AFE54406052BA0380403C4074AB07F495FE54401019B8D579403C40
10	Primary	Galvanized Iron (GI)	0	600	0105000020E6100000010000000102000000020000007C1B27DD96FE544000951FD383403C40A47D8E2594FE544010AE764185403C40
11	Primary	Galvanized Iron (GI)	0	600	0105000020E6100000010000000102000000020000008C3CED358EFE5440902E68F3C3403C407C1DC7838BFE5440307F3EB498403C40
12	Primary	Galvanized Iron (GI)	0	600	0105000020E610000001000000010200000003000000C861DE1A81FE5440B0573C6AA1403C407C1DC7838BFE5440307F3EB498403C403414D69A97FE544090AA4A878F403C40
13	Primary	Galvanized Iron (GI)	0	600	0105000020E610000001000000010200000002000000F0C5EF5094FE544050D3BD27BF403C40E07B07C691FE544050BA3CF493403C40
14	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000F83E6A8D91FE54409019713B7C403C40E8E19F2B91FE5440808B7FFF7D403C40
15	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000F83E6A8D91FE54409019713B7C403C4064D542EF90FE5440F02D598979403C40
16	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000F83E6A8D91FE54409019713B7C403C4018C21EC992FE5440C0BB624878403C40
17	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000007496EB4C8EFE54405055F1007E403C4054EFEC848DFE544030BB5C1C80403C40
18	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000007496EB4C8EFE54405055F1007E403C401C8600568FFE5440D013BA647F403C40
19	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000007496EB4C8EFE54405055F1007E403C409824E73E8DFE544020F797487B403C40
20	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000007496EB4C8EFE54405055F1007E403C40C44329198FFE5440300B9E517A403C40
21	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000090BAA4DE8AFE5440102362DF7F403C4000EBD0CC89FE5440C065306B82403C40
22	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000090BAA4DE8AFE5440102362DF7F403C408C58D9B38BFE54405063BA5B81403C40
23	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000090BAA4DE8AFE5440102362DF7F403C40E036818989FE5440506A4FB67D403C40
24	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000090BAA4DE8AFE5440102362DF7F403C40D003376B8BFE5440002CC9C67C403C40
25	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000009884584587FE5440101C570782403C40BC9BA03C86FE5440801004BA84403C40
26	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000009884584587FE5440101C570782403C404827B11388FE544030E181C283403C40
27	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000009884584587FE5440101C570782403C4078B1AEE885FE54409079652A80403C40
28	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000009884584587FE5440101C570782403C4038E513C187FE5440B0F4A4057F403C40
29	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000094F01AAB83FE5440A018E56485403C4090DC7C5B82FE5440F067549383403C40
30	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000094F01AAB83FE5440A018E56485403C403083DE3A84FE54407027589481403C40
31	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000094F01AAB83FE5440A018E56485403C40345071AA82FE5440501766E887403C40
32	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000094F01AAB83FE5440A018E56485403C40F8F5887384FE5440F013355186403C40
33	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000006815185780FE5440608ABAD788403C40048249D17EFE544000616D5187403C40
34	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000006815185780FE5440608ABAD788403C40CC185DA280FE5440E0186F5685403C40
35	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000400000018BFB4797DFE544070E1A5CF8B403C402C7931417DFE5440F09372C789403C40AC2B54187DFE544070DD748388403C40D4D3A8197DFE5440309CCF7888403C40
36	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000018BFB4797DFE544070E1A5CF8B403C4010BB474A7BFE544020B2BBE98A403C40
37	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000018BFB4797DFE544070E1A5CF8B403C4024C211AC7DFE544050011C1390403C40
38	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000018BFB4797DFE544070E1A5CF8B403C40886A6FEB7EFE5440A00CEF738E403C40
39	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000C4B0DE977FFE5440C05C137398403C401CF3F7A97FFE5440E0416D869B403C40
40	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000C4B0DE977FFE5440C05C137398403C40C8413DA67EFE5440D0A1E0C695403C40
41	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000C4B0DE977FFE5440C05C137398403C4070584CD87FFE544070DE99B293403C40
42	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000C861DE1A81FE5440B0573C6AA1403C40CC87826980FE5440100956FDA1403C40
43	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000080ADB15583FE5440F0E9918C9F403C404829DCCF83FE5440A0216A73A1403C40
44	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000080ADB15583FE5440F0E9918C9F403C40D47265B984FE5440806BC3C3A0403C40
45	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000080ADB15583FE5440F0E9918C9F403C40701E2E0783FE54400006C5339D403C40
46	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000080ADB15583FE5440F0E9918C9F403C407C7FF3A183FE5440106130FE9B403C40
47	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000F4E764BF86FE5440108B75B19C403C401C84DFC085FE5440B0B8D2BE9A403C40
48	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000F4E764BF86FE5440108B75B19C403C403C11268487FE544070D89D9199403C40
49	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000F4E764BF86FE5440108B75B19C403C4064B361B886FE544020B4618C9F403C40
50	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000007C1DC7838BFE5440307F3EB498403C40ECF5A51F8BFE5440C0FF02D396403C40
51	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000024E40DB789FE544010DEC6359A403C402C918B6888FE544030E2AFA498403C40
52	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000024E40DB789FE544010DEC6359A403C40F0A67A4289FE544080B2DEE397403C40
53	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000001E04EE8BFE544040AF7C5C9F403C40846DDF1A8BFE544010296EAA9E403C40
54	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000001E04EE8BFE544040AF7C5C9F403C402873BDC18CFE5440805632B59B403C40
55	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000709E598A8CFE5440E0AA5928A9403C40D0E331CE8BFE54405034C75CA6403C40
56	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000709E598A8CFE5440E0AA5928A9403C40ACC4A2E98BFE5440C0725F04AC403C40
57	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000709E598A8CFE5440E0AA5928A9403C40EC8FC49E8DFE5440E0012686A8403C40
58	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000709E598A8CFE5440E0AA5928A9403C404C5AFB328DFE5440301325A1A2403C40
59	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000246C82478DFE544080E9C902B5403C40A00A86C68CFE5440204B33B1B8403C40
60	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000246C82478DFE544080E9C902B5403C407CCC15578CFE544080530E3BB1403C40
61	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000246C82478DFE544080E9C902B5403C40107377368EFE5440600EAA47B5403C40
62	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000246C82478DFE544080E9C902B5403C40741FA6DA8DFE544040A4570BAE403C40
63	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000008C3CED358EFE5440902E68F3C3403C4084F1395C8DFE5440D0098DBDC7403C40
64	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000008C3CED358EFE5440902E68F3C3403C4074AC345E8FFE5440D0FD9EA2C5403C40
65	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000008C3CED358EFE5440902E68F3C3403C4054EB5A1B8DFE544090E5C26CC1403C40
66	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000030000003832131A8BFE544040238264C6403C40385CB1798AFE54404067D624C9403C40D4D2AE7E8AFE54404067D624C9403C40
67	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000003832131A8BFE544040238264C6403C402849DC1C8CFE5440204813ADC8403C40
68	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000003832131A8BFE544040238264C6403C40541D199C8AFE5440101A7CBFC2403C40
69	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000D4E2F80E88FE5440204C74C8C8403C400C0947A287FE5440F0396C6DC9403C40
70	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000D4E2F80E88FE5440204C74C8C8403C402C05AF8688FE5440A0B14A2FCC403C40
71	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000006CAA2F0586FE5440001A7E6FBD403C405CF990D284FE5440E011B49ABD403C40
72	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000006CAA2F0586FE5440001A7E6FBD403C4020120DD685FE54408030D744C1403C40
73	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000E4C47EA584FE5440001782C9B5403C40BC95682A83FE544010521AF3B4403C40
74	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000E4C47EA584FE5440001782C9B5403C40DC50CB5F84FE5440D0189BDCB9403C40
75	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000D89DBA3987FE544030DF90C2BC403C407C3F5A2488FE5440305930CEBA403C40
76	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000D89DBA3987FE544030DF90C2BC403C40385A3ABB87FE54401028CF56B4403C40
77	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000A81EB44A86FE5440004A1207AC403C4074883A7487FE5440208B9909B0403C40
78	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000A81EB44A86FE5440004A1207AC403C4040CD6F0B87FE544020F06980AA403C40
79	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000ECA389B982FE544000C31F23AB403C4094702EA581FE544020F06980AA403C40
80	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000007C849B1F8EFE5440606467B996403C4008E2ACDF8CFE544060E4E39E95403C40
81	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000007C849B1F8EFE5440606467B996403C40641BF6AB8EFE544030855DF193403C40
82	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000E07B07C691FE544050BA3CF493403C4094ADBE6890FE544010150F9492403C40
83	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000E07B07C691FE544050BA3CF493403C40D43CD03D92FE544070006D3391403C40
84	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000A47D8E2594FE544010AE764185403C407CE6766B93FE54400081EA2F87403C40
85	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000A47D8E2594FE544010AE764185403C40A85A373895FE544030B5EFD585403C40
86	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000007C1B27DD96FE544000951FD383403C40C046709D97FE5440C09624E782403C40
87	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000003414D69A97FE544090AA4A878F403C40105F078A98FE5440308DE1888A403C40
88	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000DCF6621892FE5440B01A906B99403C40F4BE9B4191FE544060E1A50598403C40
89	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000DCF6621892FE5440B01A906B99403C40E09075DC92FE544060A58CE796403C40
90	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000A8529AA692FE54409001F2DBA2403C4084AA858C91FE5440E02066E89F403C40
91	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000A8529AA692FE54409001F2DBA2403C40B88D382492FE5440E0D41175A6403C40
92	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000A8529AA692FE54409001F2DBA2403C4024AF71AB93FE5440501CF5B5A4403C40
93	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000A8529AA692FE54409001F2DBA2403C40942E946793FE5440D04CB7489F403C40
94	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000D08C4A6C93FE5440C07ED9FAAF403C405C96F5A792FE5440900059AEB3403C40
95	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000D08C4A6C93FE5440C07ED9FAAF403C409854F48A92FE544050A506EBAC403C40
96	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000D08C4A6C93FE5440C07ED9FAAF403C4060FCFB9294FE544040C2D2BEB2403C40
97	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000D08C4A6C93FE5440C07ED9FAAF403C40B402430794FE544000A2D9D2AA403C40
98	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000648B00B591FE5440E0CF5E34C1403C40D8B0CC0091FE544010AB22D6C3403C40
99	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000648B00B591FE5440E0CF5E34C1403C40E461E7C392FE5440F08AA4D6C2403C40
100	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000648B00B591FE5440E0CF5E34C1403C40100035A48FFE54403070517CBE403C40
101	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000F0C5EF5094FE544050D3BD27BF403C40F0BE39E292FE544040A9D092B9403C40
102	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000F0C5EF5094FE544050D3BD27BF403C4010C9A83695FE5440004F94F6C2403C40
103	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000000CA8C26897FE5440A0CACDB9BC403C40B41F4F1797FE544070087B23B9403C40
104	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000000CA8C26897FE5440A0CACDB9BC403C4070FE1ECE96FE5440C01EF3C5BE403C40
105	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000000CA8C26897FE5440A0CACDB9BC403C403434F17798FE54400017E88BBD403C40
106	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000503523369BFE544090E443BDB9403C4024A0E89F9AFE5440506F9709BD403C40
107	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000503523369BFE544090E443BDB9403C4018AB1B339CFE5440D020529ABB403C40
108	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000503523369BFE544090E443BDB9403C40045C717399FE544040633CFFB6403C40
109	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000078BD2D149EFE54405081B67CB7403C4024C82C049EFE5440106F1672C2403C40
110	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000078BD2D149EFE54405081B67CB7403C40EC0B96319FFE54400031111ABC403C40
111	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000078BD2D149EFE54405081B67CB7403C405CA30AB39EFE5440D01CD46BB2403C40
112	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000010FDFAA19CFE544060F54A11AB403C4044A228F29DFE5440C06968AEAC403C40
113	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E61000000100000001020000000200000010FDFAA19CFE544060F54A11AB403C40A4472E3F9DFE5440801AFF46A6403C40
114	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000BC257B029BFE544090B5AB40AC403C4074C8785B9AFE5440C01DE008AE403C40
115	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000BC257B029BFE544090B5AB40AC403C40A4CADBB29BFE5440300D65FDAD403C40
116	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000008C6470AC99FE5440901FFFD6A9403C40083D151B99FE544030C9C896AB403C40
117	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000008C6470AC99FE5440901FFFD6A9403C40C88A75E698FE5440600BAFEFA6403C40
118	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000A81513C698FE5440E07620659E403C40303A206098FE54405042250CA0403C40
119	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000A81513C698FE5440E07620659E403C40EC6CD52998FE544000C2D5199A403C40
120	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E610000001000000010200000002000000645B552F98FE54402086F0E796403C4094A18BAB97FE5440E0C9F3B793403C40
121	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000004029F75F9BFE5440F03A0E6FA2403C40606885779CFE5440700361AEA0403C40
122	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000004029F75F9BFE5440F03A0E6FA2403C40848EE18F9BFE5440706651999B403C40
123	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000007C5B010C99FE5440E07F89C296403C401041A0A49AFE5440E0E7983D96403C40
124	Secondary	Chlorinated PolyVinyl Chloride (CPVC)	20	\N	0105000020E6100000010000000102000000020000007C5B010C99FE5440E07F89C296403C400C4A2D8F99FE5440C01EA24490403C40
\.


--
-- Data for Name: sanitary_junction_point; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sanitary_junction_point (gid, junction_p, geom) FROM stdin;
1	Junction Point	0101000020E610000074AB07F495FE54401019B8D579403C40
2	Junction Point	0101000020E61000007C1B27DD96FE544000951FD383403C40
3	Junction Point	0101000020E6100000A47D8E2594FE544010AE764185403C40
4	Junction Point	0101000020E6100000F83E6A8D91FE54409019713B7C403C40
5	Junction Point	0101000020E61000007496EB4C8EFE54405055F1007E403C40
6	Junction Point	0101000020E610000090BAA4DE8AFE5440102362DF7F403C40
7	Junction Point	0101000020E61000009884584587FE5440101C570782403C40
8	Junction Point	0101000020E610000094F01AAB83FE5440A018E56485403C40
9	Junction Point	0101000020E61000006815185780FE5440608ABAD788403C40
10	Junction Point	0101000020E610000018BFB4797DFE544070E1A5CF8B403C40
11	Junction Point	0101000020E6100000C4B0DE977FFE5440C05C137398403C40
12	Junction Point	0101000020E6100000C861DE1A81FE5440B0573C6AA1403C40
13	Junction Point	0101000020E610000080ADB15583FE5440F0E9918C9F403C40
14	Junction Point	0101000020E6100000F4E764BF86FE5440108B75B19C403C40
15	Junction Point	0101000020E610000024E40DB789FE544010DEC6359A403C40
16	Junction Point	0101000020E61000007C1DC7838BFE5440307F3EB498403C40
17	Junction Point	0101000020E61000007C849B1F8EFE5440606467B996403C40
18	Junction Point	0101000020E6100000E07B07C691FE544050BA3CF493403C40
19	Junction Point	0101000020E61000003414D69A97FE544090AA4A878F403C40
20	Junction Point	0101000020E61000007C5B010C99FE5440E07F89C296403C40
21	Junction Point	0101000020E61000004029F75F9BFE5440F03A0E6FA2403C40
22	Junction Point	0101000020E610000010FDFAA19CFE544060F54A11AB403C40
23	Junction Point	0101000020E6100000BC257B029BFE544090B5AB40AC403C40
24	Junction Point	0101000020E61000008C6470AC99FE5440901FFFD6A9403C40
25	Junction Point	0101000020E6100000A81513C698FE5440E07620659E403C40
26	Junction Point	0101000020E6100000625B552F98FE54400686F0E796403C40
27	Junction Point	0101000020E6100000DCF6621892FE5440B01A906B99403C40
28	Junction Point	0101000020E6100000A8529AA692FE54409001F2DBA2403C40
29	Junction Point	0101000020E6100000D08C4A6C93FE5440C07ED9FAAF403C40
30	Junction Point	0101000020E6100000F0C5EF5094FE544050D3BD27BF403C40
31	Junction Point	0101000020E61000000CA8C26897FE5440A0CACDB9BC403C40
32	Junction Point	0101000020E6100000503523369BFE544090E443BDB9403C40
33	Junction Point	0101000020E610000078BD2D149EFE54405081B67CB7403C40
34	Junction Point	0101000020E6100000648B00B591FE5440E0CF5E34C1403C40
35	Junction Point	0101000020E61000008C3CED358EFE5440902E68F3C3403C40
36	Junction Point	0101000020E61000003832131A8BFE544040238264C6403C40
37	Junction Point	0101000020E6100000D4E2F80E88FE5440204C74C8C8403C40
38	Junction Point	0101000020E61000006CAA2F0586FE5440001A7E6FBD403C40
39	Junction Point	0101000020E6100000E4C47EA584FE5440001782C9B5403C40
40	Junction Point	0101000020E6100000ECA389B982FE544000C31F23AB403C40
41	Junction Point	0101000020E6100000A81EB44A86FE5440004A1207AC403C40
42	Junction Point	0101000020E6100000D89DBA3987FE544030DF90C2BC403C40
43	Junction Point	0101000020E6100000246C82478DFE544080E9C902B5403C40
44	Junction Point	0101000020E6100000709E598A8CFE5440E0AA5928A9403C40
45	Junction Point	0101000020E6100000001E04EE8BFE544040AF7C5C9F403C40
\.


--
-- Data for Name: sewer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sewer (gid, type, pipe_type, p_diam_mm_, geom) FROM stdin;
1	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E61000000100000001020000000300000074D507C397FE5440402C86056A403C40C8E8AC8694FE544070E6780670403C402C72AF8194FE5440000C83F26F403C40
2	Sedimentation Filter	\N	0	0105000020E610000001000000010200000005000000B8CE0DC893FE5440B0D054F570403C4020F693A893FE5440D0E4CF7F6E403C40A46AAD8594FE5440E0BAEECE6D403C403C4327A594FE5440C0A6734470403C40B8CE0DC893FE5440B0D054F570403C40
3	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000002000000405EEF0394FE5440D030E4D271403C40143F78F293FE54405069C31B70403C40
4	Septic Tank	\N	0	0105000020E6100000010000000102000000050000001C2694BB93FE544080A062C974403C40C06A611F94FE5440207B58DD74403C40ECF2922A94FE5440D0EBDD5D71403C4054AEC5C693FE54406011E84971403C401C2694BB93FE544080A062C974403C40
5	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000003000000407CF7F393FE544040083A2E74403C4064A3D72198FE544040BF08B58F403C40D0E6D66E9AFE5440B06A9FCB9B403C40
6	Septic Tank	\N	0	0105000020E610000001000000010200000005000000EC5A42979AFE544000E4DB82A8403C4064CB605B9AFE5440203C4EAAA5403C40B44BFFCD9AFE5440F0D59213A5403C4048DBE0099BFE5440007E20ECA7403C40EC5A42979AFE544000E4DB82A8403C40
7	Soak Pit	\N	0	0105000020E610000001000000010200000025000000D7F06A479AFE54409F85AD7BA3403C40213CA94F9AFE5440C403CB78A3403C40A568A7579AFE5440A2EE3970A3403C405D4A275F9AFE5440F4E83C62A3403C409E8BEE659AFE544078C1404FA3403C40D972C86B9AFE54408B24D937A3403C40B87C87709AFE5440871FBC1CA3403C4024BE06749AFE5440A898BCFEA2403C406C032B769AFE544099E6C3DEA2403C40E3A3E3769AFE54406FB9CABDA2403C406C032B769AFE5440458CD19CA2403C4024BE06749AFE544036DAD87CA2403C40B87C87709AFE54405753D95EA2403C40D972C86B9AFE5440534EBC43A2403C409E8BEE659AFE544066B1542CA2403C405D4A275F9AFE5440EA895819A2403C40A568A7579AFE54403C845B0BA2403C40213CA94F9AFE54401A6FCA02A2403C40D7F06A479AFE54403FEDE7FFA1403C408DA52C3F9AFE54401A6FCA02A2403C4009792E379AFE54403C845B0BA2403C405197AE2F9AFE5440EA895819A2403C401056E7289AFE544066B1542CA2403C40D56E0D239AFE5440534EBC43A2403C40F6644E1E9AFE54405753D95EA2403C408A23CF1A9AFE544036DAD87CA2403C4042DEAA189AFE5440458CD19CA2403C40CB3DF2179AFE54406FB9CABDA2403C4042DEAA189AFE544099E6C3DEA2403C408A23CF1A9AFE5440A898BCFEA2403C40F6644E1E9AFE5440871FBC1CA3403C40D56E0D239AFE54408B24D937A3403C401056E7289AFE544078C1404FA3403C405197AE2F9AFE5440F4E83C62A3403C4009792E379AFE5440A2EE3970A3403C408DA52C3F9AFE5440C403CB78A3403C40D7F06A479AFE54409F85AD7BA3403C40
8	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E6100000010000000102000000020000004CE444929AFE544060DE34DCA5403C408C35EC449AFE54407023A20DA3403C40
9	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000002000000CCAF5CE19AFE5440A09A5299A7403C40603328669CFE544010CAB0DCA6403C40
10	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000002000000783538AB9AFE5440D024DABCA7403C40508F1D7F99FE54405020D3F8A8403C40
11	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000002000000BC89DCD098FE5440F0FBA4EA9D403C40508F1D7F99FE5440609ED2F9A8403C40
12	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000002000000603328669CFE544010CAB0DCA6403C4070068B629EFE5440C02C0DA4B7403C40
13	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E61000000100000001020000000500000070068B629EFE5440C02C0DA4B7403C4008BC52D29CFE54408066F9E4B8403C40FCF7E34F9BFE544060346110BA403C4090D9743F97FE5440B07B5945BD403C4008C8A6918AFE5440105B8490C7403C40
14	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000003000000704D0F9A87FE544040401A1EC8403C40B46000C484FE5440407B4904B8403C40985D796081FE54409090EE73A4403C40
15	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E61000000100000001020000000200000004FA610C80FE5440B0C23F6B98403C4060AFC1EE7DFE5440509BA3BB8A403C40
16	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000004000000C43F216A7CFE544090BA28668C403C40E09BC20285FE54405071F4F682403C407C4891B390FE544040E999CA7B403C40E092B95793FE544070EF12137A403C40
17	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000002000000E092B95793FE544070EF12137A403C4080126C2994FE5440C07B508E75403C40
18	Soak Pit	\N	0	0105000020E610000001000000010200000025000000009AABA885FE544061012D73B3403C40EACB98B485FE54408D86006FB3403C40C33829C085FE54402B8D9B62B3403C4015ED02CB85FE5440FD7D5E4EB3403C40B382D1D485FE544084C5E632B3403C4034B148DD85FE5440810B0A11B3403C40529F26E485FE54400BB5CFE9B2403C401EE335E985FE5440C1E368BEB2403C4076214FEC85FE54405C302790B2403C402B405AED85FE5440B5687260B2403C4076214FEC85FE54400EA1BD30B2403C401EE335E985FE5440A9ED7B02B2403C40529F26E485FE54405F1C15D7B1403C4034B148DD85FE5440E9C5DAAFB1403C40B382D1D485FE5440E60BFE8DB1403C4016ED02CB85FE54406D538672B1403C40C33829C085FE54403F44495EB1403C40EACB98B485FE5440DD4AE451B1403C40009AABA885FE544009D0B74DB1403C401668BE9C85FE5440DD4AE451B1403C403DFB2D9185FE54403F44495EB1403C40EB46548685FE54406D538672B1403C404DB1857C85FE5440E60BFE8DB1403C40CC820E7485FE5440E9C5DAAFB1403C40AE94306D85FE54405F1C15D7B1403C40E250216885FE5440A9ED7B02B2403C408A12086585FE54400EA1BD30B2403C40D5F3FC6385FE5440B5687260B2403C408A12086585FE54405C302790B2403C40E250216885FE5440C1E368BEB2403C40AE94306D85FE54400BB5CFE9B2403C40CC820E7485FE5440810B0A11B3403C404DB1857C85FE544084C5E632B3403C40EB46548685FE5440FD7D5E4EB3403C403DFB2D9185FE54402B8D9B62B3403C401668BE9C85FE54408D86006FB3403C40009AABA885FE544061012D73B3403C40
19	Septic Tank	\N	0	0105000020E610000001000000010200000005000000C41716F185FE544040DE91E9B8403C40B8712EC185FE54409023FF1AB6403C40CCCE022E86FE5440006BE9A6B5403C40D874EA5D86FE5440C0257C75B8403C40C41716F185FE544040DE91E9B8403C40
20	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000002000000C4F90D0186FE5440C0ABDE5AB6403C40DC6C44C285FE54403030625FB3403C40
21	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E61000000100000001020000000200000088EE0A0786FE544050CED269B8403C402CF218FC84FE5440D09C7EA7BA403C40
22	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000002000000188DF03A86FE54404064FB19B8403C4088016DEC87FE5440B0A9A02FB9403C40
23	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000002000000F8F5E38685FE544050193E71B1403C40E05329AB82FE5440A01809E9AB403C40
24	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E61000000100000001020000000200000090C3DAAB86FE5440B021D55EB8403C40642A56F985FE5440609633A7AC403C40
25	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E6100000010000000102000000040000009440702B85FE5440DDD5064B9D403C40DC0C863F8AFE54407DF7CD2399403C402CBA822492FE54405D33FBE392403C4008EF9F0098FE54408D9978978E403C40
26	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E610000001000000010200000002000000BC033EF78DFE54400007D040BA403C404CBF27CA8BFE5440707FEAF597403C40
27	Primary	Reinforced Cement Concrete(RCC)	200	0105000020E6100000010000000102000000020000005CDE162B94FE5440F0B00035B6403C404C20B41C92FE5440A04D29EA92403C40
28	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000704D0F9A87FE544040401A1EC8403C40E41AB76987FE5440E0BF8CD8CA403C40
29	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000704D0F9A87FE544040401A1EC8403C4080E23F5488FE5440A0104857CD403C40
30	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E61000000100000001020000000200000008C8A6918AFE5440105B8490C7403C4044652B748AFE54404068EA17CC403C40
31	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E61000000100000001020000000200000008C8A6918AFE5440105B8490C7403C40403972E08BFE5440204927A0CB403C40
32	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A83CC46E8EFE544080467C6DC4403C40F8BB5D008EFE544070D9A8A9C8403C40
33	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A83CC46E8EFE544080467C6DC4403C40CC57958A8FFE544010314B6AC7403C40
34	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000F8F74ADD91FE544000C93CA4C1403C4080680F7391FE54404055D813C5403C40
35	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000F8F74ADD91FE544000C93CA4C1403C40881E4EEF92FE5440E042A384C3403C40
36	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000001C3B5AA095FE5440B0065C96BE403C4018E0BF1D95FE5440307412F3C1403C40
37	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000001C3B5AA095FE5440B0065C96BE403C40CCEEF3AE96FE5440B0CAF92BC0403C40
38	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000182AF1D299FE54401003F93CBB403C406C8AC30599FE544090054F84BF403C40
39	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000182AF1D299FE54401003F93CBB403C40C86E31259AFE54405021E164BE403C40
40	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000182AF1D299FE54401003F93CBB403C4078DD3B1399FE54402046CA8BB7403C40
41	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000182AF1D299FE54401003F93CBB403C403C9052369AFE5440801A4992B6403C40
42	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E61000000100000001020000000200000070068B629EFE5440C02C0DA4B7403C40CC93D636A0FE5440009CB56BBB403C40
43	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E61000000100000001020000000200000070068B629EFE5440C02C0DA4B7403C4098FCB70B9DFE5440B02BF93DBC403C40
44	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000945481CA9DFE5440E0377B9FB2403C40FC99FED19EFE5440002976E3B1403C40
45	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000945481CA9DFE5440E0377B9FB2403C4008E77F7B9EFE544060DBD97FAE403C40
46	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000603328669CFE544010CAB0DCA6403C401C9922469DFE5440803AA2DFA5403C40
47	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000603328669CFE544010CAB0DCA6403C404884A1E99CFE5440C04412EBA2403C40
48	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000508F1D7F99FE54405020D3F8A8403C4080358A9898FE5440D08ABDE4A9403C40
49	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000508F1D7F99FE5440609ED2F9A8403C4038488F8E98FE5440402046C7AC403C40
50	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000BC89DCD098FE5440F0FBA4EA9D403C40602F5FF197FE5440B04EE7C49D403C40
51	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000BC89DCD098FE5440F0FBA4EA9D403C4074B2CE1198FE544020CBF3A39F403C40
52	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000D0E6D66E9AFE5440B06A9FCB9B403C4010F901849BFE544080331DF79A403C40
53	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000D0E6D66E9AFE5440B06A9FCB9B403C4094B6A1F19AFE544080A4DB8897403C40
54	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000000CEF9F0098FE5440B09978978E403C40F8A18B9199FE5440F0BD54288F403C40
55	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000000CEF9F0098FE5440B09978978E403C4078FEE9D798FE544020A9A9898C403C40
56	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000005C3BDF4597FE544050E879208F403C40D02536AF96FE54404081A8F08C403C40
57	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000005C3BDF4597FE544050E879208F403C40A49DEE3B97FE5440B0A5724193403C40
58	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000004C20B41C92FE5440A04D29EA92403C4094BC57BA92FE5440604A08A390403C40
59	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000004C20B41C92FE5440A04D29EA92403C40DC227A7293FE5440D0BA266790403C40
60	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000003000000C8203BED8FFE544060EB0AA594403C40E066990290FE544070226CDA90403C407CDD960790FE544060B8948A90403C40
61	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000C8203BED8FFE544060EB0AA594403C40A05A43B48EFE5440E07FB54192403C40
62	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000004CBF27CA8BFE5440707FEAF597403C40305BE3818BFE5440F08BA35C94403C40
63	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000004CBF27CA8BFE5440707FEAF597403C40BC86647B8CFE5440D0B7F4BC93403C40
64	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000009840702B85FE544000D6064B9D403C4058F2FF6684FE5440E090DACE9B403C40
65	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000009840702B85FE544000D6064B9D403C407CDF923D85FE5440D08A63C19A403C40
66	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000003CA7227888FE544030B839989A403C40B07A89EF87FE5440F08E342699403C40
67	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000003CA7227888FE544030B839989A403C4068FC21BB88FE544070C8CEF697403C40
68	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000003CA7227888FE544030B839989A403C40BC3E790F88FE544090406AA39E403C40
69	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000003CA7227888FE544030B839989A403C4018C9CE5E89FE54406030AB239E403C40
70	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E61000000100000001020000000200000004FA610C80FE5440B0C23F6B98403C404064080F81FE5440503FB39198403C40
71	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E61000000100000001020000000200000004FA610C80FE5440B0C23F6B98403C4028FA30BF80FE54406092693395403C40
72	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E61000000100000001020000000200000004FA610C80FE5440B0C23F6B98403C403886E1637FFE544020BE35809B403C40
73	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E61000000100000001020000000200000004FA610C80FE5440B0C23F6B98403C4014A32ECC7EFE5440706D7A0199403C40
74	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000985D796081FE54409090EE73A4403C40ACB61EE380FE544030EBB8DEA7403C40
75	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000985D796081FE54409090EE73A4403C4088A65F6380FE5440305C7770A4403C40
76	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000BC033EF78DFE54400007D040BA403C406088C8118FFE5440B07729E1BA403C40
77	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000BC033EF78DFE54400007D040BA403C4054E2E0E18EFE54403000A9EEB7403C40
78	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000BC033EF78DFE54400007D040BA403C40447CDAF68CFE544080EB783CBC403C40
79	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000BC033EF78DFE54400007D040BA403C40E42EE8DB8CFE544090B27E39BA403C40
80	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000DC2A472E8DFE5440D00FE7E1AD403C40F874402E8CFE54403028B038AF403C40
81	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000DC2A472E8DFE5440D00FE7E1AD403C4094BA60E68DFE544010DCE0D8AE403C40
82	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000DC2A472E8DFE5440D00FE7E1AD403C40286D6ECB8DFE5440B0459D6EAB403C40
83	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000DC2A472E8DFE5440D00FE7E1AD403C40A0F061EC8BFE5440006AECD2AA403C40
84	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000030000006C7CA45E8CFE54400011DD19A1403C40E42EE8DB8CFE5440C0C4F7AFA1403C4080F140008DFE5440002827E2A1403C40
85	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000006C7CA45E8CFE54400011DD19A1403C403C222EEC8CFE5440201D7FB09E403C40
86	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000006C7CA45E8CFE54400011DD19A1403C40DC78A95F8BFE544060BADFD6A3403C40
87	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000006C7CA45E8CFE54400011DD19A1403C4080FEAA5C8BFE544010706BCCA0403C40
88	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A0BB22AC92FE5440307804889C403C40EC47AF3293FE5440D031E7179D403C40
89	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A0BB22AC92FE5440307804889C403C408CFABC1793FE544060BA66259A403C40
90	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A0BB22AC92FE5440307804889C403C40A4B379A491FE5440905967139E403C40
91	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A0BB22AC92FE5440307804889C403C4050028F7A91FE54408001AA989B403C40
92	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000005CDE162B94FE5440F0B00035B6403C40DC7FEEAD94FE5440A08408CEB6403C40
93	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000005CDE162B94FE5440F0B00035B6403C40481BB59094FE5440D06C97D1B3403C40
94	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000005CDE162B94FE5440F0B00035B6403C408409C10F93FE544010787AE5B7403C40
95	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000005CDE162B94FE5440F0B00035B6403C403867DADD92FE5440E06B8CCAB5403C40
96	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000C870527393FE544070F8D5E2A9403C40A8F653E693FE544020F15F54AA403C40
97	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000C870527393FE544070F8D5E2A9403C407CA560CD93FE5440E07A9AE9A7403C40
98	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000C870527393FE544070F8D5E2A9403C4074D1196192FE5440B022585BAC403C40
99	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000C870527393FE544070F8D5E2A9403C40DC8C4CFD91FE544030B920D9A8403C40
100	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000B42D0D2290FE54408064E3237C403C402C11A8C98FFE5440600D9D4280403C40
101	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000B42D0D2290FE54408064E3237C403C4034442BBF90FE544040C1CDE27F403C40
102	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000B42D0D2290FE54408064E3237C403C40A481C68D8FFE54409059F1B579403C40
103	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000B42D0D2290FE54408064E3237C403C40940E625390FE5440A02CE5CD79403C40
104	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000E092B95793FE544070EF12137A403C40E0A3EA3593FE544000E5846577403C40
105	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000006846775D8CFE54407051BF737E403C4070E781258CFE54402066F84F82403C40
106	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000006846775D8CFE54407051BF737E403C40205A16F98CFE5440F0CD599081403C40
107	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000006846775D8CFE54407051BF737E403C4058419AF58BFE5440804AEB827C403C40
108	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000006846775D8CFE54407051BF737E403C40080E47998CFE5440609444D37B403C40
109	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000C43F216A7CFE544090BA28668C403C402C599ACF7CFE5440F05169BD8F403C40
110	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000C43F216A7CFE544090BA28668C403C40A0434A027CFE54401044F35189403C40
111	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E61000000100000001020000000200000060AFC1EE7DFE5440509BA3BB8A403C40A0F464C57DFE5440F082190F87403C40
112	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E61000000100000001020000000200000060AFC1EE7DFE5440509BA3BB8A403C4054B20D717EFE5440D0454EA786403C40
113	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000008852DAB381FE544040C4709886403C406CF40B5981FE5440B01453028A403C40
114	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000008852DAB381FE544040C4709886403C4078FA826682FE54401053A95889403C40
115	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000008852DAB381FE544040C4709886403C40E48BF24581FE5440E07BB7E083403C40
116	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E6100000010000000102000000020000008852DAB381FE544040C4709886403C40A0AFD6C181FE544040B879CF83403C40
117	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A882712F85FE5440C0A889DB82403C40549C0BCB84FE544080B7D90187403C40
118	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A882712F85FE5440C0A889DB82403C403C38F7EE85FE544030AB1B8086403C40
119	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A882712F85FE5440C0A889DB82403C40A870229E84FE54409035F6E280403C40
120	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A882712F85FE5440C0A889DB82403C40BC8F317C85FE544040F76FF37F403C40
121	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A0D463AF88FE5440A076CBB580403C40282E508788FE5440A0F091EF84403C40
122	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A0D463AF88FE5440A076CBB580403C40703FCA8E89FE5440404834B083403C40
123	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A0D463AF88FE5440A076CBB580403C400CF1841F88FE5440A03CE6627E403C40
124	Secondary	PolyVinyl Chloride (PVC)	150	0105000020E610000001000000010200000002000000A0D463AF88FE5440A076CBB580403C40D409012389FE5440A02C27E37D403C40
\.


--
-- Data for Name: sewer_junction_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sewer_junction_points (gid, man_hole, geom) FROM stdin;
1	\N	0101000020E610000080126C2994FE5440C07B508E75403C40
2	\N	0101000020E6100000E092B95793FE544070EF12137A403C40
3	\N	0101000020E6100000B42D0D2290FE54408064E3237C403C40
4	\N	0101000020E61000006846775D8CFE54407051BF737E403C40
5	\N	0101000020E6100000A0D463AF88FE5440A076CBB580403C40
6	\N	0101000020E6100000A882712F85FE5440C0A889DB82403C40
7	\N	0101000020E61000008852DAB381FE544040C4709886403C40
8	\N	0101000020E610000060AFC1EE7DFE5440509BA3BB8A403C40
9	\N	0101000020E6100000C43F216A7CFE544090BA28668C403C40
10	\N	0101000020E610000004FA610C80FE5440B0C23F6B98403C40
11	\N	0101000020E61000009440702B85FE5440DDD5064B9D403C40
12	\N	0101000020E61000003CA7227888FE544030B839989A403C40
13	\N	0101000020E61000004CBF27CA8BFE5440707FEAF597403C40
14	\N	0101000020E6100000C8203BED8FFE544060EB0AA594403C40
15	\N	0101000020E61000004C20B41C92FE5440A04D29EA92403C40
16	\N	0101000020E61000005C3BDF4597FE544050E879208F403C40
17	\N	0101000020E610000008EF9F0098FE54408D9978978E403C40
18	\N	0101000020E6100000A0BB22AC92FE5440307804889C403C40
19	\N	0101000020E6100000C870527393FE544070F8D5E2A9403C40
20	\N	0101000020E61000005CDE162B94FE5440F0B00035B6403C40
21	\N	0101000020E6100000BC033EF78DFE54400007D040BA403C40
22	\N	0101000020E6100000DC2A472E8DFE5440D00FE7E1AD403C40
23	\N	0101000020E61000006C7CA45E8CFE54400011DD19A1403C40
24	\N	0101000020E6100000BC89DCD098FE5440F0FBA4EA9D403C40
25	\N	0101000020E6100000D0E6D66E9AFE5440B06A9FCB9B403C40
26	\N	0101000020E6100000508F1D7F99FE54405020D3F8A8403C40
27	\N	0101000020E6100000603328669CFE544010CAB0DCA6403C40
28	\N	0101000020E6100000945481CA9DFE5440E0377B9FB2403C40
29	\N	0101000020E610000070068B629EFE5440C02C0DA4B7403C40
30	\N	0101000020E6100000182AF1D299FE54401003F93CBB403C40
31	\N	0101000020E61000001C3B5AA095FE5440B0065C96BE403C40
32	\N	0101000020E6100000F8F74ADD91FE544000C93CA4C1403C40
33	\N	0101000020E6100000A83CC46E8EFE544080467C6DC4403C40
34	\N	0101000020E610000008C8A6918AFE5440105B8490C7403C40
35	\N	0101000020E6100000704D0F9A87FE544040401A1EC8403C40
36	\N	0101000020E610000090C3DAAB86FE5440B021D55EB8403C40
37	\N	0101000020E6100000E05329AB82FE5440A01809E9AB403C40
38	\N	0101000020E6100000E0FA642A85FE544030CB9149BA403C40
39	\N	0101000020E6100000985D796081FE54409090EE73A4403C40
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: street; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.street (gid, power_watt, pol_height, name, geom) FROM stdin;
1	80	8	SL1	0101000020E6100000C06CE2C993FE5440422B8E6E77403C40
2	80	8	SL2	0101000020E61000004A99151490FE5440EAD009877A403C40
3	80	8	SL3	0101000020E61000001BF6E8608CFE5440E70F3AA57C403C40
4	80	8	SL4	0101000020E610000057B11DBE88FE544059313BED7E403C40
5	80	8	SL5	0101000020E6100000DA80EF3585FE54403CAC5A1D81403C40
6	80	8	SL6	0101000020E61000002A24DE9D81FE5440BEC991E084403C40
7	80	8	SL7	0101000020E6100000B64B871F7EFE544038B209A188403C40
8	80	8	SL8	0101000020E610000016A62F5683FE5440FA65F69A9D403C40
9	80	8	SL9	0101000020E6100000B85D8A5488FE54401316FE44C9403C40
10	80	8	SL10	0101000020E610000004B72D7686FE54405C2B00FFC1403C40
11	80	8	SL11	0101000020E6100000D0FFB91D8BFE5440F0284025C7403C40
12	80	8	SL12	0101000020E61000006375122F92FE54409D4A079AC1403C40
13	80	8	SL13	0101000020E6100000F7BBCEE195FE5440D4320AB8BE403C40
14	80	8	SL14	0101000020E61000001B8D188E99FE5440FC3667BCBB403C40
15	80	8	SL15	0101000020E6100000A41C295F9DFE5440A2CE39C4B8403C40
16	80	8	SL16	0101000020E610000067CECF5D9EFE54409D82A598B1403C40
17	80	8	SL17	0101000020E61000007368A7E99CFE5440AD479766A5403C40
18	80	8	SL18	0101000020E6100000CBAFA3169BFE54403ADB502B9A403C40
19	80	8	SL19	0101000020E61000008E31481999FE54401CAFAC288F403C40
20	80	8	SL20	0101000020E610000049CBD1CF92FE5440C21EE21387403C40
21	80	8	SL21	0101000020E6100000ED4F736780FE54404B9C37EE9E403C40
22	80	8	SL22	0101000020E61000006BBB20E986FE544084CFDBBB9A403C40
23	80	8	SL23	0101000020E6100000336D6E688AFE544073B8A20498403C40
24	80	8	SL24	0101000020E61000003883CFFE94FE5440E77ECDA88F403C40
25	80	8	SL25	0101000020E61000005B84A17F91FE5440AB06BE4992403C40
26	80	8	SL26	0101000020E61000000C593AFE8DFE54408FB35F0F95403C40
27	80	8	SL27	0101000020E6100000AD3EF4C08BFE54407C665ECFA1403C40
28	80	8	SL28	0101000020E6100000B16BDBB782FE5440E1935195AC403C40
29	80	8	SL29	0101000020E61000002693085B87FE5440C5266E4DB2403C40
30	80	8	SL30	0101000020E61000007A97929D84FE544090E3DD51B7403C40
31	80	8	SL31	0101000020E6100000EAB2955E8DFE544087616E6EBB403C40
32	80	8	SL32	0101000020E610000055BABA8A8CFE54402159B445AE403C40
33	80	8	SL33	0101000020E61000006B8C20F291FE5440F26FA5BF9C403C40
34	80	8	SL34	0101000020E6100000798C0CAC92FE544091A55364A8403C40
35	80	8	SL35	0101000020E6100000A80B938493FE544090287220B6403C40
36	80	8	SL36	0101000020E6100000254FBE1898FE5440A9BAF13A97403C40
37	80	8	SL37	0101000020E610000021998DE498FE5440FF7AC2D8A3403C40
38	80	8	SL38	0101000020E610000081516C439BFE5440A1DCDED6AC403C40
39	80	8	SL39	0101000020E6100000425A77A88EFE5440708ADC65C4403C40
40	80	8	SL40	0101000020E6100000D91606FA9FFE5440FEFF8899C2403C40
41	80	8	SL41	0101000020E61000004347BB1DA1FE54405CDD63ECCB403C40
42	80	8	SL42	0101000020E6100000388A79F6A0FE54407F22EFF9CE403C40
43	80	8	SL43	0101000020E6100000C0F3E1CD98FE5440055058E3C6403C40
44	80	8	SL44	0101000020E610000004794B867AFE5440669DA4708C403C40
\.


--
-- Data for Name: swimmingpool; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.swimmingpool (gid, name, geom) FROM stdin;
1	\N	0106000020E61000000100000001030000000100000013000000D058F701A1FE5440404282B5C0403C4040C52A2AA1FE54402025C9E7C1403C408C42E014A1FE544020ADA827C2403C4064B89303A1FE5440F0D5DA6CC2403C4054E59FEBA0FE5440208EEEEDC2403C4060B323E4A0FE544040ADB165C3403C40C43C26DFA0FE5440A083CDD6C3403C40D825FBDFA0FE544000457780C4403C4074CE74ECA0FE5440A03E300CC5403C40E0BF95FFA0FE544000960266C5403C408C9EB11CA1FE5440802377D0C5403C40A8893F55A1FE544030684434C6403C40FCDE5877A1FE544000E78D4BC6403C40B8D8C59CA1FE544050D48855C6403C40B0570FB4A1FE544000B1EB3AC6403C4078146716A2FE5440701AC40FC9403C40E8CD88B8A3FE544000D0AEB2C6403C40047F27A2A2FE544040DFA02DBE403C40D058F701A1FE5440404282B5C0403C40
\.


--
-- Data for Name: telephone_internet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.telephone_internet (gid, line_type, cabel_type, p_material, p_dia_mm, geom) FROM stdin;
1	Man-hole	\N	\N	0	0105000020E6100000010000000102000000050000000141814395FE544090427A046D403C400121D16F95FE5440A1E8E2D16B403C40236044BB95FE5440D1AD8D796C403C406F518F8C95FE5440EE4C90A26D403C405BD8B34495FE544090427A046D403C40
2	Man-hole	\N	\N	0	0105000020E6100000010000000102000000050000000A05716395FE54400A709D3076403C40DD814DA995FE54401525895876403C40A16746B795FE54404C0C0D5575403C406F61677695FE5440C24F1F3175403C404A01706595FE54408B689B3476403C40
3	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E610000001000000010200000002000000E2BF085E95FE5440B90C353C6D403C40F60C409195FE5440A2B6FD3F75403C40
4	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E610000001000000010200000002000000B02BE56D95FE5440E3F9195F6D403C402D37A39F95FE5440C49EF54775403C40
5	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000400000034053C0592FE5440D80FDC3679403C40E6A9570692FE5440B8F29F4E79403C40B98802A293FE5440BC4AF16C78403C40738BD19795FE5440B4738B4E76403C40
6	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E610000001000000010200000005000000E044410B92FE54404B97763379403C40BC37010C92FE54408EC29C4179403C40B9ECBF9E93FE5440BF2E916078403C40F8A9288995FE5440DCF22A4676403C4056C9788995FE5440A2BB584676403C40
7	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E610000001000000010200000006000000A880BAFC91FE54404C79A83B79403C40470516FD91FE5440B522774A79403C407273FA618EFE5440D08A67677B403C407EA237548EFE5440A1214C6F7B403C40AC75E0AC8AFE54400DD01C9C7D403C409E2957AC8AFE54405302928F7D403C40
8	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E610000001000000010200000007000000BF8AA90192FE54404BF3DF3879403C406444610292FE54401280F85079403C40189DFD5F8EFE544051A4B6787B403C40F60EC35A8EFE54400366DE7B7B403C402CCBAA578EFE5440AF49B67D7B403C40A1FC65A98AFE54405D67F2AE7D403C40454A6FA88AFE54407464F2917D403C40
9	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E61000000100000001020000000C000000004AE1A881FE5440000050AD84403C40008634A981FE54400200B9CA84403C4000F2B1E67FFE54400100AFB986403C400008A6797DFE54400000943089403C40007E9F867CFE5440000076278A403C40000CAF757CFE54400000DD3B8A403C4000A6F3817CFE54400000AC4D8A403C40001269D97CFE5440000067388B403C40008674697DFE5440010004AE8D403C4000DABFB27DFE5440FFFFBD668F403C4000D0167F7EFE54400000F4DD93403C4000DC01787EFE5440FEFF65F093403C40
10	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000200000001020000000700000000964A7F7CFE5440FFFFEE408A403C40001C95847CFE544001007D498A403C400070B2AF7CFE54400000DBBE8A403C40000E71E07CFE5440FFFF18448B403C4000CE876B7DFE5440020062968D403C4000A4AE897EFE5440FFFFA6E793403C4000487B7C7EFE54400000EF0994403C4001020000000600000000989BAC81FE544001006AA984403C400068E2AD81FE54400000E1D984403C4000D664E97FFE5440FFFFC4BE86403C400040A97C7EFE54400100453488403C400084B8867CFE5440010077338A403C400096037F7CFE54400000EB3F8A403C40
11	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E6100000010000000102000000050000000042FE6580FE5440FFFFE8F49E403C400066179681FE5440FFFF501F9F403C4000B6980382FE54400000ACB99E403C4000168A0D85FE54400000D2439C403C4000C6C50B85FE544001007F1F9C403C40
12	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E6100000010000000102000000050000000098736080FE544001003CD59E403C4000A6379381FE5440FFFF67069F403C4000868E0B82FE5440000053A49E403C4000B4630785FE54400100B0399C403C400014690685FE5440FFFFDE239C403C40
13	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E610000001000000010200000005000000C6675C1A85FE5440166E98139C403C4075F2AC1B85FE544030C600379C403C40F86B6F9D87FE544091BB53349A403C40C3EE5BB288FE5440ADBD625399403C40BE8CEAB088FE5440D9424F2E99403C40
14	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E610000001000000010200000005000000F59D252485FE5440CAF99C0B9C403C405C08D42585FE5440D1A628219C403C40A103CCB186FE5440DE5F88E69A403C40A0B218A788FE5440FF83424F99403C40F665D8A688FE5440735F2F3699403C40
15	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E610000001000000010200000006000000488916B688FE5440B7E7432A99403C40D4FD21B888FE54406B22B24E99403C404E18287789FE54404B3D31AF98403C40B049EB558AFE5440C8998D0198403C4030FFBB378CFE5440F92F158896403C400C6C70358CFE54408AE5135B96403C40
16	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E61000000100000001020000000600000089D589BD88FE54407266702499403C40AD96BFBE88FE5440B8500B3C99403C40B611C21889FE54409046BFED98403C405312FDCE89FE544071610C5E98403C408887EA2D8CFE54404ED1737F96403C409B648C2C8CFE54409C8C146296403C40
17	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000400000066C307478CFE544042F6384D96403C40C7DEF0488CFE5440AC34AD7A96403C408A4516CC8FFE5440CE71DAC593403C40D85188CA8FFE54408269689D93403C40
18	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E6100000010000000102000000050000009C98F94C8CFE5440DE548A4896403C40C9D4DD4E8CFE54409F1D786596403C40D7E13EBC8CFE5440E883201196403C407AB0ACC08FFE544094BD0DBF93403C402DC813C08FFE54406B11F9A593403C40
19	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000E00000064379E8289FE54402935A07FC8403C403FF6458189FE54408FAF2267C8403C40643EFC1589FE54406F3192B1C8403C406050314988FE5440506FD747C9403C40EE57B73188FE5440A59EA348C9403C40A0417C1A88FE5440DF20113BC9403C409B3CAEFF87FE544063FA2619C9403C40B79B37BF87FE5440364AF196C8403C40FEC921A187FE5440454C3644C8403C405A6D7A9187FE54401CCA4B16C8403C40546A568787FE544060D469EBC7403C40EDF3B81C87FE5440A960729AC5403C400FFE821287FE54406CB266AEC5403C400559711287FE544012F909AEC5403C40
20	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E61000000100000001020000000D000000A689681687FE5440AEDDE0C2C5403C406C0F591B87FE5440684C73B7C5403C409C804F8387FE5440FF920FF0C7403C400C932A9487FE544049448735C8403C40CCC956A787FE544000089B70C8403C408C96B7E487FE5440800555FAC8403C408F0E720088FE5440C7AE8327C9403C40B4EC1A1D88FE5440806F2C4AC9403C406C85163488FE544074372856C9403C4068233E4B88FE544030161352C9403C40F86DC15989FE54409F6FCF8FC8403C40CDF9257D89FE54409F666074C8403C40BED21B7E89FE5440B4582E83C8403C40
21	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E6100000010000000102000000060000004730750787FE544016E24F74C5403C40DCBB821187FE544004563B5BC5403C405EF390C486FE5440E7A90DBCC3403C40364697B085FE54409D43DC76BD403C404895D7C384FE5440BF70D315B8403C40DCE02FBD84FE54403190A321B8403C40
22	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E610000001000000010200000006000000202D97C084FE544075508735B8403C40341AB9C384FE54400EB5CD2FB8403C4082EAF47685FE54407C5F6D43BC403C4088AA35EF86FE5440B12B3CD2C4403C404942C30887FE54405D1DCD51C5403C4052D9660487FE544066A24064C5403C40
23	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000E010F1FB91FE5440A0C57D0A79403C4013E2386C91FE5440B926B71D78403C40
24	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000003A34500292FE5440232C930679403C4089059B7491FE544075DFAD0778403C40
25	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000610D0B0B92FE5440AD7E350179403C4064B0774892FE5440BAE5003477403C40
26	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000006ADE170692FE54409462400479403C40AE90163E92FE5440E457781277403C40
27	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000008C0AD9988AFE5440FEF049617D403C40219953228AFE54405C53C7EB7B403C40
28	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000004802A5A08AFE54409D4A675C7D403C4000B16D2B8AFE5440FA51B3D67B403C40
29	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000F6A6B2A38AFE5440E0857D5A7D403C40DEDFB4E18AFE54400593E28D7B403C40
30	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000007F04E5AA8AFE5440541EFB557D403C4009C969E88AFE5440FF362C9E7B403C40
31	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000008CB4F7978AFE54407069F79B7D403C400C9C97478AFE5440846BE7B682403C40
32	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000006A5B939C8AFE5440BBA329997D403C409A2D254F8AFE5440659755DD82403C40
33	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000066F3C5B08AFE5440D888DF8C7D403C400664643D8BFE5440D1910F4D82403C40
34	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000009E2957AC8AFE54404A02928F7D403C403657B8378BFE544009E11F7082403C40
35	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000A5BE760285FE5440CDC864AD9B403C408770D6FE83FE54402BD4D6999A403C40
36	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000018CE4F0B85FE544048AB8DA69B403C40939F800684FE544043BBED809A403C40
37	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000006EAB501185FE54405F85E9A19B403C40B110A83785FE544060073E7E99403C40
38	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000B42B161B85FE5440189D5B9A9B403C409F85474085FE544047A9E96E99403C40
39	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000001B4D451085FE5440EDB3C31B9C403C40913CEFD384FE5440E568BFAEA0403C40
40	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000C6675C1A85FE5440166E98139C403C405231ECD984FE5440BBF647D0A0403C40
41	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000005FB7079A88FE544004A97EC698403C40D54F4FA787FE54407D4610BF97403C40
42	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000046C1BCA488FE5440932714BE98403C40CD029DAF87FE5440E13BA19397403C40
43	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000070CC7AAC88FE5440963BFEB798403C40C0C7EEC988FE5440618905A696403C40
44	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000603C68B888FE5440202D9EAE98403C404029FFD188FE5440544B57A696403C40
45	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000738A09348CFE54408627AAE195403C4068927F868CFE5440110A809A93403C40
46	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000AF2FC83F8CFE54404BEF3AD895403C40794913928CFE5440A9ACB59593403C40
47	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000008EE23F2587FE54406EDCC967AC403C40E9EB5A8087FE54401C821C0CAA403C40
48	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000D8F55C2787FE54400E005C8EAC403C4014D50F8787FE5440AEC89B17AA403C40
49	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000009907342987FE5440AA97F0AFAC403C40A62712D387FE5440DD889087AF403C40
50	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000AEE25D2C87FE5440AEBBABE9AC403C4045DA1AD687FE5440732845CBAF403C40
51	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000002E59249584FE5440761CF70EB8403C405FFCB0D582FE54407CBC9623B6403C40
52	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000809419884FE5440E48A2C1FB8403C40D9E4DBD182FE5440F71BFF47B6403C40
53	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000E8A86F9C84FE544036BDF434B8403C401547EB8284FE5440CC8EFEF5B8403C40
54	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000CFC71A384FE5440F6397659B8403C406E47308884FE5440B4A7E70EB9403C40
55	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000359BC5F186FE54405499B4C9C5403C407730F7DB86FE54402FB4FEBAC6403C40
56	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000232FF1F686FE544031ECA3E3C5403C4093BC26E386FE5440FD7D97BCC6403C40
57	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000C8ED838489FE54400E09CAF5C8403C409FE0F3F488FE5440C57E8C5ACB403C40
58	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000A7542F8A89FE54406646B0F0C8403C40117C6CF988FE5440991B1974CB403C40
59	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000006608199289FE5440BDD791E9C8403C4086964BDB89FE54404FF2174ECB403C40
60	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000F561F89A89FE5440916996E1C8403C40488B48E189FE544018DAB83FCB403C40
61	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000B65B3E8689FE5440C472C47CC8403C40F4E18E3C8AFE5440CB2CB296C3403C40
62	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000008046B38D89FE5440CA6EE376C8403C40CB9348478AFE544095B1697DC3403C40
63	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000052F8F7A29BFE544052DF3F84BA403C40E4BE74C39AFE54405200DBE8BB403C40
64	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000088882FAD9BFE54400ABBB57ABA403C40046A7BCA9AFE54403FFBBB11BC403C40
65	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000E897E0B69BFE5440942CA971BA403C403D4860FE9BFE54403787A0B5BA403C40
66	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000008C83FFBE9BFE54400718146ABA403C40860A92089CFE5440D4CA7E92BA403C40
67	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000C83775C58FFE544040D6102593403C404BFB091690FE5440FC97B5C690403C40
68	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000003A072BD28FFE54404E891B1993403C403B61A52690FE544040597DBC90403C40
69	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000CE95F1D68FFE5440A98D3D9393403C401AD94E0D91FE5440E832783A97403C40
70	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000005A3EB9E18FFE5440CFCD688A93403C408427151A91FE5440E6417C3297403C40
71	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000FCC588B69DFE5440D0B5847CAB403C4026BD2D349CFE54406A566557AD403C40
72	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000AD17DDB99DFE5440DAB03B98AB403C408E1AF8389CFE544043D5E980AD403C40
73	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000F87EDFCD9DFE5440F264262EAB403C405378AD2F9EFE544030480A6BAB403C40
74	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000EFE446D29DFE544035ACAC56AB403C406C13E12E9EFE5440D2AE2F86AB403C40
75	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000003000000FEA585D69DFE5440EAF1BC7DAB403C4081CC1C1E9EFE544043D0E9AAAB403C40A6426DEA9EFE5440911CE797B0403C40
76	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000003000000D89AB4D99DFE54401025089BAB403C406D41BE1A9EFE5440117651C3AB403C40DCB05BE39EFE5440357F8B9DB0403C40
77	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000371D4FF991FE54405F061C0C79403C40D2FFF79F8FFE5440DF36DCC678403C40
78	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000F0EB01F591FE544000E3C00E79403C40793ACD9A8FFE544038F5E8EC78403C40
79	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000038C68AF691FE544038751B2D79403C404C4504A38DFE54400AF142407A403C40
80	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000DAD35EF591FE5440958DEE1579403C40D81623A08DFE5440176675EE79403C40
81	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000BF8AA90192FE544044F3DF3879403C40711873EF8FFE5440949375BF7F403C40
82	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000A880BAFC91FE54404B79A83B79403C404A14C5E78FFE54403F44A68A7F403C40
83	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000005E26D2958AFE5440F38D8D6D7D403C40D2778E7E88FE5440B75245D37C403C40
84	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000E84A39978AFE5440F686E28B7D403C40B66EF66188FE544052DBF3F37C403C40
85	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000D3ECA0FA91FE544057BDD73C79403C407B5CC20F8EFE54409DF399F980403C40
86	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000CCCA6DF791FE544020D7A53E79403C40F63A41098EFE544076BD01AD80403C40
87	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000086F280A28AFE5440B43E8E957D403C40E7CA587888FE5440202D47CA84403C40
88	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000006A5B939C8AFE5440BBA329997D403C4044F3346488FE5440ED25949784403C40
89	Junction Box	\N	\N	0	0105000020E6100000010000000102000000080000006FC2603285FE5440DA0BEFCF80403C404892FC4D85FE5440AF39FDC380403C4011518A5085FE5440332C520281403C401E87EB3485FE54402A36301381403C408C149D1B85FE5440EE83A42281403C4002F0871885FE5440B1E285DF80403C4044995F3285FE54404D6F79CF80403C402991CD3485FE54401D82421381403C40
90	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000400000000EA80A28AFE544000008E957D403C4000F0DBA28AFE5440000028B37D403C400022E52B85FE54400000212481403C4000421B2B85FE5440FFFF2D1981403C40
91	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E61000000100000001020000000400000000586B2F85FE544000008D1681403C400078BD2F85FE54400000811B81403C400030BA9B8AFE54400000EEA77D403C400072939C8AFE544000002A997D403C40
92	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000009ACD3485FE54400000441381403C4000B2B14F86FE54400000757386403C40
93	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000586B2F85FE544000008D1681403C4000C05F4286FE54400000548586403C40
94	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000586B2F85FE544000008D1681403C40005A1D9F84FE54400000E2C987403C40
95	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000421B2B85FE544000002E1981403C40000E358B84FE544000006CB887403C40
96	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000ACD12C85FE54400000ECD280403C4000D6BDEE85FE5440000025707E403C40
97	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000D2D92685FE54400000A1D680403C40005691E185FE54400000FD5C7E403C40
98	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000005A0D2285FE544000009DD980403C40006A197184FE544000009C7F7F403C40
99	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000DE871885FE5440000086DF80403C40008E7F7184FE54400000DFC57F403C40
100	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000000A791985FE5440000009F480403C4000008DA282FE54400000864A81403C40
101	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000068DC1A85FE54400000421281403C4000B035A182FE54400000DC7F81403C40
102	Junction Box	\N	\N	0	0105000020E61000000100000001020000000700000000F073BC81FE5440FFFF255184403C4000C8EAD381FE54400000F33A84403C4000262DD881FE54400100D97B84403C40006E6DA581FE5440FFFFEBB084403C4000CEE99F81FE5440FFFF7D6A84403C4000F278BC81FE54400000B65184403C400030D6BE81FE544000005B9684403C40
103	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000A0000000086702385FE5440FFFFDD1D81403C4000E28C2385FE5440FFFF522981403C4000A22A1C85FE5440FFFFEA2D81403C40005C319784FE544000006DBC81403C4000F4324684FE544001003A1382403C40000A9A9C83FE5440FFFFFBC882403C4000543A6583FE544001009F0683403C4000DE12C182FE544000004DAA83403C4000C645B881FE5440FFFFC5CE84403C4000885AB581FE5440010045A084403C40
104	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E6100000010000000102000000090000000098B7BA81FE5440FFFFA89A84403C40004E6FBD81FE5440000082B484403C4000609C9482FE5440000037C883403C400048DD6C83FE5440FFFFBBFA82403C4000205C9D83FE5440010098C482403C40005C621784FE54400100E74082403C4000DABA1B85FE5440FFFFF02781403C40009CCA2085FE5440FFFFCA2481403C40005EB42085FE54400000891F81403C40
105	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000006A2EB781FE544000004E5684403C4000709B0E81FE544000007F0C83403C40
106	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000C4B2B081FE54400000EE5B84403C400002FC0581FE54400000D13283403C40
107	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000006E47A981FE544000005F6284403C4000008C5D7FFE54400000667C84403C40
108	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000CEE99F81FE544000007E6A84403C4000E2B5517FFE544000005CA784403C40
109	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000588FA081FE54400000C17284403C40002C309D7DFE54400000C59C86403C40
110	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000DA37A281FE54400000EE8784403C4000C4A9957DFE5440000017C886403C40
111	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000006E6DA581FE54400000ECB084403C400056E7787BFE54400000A97789403C40
112	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000005434A381FE54400000889484403C4000E81C747BFE54400000C70E89403C40
113	Junction Box	\N	\N	0	0105000020E61000000200000001020000000500000000F074537EFE54400000342694403C4000B2367D7EFE544001001E2995403C4000F663A07EFE54400000E9D694403C40002010757EFE5440010095DF93403C4000EE28537EFE54400100D42694403C4001020000000200000000F6C5677EFE544000002DA494403C4000BA4A887EFE5440FFFF594D94403C40
114	Junction Box	\N	\N	0	0105000020E61000000200000001020000000500000000069B2380FE544001004DFE9E403C40003CE56180FE544000004462A0403C4000C47E9380FE54400000EAF89F403C4000DAE95380FE54400000968D9E403C40006CBE2180FE5440FFFFA4029F403C400102000000020000000036104380FE5440FFFF13B29F403C4000F6F27080FE5440FFFF81339F403C40
115	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000400000000F0DF807EFE5440FFFF022394403C40001C5A8A7EFE5440FEFFFC0594403C40003A2C6380FE54400000FCAC9E403C4000943E5C80FE5440FFFF31BD9E403C40
116	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E6100000010000000102000000060000000030AA857EFE5440FEFF583E94403C400024788B7EFE54400000352D94403C4000906F157FFE544000002C4E97403C4000A480E57FFE5440000001F79B403C400076635B80FE5440FFFFAFA09E403C400088625880FE5440000024A79E403C40
117	Junction Box	\N	\N	0	0105000020E61000000200000001020000000500000000CE6DF791FE5440FFFFA63E79403C40009EEF2892FE54400000B82279403C40002CF52692FE5440FFFF0DF078403C4000EA01F591FE5440FFFFC20E79403C4000CE6DF791FE5440FFFFA63E79403C400102000000020000000092011092FE5440FFFFC93079403C4000A6980D92FE5440FFFFA3FF78403C40
118	Junction Box	\N	\N	0	0105000020E61000000200000001020000000500000000BAF7978AFE54400000F89B7D403C4000AEBEC98AFE54400000AF7D7D403C400068ABC88AFE5440FFFFA7437D403C4000E65A958AFE544001007A637D403C4000BAF7978AFE54400000F89B7D403C40010200000002000000003CCEB18AFE544000003F8C7D403C4000C6BFAF8AFE54400000F0527D403C40
119	Junction Box	\N	\N	0	0105000020E6100000020000000102000000020000000020992985FE54400000FA069C403C400048852185FE5440000062959B403C40010200000005000000009E2F0485FE5440FFFFAE259C403C4000F4124F85FE5440FEFF39E89B403C40000E564785FE54400100A3779B403C40001C1FFC84FE544000004DB29B403C40009E2F0485FE5440FFFFAE259C403C40
120	Junction Box	\N	\N	0	0105000020E61000000200000001020000000500000000CA3E9B88FE54400000423F99403C4000AA849388FE544000009DCB98403C40004288DE88FE54400000929098403C40008E7FE688FE54400000690499403C4000CA3E9B88FE54400000423F99403C4001020000000200000000BC56C088FE5440FFFF3F2299403C40000C20B988FE5440000010AE98403C40
121	Junction Box	\N	\N	0	0105000020E61000000200000001020000000500000000C03E298CFE5440FFFFAF6496403C400002AC748CFE54400000462996403C40007CAD6C8CFE54400000ABB495403C4000A8A2218CFE5440000072F095403C4000C03E298CFE5440FFFFAF6496403C4001020000000200000000A2EA518CFE54400100A74496403C4000EA2D4A8CFE5440FFFF26D095403C40
122	Junction Box	\N	\N	0	0105000020E610000002000000010200000005000000007460BC8FFE5440000002A993403C400086560990FE54400000F56993403C400096340190FE5440FEFFFBF192403C40002EC4B48FFE5440FFFFC43493403C40007460BC8FFE5440000002A993403C4001020000000200000000AE14E48FFE5440FEFF7A8893403C4000143DDB8FFE54400100FC0F93403C40
123	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000003E161B85FE544000005C9A9B403C4000FEA7CB86FE54400000B92398403C40
124	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000048852185FE5440000062959B403C400024C2D486FE54400000E24D98403C40
125	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000DE7AAC88FE54400000FEB798403C40003AA2658AFE54400000F57495403C40
126	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000000C20B988FE5440000010AE98403C400096AF738AFE544000000FA895403C40
127	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000007E5C1A85FE5440000098139C403C400034926983FE544000004524A2403C40
128	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000050451085FE54400000C41B9C403C4000E8FF4683FE5440000071F6A1403C40
129	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000022C83F8CFE544000003BD895403C40004009F38DFE5440000030AA92403C40
130	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000EA2D4A8CFE5440000027D095403C4000AE7DFF8DFE544000006DD292403C40
131	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000162BD28FFE544000001C1993403C4000F0588A91FE54400000BEA28F403C40
132	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000143DDB8FFE54400000FC0F93403C4000148F9891FE54400000D7D58F403C40
133	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000002A985A7EFE54400000351794403C40004076A37DFE54400000C50E93403C40
134	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000008E1687EFE5440000030F993403C4000DA06B57DFE5440000082C892403C40
135	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000CE5A5A7EFE54400000F95094403C4000C00A777EFE54400000AA6696403C40
136	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000F6C5677EFE544000002DA494403C4000AE69857EFE544000008BA696403C40
137	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000DC01787EFE5440000066F093403C40008243557FFE544000003F358D403C40
138	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000487B7C7EFE54400000EF0994403C40008CE56C7FFE54400000CD378D403C40
139	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000487B7C7EFE54400000EF0994403C4000BA272D80FE54400000F2B193403C40
140	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000F0DF807EFE54400000032394403C4000E8183680FE5440000045EF93403C40
141	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000D262837EFE54400000583194403C4000A035E380FE54400000CBA998403C40
142	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000006814877EFE544000006E4694403C40009E56DD80FE544000008EE398403C40
143	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000069B2380FE544000004DFE9E403C40001A974E7FFE5440000048099E403C40
144	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000000E472C80FE54400000DC2F9F403C40006E02457FFE5440000007899E403C40
145	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000009E473580FE544000004D639F403C40000A592D80FE544000002837A2403C40
146	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000024883D80FE5440000076929F403C400014B44380FE54400000CF83A2403C40
147	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000024883D80FE5440000076929F403C4000CCAD1981FE54400000EA6AA7403C40
148	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000036104380FE5440000014B29F403C40004E1C3281FE54400000E54CA7403C40
149	Junction Box	\N	\N	0	0105000020E610000002000000010200000005000000005074F486FE544001003AC1AB403C4000F48F0887FE544000000700AD403C4000909F2D87FE544001009C00AD403C4000E86F1A87FE5440FFFF76A2AB403C40005074F486FE544001003AC1AB403C400102000000020000000086F0FD86FE544001009B57AC403C4000DCA52387FE5440FFFF904AAC403C40
150	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000C0B81587FE544000003D00AD403C4000782F2388FE5440000043E6B9403C40
151	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000921B2387FE544000007200AD403C40002C912C88FE544000000990B9403C40
152	Junction Box	\N	\N	0	0105000020E6100000020000000102000000050000000054317784FE544000007B73B7403C4000AC53A884FE5440FFFFE372B8403C400050B1C284FE5440FFFFCF41B8403C4000E2A69484FE54400000C434B7403C400054317784FE544000007B73B7403C40010200000002000000001CAE8F84FE5440000085F2B7403C4000C6D8AC84FE5440000026C2B7403C40
153	Junction Box	\N	\N	0	0105000020E61000000200000001020000000600000000427A0187FE5440FEFFE354C5403C40004242E986FE544005009DD5C4403C4002E4ABCC86FE544008006C10C5403C40003264FD86FE54400900FE03C6403C4001166B1987FE5440FFFFB1D2C5403C4000427A0187FE5440FEFFE354C5403C400102000000020000000086BDE486FE5440FFFF5588C5403C4000427A0187FE5440FEFFE354C5403C40
154	Junction Box	\N	\N	0	0105000020E6100000020000000102000000050000000054E95989FE5440FFFF771CC9403C40003017A489FE5440000062D9C8403C4000DA859C89FE54400000356BC8403C4000F6ED5289FE5440FFFF38A5C8403C400054E95989FE5440FFFF771CC9403C400102000000020000000080458189FE54400100B6F8C8403C4000E8DA7A89FE54400100C085C8403C40
155	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000A8A7B084FE544000006563B8403C4000602F8E85FE54400000D550BE403C40
156	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000FCA0B884FE544000008C54B8403C4000EA2DA585FE544000005DAFBE403C40
157	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000096690887FE544000009CF0C5403C40003A27CA87FE54400000134ECC403C40
158	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000008CF51087FE5440000094E1C5403C40008C79DD87FE54400000773DCC403C40
159	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000068F89A89FE5440000096E1C8403C40001C72768BFE544000007AEEC9403C40
160	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000CC95A289FE5440000076C3C8403C40004061838BFE54400000CBA2C9403C40
161	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000C6A2A089FE5440000017A7C8403C400052B7368DFE544000004689C8403C40
162	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000002CE79D89FE544000004F7FC8403C4000F25B428DFE54400000CC26C8403C40
163	Junction Box	\N	\N	0	0105000020E6100000020000000102000000050000000086AFA38EFE544000009E75C4403C40007A78AC8EFE5440FEFF5AFBC4403C4000CC72F68EFE5440FFFFC4BBC4403C4000D8EBF18EFE5440FFFF2636C4403C400086AFA38EFE544000009E75C4403C400102000000020000000072F0D08EFE5440000004DCC4403C4000202CCA8EFE5440FFFF6756C4403C40
164	Junction Box	\N	\N	0	0105000020E61000000200000001020000000500000000F8714E92FE54400000DF0DC2403C400070869D92FE544000002ACDC1403C4000304F9892FE5440FFFF0056C1403C400028C34692FE54400100D593C1403C4000DA6B4E92FE544001007F0DC2403C4001020000000200000000A42F7492FE54400000FDEEC1403C40000E886E92FE54400100AE75C1403C40
165	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000003E0C7992FE54400000B56DC1403C400030024D92FE544000000B8DBC403C40
166	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000E0BA8592FE544000001864C1403C40008AB96292FE544000004852BC403C40
167	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000D84B8D92FE5440000071DAC1403C4000DE751093FE5440000000A1C2403C40
168	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000070869D92FE544000002ACDC1403C4000BAB42193FE544000001F78C2403C40
169	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000003054E08EFE54400000C9CEC4403C40001262848FFE544000005F8AC6403C40
170	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000CC72F68EFE54400000C5BBC4403C400060549F8FFE54400000853EC6403C40
171	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000003015F58EFE544000007793C4403C400076813E91FE544000006520C4403C40
172	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000002E10F38EFE54400000DC57C4403C4000A28E4C91FE54400000ADA7C3403C40
173	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000070869D92FE544000002ACDC1403C400026331896FE54400000ADD1BF403C40
174	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000C68E9B92FE5440000035A0C1403C400094FD1C96FE54400000D681BF403C40
175	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000C68E9B92FE5440010035A0C1403C40003CBCF397FE5440FFFF7DE6BD403C40
176	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000006CA29992FE5440FDFF4674C1403C4000926C2698FE544001007B56BD403C40
177	Junction Box	\N	\N	0	0105000020E610000002000000010200000005000000008CFFBE9BFE54400000156ABA403C4000167E799BFE54400100E5A9BA403C400074CA729BFE544001005D3CBA403C4000A43DB89BFE5440FFFF7806BA403C40008CFFBE9BFE54400000156ABA403C40010200000002000000000C389C9BFE544000007B8ABA403C40004251969BFE5440FEFFC320BA403C40
178	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000A43DB89BFE544000007906BA403C40007AB34599FE5440000077A4B6403C40
179	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000C640AA9BFE544000005411BA403C400070B63F99FE544000003130B7403C40
180	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000009666A39BFE54400000A516BA403C4000E8B02597FE5440000070B1B9403C40
181	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000002E52979BFE54400000FC1FBA403C40005A100B97FE54400000D4CAB9403C40
182	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E610000001000000010200000004000000004EBDE48EFE5440FFFFD740C4403C4000E652E38EFE5440FFFF6F1FC4403C400032BE7792FE54400000B748C1403C40003E0C7992FE54400000B56DC1403C40
183	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E6100000010000000102000000040000000056BC7192FE544001004173C1403C400034867092FE5440FFFFDA5EC1403C40004E25ED8EFE5440FFFF5A29C4403C400036F1ED8EFE544000006139C4403C40
184	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E6100000010000000102000000040000000084318D92FE544001006F5EC1403C4000E2E08B92FE54400000C434C1403C4000EE0B9C9BFE5440FFFFC501BA403C400090579D9BFE54400100521BBA403C40
185	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E61000000100000001020000000400000000304F9892FE5440FFFF0056C1403C40003E3A9792FE5440FFFFBA3FC1403C40008AB5969BFE544001005B13BA403C40002E52979BFE54400000FC1FBA403C40
186	Junction Box	\N	\N	0	0105000020E6100000010000000102000000050000000016EBAF9DFE544001007345AB403C40005292CE9DFE544001009E44AC403C40001468E79DFE544001001D19AC403C40004895CB9DFE5440FFFF1419AB403C400016EBAF9DFE544001007345AB403C40
187	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000007CB3BF9DFE54400000D4C8AB403C4000A0B4D99DFE54400000099BAB403C40
188	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000004895CB9DFE544000001519AB403C4000D257209EFE544000009D89A8403C40
189	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000C8F6BE9DFE54400000522DAB403C40001266049EFE54400000B659A8403C40
190	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000016EBAF9DFE544000007345AB403C4000ACD7249DFE54400000D29FA2403C40
191	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000C8F6BE9DFE54400000522DAB403C40009CC9409DFE54400000DA8FA2403C40
192	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000D888B69DFE54400000867CAB403C400036EAEF9AFE54400000657AAE403C40
193	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000046C5B19DFE54400000DD54AB403C40005053EA9AFE544000000818AE403C40
194	Junction Box	\N	\N	0	0105000020E610000002000000010200000005000000007E26139BFE5440000058ED99403C400094A2599BFE54400000F3759B403C4000E6B5899BFE5440FFFF94069B403C400024E2489BFE54400000E26A99403C40007E26139BFE5440000058ED99403C4001020000000200000000628E689BFE5440FFFF07349A403C400018A3359BFE5440000070AD9A403C40
195	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000B4A71D9BFE54400000D7D399403C400092C9209AFE544000001FB491403C40
196	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000F0CA299BFE544000005FB699403C4000E0BB3B9AFE54400000505491403C40
197	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000030D7369BFE54400000B29699403C40006837409BFE544000009EA196403C40
198	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000024E2489BFE54400000E26A99403C400028295C9BFE5440000089C996403C40
199	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000F4D2569BFE544000006CC399403C4000BAC61D9CFE54400000A9729C403C40
200	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000628E689BFE5440000008349A403C40002EC1289CFE5440000068F29C403C40
201	Junction Box	\N	\N	0	0105000020E6100000020000000102000000050000000054AF3E98FE54400000BFDF9B403C40005E8E5F98FE5440FFFF57C39B403C400056BA8598FE54400000EB109E403C400074E35F98FE54400000E12E9E403C400062E13F98FE54400100B7DE9B403C4001020000000200000000EA725098FE54400000AD189D403C4000281A7498FE54400000AE009D403C40
202	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000074E35F98FE54400000E12E9E403C400044484398FE54400000D4D7A1403C40
203	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000F2E46D98FE54400000CC239E403C40009C415098FE54400000AC27A2403C40
204	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000F2E46D98FE54400000CC239E403C400030248A98FE54400000016EA5403C40
205	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000074E35F98FE54400000E12E9E403C4000AE1B9B98FE54400000C3E9A5403C40
206	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000F2E46D98FE54400000CB239E403C400076EAFB98FE544000006A7EAC403C40
207	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000A6F57A98FE5440000072199E403C4000C6DC1699FE544000006F72AC403C40
208	Junction Box	\N	\N	0	0105000020E6100000020000000102000000050000000034FDA491FE54400200F0247E403C400052599991FE54400200E5617D403C400070DD2192FE5440FFFF94177D403C40000E7D2D92FE5440FFFF1DE97D403C400034FDA491FE54400200F0247E403C40010200000002000000000229DE91FE54400000703C7D403C4000F296E791FE5440000059107E403C40
209	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000006E5E0292FE5440000004FC7D403C4000285EE293FE54400000FC9087403C40
210	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000076770B92FE5440000008F87D403C4000C6E40794FE54400000707787403C40
211	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000C45F2C92FE5440000007D57D403C4000623BF094FE54400000D84486403C40
212	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000000A4D2992FE54400000A19D7D403C4000E6193295FE544000001A2886403C40
213	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000CA7AFD91FE5440000029FE7D403C4000B4FB9391FE544000009F7D7F403C40
214	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000C2B2F091FE54400000C3037E403C40003AC28A91FE5440000033457F403C40
215	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000000A4D2992FE5440FEFFA09D7D403C4000BC5EA897FE544001007FAF81403C40
216	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000070DD2192FE5440000095177D403C40002A3EE897FE54400000DFEF80403C40
217	Junction Box	\N	\N	0	0105000020E610000002000000010200000005000000003AB8208DFE5440000000FCBA403C400060DEF88CFE5440FFFF6BB5B8403C40007810298DFE544000004B8CB8403C4000E41F4F8DFE5440FFFFDAD9BA403C40004401238DFE5440FFFF51FABA403C40010200000002000000009AD10E8DFE54400100BDE4B9403C400062C83C8DFE54400000BCBDB9403C40
218	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000004401238DFE5440000052FABA403C40001C1F218DFE54400000921ABD403C40
219	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000001E872E8DFE54400000D7F1BA403C40004AE0378DFE544000009BD0BD403C40
220	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000D8DD148DFE54400000B94EBA403C4000E8A0868CFE54400000AC25BA403C40
221	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000E619118DFE54400000AC17BA403C40001409838CFE54400000027EB9403C40
222	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000096FD418DFE54400000680EBA403C40007CB6538EFE544000009282B0403C40
223	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000D08D458DFE544000009C45BA403C4000D07A648EFE5440000039CFB0403C40
224	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000046044C8DFE54400000B7A9BA403C400052008C8EFE544000002DCCB6403C40
225	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000D08D458DFE544000009C45BA403C40007E68888EFE54400000D64AB6403C40
226	Junction Box	\N	\N	0	0105000020E6100000040000000102000000030000000124653E8CFE54400500D9B3A9403C40000283528CFE54400700BBEEAA403C400022FF088CFE544004005524AB403C40010200000004000000008CADF48BFE544004009B05AA403C40013A5BE18BFE54400300B6C3A8403C4001D6932B8CFE544004004F8DA8403C400124653E8CFE54400500D9B3A9403C40010200000002000000008CADF48BFE544004009B05AA403C400124653E8CFE54400500D9B3A9403C4001020000000200000001B204068CFE5440FFFF8026AB403C40008CADF48BFE544004009B05AA403C40
227	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000C28F298CFE54400000980CAB403C400006ECF28BFE544000004063AE403C40
228	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000FC823D8CFE544000000CFEAA403C4000CEDF0A8CFE54400000A469AE403C40
229	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000E0DE008CFE54400000BCD0AA403C4000B46C5A8BFE544000009CC6A7403C40
230	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000A26AF88BFE54400000E743AA403C40001898698BFE54400000FE69A7403C40
231	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000000283528CFE54400000BBEEAA403C40007809158EFE544000009B45AC403C40
232	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000FC064B8CFE544000009379AA403C4000A0C3398EFE54400000EDA5AB403C40
233	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000FC064B8CFE544000009379AA403C40001A2ECD8DFE54400000CDCFA4403C40
234	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000008098448CFE54400000E914AA403C40002C32C58DFE544000003663A4403C40
235	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000008098448CFE54400000E914AA403C4000E8665D8DFE54400000C7F29E403C40
236	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000024653E8CFE54400000D9B3A9403C40009EA4488DFE54400000EF3F9E403C40
237	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000A26AF88BFE54400000E743AA403C40001CDDE18AFE544000001452A0403C40
238	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000008CADF48BFE544000009B05AA403C40009402FD8AFE54400000DE53A0403C40
239	Junction Box	\N	\N	0	0105000020E61000000200000001020000000500000000AEF74693FE5440FFFFB548B6403C400094791893FE5440FFFFC423B3403C40005A1F4C93FE5440000028FDB2403C400020327F93FE54400000401DB6403C4000644C4693FE5440FFFF3949B6403C400102000000020000000024452F93FE5440FFFFCCCAB4403C40000E936693FE544000008C9BB4403C40
240	Junction Box	\N	\N	0	0105000020E610000002000000010200000005000000005EA5C791FE5440000038D99C403C4000F47AEE91FE5440000093BD9C403C4000D625CB91FE544001002EB39A403C40007A9EA891FE54400200D5C49A403C40005EA5C791FE5440000038D99C403C400102000000020000000078A6B891FE54400000C2D79B403C400036AADC91FE544000002AB69B403C40
241	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000C2E4BC91FE54400000AD449C403C40005A63F090FE54400000F1D19B403C40
242	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000022A8B991FE5440000064079C403C40008A68EA90FE5440000089799B403C40
243	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000036B4D191FE544000000FD29C403C4000400E9C91FE54400000C7E6A0403C40
244	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000009484DC91FE544000005CCA9C403C40000AFDBD91FE54400000993EA1403C40
245	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000036AADC91FE544000002AB69B403C400098354693FE54400000C60A99403C40
246	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000D0D2E191FE5440000072029C403C4000FA266393FE54400000956A99403C40
247	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000D0D2E191FE5440000072029C403C40006004A793FE54400000D6CF9E403C40
248	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000036E7E691FE544000008A4D9C403C400062FFB093FE544000008B639F403C40
249	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E6100000010000000102000000020000000036E7E691FE544000008A4D9C403C400022F1CC93FE54400000FF64A4403C40
250	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000F47AEE91FE5440000092BD9C403C4000B8F8BD93FE54400000CEC8A4403C40
251	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000707E3C93FE544000006193B5403C400080CB9091FE5440000008A7B0403C40
252	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000009C9A3793FE54400000B73EB5403C40000A58AA91FE54400000D494B0403C40
253	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000B8347993FE5440000069BFB5403C4000D22E1D95FE54400000AD59B3403C40
254	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000F62E7193FE54400000BF41B5403C4000C2252F95FE5440000001B2B2403C40
255	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000F62E7193FE54400000BF41B5403C40008461B994FE54400000C344AD403C40
256	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000000E936693FE544000008C9BB4403C40008461B994FE544000007FD5AB403C40
257	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E6100000010000000102000000080000000098736080FE544001003CD59E403C4000EC1B6880FE5440FFFF12BE9E403C40004CFA9B81FE5440000058D5A5403C40003653D082FE544000005CA6AC403C400022A75983FE5440FFFFA33EAF403C40002EFBA083FE5440FFFFD234B1403C40004689C284FE544000001AC7B7403C4000CC7AB384FE54400100EAE8B7403C40
258	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E61000000100000001020000000D0000000042FE6580FE5440FFFFE7F49E403C4000DEBE6980FE5440000024EA9E403C4000BA7C5081FE54400000B231A4403C4000F055D981FE544000000062A7403C4000D85A3482FE54400100727CA9403C40005C098482FE5440FFFFAB40AB403C40006098E982FE54400000B54DAD403C4000F85C4A83FE54400100571FAF403C4000E07A8883FE5440FFFFBADFB0403C400090A8E383FE5440FFFFA0F7B2403C4000FC9F6D84FE544000000A2DB6403C40001A14B784FE54400000E2BCB7403C4000F257AF84FE5440FFFFBED0B7403C40
259	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E61000000100000001020000000600000000E0159589FE544001001271C8403C400064149489FE544001005867C8403C4000468C118DFE5440FFFFF29CC5403C400022BC2E8DFE544001002686C5403C4000D676CE8EFE544000005541C4403C40008001CF8EFE544001007B52C4403C40
260	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000600000000DAA6D48EFE5440FFFFE64DC4403C4000B8F9D28EFE54400100512CC4403C4000A42C238DFE5440FFFF5480C5403C4000863F0B8DFE544001005E93C5403C40005EB48D89FE5440FFFF375DC8403C400038498F89FE54400000A475C8403C40
261	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E61000000100000001020000000200000000EA2FBD84FE5440FFFFA421B8403C40009E400687FE5440000068DBAC403C40
262	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000200000000CC7AB384FE54400100EAE8B7403C4000BE0E0387FE54400000C1A8AC403C40
263	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E6100000010000000102000000040000000046044C8DFE54400000B7A9BA403C4000F89D658DFE54400100D1A7BA403C4000EC65638CFE54400000131EAA403C40008098448CFE5440FFFFE814AA403C40
264	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E61000000100000001020000000400000000FC064B8CFE544000009379AA403C40009A7B5C8CFE544000002D84AA403C40007CD1508DFE544001001222BA403C4000D08D458DFE544000009C45BA403C40
265	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E610000001000000010200000004000000007070358CFE54400000145B96403C40005C7B688BFE54400100C5A49B403C4000E23A428CFE5440000005C5A9403C400086B63F8CFE544000007CC8A9403C40
266	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E610000001000000010200000004000000006AE03E8CFE5440FFFFA75396403C4000E8926C8BFE5440FFFF6AAD9B403C40003C73448CFE54400000FFD6A9403C40000EE5408CFE54400000FBDAA9403C40
267	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E610000001000000010200000004000000005288CA8FFE54400000699D93403C4000FE787F91FE54400100113B96403C40001A58EB91FE544001000CF29B403C4000D0D2E191FE5440FEFF71029C403C40
268	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000400000000A0F1D68FFE544000003E9393403C4000BEA48191FE5440FFFF8A2796403C4000F6E7EF91FE5440FFFFBD189C403C4000EE45E491FE54400000A8269C403C40
269	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000E4E25798FE54400000D79A9D403C4000EC358E97FE54400000FAF49C403C40
270	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000E4E25798FE54400000D79A9D403C400012259B97FE5440000080BB9C403C40
271	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E610000001000000010200000002000000007A065598FE54400000E8659D403C400000F73897FE54400000F0DD96403C40
272	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000140E5398FE5440000075419D403C40008A835297FE54400000CE5796403C40
273	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E6100000010000000102000000020000000098A27898FE5440FFFF8B409D403C4000F6A11B9BFE54400000981C9A403C40
274	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000200000000528A7D98FE5440FFFF1C8B9D403C4000A461259BFE54400100E5529A403C40
275	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000600000000A461259BFE54400100E5529A403C4000D0DD089BFE544000008AA09A403C400072AE1E9CFE544000006B66A0403C4000107F649CFE544000001505A2403C400050C4939DFE5440FFFF1A99AB403C40000A4CB49DFE5440FFFFE569AB403C40
276	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E6100000010000000102000000050000000046C5B19DFE54400000DD54AB403C4000BAC6959DFE544000006C78AB403C4000E441679CFE544001006DCBA1403C40001845229BFE54400200D6AF9A403C4000C6FF2D9BFE54400200E4829A403C40
277	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E6100000010000000102000000020000000082A90192FE54400000E03879403C4000CEE4EF91FE54400000C9327D403C40
278	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000200000000F43B0592FE54400000DC3679403C40005E94F991FE54400100842D7D403C40
279	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000400000000EE45E491FE54400000A8269C403C4000F6E7EF91FE5440FFFFBD189C403C40003CE28393FE5440FFFF4026B5403C4000F62E7193FE5440FFFFBE41B5403C40
280	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E6100000010000000102000000090000000036E7E691FE5440FFFF894D9C403C40007895EE91FE54400100E9469C403C4000FA733092FE5440FFFFFA77A0403C400022FE6292FE5440FFFFE899A3403C400064D09492FE54400000C1BDA6403C400078A2C692FE5440010018EDA9403C40008E3A1A93FE544000000052AF403C400040DA7293FE5440FFFFA6CCB4403C4000ACA96A93FE5440010095DBB4403C40
281	Primary line	TV	Galvanised Iron (GI) Pipe	25	0105000020E61000000100000001020000000500000000F43B0592FE54400000DC3679403C4000A8952197FE5440010032247F403C400008239E97FE54400200EB8F87403C40006EEF0F9BFE54400000E56C9A403C4000F609229BFE5440000047409A403C40
282	Primary line	Telephone	Galvanised Iron (GI) Pipe	50	0105000020E6100000010000000102000000050000000092011092FE5440FEFFC93079403C400006402F97FE5440000048F67E403C400062FBB597FE54400100DFA187403C4000E695109BFE54400000C1299A403C4000F6A11B9BFE54400000981C9A403C40
283	Secondary line	Telephone	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000E046D29DFE54400000AD56AB403C40007CCA00A0FE54400000F5E3B7403C40
284	Secondary line	TV	High Density Polyethylene (HDPE) Conduit	20	0105000020E61000000100000001020000000200000000A0B4D99DFE54400000099BAB403C40004E67FA9FFE54400000995EB8403C40
\.


--
-- Data for Name: temple; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temple (gid, geom) FROM stdin;
1	0106000020E610000001000000010300000001000000050000001C94339E78FE544020F6734183403C40984CD1FA78FE54405025759B85403C402C7E4A9F79FE5440C055B45584403C408C64E13F79FE5440A008AB0B82403C401C94339E78FE544020F6734183403C40
\.


--
-- Data for Name: water_network; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.water_network (gid, line_type, pip_dia_in, geom) FROM stdin;
1	Distribution Line	2	0105000020E610000002000000010200000009000000006604FC9EFE5440FBFF2024B7403C400060CA849CFE5440FBFF3C9EA2403C40003E02B29BFE5440FFFFC7039E403C4001867F8D99FE54400800C53992403C40000AA5DE98FE5440FFFFC44B8E403C40004840AD97FE544000003E7787403C40016EEB2597FE54400400BD387E403C400116C47397FE54400A003ED67C403C400386F67497FE5440FDFF74D17C403C40010200000004000000013A04FC9EFE5440FFFF2024B7403C40013207BA9EFE544004002E1FBD403C401916A6DD9EFE54403BA62051BE403C4088D9A19AA0FE54403DD099E4BB403C40
2	Distribution Line	2	0105000020E610000001000000010200000039000000008615B992FE544000008A2087403C4000BA564A95FE54400000C12485403C40008A9F1196FE544000009E9E84403C4000445A6397FE544000006EDA8C403C4000EC1F5D97FE5440000063928D403C40009AB73897FE5440000034DB8D403C40003E4F6D95FE54400000DD508F403C4000F0319B93FE544000001AB990403C4000203B0A92FE5440000047F591403C4000308F2290FE544000006E7693403C400078E0688EFE5440000083CB94403C40003AB5758CFE54400000815096403C400040CA7C8AFE54400000BCE697403C4000D4398788FE54400000A36D99403C400084FD5086FE54400000B1359B403C400094900785FE54400000223E9C403C400024D48C83FE54400000B1699D403C400068B55E82FE5440000013649E403C4000B80AB781FE5440000019E59E403C400098DA9C81FE544000000CD79E403C4000747F8681FE54400000CA909E403C4000C82C2381FE54400000D14C9C403C400078359980FE54400000113699403C4000C2530D80FE544000000C0796403C40006A8B777FFE54400000439D92403C4000D0D1D87EFE54400000A6188F403C400098657F7EFE544000008E148D403C4000E4FB717EFE5440000032B28C403C40005C9F727EFE54400000D34F8C403C400014347C7EFE544000009E178C403C400024AB977EFE5440000077D68B403C4000A6948D7FFE54400000DDD18A403C4000C6000181FE54400000B04989403C400060321E82FE54400000421388403C400088D57583FE544000004CAC86403C40005EC1B784FE544000007E5885403C40004A064A85FE5440000087B784403C4000B8F1C886FE5440000033CB83403C40000EFD6787FE54400000F26D83403C4000E2DF5688FE5440000009DB82403C4000A2590E89FE54400000BE6782403C40006C35CE89FE54400000F1F081403C4000F0FE898AFE54400000E27F81403C4000CC868A8BFE54400000B6E380403C4000F64B8B8CFE54400000B64380403C4000F2697E8DFE5440000034AF7F403C4000FEBB5B8EFE544000001D287F403C400012FF7E8FFE54400000877E7E403C40003A827490FE5440000011E97D403C40008CDA6D91FE544000001A5F7D403C4000B055E691FE54400000D3207D403C40008A042192FE54400000EB077D403C40002E7C2792FE5440000088277D403C4000086D4592FE544000005A507F403C4000ACA26892FE54400000229181403C4000F8A68892FE5440000002B183403C40001032B992FE544000008A2087403C40
3	Distribution Line	2	0105000020E610000001000000010200000050000000E27FEB7B83FE5440E17E2B27A1403C403111A76F82FE54402F751EF6A1403C40A335E24B82FE5440E4DDE130A2403C40BFFEF04282FE5440AACE84ABA2403C40A717DA5B82FE54405DBA084FA3403C400A062ED382FE54402393A30DA6403C4099FE211383FE544064AC508EA7403C4061B63A4783FE54405206E8C0A8403C4042DC7F7483FE5440BAD16CC7A9403C401B1FF99F83FE54400A6D78B6AA403C40284EA3A783FE54405E1107CCAA403C40B4B156B183FE54409B851CCAAA403C406DFC11FC83FE544029B0458DAA403C40AA4ECA6084FE5440371F503CAA403C403F73ECD284FE544047BC35E3A9403C406C3A444085FE544029428B8BA9403C4055E344F485FE5440D6661FF5A8403C40FBEB017886FE54408302F186A8403C409A1159AD86FE5440BFC7425CA8403C407F7D3DB186FE54409A577361A8403C4019116FB486FE5440AA0E076DA8403C4030B3BAB686FE54404B752C88A8403C40EFAECFBF86FE54407176E70FA9403C40854845D486FE544046354B43AA403C40C5346CEC86FE544051EC5DB1AB403C40A79F7CFE86FE5440C34F9FC3AC403C40C70DA41587FE54403573802EAE403C40638AE52B87FE544017D8CB91AF403C40B52E744187FE544092DF4CF0B0403C40F51A9B5987FE5440A5695376B2403C40D68CC36E87FE5440A66B7ABCB3403C40C8B6538187FE54401FA2AFE6B4403C4044B5959687FE5440FE24033AB6403C406B0E75A487FE5440AFB3F719B7403C402126EAB987FE5440CA50525FB8403C40A9F9C7CA87FE544031DFF775B9403C404A68D9DA87FE5440919AA974BA403C40D7259BF087FE54409D51BCE2BB403C40F0B0F60588FE5440C7A5AA33BD403C40B780D31888FE5440DF600D69BE403C40E4C3962B88FE544008E4AF85BF403C40D3F43E4188FE54403047A2CEC0403C40D699576188FE54404E75E8A0C2403C4051F9BF8588FE5440C1811BC1C4403C407B4B879088FE54404FE32105C5403C40CAC13AAE88FE5440D1157E41C5403C403B20D4C288FE544045A2F24DC5403C4025C727B189FE5440D2953E90C4403C40FD8B8D538AFE5440848DC611C4403C40321601EF8AFE5440FA103995C3403C4095C52FAD8BFE54402B4DA202C3403C40D4C7AF808CFE544038FC0C59C2403C40402A22838DFE54405063E48EC1403C40492BF1928DFE54409433B07CC1403C40628945A28DFE5440C301DE4AC1403C40605B6AAA8DFE544078E7E01CC1403C4030ADECAF8DFE54404C87EEEDC0403C4030ADECAF8DFE544006526A87C0403C4014AA7F808DFE544035A95C68BD403C40927723448DFE544017F8D6CAB9403C400B80FE138DFE54407FDE65E2B6403C40368963EE8CFE5440CDE6DF9BB4403C40469D86BD8CFE54404D3D4872B1403C4079998F838CFE54409D4543C9AD403C4033445B498CFE5440CE933321AA403C4025BE23ED8BFE54402A4B1A6CA4403C40E6F2809A8BFE54404820B0199F403C407EB566698BFE54403A038DFC9B403C401339C5648BFE544003B1CFB59B403C4038A9945F8BFE5440C5C57C8F9B403C40A9EAFE578BFE544086DA29699B403C40A6F902508BFE544031459F4B9B403C403CAB3C438BFE54402A72AB339B403C402A03AD2F8BFE5440F168501D9B403C40E524B61D8BFE5440D7CD1C1E9B403C407D1724AA8AFE5440A45755789B403C40E82221C988FE5440B74519FB9C403C4085B6540786FE544022059A239F403C40E08D684D84FE5440524A847CA0403C406417D37B83FE54401CA36027A1403C40
4	Distribution Line	2	0105000020E610000001000000010200000039000000E3521F7B8CFE5440024387069C403C40F71007E78DFE544049A86962B3403C40DE5D0F098EFE5440CE1E7E96B5403C4056726D198EFE544032E9338DB6403C40CE86CB298EFE5440685F7A95B7403C4036DCA9398EFE5440DFD1BF9FB8403C4073DEEC4C8EFE544023EEEDD7B9403C402FE8315C8EFE544079F20BCBBA403C408585A86E8EFE544005FEDCF0BB403C4037B3397F8EFE544021D9EFF9BC403C408C50B0918EFE54407AAE5921BE403C4015248EA28EFE54401B736636BF403C40DEFB56AA8EFE54405D200199BF403C40B0AFD3B08EFE5440065A1ACCBF403C402DB601BB8EFE5440D40303FABF403C402BB52DC98EFE544015E05128C0403C4022C9A1E08EFE544005090E49C0403C40BA5313FD8EFE5440C7FD0A4FC0403C40C00D6F448FFE54406A958C19C0403C400B8611CA8FFE5440F3C08EB0BF403C404D32D83A90FE5440CA9F2355BF403C401A83C8F090FE5440B848A0C4BE403C401A2AD07891FE5440DA07D45EBE403C4070770EFA91FE54402EFD6EF7BD403C40DA7CB47892FE544036216F92BD403C407F7CB11593FE5440C33F1515BD403C409CB0BC9693FE54403E967BB0BC403C400004F3C293FE5440984D5E85BC403C406859D1D293FE544034F23B64BC403C40294ECED893FE5440C0DF8537BC403C4045DAFDDF93FE544015D520D0BB403C40E959BBCB93FE5440DE8F3677BA403C4084FE98AA93FE54400F28D771B8403C40B93DC08F93FE5440A9DDE1C9B6403C407467B57293FE544088919307B5403C400828F35D93FE5440D544A7B2B3403C40A0951F2893FE54407173EC47B0403C40920FE8CB92FE54404DEB107EAA403C40E7D4FAA692FE544010844F0BA8403C401539427F92FE54403898608DA5403C4012581E6192FE544006B52E93A3403C40DF41673692FE5440EBECF0E6A0403C40DD701B0292FE54402B0DF2BE9D403C40695E65D591FE54400972C0FA9A403C40D3CCDBB591FE54405F5A801C99403C4011E98A8B91FE5440C1B4CBA496403C406DAE988491FE5440FAC0A77296403C40D0296B7991FE5440D570884B96403C40DA0D0B6D91FE544084BDF53D96403C40F21753DF90FE54402102C3A196403C40C55F963D8FFE54400477E6EE97403C40BE1B676C8EFE5440324B958E98403C40111EDFB68CFE5440C6ED49EC99403C409A29317A8CFE54403DE2F7289A403C403CB006698CFE5440220764829A403C40554B3A688CFE544036803FCA9A403C40F4C0637B8CFE544027CBD2049C403C40
5	Distribution Line	2	0105000020E6100000020000000102000000530000000192ACB495FE5440010037C692403C400200709697FE544004008D4191403C4001A871A797FE54400200B73D91403C40000A81B197FE54400D00C15391403C40013681D997FE544003001F7093403C4001E2400798FE54400A00F32196403C40005EC33498FE5440FFFFF0E698403C4000403E5D98FE5440050095589B403C400030DC7C98FE54400200AB369D403C4000DCF1A298FE544000009BA19F403C4001AC89CE98FE544008008E67A2403C4000F4A6F998FE5440FEFFF622A5403C40015C092A99FE54400600FC2BA8403C4000986B5A99FE54400200602CAB403C400196038699FE54400500DFE5AD403C4002E6858B99FE5440FDFF0527AE403C40020C338D99FE544001006F34AE403C4000426D9399FE54400200193CAE403C4001E034EE99FE5440F9FF72EFAD403C4002EA9DB29AFE5440FCFFD246AD403C4000823F6C9BFE54400100B3A9AC403C4001403A689CFE54400600BFDAAB403C40005E967C9CFE5440090055CDAB403C40016468869CFE5440FEFF09D4AB403C4000E294939CFE54400A000AEBAB403C4000FA1E9E9CFE5440FEFF0702AC403C4001E4A8A89CFE544003003B2BAC403C40002A9FC99CFE544004005126AD403C4001D08CDD9CFE5440060082C6AD403C4000124FF29CFE544004003973AE403C40011663079DFE54400400C423AF403C40017CA21B9DFE5440000006C7AF403C400164E0269DFE54400300C623B0403C400178563C9DFE5440FBFF2BD9B0403C40001E6F4C9DFE54400300015DB1403C40007EF0639DFE54400300E61DB2403C400190EF7D9DFE54400300F2FCB2403C4001C6E2929DFE544007007CA1B3403C40025E9EA09DFE54400000551AB4403C4001BCC4A19DFE544009003E2DB4403C40008CA39E9DFE5440FFFFB093B4403C40003C84879DFE5440FFFFD2F6B4403C400156BD779DFE54400400AE1EB5403C40005683249DFE54400500E857B5403C400078C6B09CFE54400900B6ABB5403C400064A46A9CFE54400200C9DDB5403C40009CE1D59BFE5440FDFF6D41B6403C4000EA24A29BFE54400100546BB6403C40017A35C89AFE5440FEFFA528B7403C400122447F9AFE54400000B164B7403C40004A84399AFE544006003EA1B7403C4001685DB499FE54400200CB07B8403C4001C2421F99FE54400900EE76B8403C400014988B98FE5440010007E7B8403C40019C3BFF97FE5440FDFF4B53B9403C400174F75297FE5440060046D8B9403C4001D2C33996FE54400000A4B4BA403C40015A902095FE54400800408BBB403C400058510F95FE544005005D90BB403C400050AA0195FE5440FFFFFA85BB403C40017CB7E794FE54400600194EBB403C4000A8EFDD94FE544003006815BB403C4000785CD194FE54400000664FBA403C40002C6DB094FE54400100D34AB8403C4001A8188D94FE54400B00C014B6403C4000005E6994FE544007007BDBB3403C4001C2423A94FE5440030059F7B0403C40014CBD1294FE54400200C493AE403C4001506CE893FE544003007EF7AB403C400056E8BD93FE54400C003363A9403C4001A8F89D93FE544000004150A7403C4001063B8093FE544002000F56A5403C4001AE496393FE544005000A6BA3403C400068574893FE5440000055AAA1403C40007C052093FE5440030037219F403C4000EA53EA92FE544004008CB89B403C4000A006B992FE5440FEFF1EA298403C40005AE98D92FE5440010015F595403C4001A4528892FE54400400168E95403C4000BEB68C92FE54400200BE6F95403C40002EB19792FE5440FFFF354E95403C40018C0AA994FE54400900149B93403C400192ACB495FE5440010037C692403C400102000000030000000156BD779DFE54400400AE1EB5403C4000FA85129EFE54400400D563C0403C40C997D8B3A0FE54400AB43AC4BC403C40
6	Distribution Line	2	0105000020E61000000100000001020000005C000000336348DDA0FE544096C09DD7BD403C40C4E8BCEC9DFE544076863CDAC1403C4000D2A6B19DFE544001000CEBBD403C4000D250919DFE544004004FD7BB403C40007813699DFE54400200392BB9403C40016272639DFE5440040090D3B8403C4000EE17609DFE5440090000BEB8403C40009CC0569DFE544003008BB1B8403C40013A84B39CFE544005005434B9403C4000E2583F9CFE5440FEFFBD91B9403C40FF3F27C39BFE5440090077F3B9403C400098A4319BFE54400500E167BA403C4001C2F6B79AFE5440010015CABA403C40016ACB439AFE54400100F927BB403C40006636C299FE54400700D991BB403C400182264099FE5440FBFF51F9BB403C4001F6539698FE54400A003F84BC403C4001EC6B1698FE5440FFFF3CEBBC403C40007E0CA497FE54400500D344BD403C40000E57FD96FE5440FEFF1FC7BD403C400176B56B96FE54400B000D3BBE403C4000D0F0E295FE5440010006AEBE403C40023E214795FE54400500B427BF403C40013EC9B194FE544004006895BF403C4001E075EB93FE544002001831C0403C4001B65C5393FE5440070057A9C0403C400152288C92FE54400B001243C1403C400198419191FE54400400DE0DC2403C4000F4923291FE54400A005A5EC2403C4002E4E7C790FE544004008AB5C2403C400060AF6D90FE54400500D7FAC2403C4001D290F48FFE54400300BB58C3403C4000FE88588FFE544001003FCDC3403C40007AEB968EFE5440FFFF285CC4403C4000F6F7B48DFE5440FEFFCB13C5403C400194F3F38CFE54400300E7A9C5403C40014AC02A8CFE54400000614AC6403C40019409368BFE54400500660CC7403C400046B34C8AFE5440FCFFA1C1C7403C4000B0419989FE544004008D50C8403C4001E0179588FE5440FDFF2914C9403C4002E80A4A88FE5440FFFFE547C9403C40013E4B4488FE544005008B48C9403C400012A13C88FE54400400194BC9403C4001B0D83388FE54400600E647C9403C40014E102B88FE54400300A046C9403C40006CA42188FE5440FEFF3B40C9403C400136DC1888FE54400000EE37C9403C400094AC1188FE544005008B31C9403C4001B2B20588FE5440FFFF0B26C9403C400022649A87FE54400100BF40C8403C400136219187FE5440FEFF5B23C8403C4000D49F8987FE5440060098FFC7403C4001A83C8387FE5440060021E4C7403C40003C9D7A87FE54400000CEBDC7403C40FF8F967387FE54400B00BB91C7403C4001244B2A87FE54400200C6FCC5403C4001904DE986FE544004005C98C4403C4000DE2B7686FE54400000B1F9C1403C4000EE281786FE5440020020F1BF403C4000E003BF85FE544001001C02BE403C4001C8DC6A85FE544001003C08BC403C4001FCC81885FE54400300F71EBA403C40FF6F30DA84FE5440010050A9B8403C4002FE93A384FE54400300956AB7403C40003E966284FE544002000F01B6403C4001FAE00B84FE54400300A70BB4403C40FF7DFBD783FE54400500C8EEB2403C40002635CB83FE54400600F09EB2403C40001891B783FE5440FFFFDB26B2403C4001667E8B83FE544003007B15B1403C400192604D83FE544002006992AF403C400194670083FE54400B00B0DCAD403C400092E69382FE5440FFFF9575AB403C4001B8661082FE544000006587A8403C4000F4C68F81FE54400000DFA0A5403C40FFF9C13481FE54400900168EA3403C4001B8C5EC80FE5440FEFF85E8A1403C400120D09B80FE544001004016A0403C400034C54C80FE544007004E539E403C400130BEF57FFE5440060049649C403C40009059797FFE54400000859299403C4000369B0C7FFE54400100C12397403C40019478C37EFE5440FFFFBF8095403C4002C0A1867EFE54400600CF2094403C400272CE2E7EFE54400000932792403C40006892EF7DFE5440FDFF28C390403C4001B208A87DFE54400600E7258F403C4001343F797DFE5440FEFF36238E403C4001B215667DFE54400800B7B48D403C40010CDFE77CFE5440F9FF81D789403C40010CDFE77CFE54400200EAD589403C40
7	Distribution Line	2	0105000020E610000001000000010200000020000000003E03A57BFE5440000071268B403C400018DFE77CFE54400000EAD589403C400044F4B97DFE54400000B90689403C40004430727EFE544000001C4388403C40003ABEED7EFE544000002AC487403C400070DE777FFE54400000DA3287403C40005205F57FFE54400000EBAB86403C400088DEA580FE54400000B6E685403C40001AF54281FE54400000704185403C4000E21AC281FE5440000021B084403C4000660EA482FE54400000D0BB83403C40008A854C83FE54400000EE1C83403C400070056B83FE5440000063FF82403C400012370F84FE544000003A4C82403C4000BA65B984FE54400000669181403C400006970D85FE54400000E63581403C4000E8049C85FE54400000BCDF80403C400014CD0986FE54400000B59B80403C40007CF77F86FE54400000415280403C4000EC00BE86FE54400000042A80403C4000FCC70587FE544000004DFD7F403C4000CA06A487FE54400000369C7F403C40003080E387FE5440000005737F403C40007E375E88FE5440000042217F403C400002E2B588FE54400000B1E97E403C40007061EB89FE54400000942A7E403C4000A4FF748BFE54400000C1327D403C40008443888DFE5440000095F67B403C400050B9D48EFE5440000020337B403C4000E85E7890FE54400000C53F7A403C4000DED41492FE54400000804A79403C400010A94F92FE54400000CA2879403C40
8	Supply Line	0.5	0105000020E610000001000000010200000003000000C2ED822B92FE5440BF91803D79403C40D19FD24292FE54405F05E87477403C40FAF0F04192FE544056BB2F7877403C40
9	Supply Line	0.5	0105000020E61000000100000001020000000300000021A4DA6D90FE5440B131DE457A403C40AD13053790FE5440FE14E9E278403C4099C2E63790FE5440385FA1DF78403C40
10	Supply Line	0.5	0105000020E61000000100000001020000000300000020D254A38EFE544005F029507B403C40396977C68EFE5440AB6236A379403C40E10790C58EFE54401A904AA379403C40
11	Supply Line	0.5	0105000020E6100000010000000102000000030000003902E4D88CFE5440D5C2F25E7C403C4054C5A49B8CFE544019B946EA7A403C40B0268C9C8CFE5440E38B32EA7A403C40
12	Supply Line	0.5	0105000020E610000001000000010200000003000000234F30EB8AFE5440B78284897D403C400032F3F78AFE544085827DE57B403C407C42BCF98AFE544037A021E27B403C40
13	Supply Line	0.5	0105000020E610000001000000010200000002000000ABACA25889FE5440B7B830857E403C40B131C90489FE5440D8003EF17C403C40
14	Supply Line	0.5	0105000020E610000001000000010200000002000000221C054687FE5440382CE3D57F403C40ED8AE05D87FE5440466664267E403C40
15	Supply Line	0.5	0105000020E6100000010000000102000000020000002C8EB2A685FE54403ABAB4CD80403C406DDBA45A85FE544078025F507F403C40
16	Supply Line	0.5	0105000020E6100000010000000102000000020000000BDCF4E583FE54405B123E7982403C402B7EE1F183FE544025B2825780403C40
17	Supply Line	0.5	0105000020E610000001000000010200000002000000A71AFE3082FE5440B9313A3884403C40E11136E581FE54400F2772CF82403C40
18	Supply Line	0.5	0105000020E6100000010000000102000000020000001486043D80FE5440F907A25B86403C4009974F4680FE5440A87D017484403C40
19	Supply Line	0.5	0105000020E610000001000000010200000002000000E32F8AA57EFE54402344590E88403C40131DF1487EFE54402F5D435F86403C40
20	Supply Line	0.5	0105000020E610000001000000010200000002000000AD9A42AD7CFE5440A30301138A403C4039011FB97CFE5440D3BC871A88403C40
21	Supply Line	0.5	0105000020E610000001000000010200000002000000EBBFEDDD7BFE5440E8A21DEB8A403C402CD4B5757BFE5440BC8E355289403C40
22	Supply Line	0.5	0105000020E6100000010000000102000000020000003FDEBF7982FE544094659FB387403C407357405A82FE5440C38648E289403C40
23	Supply Line	0.5	0105000020E61000000100000001020000000200000037D55E1684FE5440DE65C11886403C40ACE1C47684FE5440C16D80EF87403C40
24	Supply Line	0.5	0105000020E610000001000000010200000003000000B20814C085FE5440C1F2AA6E84403C40E86F17C185FE544068336FCA86403C40759883C285FE54408C89EBD386403C40
25	Supply Line	0.5	0105000020E610000001000000010200000002000000ABBEC48587FE5440A596A15B83403C4099BD98CF87FE5440583D9A5A85403C40
26	Supply Line	0.5	0105000020E6100000010000000102000000020000005B9ACA7E89FE5440590F1E2282403C40F59FFE5A89FE5440B3E7DB2F84403C40
27	Supply Line	0.5	0105000020E6100000010000000102000000020000005672960D8BFE54404D96C52F81403C402875355C8BFE54400D229FE782403C40
28	Supply Line	0.5	0105000020E61000000100000001020000000200000004BE95158DFE54407CE03CEF7F403C40AC0BBEFB8CFE54402C694A9E81403C40
29	Supply Line	0.5	0105000020E6100000010000000102000000020000002DE165B38EFE5440705512F57E403C406B5ADEEF8EFE5440D86CBA1880403C40
30	Supply Line	0.5	0105000020E610000001000000010200000002000000C3038AAA90FE5440A2C12BCB7D403C405BF4038790FE5440545B6AD97E403C40
31	Supply Line	0.5	0105000020E6100000010000000102000000020000000697AD4A93FE5440F43A0EB086403C4077D0281C93FE54405D4E630588403C40
32	Supply Line	0.5	0105000020E610000001000000010200000002000000C63815C694FE54407BDEEE8A85403C40557D11FF94FE5440B444EA7A86403C40
33	Supply Line	0.5	0105000020E610000001000000010200000002000000DD9617DD91FE5440ED4EED1892403C40697E528691FE544065C00CF68F403C40
34	Supply Line	0.5	0105000020E61000000100000001020000000200000000308F2290FE544000006E7693403C408EDDF64290FE544078B927EF90403C40
35	Supply Line	0.5	0105000020E6100000010000000102000000020000000078E0688EFE5440000083CB94403C40BCCFAF0D8EFE54408F0576B192403C40
36	Supply Line	0.5	0105000020E6100000010000000102000000020000001D05BE8F8CFE54401243373C96403C406C2BA2958CFE54407E5F0DE493403C40
37	Supply Line	0.5	0105000020E6100000010000000102000000020000005E0D98F28AFE5440CA9CF48797403C40F494DD8D8AFE5440F935329395403C40
38	Supply Line	0.5	0105000020E6100000010000000102000000020000004BBB231A89FE5440F31823FB98403C40A4F0CF1589FE54407A5F0BA996403C40
39	Supply Line	0.5	0105000020E6100000010000000102000000020000005E0EEA6487FE5440DE4375579A403C4010CEDB0687FE5440237B9B4E98403C40
40	Supply Line	0.5	0105000020E610000001000000010200000002000000F26FA46C85FE5440D88AFEEC9B403C40F06E398585FE5440D5E9DF5A99403C40
41	Supply Line	0.5	0105000020E610000001000000010200000002000000B543E4F783FE54409EBD02159D403C4041C0156F83FE5440BDF0C2269B403C40
42	Supply Line	0.5	0105000020E61000000100000001020000000200000044BED8E981FE5440489000BE9E403C40CCAB38FC81FE5440E8B5EC309D403C40
43	Supply Line	0.5	0105000020E610000001000000010200000002000000B830539D7EFE5440781648C18D403C40144AD1A17FFE5440BAF3E0EF8D403C40
44	Supply Line	0.5	0105000020E610000001000000010200000002000000389806E97FFE5440FD91463395403C40B142BB1D80FE5440FEF5D32693403C40
45	Supply Line	0.5	0105000020E610000001000000010200000002000000DC7B8F728BFE5440506E3E919C403C40120EAF118BFE54402952DBB79D403C40
46	Supply Line	0.5	0105000020E610000001000000010200000002000000E3521F7B8CFE5440024387069C403C405B7FB8F68CFE5440B5CEE9D19C403C40
47	Supply Line	0.5	0105000020E61000000100000001020000000200000054334DDD8BFE54404D3BFB66A3403C40D325067C8BFE5440D8A03017A3403C40
48	Supply Line	0.5	0105000020E61000000100000001020000000200000000CD47E68CFE5440554D68E7A2403C408B84C3458DFE544086BE26DCA1403C40
49	Supply Line	0.5	0105000020E610000001000000010200000002000000E56284738CFE54408CD13DC7AC403C40906568018CFE54408659D151AE403C40
50	Supply Line	0.5	0105000020E610000001000000010200000002000000F8C0FA3B8DFE544028D6A867A8403C408B348BB48DFE5440A4925068A9403C40
51	Supply Line	0.5	0105000020E6100000010000000102000000020000005CFA2F9B8DFE5440DC9B2A84AE403C40A771561C8EFE544057363D75AF403C40
52	Supply Line	0.5	0105000020E610000001000000010200000002000000B4AE881A8DFE54408E398547B7403C4016578BC28CFE54407AB200D9B6403C40
53	Supply Line	0.5	0105000020E61000000100000001020000000200000054DCE11B8EFE54409A7FD6B4B6403C407F934B828EFE54403BE53640B5403C40
54	Supply Line	0.5	0105000020E6100000010000000102000000030000008BFA269D91FE54408782ADAB97403C40EC90BC4C91FE5440E4E8068799403C404628EF4D91FE5440E4E8068799403C40
55	Supply Line	0.5	0105000020E6100000010000000102000000020000000A80E49992FE5440BFD971B396403C400BB0FE2693FE5440E015940C98403C40
56	Supply Line	0.5	0105000020E6100000010000000102000000020000003857541592FE544005D5EFE79E403C40E47D688D91FE544095AA7C219E403C40
57	Supply Line	0.5	0105000020E61000000100000001020000000200000059EE811293FE5440202394459E403C4079C00C7093FE5440BB4981859C403C40
58	Supply Line	0.5	0105000020E61000000100000001020000000200000037ECBC6693FE5440DAF891A5A3403C401FC9C9F393FE544096D09F8CA4403C40
59	Supply Line	0.5	0105000020E61000000100000001020000000200000022C427D193FE54406AFA1F8EAA403C40CBE4DA3694FE544038EC2DF7A8403C40
60	Supply Line	0.5	0105000020E61000000100000001020000000200000055BF3FD792FE544087065534AB403C40EBD09B5692FE5440BF683AD6AA403C40
61	Supply Line	0.5	0105000020E61000000100000001020000000200000033528A3893FE54403AD1B652B1403C4066AAC25A92FE5440005C27DAB2403C40
62	Supply Line	0.5	0105000020E6100000010000000102000000020000002A027D3194FE54406856986FB0403C4010378EB994FE5440AF77B9BAB1403C40
63	Supply Line	0.5	0105000020E610000001000000010200000002000000AEC1ECE197FE54400410D2A488403C40A66C55EA97FE5440DAF28C2F87403C40
64	Supply Line	0.5	0105000020E6100000010000000102000000020000004A85095D98FE5440F652B3658B403C40E9AADBD998FE54403950D45B8B403C40
65	Supply Line	0.5	0105000020E610000001000000010200000002000000D277EB6999FE54401E24136D91403C404FE2F39B99FE544088253C488F403C40
66	Supply Line	0.5	0105000020E61000000100000001020000000200000040E9F3559AFE5440580EB68896403C407845E6E49AFE5440DE91853196403C40
67	Supply Line	0.5	0105000020E6100000010000000102000000020000005EDE436D9BFE5440BA828A899C403C40448FBE979BFE54408A00C8029A403C40
68	Supply Line	0.5	0105000020E610000001000000010200000002000000FDBA65509CFE5440F8CC4F79A1403C400695E6DB9CFE544043682392A1403C40
69	Supply Line	0.5	0105000020E6100000010000000102000000020000004CAECF269DFE5440B27DC8E2A7403C400425FE769DFE5440287E081BA6403C40
70	Supply Line	0.5	0105000020E61000000100000001020000000200000080EE89D29DFE544040BE1F78AD403C40E105BA619EFE54404461369FAD403C40
71	Supply Line	0.5	0105000020E610000001000000010200000002000000AC9B5C969EFE544020B004D6B3403C400AF870F19EFE5440025858B0B1403C40
72	Supply Line	0.5	0105000020E610000001000000010200000002000000D656CCCB97FE5440B1D3F5B692403C406E59977897FE5440E05D63EB94403C40
73	Supply Line	0.5	0105000020E61000000100000001020000000200000092B8174898FE5440A12EB0119A403C40750CDBBC97FE5440D47BE80299403C40
74	Supply Line	0.5	0105000020E610000001000000010200000002000000A9A2DC9E98FE5440B92B405F9F403C405C11974298FE5440E97F1E91A1403C40
75	Supply Line	0.5	0105000020E610000001000000010200000002000000D1736C1799FE544006371201A7403C4017F33F8998FE5440D006C070A5403C40
76	Supply Line	0.5	0105000020E6100000010000000102000000020000009E378B6599FE5440A6DF59DEAB403C4017932F0E99FE54405FFC2284AE403C40
77	Supply Line	0.5	0105000020E6100000010000000102000000020000006BB208A87DFE5440E6DDE5258F403C406F61A1C67DFE544082ADE5C890403C40
78	Supply Line	0.5	0105000020E6100000010000000102000000020000001C887EE47EFE54401006F23D96403C404DB098507EFE544068A241AA95403C40
79	Supply Line	0.5	0105000020E610000001000000010200000002000000EEE08A997FFE5440E8494F4D9A403C40B01F67677FFE5440E1F9F1419C403C40
80	Supply Line	0.5	0105000020E610000001000000010200000002000000501611B480FE54403CA6EEA1A0403C409A061BFD7FFE5440296DA1CFA0403C40
81	Supply Line	0.5	0105000020E6100000010000000102000000020000007E17B17D81FE544004F36737A5403C406DD4822881FE544092A12AA0A7403C40
82	Supply Line	0.5	0105000020E6100000010000000102000000020000001ECEBB9683FE5440248F325BB1403C4020D4B2C182FE5440D2362E6FB1403C40
83	Supply Line	0.5	0105000020E610000001000000010200000002000000EC0C31D484FE54407F804D86B8403C40F110AEC284FE5440594A9972BA403C40
84	Supply Line	0.5	0105000020E61000000100000001020000000200000007EE190486FE54405D081886BF403C407EC5ECB185FE5440CF88F516BF403C40
85	Supply Line	0.5	0105000020E61000000100000001020000000200000067662F3187FE5440A764D922C6403C40B1720E4787FE5440EE2BBF0BC7403C40
86	Supply Line	0.5	0105000020E610000001000000010200000002000000E058F16288FE5440A8E8BB36C9403C40FA1B4C3088FE54405F229447CB403C40
87	Supply Line	0.5	0105000020E610000001000000010200000002000000F127EBC489FE544052C8C62DC8403C40541535558AFE54403D12D5C7CA403C40
88	Supply Line	0.5	0105000020E61000000100000001020000000200000093959CE48BFE544062D5FC81C6403C40B39086AC8BFE544078DB50D4C9403C40
89	Supply Line	0.5	0105000020E6100000010000000102000000020000002AAA5A5C8DFE5440344BB558C5403C40917369DD8DFE5440F15E44F5C7403C40
90	Supply Line	0.5	0105000020E6100000010000000102000000020000005D84E6708FFE544098C80CBBC3403C40F7D0B2448FFE54402173D4D9C6403C40
91	Supply Line	0.5	0105000020E610000001000000010200000002000000F887D7EA90FE54408F4FFA98C2403C403B7DF33591FE54403AECB15CC4403C40
92	Supply Line	0.5	0105000020E610000001000000010200000002000000768CC3DE92FE544054795103C1403C40670B40BF92FE54402CCC8CEAC2403C40
93	Supply Line	0.5	0105000020E61000000100000001020000000200000060095A4796FE5440E1E29C59BE403C405C5A218696FE5440853CC171BF403C40
94	Supply Line	0.5	0105000020E610000001000000010200000002000000D4EFAB6A98FE5440C41765A7BC403C407B99133498FE544081694EF7BD403C40
95	Supply Line	0.5	0105000020E610000001000000010200000002000000AA7909F299FE544047F3C46ABB403C40DF964C209AFE544054A424EDBB403C40
96	Supply Line	0.5	0105000020E610000001000000010200000002000000D70F29F99BFE544072DBF7C8B9403C4043B435E09BFE5440C7D463A7BA403C40
97	Supply Line	0.5	0105000020E6100000010000000102000000020000008C12699F82FE5440D0F746D1A1403C403C135FE982FE544040A612AFA2403C40
98	Supply Line	0.5	0105000020E610000001000000010200000002000000D852571085FE544010B6CC10A0403C40D40AF4D584FE54409097E8E1A0403C40
99	Supply Line	0.5	0105000020E61000000100000001020000000200000074DBE6CF86FE544030F3B4B69E403C4040112D5787FE5440403A160DA1403C40
100	Supply Line	0.5	0105000020E610000001000000010200000002000000585719F28BFE5440801461CBC2403C406038A09E8BFE5440B0C9248AC2403C40
101	Supply Line	0.5	0105000020E610000001000000010200000002000000FC21635F89FE5440F08C54D1C4403C4004E3008A89FE5440900A7A16C4403C40
102	Supply Line	0.5	0105000020E610000001000000010200000002000000E8ECD1E192FE544000A3803EBD403C40E0FA1B7292FE5440D0D70BECBB403C40
103	Supply Line	0.5	0105000020E610000001000000010200000002000000F43E438695FE54402079A23DBB403C404463919695FE544040BB194CB9403C40
104	Supply Line	0.5	0105000020E61000000100000001020000000200000044AEEBAC99FE5440A0A4560DB8403C40983B755899FE5440202D3AD8B6403C40
105	Supply Line	0.5	0105000020E610000001000000010200000002000000D8A90D509AFE54401020AD8DB7403C40C865D8789AFE5440004623F1B6403C40
106	Supply Line	0.5	0105000020E610000001000000010200000002000000A038C6649CFE54402057B7E1B5403C40A00E67359CFE5440008E37AFB5403C40
107	Supply Line	0.5	0105000020E610000001000000010200000002000000002C951987FE544000006D6DAE403C4000C828C887FE544000002F14AF403C40
108	Supply Line	0.5	0105000020E61000000100000001020000000200000000D2C7E587FE54400000972CBB403C400078D36F88FE54400000089AB9403C40
109	Distribution Line	2	0105000020E6100000010000000102000000020000000082A61C82FE5440000047CDA8403C40003ABADC82FE544000001247A6403C40
110	Distribution Line	2	0105000020E610000001000000010200000002000000001CE3AC8DFE54400000D307C1403C4000F427C18EFE54400000ACFABF403C40
111	Distribution Line	2	0105000020E61000000100000001020000000200000000A466698BFE544000008DFC9B403C4000C2F16B8CFE5440000044079B403C40
112	Distribution Line	2	0105000020E610000001000000010200000002000000001A63718FFE5440000098C597403C40007E95438FFE544000009E2294403C40
113	Distribution Line	2	0105000020E6100000010000000102000000020000000002D11792FE54400000D40B7D403C4000FE822B92FE54400000823D79403C40
114	Distribution Line	2	0105000020E610000001000000010200000002000000001AF2B196FE54400000368788403C4000CA8D8E97FE54400000715E85403C40
115	Distribution Line	2	0105000020E61000000100000001020000000200000000D035F894FE544000009E71BB403C4000344ADC93FE544000006605BC403C40
116	Overhead tank	0	0105000020E610000001000000010200000005000000C808FF70A0FE5440A4EC0B72C1403C407C653463A2FE544074E52B0ABE403C4048DC53C0A1FE544043504950B8403C40338AC5B39FFE54405F66D691BB403C40C808FF70A0FE5440A4EC0B72C1403C40
117	Borehole to overhead tank line	2	0105000020E6100000010000000102000000050000000102D1A1A1FE5440010037DDCD403C40481C4CA5A0FE5440BD449DBFCF403C400AA2D3659FFE54408D408B3CC4403C404330589FA1FE5440C0A7E349C0403C40CD635465A1FE54404D87662EBE403C40
118	Bore hole	0	0105000020E610000001000000010200000005000000001C22B5A0FE54400000572BCD403C400012DB40A1FE54400000FBD9CF403C4000240BDAA2FE544000002694CB403C4000325744A2FE5440000087DDC8403C40001C22B5A0FE54400000572BCD403C40
119	Supply Line	2	0105000020E610000001000000010200000004000000FABAA0ABA1FE544033DE0742CE403C40F54B7EEE9EFE5440141113FCD4403C40DA22BF8C9DFE544013558A73D7403C4082032F449DFE544083B8C6CAD4403C40
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 104, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: boundary_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boundary_gid_seq', 3, true);


--
-- Name: boundarybuilding_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boundarybuilding_gid_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 4, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 26, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: drainage_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drainage_gid_seq', 207, true);


--
-- Name: electrical_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.electrical_gid_seq', 288, true);


--
-- Name: house_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.house_gid_seq', 105, true);


--
-- Name: issue_issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issue_issue_id_seq', 13, true);


--
-- Name: man hole_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."man hole_gid_seq"', 32, true);


--
-- Name: outlet_valve_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.outlet_valve_gid_seq', 169, true);


--
-- Name: park_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.park_gid_seq', 4, true);


--
-- Name: road_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.road_gid_seq', 11, true);


--
-- Name: sanitary_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sanitary_gid_seq', 124, true);


--
-- Name: sanitary_junction_point_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sanitary_junction_point_gid_seq', 45, true);


--
-- Name: sewer_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sewer_gid_seq', 124, true);


--
-- Name: sewer_junction_points_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sewer_junction_points_gid_seq', 39, true);


--
-- Name: street_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.street_gid_seq', 44, true);


--
-- Name: swimmingpool_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.swimmingpool_gid_seq', 1, true);


--
-- Name: telephone_internet_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.telephone_internet_gid_seq', 284, true);


--
-- Name: temple_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temple_gid_seq', 1, true);


--
-- Name: water_network_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.water_network_gid_seq', 119, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: boundary boundary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boundary
    ADD CONSTRAINT boundary_pkey PRIMARY KEY (gid);


--
-- Name: boundarybuilding boundarybuilding_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boundarybuilding
    ADD CONSTRAINT boundarybuilding_pkey PRIMARY KEY (gid);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: drainage drainage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drainage
    ADD CONSTRAINT drainage_pkey PRIMARY KEY (gid);


--
-- Name: electrical electrical_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.electrical
    ADD CONSTRAINT electrical_pkey PRIMARY KEY (gid);


--
-- Name: house house_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house
    ADD CONSTRAINT house_pkey PRIMARY KEY (gid);


--
-- Name: issue_issue issue_issue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_issue
    ADD CONSTRAINT issue_issue_pkey PRIMARY KEY (id);


--
-- Name: man hole man hole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."man hole"
    ADD CONSTRAINT "man hole_pkey" PRIMARY KEY (gid);


--
-- Name: outlet_valve outlet_valve_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outlet_valve
    ADD CONSTRAINT outlet_valve_pkey PRIMARY KEY (gid);


--
-- Name: park park_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.park
    ADD CONSTRAINT park_pkey PRIMARY KEY (gid);


--
-- Name: road road_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.road
    ADD CONSTRAINT road_pkey PRIMARY KEY (gid);


--
-- Name: sanitary_junction_point sanitary_junction_point_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sanitary_junction_point
    ADD CONSTRAINT sanitary_junction_point_pkey PRIMARY KEY (gid);


--
-- Name: sanitary sanitary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sanitary
    ADD CONSTRAINT sanitary_pkey PRIMARY KEY (gid);


--
-- Name: sewer_junction_points sewer_junction_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sewer_junction_points
    ADD CONSTRAINT sewer_junction_points_pkey PRIMARY KEY (gid);


--
-- Name: sewer sewer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sewer
    ADD CONSTRAINT sewer_pkey PRIMARY KEY (gid);


--
-- Name: street street_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.street
    ADD CONSTRAINT street_pkey PRIMARY KEY (gid);


--
-- Name: swimmingpool swimmingpool_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.swimmingpool
    ADD CONSTRAINT swimmingpool_pkey PRIMARY KEY (gid);


--
-- Name: telephone_internet telephone_internet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telephone_internet
    ADD CONSTRAINT telephone_internet_pkey PRIMARY KEY (gid);


--
-- Name: temple temple_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temple
    ADD CONSTRAINT temple_pkey PRIMARY KEY (gid);


--
-- Name: water_network water_network_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_network
    ADD CONSTRAINT water_network_pkey PRIMARY KEY (gid);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: boundary_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boundary_geom_idx ON public.boundary USING gist (geom);


--
-- Name: boundarybuilding_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boundarybuilding_geom_idx ON public.boundarybuilding USING gist (geom);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: drainage_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX drainage_geom_idx ON public.drainage USING gist (geom);


--
-- Name: electrical_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX electrical_geom_idx ON public.electrical USING gist (geom);


--
-- Name: house_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX house_geom_idx ON public.house USING gist (geom);


--
-- Name: issue_issue_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX issue_issue_location_id ON public.issue_issue USING gist (location);


--
-- Name: man hole_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "man hole_geom_idx" ON public."man hole" USING gist (geom);


--
-- Name: outlet_valve_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX outlet_valve_geom_idx ON public.outlet_valve USING gist (geom);


--
-- Name: park_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX park_geom_idx ON public.park USING gist (geom);


--
-- Name: road_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX road_geom_idx ON public.road USING gist (geom);


--
-- Name: sanitary_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sanitary_geom_idx ON public.sanitary USING gist (geom);


--
-- Name: sanitary_junction_point_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sanitary_junction_point_geom_idx ON public.sanitary_junction_point USING gist (geom);


--
-- Name: sewer_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sewer_geom_idx ON public.sewer USING gist (geom);


--
-- Name: sewer_junction_points_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sewer_junction_points_geom_idx ON public.sewer_junction_points USING gist (geom);


--
-- Name: street_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX street_geom_idx ON public.street USING gist (geom);


--
-- Name: swimmingpool_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX swimmingpool_geom_idx ON public.swimmingpool USING gist (geom);


--
-- Name: telephone_internet_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX telephone_internet_geom_idx ON public.telephone_internet USING gist (geom);


--
-- Name: temple_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX temple_geom_idx ON public.temple USING gist (geom);


--
-- Name: water_network_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX water_network_geom_idx ON public.water_network USING gist (geom);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

