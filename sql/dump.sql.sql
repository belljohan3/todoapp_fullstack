--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2024-04-08 09:36:41

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
-- TOC entry 220 (class 1259 OID 33497)
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33496)
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO postgres;

--
-- TOC entry 3612 (class 0 OID 0)
-- Dependencies: 219
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- TOC entry 214 (class 1259 OID 33435)
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255)
);


ALTER TABLE public.directus_collections OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 33812)
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 33474)
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 33473)
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO postgres;

--
-- TOC entry 3613 (class 0 OID 0)
-- Dependencies: 217
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- TOC entry 222 (class 1259 OID 33521)
-- Name: directus_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);


ALTER TABLE public.directus_files OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 33926)
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33511)
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 33685)
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 33872)
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 33871)
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_notifications_id_seq OWNER TO postgres;

--
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 239
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- TOC entry 243 (class 1259 OID 33943)
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 33826)
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 33547)
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


ALTER TABLE public.directus_permissions OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33546)
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 223
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- TOC entry 226 (class 1259 OID 33566)
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 33565)
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO postgres;

--
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 225
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- TOC entry 228 (class 1259 OID 33591)
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 33590)
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO postgres;

--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 227
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- TOC entry 230 (class 1259 OID 33610)
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);


ALTER TABLE public.directus_revisions OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 33609)
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO postgres;

--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 229
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- TOC entry 215 (class 1259 OID 33445)
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 33633)
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);


ALTER TABLE public.directus_sessions OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 33646)
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(50) DEFAULT NULL::character varying,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json
);


ALTER TABLE public.directus_settings OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 33645)
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO postgres;

--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 232
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- TOC entry 241 (class 1259 OID 33892)
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 33977)
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 33456)
-- Name: directus_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true
);


ALTER TABLE public.directus_users OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 33674)
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);


ALTER TABLE public.directus_webhooks OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 33673)
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO postgres;

--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 234
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- TOC entry 248 (class 1259 OID 33999)
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    is_completed boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 33998)
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO postgres;

--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 247
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- TOC entry 246 (class 1259 OID 33986)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 33985)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 245
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3294 (class 2604 OID 33500)
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 33477)
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- TOC entry 3321 (class 2604 OID 33875)
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- TOC entry 3298 (class 2604 OID 33550)
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- TOC entry 3299 (class 2604 OID 33569)
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- TOC entry 3302 (class 2604 OID 33594)
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- TOC entry 3304 (class 2604 OID 33613)
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- TOC entry 3305 (class 2604 OID 33649)
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- TOC entry 3311 (class 2604 OID 33677)
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- TOC entry 3331 (class 2604 OID 34002)
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- TOC entry 3330 (class 2604 OID 33989)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3578 (class 0 OID 33497)
-- Dependencies: 220
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
1	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-18 19:40:35.307+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
2	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:31:17.503+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
3	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:31:41.824+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_collections	tasks	\N	http://localhost:8055
4	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:31:47.732+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_collections	users	\N	http://localhost:8055
5	update	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:31:56.252+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_collections	tasks	\N	http://localhost:8055
6	update	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:31:58.115+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_collections	users	\N	http://localhost:8055
7	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:32:08.95+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_fields	1	\N	http://localhost:8055
8	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:32:12.917+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_fields	2	\N	http://localhost:8055
9	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:32:15.258+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_fields	3	\N	http://localhost:8055
10	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:32:17.45+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_fields	4	\N	http://localhost:8055
11	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:32:19.418+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_fields	5	\N	http://localhost:8055
12	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:32:22.25+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_fields	6	\N	http://localhost:8055
13	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:32:24.485+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_fields	7	\N	http://localhost:8055
14	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:32:32.08+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_fields	8	\N	http://localhost:8055
15	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:32:34.215+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_fields	9	\N	http://localhost:8055
16	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:32:36.264+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_fields	10	\N	http://localhost:8055
17	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:32:41.336+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_fields	11	\N	http://localhost:8055
18	update	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:34:13.163+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
19	update	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 11:50:42.79+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
20	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 13:16:31.58+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_flows	58f1322d-a67a-4204-b9e5-1379f727362b	\N	http://localhost:8055
21	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 13:17:37.253+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_operations	4e0e3e28-433c-4ffc-8ada-30a19c0cdb0b	\N	http://localhost:8055
22	update	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 13:17:37.289+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_flows	58f1322d-a67a-4204-b9e5-1379f727362b	\N	http://localhost:8055
23	run	\N	2023-10-25 13:18:07.285+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_flows	58f1322d-a67a-4204-b9e5-1379f727362b	\N	\N
24	run	\N	2023-10-25 13:18:39.12+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_flows	58f1322d-a67a-4204-b9e5-1379f727362b	\N	\N
25	delete	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 13:23:23.269+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_flows	58f1322d-a67a-4204-b9e5-1379f727362b	\N	http://localhost:8055
26	update	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 13:55:12.008+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
27	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 14:25:01.307+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
28	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 14:26:25.336+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
29	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 14:26:38.68+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
30	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 14:45:20.607+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
31	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 14:47:16.896+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
32	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 14:47:20.051+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
33	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 14:47:24.163+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
34	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 14:47:25.391+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
35	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 14:47:25.44+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
36	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:13:23.03+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
37	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:18:24.164+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
38	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:18:26.602+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
39	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:18:27.837+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
40	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:19:33.488+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
41	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:19:35.838+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
42	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:19:36.586+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
43	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:19:37.727+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
44	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:19:39.206+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
45	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:19:41.097+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
46	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:29:10.534+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
47	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:36:29.891+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
48	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:44:07.246+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
49	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:44:10.593+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
50	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:44:15.741+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
51	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:44:17.411+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
52	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:44:19.064+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
53	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:47:16.904+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
54	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 15:49:32.834+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
55	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 20:50:09.372+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
56	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 20:52:03.503+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
57	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 20:58:09.525+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
58	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 21:00:06.248+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
59	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-10-25 21:01:22.926+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
60	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-12 16:45:24.321+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
61	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-12 16:48:22.892+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
62	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 14:08:18.804+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
63	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 14:11:44.133+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
64	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 14:16:17.544+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
65	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 14:28:01.522+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
66	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 14:31:21.637+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
67	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 14:31:30.632+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
68	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 14:39:57.16+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
69	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 14:42:23.559+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
70	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 14:42:23.585+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
71	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 14:43:56.269+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
72	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 14:51:32.27+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
73	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 14:56:14.5+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
74	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 15:02:00.423+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
75	update	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 15:04:52.18+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
76	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-11-20 15:05:43.109+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
77	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:24:01.992+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
78	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:28:36.326+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
79	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:30:36.558+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
80	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:35:03.635+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
81	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:40:59.312+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
82	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:41:24.242+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
83	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:42:48.918+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
84	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:43:25.961+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
85	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:46:14.983+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
86	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:46:53.561+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
87	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:47:08.478+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
88	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:48:33.037+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
89	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:49:12.85+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
90	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:50:12.792+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
91	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-03 10:51:19.603+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
92	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-10 08:35:19.03+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
93	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-10 08:50:18.227+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
94	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-15 10:41:53.26+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
95	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-27 19:32:49.96+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
96	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-27 19:57:25.106+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
97	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-27 19:57:33.206+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
98	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-27 19:58:16.388+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
99	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-27 19:58:18.457+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
100	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-27 19:58:19.846+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
101	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-27 19:58:23.109+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
102	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:15:20.69+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
103	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:20:45.61+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
104	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:22:30.054+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
105	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:22:38.164+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
106	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:22:45.673+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
107	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:25:45.405+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
108	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:26:05.735+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
109	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:33:05.064+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
110	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:33:17.165+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
111	update	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:33:42.698+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
112	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:33:53.496+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
113	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:36:23.472+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
114	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:36:46.332+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
115	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:36:52.477+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
116	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:41:50.006+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
117	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:43:11.198+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
118	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:43:11.834+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
119	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:43:49.856+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
120	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:43:52.49+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
121	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:44:00.309+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
122	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:44:32.874+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
123	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:44:34.299+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
124	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:44:34.837+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
125	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:45:05.647+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
126	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:45:08.602+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
127	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:46:19.122+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
128	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:46:58.691+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
129	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 10:55:57.07+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
130	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 11:02:12.699+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
131	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 11:02:23.129+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
132	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 11:02:58.201+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
133	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 11:03:13.977+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
134	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 11:04:16.217+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
135	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 11:12:33.88+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
136	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 11:13:19.639+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
137	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 11:21:12.436+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
138	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 11:24:01.156+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
139	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 11:45:54.064+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
140	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 11:55:12.65+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
141	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 12:20:06.078+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
142	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 12:20:46.545+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
143	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 12:40:05.974+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
144	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 14:07:26.586+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
145	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 14:49:44.803+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
146	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2023-12-28 15:21:51.211+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
147	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 14:30:55.845+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
148	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 14:53:58.495+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
149	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 14:55:26.256+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
150	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 14:56:44.782+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
151	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 15:17:05.127+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
152	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 15:19:56.877+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
153	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 15:30:13.999+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
154	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 15:53:28.049+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
155	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 15:57:41.241+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
156	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 16:33:33.643+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
157	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 16:48:12.775+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
158	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 16:48:20.109+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
159	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 17:09:32.715+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	tasks	4	\N	http://localhost:8055
160	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 17:10:26.107+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
161	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-01-20 17:36:28.662+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
162	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-05 20:55:11.197+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
163	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-05 20:55:41.609+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
164	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-05 21:08:15.23+01	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
165	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 16:45:07.216+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
166	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:05:40.762+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
167	update	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:06:09.741+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	users	1	\N	http://localhost:8055
168	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:06:31.43+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
169	delete	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:06:38.816+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	tasks	1	\N	http://localhost:5173
170	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:06:53.573+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
171	delete	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:07:08.876+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	tasks	4	\N	http://localhost:5173
172	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:34:05.95+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
173	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:37:16.341+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
174	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:37:37.371+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
175	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:38:39.778+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
176	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:38:44.876+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
177	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:38:55.632+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
178	delete	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:40:14.796+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	tasks	3	\N	http://localhost:5173
179	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:41:35.23+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
180	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-02-06 17:55:35.154+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
181	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 10:38:16.303+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
182	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 10:40:49.253+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
183	delete	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 10:41:18.481+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	tasks	2	\N	http://localhost:5174
184	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 10:48:42.094+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
185	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 10:51:49.805+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
186	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 10:55:46.873+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
187	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 11:12:41.903+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
188	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 11:17:56.791+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	tasks	5	\N	http://localhost:8055
189	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 11:18:18.484+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	tasks	6	\N	http://localhost:8055
190	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 11:31:16.9+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
191	delete	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 11:42:30.031+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	tasks	5	\N	http://localhost:5174
192	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 11:43:29.437+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
193	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 11:45:47.914+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
194	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 11:46:45.81+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
195	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 11:51:33.83+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
196	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 12:04:14.367+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_settings	1	\N	http://localhost:8055
197	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 12:27:02.319+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
198	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 12:42:44.778+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
199	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 13:11:04.287+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
200	update	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 13:37:31.333+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_settings	1	\N	http://localhost:8055
201	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 13:37:42.702+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_permissions	1	\N	http://localhost:8055
202	delete	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 13:38:17.345+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_permissions	1	\N	http://localhost:8055
203	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 13:38:25.877+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_permissions	2	\N	http://localhost:8055
204	delete	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 13:38:56.601+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_permissions	2	\N	http://localhost:8055
205	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 13:39:05.427+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_permissions	3	\N	http://localhost:8055
206	delete	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 13:39:15.259+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_permissions	3	\N	http://localhost:8055
207	update	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 14:00:15.184+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
208	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 14:12:49.975+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
209	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 14:46:56.563+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
210	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:02:41.817+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
211	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:05:22.251+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
212	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:27:29.799+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
213	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:27:49.926+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
214	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:28:11.376+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
215	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:29:04.86+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
216	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:29:30.906+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
217	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:29:43.124+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
218	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:38:19.824+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
219	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:39:28.682+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
220	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:40:32.997+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
221	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:43:23.278+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
222	update	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:43:47.945+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
223	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-03-20 15:44:37.465+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5174
224	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 13:39:30.655+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:8055
225	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 13:45:40.009+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
226	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 13:48:48.472+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
227	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 13:54:42.422+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
228	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 13:59:20.721+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
229	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 15:18:56.5+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
230	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 15:48:56.029+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
231	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 21:04:05.115+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
232	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 21:44:00.206+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
233	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 22:03:59.849+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
234	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 22:08:54.565+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
235	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 22:09:03.992+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
236	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 22:09:30.307+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
237	login	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-06 22:20:26.206+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	http://localhost:5173
238	create	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-07 18:58:06.841+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_dashboards	0573e17f-f098-4a70-bc1b-7f3c505c9117	\N	http://localhost:8055
239	delete	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-07 18:58:25.051+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	directus_dashboards	0573e17f-f098-4a70-bc1b-7f3c505c9117	\N	http://localhost:8055
\.


--
-- TOC entry 3572 (class 0 OID 33435)
-- Dependencies: 214
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url) FROM stdin;
tasks	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N
users	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N
\.


--
-- TOC entry 3595 (class 0 OID 33812)
-- Dependencies: 237
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- TOC entry 3576 (class 0 OID 33474)
-- Dependencies: 218
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
1	tasks	id	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
2	tasks	user_id	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
3	tasks	title	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
4	tasks	description	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
5	tasks	is_completed	cast-boolean	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
6	tasks	created_at	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
7	tasks	updated_at	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
8	users	id	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
9	users	username	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
10	users	email	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
11	users	password	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
\.


--
-- TOC entry 3580 (class 0 OID 33521)
-- Dependencies: 222
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
\.


--
-- TOC entry 3600 (class 0 OID 33926)
-- Dependencies: 242
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- TOC entry 3579 (class 0 OID 33511)
-- Dependencies: 221
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- TOC entry 3594 (class 0 OID 33685)
-- Dependencies: 236
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2023-10-18 19:38:28.128029+01
20201029A	Remove System Relations	2023-10-18 19:38:28.146444+01
20201029B	Remove System Collections	2023-10-18 19:38:28.161311+01
20201029C	Remove System Fields	2023-10-18 19:38:28.186954+01
20201105A	Add Cascade System Relations	2023-10-18 19:38:28.245196+01
20201105B	Change Webhook URL Type	2023-10-18 19:38:28.255066+01
20210225A	Add Relations Sort Field	2023-10-18 19:38:28.264807+01
20210304A	Remove Locked Fields	2023-10-18 19:38:28.269936+01
20210312A	Webhooks Collections Text	2023-10-18 19:38:28.278646+01
20210331A	Add Refresh Interval	2023-10-18 19:38:28.283345+01
20210415A	Make Filesize Nullable	2023-10-18 19:38:28.292766+01
20210416A	Add Collections Accountability	2023-10-18 19:38:28.299307+01
20210422A	Remove Files Interface	2023-10-18 19:38:28.303306+01
20210506A	Rename Interfaces	2023-10-18 19:38:28.343855+01
20210510A	Restructure Relations	2023-10-18 19:38:28.375554+01
20210518A	Add Foreign Key Constraints	2023-10-18 19:38:28.393809+01
20210519A	Add System Fk Triggers	2023-10-18 19:38:28.430235+01
20210521A	Add Collections Icon Color	2023-10-18 19:38:28.436565+01
20210525A	Add Insights	2023-10-18 19:38:28.492525+01
20210608A	Add Deep Clone Config	2023-10-18 19:38:28.502105+01
20210626A	Change Filesize Bigint	2023-10-18 19:38:28.528407+01
20210716A	Add Conditions to Fields	2023-10-18 19:38:28.532593+01
20210721A	Add Default Folder	2023-10-18 19:38:28.543102+01
20210802A	Replace Groups	2023-10-18 19:38:28.551172+01
20210803A	Add Required to Fields	2023-10-18 19:38:28.55538+01
20210805A	Update Groups	2023-10-18 19:38:28.563123+01
20210805B	Change Image Metadata Structure	2023-10-18 19:38:28.570798+01
20210811A	Add Geometry Config	2023-10-18 19:38:28.575387+01
20210831A	Remove Limit Column	2023-10-18 19:38:28.579807+01
20210903A	Add Auth Provider	2023-10-18 19:38:28.610021+01
20210907A	Webhooks Collections Not Null	2023-10-18 19:38:28.626602+01
20210910A	Move Module Setup	2023-10-18 19:38:28.633114+01
20210920A	Webhooks URL Not Null	2023-10-18 19:38:28.644115+01
20210924A	Add Collection Organization	2023-10-18 19:38:28.65181+01
20210927A	Replace Fields Group	2023-10-18 19:38:28.665956+01
20210927B	Replace M2M Interface	2023-10-18 19:38:28.671204+01
20210929A	Rename Login Action	2023-10-18 19:38:28.675859+01
20211007A	Update Presets	2023-10-18 19:38:28.687533+01
20211009A	Add Auth Data	2023-10-18 19:38:28.692192+01
20211016A	Add Webhook Headers	2023-10-18 19:38:28.696882+01
20211103A	Set Unique to User Token	2023-10-18 19:38:28.706125+01
20211103B	Update Special Geometry	2023-10-18 19:38:28.711473+01
20211104A	Remove Collections Listing	2023-10-18 19:38:28.716294+01
20211118A	Add Notifications	2023-10-18 19:38:28.740141+01
20211211A	Add Shares	2023-10-18 19:38:28.770762+01
20211230A	Add Project Descriptor	2023-10-18 19:38:28.77673+01
20220303A	Remove Default Project Color	2023-10-18 19:38:28.788944+01
20220308A	Add Bookmark Icon and Color	2023-10-18 19:38:28.794557+01
20220314A	Add Translation Strings	2023-10-18 19:38:28.799847+01
20220322A	Rename Field Typecast Flags	2023-10-18 19:38:28.810879+01
20220323A	Add Field Validation	2023-10-18 19:38:28.816243+01
20220325A	Fix Typecast Flags	2023-10-18 19:38:28.82575+01
20220325B	Add Default Language	2023-10-18 19:38:28.84024+01
20220402A	Remove Default Value Panel Icon	2023-10-18 19:38:28.850662+01
20220429A	Add Flows	2023-10-18 19:38:28.921933+01
20220429B	Add Color to Insights Icon	2023-10-18 19:38:28.928019+01
20220429C	Drop Non Null From IP of Activity	2023-10-18 19:38:28.933218+01
20220429D	Drop Non Null From Sender of Notifications	2023-10-18 19:38:28.937948+01
20220614A	Rename Hook Trigger to Event	2023-10-18 19:38:28.94255+01
20220801A	Update Notifications Timestamp Column	2023-10-18 19:38:28.952413+01
20220802A	Add Custom Aspect Ratios	2023-10-18 19:38:28.957828+01
20220826A	Add Origin to Accountability	2023-10-18 19:38:28.964378+01
20230401A	Update Material Icons	2023-10-18 19:38:28.976042+01
20230525A	Add Preview Settings	2023-10-18 19:38:28.981155+01
20230526A	Migrate Translation Strings	2023-10-18 19:38:29.004154+01
20230721A	Require Shares Fields	2023-10-18 19:38:29.014207+01
\.


--
-- TOC entry 3598 (class 0 OID 33872)
-- Dependencies: 240
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- TOC entry 3601 (class 0 OID 33943)
-- Dependencies: 243
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- TOC entry 3596 (class 0 OID 33826)
-- Dependencies: 238
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- TOC entry 3582 (class 0 OID 33547)
-- Dependencies: 224
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
\.


--
-- TOC entry 3584 (class 0 OID 33566)
-- Dependencies: 226
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
3	\N	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	users	\N	\N	{"tabular":{"fields":["id","username","email","password"]}}	{"tabular":{"widths":{}}}	\N	\N	bookmark	\N
4	\N	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	directus_webhooks	\N	tabular	{"tabular":{"fields":["status","method","name","collections","actions"],"limit":25}}	{"tabular":{"widths":{"status":32,"method":100,"name":210,"collections":240,"actions":210}}}	\N	\N	bookmark	\N
5	\N	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	directus_translations	\N	\N	{"tabular":{"limit":25}}	\N	\N	\N	bookmark	\N
6	\N	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	directus_presets	\N	\N	{"tabular":{"limit":25}}	\N	\N	\N	bookmark	\N
7	\N	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	directus_activity	\N	tabular	{"tabular":{"sort":["-timestamp"],"fields":["action","collection","timestamp","user"],"page":1}}	{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}}	\N	\N	bookmark	\N
2	\N	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	tasks	\N	\N	{"tabular":{"limit":25,"fields":["id","description","title","user_id"]}}	{"tabular":{"widths":{"description":248}}}	\N	\N	bookmark	\N
1	\N	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	\N	directus_users	\N	cards	{"cards":{"sort":["email"],"limit":25,"page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N	\N	bookmark	\N
\.


--
-- TOC entry 3586 (class 0 OID 33591)
-- Dependencies: 228
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
\.


--
-- TOC entry 3588 (class 0 OID 33610)
-- Dependencies: 230
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM stdin;
1	3	directus_collections	tasks	{"hidden":true,"collection":"tasks"}	{"hidden":true,"collection":"tasks"}	\N
2	4	directus_collections	users	{"hidden":true,"collection":"users"}	{"hidden":true,"collection":"users"}	\N
3	5	directus_collections	tasks	{"collection":"tasks","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null}	{"hidden":false}	\N
4	6	directus_collections	users	{"collection":"users","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null}	{"hidden":false}	\N
5	7	directus_fields	1	{"special":null,"collection":"tasks","field":"id"}	{"special":null,"collection":"tasks","field":"id"}	\N
6	8	directus_fields	2	{"special":null,"collection":"tasks","field":"user_id"}	{"special":null,"collection":"tasks","field":"user_id"}	\N
7	9	directus_fields	3	{"special":null,"collection":"tasks","field":"title"}	{"special":null,"collection":"tasks","field":"title"}	\N
8	10	directus_fields	4	{"special":null,"collection":"tasks","field":"description"}	{"special":null,"collection":"tasks","field":"description"}	\N
9	11	directus_fields	5	{"special":["cast-boolean"],"collection":"tasks","field":"is_completed"}	{"special":["cast-boolean"],"collection":"tasks","field":"is_completed"}	\N
10	12	directus_fields	6	{"special":null,"collection":"tasks","field":"created_at"}	{"special":null,"collection":"tasks","field":"created_at"}	\N
11	13	directus_fields	7	{"special":null,"collection":"tasks","field":"updated_at"}	{"special":null,"collection":"tasks","field":"updated_at"}	\N
12	14	directus_fields	8	{"special":null,"collection":"users","field":"id"}	{"special":null,"collection":"users","field":"id"}	\N
13	15	directus_fields	9	{"special":null,"collection":"users","field":"username"}	{"special":null,"collection":"users","field":"username"}	\N
14	16	directus_fields	10	{"special":null,"collection":"users","field":"email"}	{"special":null,"collection":"users","field":"email"}	\N
15	17	directus_fields	11	{"special":null,"collection":"users","field":"password"}	{"special":null,"collection":"users","field":"password"}	\N
16	18	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	{"id":"1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","first_name":"Johan","last_name":"Bell","email":"belljohan3@gmail.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"b35245ca-9b0e-4afe-865f-65d7b5842dce","token":null,"last_access":"2023-10-25T10:31:17.512Z","last_page":"/users/1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"first_name":"Johan","last_name":"Bell"}	\N
17	19	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	{"id":"1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","first_name":"Johan","last_name":"Bell","email":"belljohan3@gmail.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"b35245ca-9b0e-4afe-865f-65d7b5842dce","token":"**********","last_access":"2023-10-25T10:50:28.923Z","last_page":"/users/1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"token":"**********"}	\N
18	20	directus_flows	58f1322d-a67a-4204-b9e5-1379f727362b	{"name":"Test","icon":"bolt","color":null,"description":null,"status":"active","accountability":"all","trigger":"webhook","options":{"return":"$all"}}	{"name":"Test","icon":"bolt","color":null,"description":null,"status":"active","accountability":"all","trigger":"webhook","options":{"return":"$all"}}	\N
20	22	directus_flows	58f1322d-a67a-4204-b9e5-1379f727362b	{"id":"58f1322d-a67a-4204-b9e5-1379f727362b","name":"Test","icon":"bolt","color":null,"description":null,"status":"active","trigger":"webhook","accountability":"all","options":{"return":"$all"},"operation":"4e0e3e28-433c-4ffc-8ada-30a19c0cdb0b","date_created":"2023-10-25T12:16:31.561Z","user_created":"1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","operations":["4e0e3e28-433c-4ffc-8ada-30a19c0cdb0b"]}	{"operation":"4e0e3e28-433c-4ffc-8ada-30a19c0cdb0b"}	\N
19	21	directus_operations	4e0e3e28-433c-4ffc-8ada-30a19c0cdb0b	{"flow":"58f1322d-a67a-4204-b9e5-1379f727362b","position_x":19,"position_y":1,"name":"Log to Console","key":"log_5ou5g","type":"log","options":{"message":"Test"}}	{"flow":"58f1322d-a67a-4204-b9e5-1379f727362b","position_x":19,"position_y":1,"name":"Log to Console","key":"log_5ou5g","type":"log","options":{"message":"Test"}}	20
21	23	directus_flows	58f1322d-a67a-4204-b9e5-1379f727362b	{"steps":[{"operation":"4e0e3e28-433c-4ffc-8ada-30a19c0cdb0b","key":"log_5ou5g","status":"resolve","options":{"message":"Test"}}],"data":{"$trigger":{"path":"/trigger/58f1322d-a67a-4204-b9e5-1379f727362b","query":{},"body":{},"method":"GET","headers":{"host":"localhost:8055","connection":"keep-alive","sec-ch-ua":"\\"Chromium\\";v=\\"118\\", \\"Google Chrome\\";v=\\"118\\", \\"Not=A?Brand\\";v=\\"99\\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\\"Windows\\"","upgrade-insecure-requests":"1","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","sec-fetch-site":"none","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document","accept-encoding":"gzip, deflate, br","accept-language":"fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7","cookie":"--redacted--"}},"$last":null,"$accountability":{"user":null,"role":null,"admin":false,"app":false,"ip":"127.0.0.1","userAgent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36"},"$env":{},"log_5ou5g":null}}	\N	\N
22	24	directus_flows	58f1322d-a67a-4204-b9e5-1379f727362b	{"steps":[{"operation":"4e0e3e28-433c-4ffc-8ada-30a19c0cdb0b","key":"log_5ou5g","status":"resolve","options":{"message":"Test"}}],"data":{"$trigger":{"path":"/trigger/58f1322d-a67a-4204-b9e5-1379f727362b","query":{},"body":{},"method":"GET","headers":{"host":"localhost:8055","connection":"keep-alive","cache-control":"max-age=0","sec-ch-ua":"\\"Chromium\\";v=\\"118\\", \\"Google Chrome\\";v=\\"118\\", \\"Not=A?Brand\\";v=\\"99\\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\\"Windows\\"","upgrade-insecure-requests":"1","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","sec-fetch-site":"none","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document","accept-encoding":"gzip, deflate, br","accept-language":"fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7","cookie":"--redacted--","if-none-match":"W/\\"4a5-VcvJDHdTGx+DHkNknLFz4QE47MY\\""}},"$last":null,"$accountability":{"user":null,"role":null,"admin":false,"app":false,"ip":"127.0.0.1","userAgent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36"},"$env":{},"log_5ou5g":null}}	\N	\N
23	26	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	{"id":"1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","first_name":"Johan","last_name":"Bell","email":"belljohan3@gmail.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"b35245ca-9b0e-4afe-865f-65d7b5842dce","token":null,"last_access":"2023-10-25T12:42:11.321Z","last_page":"/users/1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"token":null}	\N
24	75	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	{"id":"1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","first_name":"Johan","last_name":"Bell","email":"belljohan3@gmail.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"b35245ca-9b0e-4afe-865f-65d7b5842dce","token":"**********","last_access":"2023-11-20T14:04:36.831Z","last_page":"/users/1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"token":"**********"}	\N
25	111	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	{"id":"1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","first_name":"Johan","last_name":"Bell","email":"belljohan3@gmail.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"b35245ca-9b0e-4afe-865f-65d7b5842dce","token":"**********","last_access":"2023-12-28T09:33:17.170Z","last_page":"/users/1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"token":"**********"}	\N
26	159	tasks	4	{"title":"Coding","description":"Learning Coding ","is_completed":true,"user_id":2}	{"title":"Coding","description":"Learning Coding ","is_completed":true,"user_id":2}	\N
27	167	users	1	{"id":1,"username":"user1","email":"user1@example.com","password":"hashed_password"}	{"password":"hashed_password"}	\N
28	188	tasks	5	{"title":"Test","description":"testinf","is_completed":true,"user_id":1}	{"title":"Test","description":"testinf","is_completed":true,"user_id":1}	\N
29	189	tasks	6	{"user_id":2,"title":"Johan Bell","description":"Task: Coding"}	{"user_id":2,"title":"Johan Bell","description":"Task: Coding"}	\N
30	196	directus_settings	1	{"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"$t:documentation","url":"https://docs.directus.io","icon":"help","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"generate-types","enabled":true}]}	{"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"$t:documentation","url":"https://docs.directus.io","icon":"help","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"generate-types","enabled":true}]}	\N
31	200	directus_settings	1	{"id":1,"project_name":"TODO ","project_url":null,"project_color":"#136728","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"$t:documentation","url":"https://docs.directus.io","icon":"help","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"generate-types","enabled":true}],"project_descriptor":"To Do app project","default_language":"en-US","custom_aspect_ratios":null}	{"project_name":"TODO ","project_color":"#136728","project_descriptor":"To Do app project"}	\N
32	201	directus_permissions	1	{"role":null,"collection":"tasks","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"tasks","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
33	203	directus_permissions	2	{"role":null,"collection":"users","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"users","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
34	205	directus_permissions	3	{"role":null,"collection":"tasks","action":"create"}	{"role":null,"collection":"tasks","action":"create"}	\N
35	207	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	{"id":"1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","first_name":"Johan","last_name":"Bell","email":"belljohan3@gmail.com","password":"**********","location":"Douala, Cameroon","title":"Frontend Developer","description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"b35245ca-9b0e-4afe-865f-65d7b5842dce","token":"**********","last_access":"2024-03-20T12:47:06.702Z","last_page":"/users/1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"location":"Douala, Cameroon","title":"Frontend Developer"}	\N
36	222	directus_users	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	{"id":"1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","first_name":"Johan","last_name":"Bell","email":"belljohan3@gmail.com","password":"**********","location":"Douala, Cameroon","title":"Frontend Developer","description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"b35245ca-9b0e-4afe-865f-65d7b5842dce","token":"**********","last_access":"2024-03-20T14:43:23.280Z","last_page":"/users/1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"token":"**********"}	\N
37	238	directus_dashboards	0573e17f-f098-4a70-bc1b-7f3c505c9117	{"name":"Overview","icon":"dashboard","color":null,"note":null}	{"name":"Overview","icon":"dashboard","color":null,"note":null}	\N
\.


--
-- TOC entry 3573 (class 0 OID 33445)
-- Dependencies: 215
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
b35245ca-9b0e-4afe-865f-65d7b5842dce	Administrator	verified	$t:admin_description	\N	f	t	t
\.


--
-- TOC entry 3589 (class 0 OID 33633)
-- Dependencies: 231
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) FROM stdin;
5IB0fcbwwMzfpHfydX8OfyaVwXOxlfyGAFyr1h3k-_ZdBdSmKY70QnEGTuEhaFg6	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-13 21:04:05.109+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
WZXwoKkAlhKy9kUx9VGMJ4YpYc7M1Wm-r9qs5Sg59j6tBE6dhXqpJWuJzb8jwbHu	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-13 21:44:00.201+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
-KuxoU_f-a8Ej9zxbnVF1GNijFVRA_AyKv-q8YPZKerfol8-5uLFDAw-A-rnr3pn	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-14 18:57:15.558+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:8055
LH5dZ6ITVaQX80Qd3Lni1xZvkGwFndZyxDzqoVvq8yA_nech5rCpMcQ1CZGfZzOC	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-13 13:45:40.002+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
VrJrrGmr9743t2NZ0L1VTj0xzNDq16LL47owKDDT_GMDBDST73osrNtBBFz8ZNUE	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-13 13:48:48.467+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
OP61Gct7pjhk0LBKBlueCZXPmLvl1_ItPXh4zYBg-Zu0wC-PY7XsgCatj0TWyzGI	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-13 13:54:42.416+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
-9MIxmqg4hX_4Pn-LGd3imUdTJQr6W5cVvaZqmAQyNgRR3XrHvGMRhJZYyXWnaFc	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-13 13:59:20.715+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
3-q3HTkKBc2tAP3OpGPE6bcpd35VYwS2AM3smlOhDcf9nUQbCq8P91OUTWL82K2y	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-13 15:18:56.468+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
M0iwiiMyzJWzF0o8aPhoH6Ot-2hssfq9YiHsgDUESVBcrvE_t4gPZSwg77RwFN96	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-13 15:48:56.025+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
lGyeoAmJWS5CaJ9PMcvXO01MolO8Y2amo8TFuyITe4nAPP9CjxwtIGH5P-26BAxz	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-13 22:03:59.842+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
m-Wi8EcjfqwG1ffWVBjAaIS5bHfzRMYr3qzkmqLYiMtDAF9-DV-QoWRNcMlLc52N	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-13 22:08:54.561+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
TbYJ7NgLTp1G7Q4Q96gsxTyOS1f9o-SgcOWtsPm6dJe8OJVc0P_bnhN0Cr8CoF1w	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-13 22:09:03.989+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
FitopMrbGTEXmvzaQnhQbkAx7bweHiUV_FDEfVDgeXe1Sa8ONzfsgW7hM2ygJIrY	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-13 22:09:30.304+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
iuo5s27igu1XDk6zwZnalPp6mGKEggx0VXStz9GVc8VKeZj3QOw_iIwMqcEVerh7	1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	2024-04-14 18:43:44.442+01	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36	\N	http://localhost:5173
\.


--
-- TOC entry 3591 (class 0 OID 33646)
-- Dependencies: 233
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios) FROM stdin;
1	TODO 	\N	#136728	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"$t:documentation","url":"https://docs.directus.io","icon":"help","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"generate-types","enabled":true}]	To Do app project	en-US	\N
\.


--
-- TOC entry 3599 (class 0 OID 33892)
-- Dependencies: 241
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- TOC entry 3602 (class 0 OID 33977)
-- Dependencies: 244
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- TOC entry 3574 (class 0 OID 33456)
-- Dependencies: 216
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications) FROM stdin;
1c5c9265-a93e-478c-bf4f-ab30f3fcb5bd	Johan	Bell	belljohan3@gmail.com	$argon2id$v=19$m=65536,t=3,p=4$gc6G/4W7ByN+SdUDEYKH8Q$SjWBqCHsWFKxLKmhHksyvRojOvdBR1vTrwnzRRqrZqU	Douala, Cameroon	Frontend Developer	\N	\N	\N	\N	auto	\N	active	b35245ca-9b0e-4afe-865f-65d7b5842dce	g5ORXo3tMQ7rblfrm7-YGnIb7gCCj5qy	2024-04-07 18:57:15.561+01	/insights	default	\N	\N	t
\.


--
-- TOC entry 3593 (class 0 OID 33674)
-- Dependencies: 235
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
\.


--
-- TOC entry 3606 (class 0 OID 33999)
-- Dependencies: 248
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (id, user_id, title, description, is_completed, created_at, updated_at) FROM stdin;
6	2	Johan Bell	Task: Coding	f	2024-03-20 11:18:18.479942	2024-03-20 11:18:18.479942
\.


--
-- TOC entry 3604 (class 0 OID 33986)
-- Dependencies: 246
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password) FROM stdin;
2	user2	user2@example.com	hashed_password2
1	user1	user1@example.com	hashed_password
\.


--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 219
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 239, true);


--
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 217
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 11, true);


--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 239
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 223
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 3, true);


--
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 225
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 7, true);


--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 227
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 1, false);


--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 229
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 37, true);


--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 232
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 234
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 247
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_id_seq', 6, true);


--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 245
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 3350 (class 2606 OID 33505)
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 33444)
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- TOC entry 3372 (class 2606 OID 33820)
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 33485)
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 33530)
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- TOC entry 3380 (class 2606 OID 33937)
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- TOC entry 3382 (class 2606 OID 33935)
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 33515)
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- TOC entry 3370 (class 2606 OID 33692)
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3376 (class 2606 OID 33880)
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3384 (class 2606 OID 33950)
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- TOC entry 3386 (class 2606 OID 33959)
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- TOC entry 3388 (class 2606 OID 33952)
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- TOC entry 3374 (class 2606 OID 33835)
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 33554)
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3358 (class 2606 OID 33574)
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 33598)
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 33617)
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 33455)
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 33639)
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- TOC entry 3366 (class 2606 OID 33657)
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3378 (class 2606 OID 33900)
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- TOC entry 3390 (class 2606 OID 33983)
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 33862)
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- TOC entry 3342 (class 2606 OID 33860)
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- TOC entry 3344 (class 2606 OID 33465)
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3346 (class 2606 OID 33870)
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- TOC entry 3368 (class 2606 OID 33684)
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- TOC entry 3398 (class 2606 OID 34009)
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 3392 (class 2606 OID 33997)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3394 (class 2606 OID 33993)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 33995)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3399 (class 2606 OID 33864)
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- TOC entry 3416 (class 2606 OID 33821)
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 3402 (class 2606 OID 33777)
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- TOC entry 3403 (class 2606 OID 33708)
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- TOC entry 3404 (class 2606 OID 33703)
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- TOC entry 3424 (class 2606 OID 33938)
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 3401 (class 2606 OID 33713)
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- TOC entry 3419 (class 2606 OID 33881)
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- TOC entry 3420 (class 2606 OID 33886)
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- TOC entry 3425 (class 2606 OID 33965)
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- TOC entry 3426 (class 2606 OID 33960)
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- TOC entry 3427 (class 2606 OID 33953)
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- TOC entry 3428 (class 2606 OID 33970)
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 3417 (class 2606 OID 33836)
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- TOC entry 3418 (class 2606 OID 33841)
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 3405 (class 2606 OID 33782)
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3406 (class 2606 OID 33792)
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3407 (class 2606 OID 33787)
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- TOC entry 3408 (class 2606 OID 33797)
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- TOC entry 3409 (class 2606 OID 33738)
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- TOC entry 3410 (class 2606 OID 33916)
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- TOC entry 3411 (class 2606 OID 33802)
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- TOC entry 3412 (class 2606 OID 33748)
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- TOC entry 3413 (class 2606 OID 33758)
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- TOC entry 3414 (class 2606 OID 33753)
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- TOC entry 3415 (class 2606 OID 33852)
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- TOC entry 3421 (class 2606 OID 33901)
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- TOC entry 3422 (class 2606 OID 33906)
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3423 (class 2606 OID 33911)
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 3400 (class 2606 OID 33807)
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- TOC entry 3429 (class 2606 OID 34010)
-- Name: tasks tasks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2024-04-08 09:36:42

--
-- PostgreSQL database dump complete
--

