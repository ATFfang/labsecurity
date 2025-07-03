--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: camera_id_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.camera_id_mapping (
    numeric_id bigint,
    camera_info_id text,
    camera_name text,
    org_name text
);


ALTER TABLE public.camera_id_mapping OWNER TO postgres;

--
-- Name: t_buildings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_buildings (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.t_buildings OWNER TO postgres;

--
-- Name: t_buildings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_buildings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_buildings_id_seq OWNER TO postgres;

--
-- Name: t_buildings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_buildings_id_seq OWNED BY public.t_buildings.id;


--
-- Name: t_camera_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_camera_info (
    camera_id text NOT NULL,
    camera_name text,
    camera_status integer,
    org_name text,
    id text NOT NULL
);


ALTER TABLE public.t_camera_info OWNER TO postgres;

--
-- Name: t_cameras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_cameras (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    rtsp_id character varying(64) NOT NULL,
    lab_id integer NOT NULL,
    x double precision,
    y double precision,
    height double precision,
    heading double precision,
    pitch double precision
);


ALTER TABLE public.t_cameras OWNER TO postgres;

--
-- Name: t_cameras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_cameras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_cameras_id_seq OWNER TO postgres;

--
-- Name: t_cameras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_cameras_id_seq OWNED BY public.t_cameras.id;


--
-- Name: t_eventpara; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_eventpara (
    id integer NOT NULL,
    camera_id integer NOT NULL,
    event_id integer NOT NULL,
    para json
);


ALTER TABLE public.t_eventpara OWNER TO postgres;

--
-- Name: t_eventpara_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_eventpara_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_eventpara_id_seq OWNER TO postgres;

--
-- Name: t_eventpara_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_eventpara_id_seq OWNED BY public.t_eventpara.id;


--
-- Name: t_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_events (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    structured_params json
);


ALTER TABLE public.t_events OWNER TO postgres;

--
-- Name: t_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_events_id_seq OWNER TO postgres;

--
-- Name: t_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_events_id_seq OWNED BY public.t_events.id;


--
-- Name: t_floors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_floors (
    id integer NOT NULL,
    building_id integer NOT NULL,
    floor_plan bytea
);


ALTER TABLE public.t_floors OWNER TO postgres;

--
-- Name: t_floors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_floors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_floors_id_seq OWNER TO postgres;

--
-- Name: t_floors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_floors_id_seq OWNED BY public.t_floors.id;


--
-- Name: t_labs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_labs (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    room_no character varying(50),
    floor_id integer NOT NULL,
    administrator character varying(100),
    phone_no character varying(50),
    risk_level integer,
    lab_type character varying(100),
    room_plan bytea
);


ALTER TABLE public.t_labs OWNER TO postgres;

--
-- Name: t_labs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_labs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_labs_id_seq OWNER TO postgres;

--
-- Name: t_labs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_labs_id_seq OWNED BY public.t_labs.id;


--
-- Name: t_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_logs (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    content text,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public.t_logs OWNER TO postgres;

--
-- Name: t_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_logs_id_seq OWNER TO postgres;

--
-- Name: t_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_logs_id_seq OWNED BY public.t_logs.id;


--
-- Name: t_models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_models (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    event_id integer NOT NULL,
    modelfile character varying(255),
    configfile character varying(255),
    date date
);


ALTER TABLE public.t_models OWNER TO postgres;

--
-- Name: t_models_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_models_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_models_id_seq OWNER TO postgres;

--
-- Name: t_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_models_id_seq OWNED BY public.t_models.id;


--
-- Name: t_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_permissions (
    id integer NOT NULL,
    lab_id_list json NOT NULL
);


ALTER TABLE public.t_permissions OWNER TO postgres;

--
-- Name: t_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_permissions_id_seq OWNER TO postgres;

--
-- Name: t_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_permissions_id_seq OWNED BY public.t_permissions.id;


--
-- Name: t_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_results (
    id integer NOT NULL,
    task_id integer NOT NULL,
    event_id integer NOT NULL,
    description text,
    time1 timestamp without time zone,
    time2 timestamp without time zone,
    picture1 uuid,
    picture2 uuid,
    picture3 uuid
);


ALTER TABLE public.t_results OWNER TO postgres;

--
-- Name: t_results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_results_id_seq OWNER TO postgres;

--
-- Name: t_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_results_id_seq OWNED BY public.t_results.id;


--
-- Name: t_results_whitecoat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_results_whitecoat (
    id SERIAL PRIMARY KEY,
    "timestamp" timestamp with time zone NOT NULL,
    room_id integer NOT NULL,
    camera_id integer NOT NULL,
    alarm_category text NOT NULL,
    photo uuid,
    message text
);


ALTER TABLE public.t_results_whitecoat OWNER TO postgres;

--
-- Name: t_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_roles (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.t_roles OWNER TO postgres;

--
-- Name: t_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_roles_id_seq OWNER TO postgres;

--
-- Name: t_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_roles_id_seq OWNED BY public.t_roles.id;


--
-- Name: t_rtsp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_rtsp (
    id integer NOT NULL,
    res_code character varying(64) NOT NULL,
    res_name character varying(255),
    res_type integer,
    res_sub_type integer,
    res_status integer,
    res_ext_status integer,
    res_is_be_share integer,
    org_code character varying(50),
    stream_num integer,
    res_is_foreign integer,
    org_name character varying(255),
    res_attribute integer,
    dev_encode_set integer,
    voice_status integer,
    has_brd_sub_res integer,
    is_bind integer,
    res_bind_code character varying(64),
    sub_type_of_sub_type integer,
    is_super_ipc integer,
    is_cam_in_complex_ipc integer,
    reserve text
);


ALTER TABLE public.t_rtsp OWNER TO postgres;

--
-- Name: t_rtsp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_rtsp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_rtsp_id_seq OWNER TO postgres;

--
-- Name: t_rtsp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_rtsp_id_seq OWNED BY public.t_rtsp.id;


--
-- Name: t_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_tasks (
    id integer NOT NULL,
    date date NOT NULL,
    camera_id text
);


ALTER TABLE public.t_tasks OWNER TO postgres;

--
-- Name: t_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_tasks_id_seq OWNER TO postgres;

--
-- Name: t_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_tasks_id_seq OWNED BY public.t_tasks.id;


--
-- Name: t_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_users (
    id integer NOT NULL,
    realname character varying(100) NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    role_id integer NOT NULL,
    permission_id integer
);


ALTER TABLE public.t_users OWNER TO postgres;

--
-- Name: t_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.t_users_id_seq OWNER TO postgres;

--
-- Name: t_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_users_id_seq OWNED BY public.t_users.id;


--
-- Name: t_buildings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_buildings ALTER COLUMN id SET DEFAULT nextval('public.t_buildings_id_seq'::regclass);


--
-- Name: t_cameras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_cameras ALTER COLUMN id SET DEFAULT nextval('public.t_cameras_id_seq'::regclass);


--
-- Name: t_eventpara id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_eventpara ALTER COLUMN id SET DEFAULT nextval('public.t_eventpara_id_seq'::regclass);


--
-- Name: t_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_events ALTER COLUMN id SET DEFAULT nextval('public.t_events_id_seq'::regclass);


--
-- Name: t_floors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_floors ALTER COLUMN id SET DEFAULT nextval('public.t_floors_id_seq'::regclass);


--
-- Name: t_labs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_labs ALTER COLUMN id SET DEFAULT nextval('public.t_labs_id_seq'::regclass);


--
-- Name: t_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_logs ALTER COLUMN id SET DEFAULT nextval('public.t_logs_id_seq'::regclass);


--
-- Name: t_models id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_models ALTER COLUMN id SET DEFAULT nextval('public.t_models_id_seq'::regclass);


--
-- Name: t_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_permissions ALTER COLUMN id SET DEFAULT nextval('public.t_permissions_id_seq'::regclass);


--
-- Name: t_results id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_results ALTER COLUMN id SET DEFAULT nextval('public.t_results_id_seq'::regclass);


--
-- Name: t_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_roles ALTER COLUMN id SET DEFAULT nextval('public.t_roles_id_seq'::regclass);


--
-- Name: t_rtsp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_rtsp ALTER COLUMN id SET DEFAULT nextval('public.t_rtsp_id_seq'::regclass);


--
-- Name: t_tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tasks ALTER COLUMN id SET DEFAULT nextval('public.t_tasks_id_seq'::regclass);


--
-- Name: t_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_users ALTER COLUMN id SET DEFAULT nextval('public.t_users_id_seq'::regclass);


--
-- Data for Name: camera_id_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.camera_id_mapping (numeric_id, camera_info_id, camera_name, org_name) FROM stdin;
1	CAM000001	化学馆1F东大门	化学馆实验室  2024
2	CAM000002	实验A楼201-1	ISC6800实验室A楼
3	CAM000003	实验A楼122-2	2019新增实验A楼
4	CAM000004	实验A楼122-1	2019新增实验A楼
5	CAM000005	实验A楼201-2	ISC6800实验室A楼
6	CAM000006	JK12外细胞间	生命科学院实验室
7	CAM000007	JK02亮室	生命科学院实验室
8	CAM000008	JK07显微镜室-1	生命科学院实验室
9	CAM000009	JK05生化分析室-1	生命科学院实验室
10	CAM000010	JK04活细胞工作站	生命科学院实验室
11	CAM000011	JK03基因组平台	生命科学院实验室
12	CAM000012	JK21储藏室	生命科学院实验室
13	CAM000013	JK26过道-2	生命科学院实验室
14	CAM000014	JK31内细胞室-2	生命科学院实验室
15	CAM000015	JK23样品准备室-3	生命科学院实验室
16	CAM000016	JK17病理切片室	生命科学院实验室
17	CAM000017	JK14过道-1	生命科学院实验室
18	CAM000018	JK28样品准备室-1	生命科学院实验室
19	CAM000019	JK01暗室	生命科学院实验室
20	CAM000020	JK30生化分析室-4	生命科学院实验室
21	CAM000021	JK20准备室	生命科学院实验室
22	CAM000022	JK22样品准备室-2	生命科学院实验室
23	CAM000023	JK23共聚焦缓冲间	生命科学院实验室
24	CAM000024	JK19制氮间	生命科学院实验室
25	CAM000025	JK24显微镜室-2	生命科学院实验室
26	CAM000026	JK16液相室	生命科学院实验室
27	CAM000027	JK29生化分析室-2	生命科学院实验室
28	CAM000028	JK15过道-3	生命科学院实验室
29	CAM000029	JK11冷库间	生命科学院实验室
30	CAM000030	JK06生化分析室-3	生命科学院实验室
31	CAM000031	JK18质谱室-1	生命科学院实验室
32	CAM000032	JK13流室	生命科学院实验室
33	CAM000033	JK10内细胞间-1	生命科学院实验室
34	CAM000034	JK08暗室-1	生命科学院实验室
35	CAM000035	JK25质谱室-2	生命科学院实验室
36	CAM000036	JK27样品准备室-4	生命科学院实验室
37	CAM000037	JK32暗室-2	生命科学院实验室
38	CAM000038	实验A楼137-1	2019新增实验A楼
39	CAM000039	实验A楼137-2	2019新增实验A楼
40	CAM000040	实验A楼141-1	2019新增实验A楼
41	CAM000041	实验A楼141-2	2019新增实验A楼
42	CAM000042	实验A楼141-3	2019新增实验A楼
43	CAM000043	A510-508-1	ISC6800河口海岸实验室
44	CAM000044	B109-1	ISC6800河口海岸实验室
45	CAM000045	B109-2	ISC6800河口海岸实验室
46	CAM000046	B109-3	ISC6800河口海岸实验室
47	CAM000047	B104-106-1	ISC6800河口海岸实验室
48	CAM000048	B104-106-2	ISC6800河口海岸实验室
49	CAM000049	B108-1	ISC6800河口海岸实验室
50	CAM000050	B108-2	ISC6800河口海岸实验室
51	CAM000051	B113-115-1	ISC6800河口海岸实验室
52	CAM000052	B113-115-2	ISC6800河口海岸实验室
53	CAM000053	B113-115-3	ISC6800河口海岸实验室
54	CAM000054	B110-1	ISC6800河口海岸实验室
55	CAM000055	B110-2	ISC6800河口海岸实验室
56	CAM000056	B119-1	ISC6800河口海岸实验室
57	CAM000057	A111-113-1	ISC6800河口海岸实验室
58	CAM000058	B119-2	ISC6800河口海岸实验室
59	CAM000059	B125-1	ISC6800河口海岸实验室
60	CAM000060	B125-2	ISC6800河口海岸实验室
61	CAM000061	B127-1	ISC6800河口海岸实验室
62	CAM000062	B127-2	ISC6800河口海岸实验室
63	CAM000063	B214-1	ISC6800河口海岸实验室
64	CAM000064	B214-2	ISC6800河口海岸实验室
65	CAM000065	B111-1	ISC6800河口海岸实验室
66	CAM000066	B117	ISC6800河口海岸实验室
67	CAM000067	B121-123-1	ISC6800河口海岸实验室
68	CAM000068	A111-113-2	ISC6800河口海岸实验室
69	CAM000069	B121-123-2	ISC6800河口海岸实验室
70	CAM000070	B212-1	ISC6800河口海岸实验室
71	CAM000071	B210-1	ISC6800河口海岸实验室
72	CAM000072	B210-2	ISC6800河口海岸实验室
73	CAM000073	A310	ISC6800河口海岸实验室
74	CAM000074	B210-4	ISC6800河口海岸实验室
75	CAM000075	B216-1	ISC6800河口海岸实验室
76	CAM000076	B520-1	ISC6800河口海岸实验室
77	CAM000077	B520-2	ISC6800河口海岸实验室
78	CAM000078	D126-2	ISC6800河口海岸实验室
79	CAM000079	A111-113-3	ISC6800河口海岸实验室
80	CAM000080	B302	ISC6800河口海岸实验室
81	CAM000081	D112人工气候室	ISC6800河口海岸实验室
82	CAM000082	D132	ISC6800河口海岸实验室
83	CAM000083	D120冷库	ISC6800河口海岸实验室
84	CAM000084	A504-2	ISC6800河口海岸实验室
85	CAM000085	A502-1	ISC6800河口海岸实验室
86	CAM000086	A502-2	ISC6800河口海岸实验室
87	CAM000087	A111-113-4	ISC6800河口海岸实验室
88	CAM000088	B210-3	ISC6800河口海岸实验室
89	CAM000089	D126-1	ISC6800河口海岸实验室
90	CAM000090	B304-1	ISC6800河口海岸实验室
91	CAM000091	D122-1	ISC6800河口海岸实验室
92	CAM000092	D122-2	ISC6800河口海岸实验室
93	CAM000093	D103-109人工气候室	ISC6800河口海岸实验室
94	CAM000094	A504-1	ISC6800河口海岸实验室
95	CAM000095	B216-2	ISC6800河口海岸实验室
96	CAM000096	A104-108-1	ISC6800河口海岸实验室
97	CAM000097	超净实验室1	ISC6800河口海岸实验室
98	CAM000098	超净实验室2	ISC6800河口海岸实验室
99	CAM000099	超净实验室3	ISC6800河口海岸实验室
100	CAM000100	超净实验室4	ISC6800河口海岸实验室
101	CAM000101	超净实验室5	ISC6800河口海岸实验室
102	CAM000102	超净实验室6	ISC6800河口海岸实验室
103	CAM000103	超净实验室7	ISC6800河口海岸实验室
104	CAM000104	超净实验室8	ISC6800河口海岸实验室
105	CAM000105	超净实验室9	ISC6800河口海岸实验室
106	CAM000106	A104-108-2	ISC6800河口海岸实验室
107	CAM000107	超净实验室10	ISC6800河口海岸实验室
108	CAM000108	超净实验室11	ISC6800河口海岸实验室
109	CAM000109	超净实验室12	ISC6800河口海岸实验室
110	CAM000110	A104-108-3	ISC6800河口海岸实验室
111	CAM000111	A104-108-5	ISC6800河口海岸实验室
112	CAM000112	A104-108-6	ISC6800河口海岸实验室
113	CAM000113	A104-108-7	ISC6800河口海岸实验室
114	CAM000114	A104-108-8	ISC6800河口海岸实验室
115	CAM000115	A104-108-9	ISC6800河口海岸实验室
116	CAM000116	A104-108-10	ISC6800河口海岸实验室
117	CAM000117	A104-108-4	ISC6800河口海岸实验室
118	CAM000118	B楼4F厕所走道	ISC6800河口海岸实验室
119	CAM000119	B楼4F西楼梯出入口	ISC6800河口海岸实验室
120	CAM000120	B楼429-431-1	ISC6800河口海岸实验室
121	CAM000121	B楼429-431-2	ISC6800河口海岸实验室
122	CAM000122	A117-115-1	ISC6800河口海岸实验室
123	CAM000123	A117-115-2	ISC6800河口海岸实验室
124	CAM000125	A119-121-1	ISC6800河口海岸实验室
125	CAM000126	A119-121-2	ISC6800河口海岸实验室
126	CAM000127	A119-121-3	ISC6800河口海岸实验室
127	CAM000128	A125-1	ISC6800河口海岸实验室
128	CAM000129	A125-2	ISC6800河口海岸实验室
129	CAM000130	A1F显微镜实验室	ISC6800河口海岸实验室
130	CAM000131	A1F酸缸间	ISC6800河口海岸实验室
131	CAM000132	A216酸缸间	ISC6800河口海岸实验室
132	CAM000133	A322水制备室	ISC6800河口海岸实验室
133	CAM000134	A320酸缸间	ISC6800河口海岸实验室
134	CAM000135	A316-318-1	ISC6800河口海岸实验室
135	CAM000136	A316-318-2	ISC6800河口海岸实验室
136	CAM000137	A316-318-3	ISC6800河口海岸实验室
137	CAM000138	A316-318-4	ISC6800河口海岸实验室
138	CAM000139	A314-1	ISC6800河口海岸实验室
139	CAM000140	A314-2	ISC6800河口海岸实验室
140	CAM000141	A312-1	ISC6800河口海岸实验室
141	CAM000142	A312-2	ISC6800河口海岸实验室
142	CAM000143	A308-1	ISC6800河口海岸实验室
143	CAM000144	A308-2	ISC6800河口海岸实验室
144	CAM000145	A308-3	ISC6800河口海岸实验室
145	CAM000146	A408-410-1	ISC6800河口海岸实验室
146	CAM000147	A408-410-2	ISC6800河口海岸实验室
147	CAM000148	A408-410-3	ISC6800河口海岸实验室
148	CAM000150	A412-1	ISC6800河口海岸实验室
149	CAM000152	A420酸缸间	ISC6800河口海岸实验室
150	CAM000153	A422水制备室	ISC6800河口海岸实验室
151	CAM000154	A406-1	ISC6800河口海岸实验室
152	CAM000155	A406-2	ISC6800河口海岸实验室
153	CAM000156	A522-1	ISC6800河口海岸实验室
154	CAM000157	A512-514-1	ISC6800河口海岸实验室
155	CAM000158	A512-514-2	ISC6800河口海岸实验室
156	CAM000159	A512-514-3	ISC6800河口海岸实验室
157	CAM000160	A512-514-4	ISC6800河口海岸实验室
158	CAM000161	A510-508-2	ISC6800河口海岸实验室
159	CAM000162	A510-508-3	ISC6800河口海岸实验室
160	CAM000163	A510-508-4	ISC6800河口海岸实验室
161	CAM000164	实验A楼259-261-1	ISC6800实验室A楼
162	CAM000165	实验A楼259-261-2	ISC6800实验室A楼
163	CAM000166	实验A楼255-257-1	ISC6800实验室A楼
164	CAM000167	实验A楼255-257-2	ISC6800实验室A楼
165	CAM000168	实验A楼354-256	ISC6800实验室A楼
166	CAM000169	实验A楼352	ISC6800实验室A楼
167	CAM000170	实验A楼135	ISC6800实验室A楼
168	CAM000171	河口海岸A楼2F洗手间出入口	ISC6800河口海岸实验室
169	CAM000172	河口海岸A楼2F茶水间	ISC6800河口海岸实验室
170	CAM000173	河口海岸B楼3F中间通道	ISC6800河口海岸实验室
171	CAM000174	河口海岸B楼2F中间通道	ISC6800河口海岸实验室
172	CAM000175	河口海岸A楼2F215财务室	ISC6800河口海岸实验室
173	CAM000176	化学楼303	化学馆实验室  2024
174	CAM000177	化学馆240	化学馆实验室  2024
175	CAM000178	实验A楼205-1	ISC6800实验室A楼
176	CAM000179	实验A楼205-2	ISC6800实验室A楼
177	CAM000180	实验A楼209-2	ISC6800实验室A楼
178	CAM000181	实验A楼209-1	ISC6800实验室A楼
179	CAM000182	实验A楼210-1	ISC6800实验室A楼
180	CAM000183	实验A楼210-2	ISC6800实验室A楼
181	CAM000184	实验A楼213-1	ISC6800实验室A楼
182	CAM000185	实验A楼213-2	ISC6800实验室A楼
183	CAM000186	实验A楼213-3	ISC6800实验室A楼
184	CAM000187	实验A楼217-1	ISC6800实验室A楼
185	CAM000188	实验A楼217-2	ISC6800实验室A楼
186	CAM000189	实验A楼217-3	ISC6800实验室A楼
187	CAM000190	实验楼花坛东向	平台摄像机
188	CAM000191	实验A楼241	2019新增实验A楼
189	CAM000192	实验A楼303-1	ISC6800实验室A楼
190	CAM000193	实验A楼303-2	ISC6800实验室A楼
191	CAM000194	化学馆B209-2房间	化学馆实验室2
192	CAM000195	219-1门口	化学馆实验室2
193	CAM000196	化学馆B219-2房间	化学馆实验室2
194	CAM000197	114房间-1	闵行物理楼实验室
195	CAM000198	116房间-2	闵行物理楼实验室
196	CAM000199	118房间	闵行物理楼实验室
197	CAM000200	133房间	闵行物理楼实验室
198	CAM000201	121房间	闵行物理楼实验室
199	CAM000202	142房间	闵行物理楼实验室
200	CAM000203	144房间	闵行物理楼实验室
201	CAM000204	146房间	闵行物理楼实验室
202	CAM000205	148房间	闵行物理楼实验室
203	CAM000206	150房间	闵行物理楼实验室
204	CAM000207	140房间	闵行物理楼实验室
205	CAM000208	物理楼1F120房间	闵行物理楼实验室
206	CAM000209	实验C楼群楼212-214-1	实验室C楼新增
207	CAM000210	实验C楼群楼212-214-2	实验室C楼新增
208	CAM000211	实验C楼群楼212-214-3	实验室C楼新增
209	CAM000212	实验C楼群楼212-214-4	实验室C楼新增
210	CAM000213	实验C楼群楼204	实验室C楼新增
211	CAM000214	实验C楼裙楼207	实验室C楼新增
212	CAM000215	实验C楼裙楼201-1	实验室C楼新增
213	CAM000216	实验C楼裙楼201-2	实验室C楼新增
214	CAM000217	实验CD楼中间通道	实验室C楼新增
215	CAM000218	实验D208-210-1	实验D楼新增
216	CAM000219	实验D116-118-1	实验D楼新增
217	CAM000220	实验D116-118-2	实验D楼新增
218	CAM000221	实验D208-210-2	实验D楼新增
219	CAM000222	实验D楼418-7	实验D楼新增
220	CAM000223	实验D楼418-8	实验D楼新增
221	CAM000224	实验D楼418-5	实验D楼新增
222	CAM000225	实验D楼418-4	实验D楼新增
223	CAM000226	实验D楼418-3	实验D楼新增
224	CAM000227	实验D楼418-2	实验D楼新增
225	CAM000228	实验D楼418-1	实验D楼新增
226	CAM000229	实验D楼418-6	实验D楼新增
227	CAM000230	华闵食堂三楼天台-3	实验D楼新增
228	CAM000231	华闵食堂三楼天台-2	实验D楼新增
229	CAM000232	华闵食堂三楼天台-1	实验D楼新增
230	CAM000233	实验A517-2	实验D楼新增
231	CAM000234	实验A楼517-1	实验D楼新增
232	CAM000235	实验A楼517-3	实验D楼新增
233	CAM000236	实验D楼420	实验D楼新增
234	CAM000237	实验D楼422-424-1	实验D楼新增
235	CAM000238	实验D楼422-424-2	实验D楼新增
236	CAM000239	实验D楼422-424-3	实验D楼新增
237	CAM000240	实验D楼422-424-4	实验D楼新增
238	CAM000241	实验D楼422-424-5	实验D楼新增
239	CAM000242	实验D楼422-424-6	实验D楼新增
240	CAM000243	实验楼工地东通道	实验楼工地
241	CAM000244	生态科学院后通道向北	实验楼工地
242	CAM000245	生态科学院后通道向南	实验楼工地
243	CAM000246	实验楼工地北通道	实验楼工地
244	CAM000247	实验楼西通道向北	实验楼工地
245	CAM000248	实验楼南通道向西	实验楼工地
246	CAM000249	实验楼工地通道向南	实验楼工地
247	CAM000250	实验楼工地食堂边门	实验楼工地
248	CAM000251	实验楼工地B楼与C 楼之间	实验楼工地
249	CAM000252	校医院书林桥河边西小路	实验楼工地
250	CAM000253	动物实验室1F系统外走廊	动物实验室旧
251	CAM000254	动物实验室1F洗刷区过道	动物实验室旧
252	CAM000255	动物实验室1F大门出入口	动物实验室旧
253	CAM000256	动物实验室1F洗刷区外区域	动物实验室旧
254	CAM000257	动物实验室1F外厕门	动物实验室旧
255	CAM000258	动物实验室1F南通道东照	动物实验室旧
256	CAM000259	动物实验室1F南通道西照	动物实验室旧
257	CAM000260	动物实验室1F北通道西照	动物实验室旧
258	CAM000261	动物实验室1F门厅	动物实验室旧
259	CAM000262	动物实验室1F门厅走廊	动物实验室旧
260	CAM000263	化学楼210	化学楼实验室2024新增
261	CAM000264	化学楼211	化学楼实验室2024新增
262	CAM000265	化学楼236	化学楼实验室2024新增
263	CAM000266	化学楼232	化学楼实验室2024新增
264	CAM000267	化学楼304	化学楼实验室2024新增
265	CAM000268	化学楼306	化学楼实验室2024新增
266	CAM000269	化学楼314	化学楼实验室2024新增
267	CAM000270	化学楼326	化学楼实验室2024新增
268	CAM000271	化学楼338	化学楼实验室2024新增
269	CAM000272	化学楼346	化学楼实验室2024新增
270	CAM000273	化学楼349	化学楼实验室2024新增
271	CAM000274	化学楼351	化学楼实验室2024新增
272	CAM000275	化学楼314	化学楼实验室2024新增
273	CAM000276	化学楼408	化学楼实验室2024新增
274	CAM000277	化学楼408-2	化学楼实验室2024新增
275	CAM000278	化学楼412	化学楼实验室2024新增
276	CAM000279	化学楼413	化学楼实验室2024新增
277	CAM000280	化学楼415	化学楼实验室2024新增
278	CAM000281	化学楼416	化学楼实验室2024新增
279	CAM000282	化学楼420	化学楼实验室2024新增
280	CAM000283	化学楼424-1	化学楼实验室2024新增
281	CAM000284	化学楼424-2	化学楼实验室2024新增
282	CAM000285	化学楼442	化学楼实验室2024新增
283	CAM000286	化学楼438	化学楼实验室2024新增
284	CAM000287	化学楼444-1	化学楼实验室2024新增
285	CAM000288	化学楼444-2	化学楼实验室2024新增
286	CAM000289	化学楼451	化学楼实验室2024新增
287	CAM000290	化学楼513	化学楼实验室2024新增
288	CAM000291	化学楼534	化学楼实验室2024新增
289	CAM000292	化学楼203-1	化学楼实验室2024新增
290	CAM000293	化学楼203-2	化学楼实验室2024新增
291	CAM000294	化学楼226-1	化学楼实验室2024新增
292	CAM000295	实验A楼后停车场	充电桩2
293	CAM000296	实验D楼后樱桃河人行步道东	河道景观2023
294	CAM000297	实验C楼后樱桃河人行步道东-1	河道景观2023
295	CAM000298	实验D楼后樱桃河人行步道西	河道景观2023
296	CAM000299	实验C楼后樱桃河人行步道东-2	河道景观2023
297	CAM000300	实验C楼后樱桃河人行步道东-3	河道景观2023
298	CAM000301	实验C楼后樱桃河人行步道西	河道景观2023
299	CAM000302	实验D楼2F门厅旁走廊	实验D楼
300	CAM000303	实验D楼2F房间走廊东照	实验D楼
301	CAM000304	实验D楼2F长走廊西照	实验D楼
302	CAM000305	实验D楼4F长走廊东照	实验D楼
303	CAM000306	实验D楼2F长走廊东照	实验D楼
304	CAM000307	实验D楼4F门厅旁走廊	实验D楼
305	CAM000308	实验D楼1F117走廊东照	实验D楼
306	CAM000309	实验D楼1F房间124消防通道	实验D楼
307	CAM000310	实验D楼5F长走廊西照	实验D楼
308	CAM000311	实验D楼5F长走廊东照	实验D楼
309	CAM000312	实验D楼4F房间417走廊东照	实验D楼
310	CAM000313	实验D楼1F大门门厅全景	实验D楼
311	CAM000314	实验D楼5F电梯旁主消防通道	实验D楼
312	CAM000315	实验D楼1F侧电梯和侧门	实验D楼
313	CAM000316	实验D楼3F长走廊西照	实验D楼
314	CAM000317	实验D楼4F长走廊西照	实验D楼
315	CAM000318	实验D楼5F电梯旁侧消防通道	实验D楼
316	CAM000319	实验D楼5F房间507东照	实验D楼
317	CAM000320	实验D楼3F长走廊东照	实验D楼
318	CAM000321	实验D楼1F侧消防通道	实验D楼
319	CAM000322	实验D楼3F317走廊东照	实验D楼
320	CAM000323	实验D楼3F门厅旁走廊	实验D楼
321	CAM000324	实验D楼1F大门门厅	实验D楼
322	CAM000325	实验D楼1F大厅	实验D楼
323	CAM000326	化学楼药品室通道1	实验D楼药品室
324	CAM000327	化学楼药品室通道4	实验D楼药品室
325	CAM000328	化学楼药品室通道进口	实验D楼药品室
326	CAM000329	化学楼药品室通道3	实验D楼药品室
327	CAM000330	化学楼药品室通道2	实验D楼药品室
328	CAM000331	实验D楼前机动车充电桩	充电桩
329	CAM000332	通用实验室2-1-1	物理楼裙楼实验室
330	CAM000333	通风实验室2-1-2	物理楼裙楼实验室
331	CAM000334	通用实验室2-4-1	物理楼裙楼实验室
332	CAM000335	通用实验室2-4-2	物理楼裙楼实验室
333	CAM000336	通用实验室走廊东照	物理楼裙楼实验室
334	CAM000337	通用实验室走廊西照	物理楼裙楼实验室
335	CAM000338	通用实验室1-3-1	物理楼裙楼实验室
336	CAM000339	通用实验室1-3-2	物理楼裙楼实验室
337	CAM000340	通用实验室1-3-3	物理楼裙楼实验室
338	CAM000341	通用实验室1-2	物理楼裙楼实验室
339	CAM000342	通风实验室1-1	物理楼裙楼实验室
340	CAM000343	 通风实验室2-3-1	物理楼裙楼实验室
341	CAM000344	通风实验室2-3-2	物理楼裙楼实验室
342	CAM000345	通风实验室2-2-1	物理楼裙楼实验室
343	CAM000346	通风实验室2-2-2	物理楼裙楼实验室
344	CAM000347	通用实验室2-5-1	物理楼裙楼实验室
345	CAM000348	通用实验室2-5-2	物理楼裙楼实验室
346	CAM000349	万级超净实验室1	物理楼裙楼实验室
347	CAM000350	万级超净实验室2	物理楼裙楼实验室
348	CAM000351	微纳制备及表征实验室-1	物理楼裙楼实验室
349	CAM000352	微纳制备及表征实验室-2	物理楼裙楼实验室
350	CAM000353	微纳制备及表征实验室-3	物理楼裙楼实验室
351	CAM000354	光刻实验室	物理楼裙楼实验室
352	CAM000355	更衣室	物理楼裙楼实验室
353	CAM000356	微纳米实验室1	物理楼裙楼实验室
354	CAM000357	微纳米实验室2	物理楼裙楼实验室
355	CAM000358	微纳米实验室3	物理楼裙楼实验室
356	CAM000359	微纳米实验室4	物理楼裙楼实验室
357	CAM000360	微纳米实验室5	物理楼裙楼实验室
358	CAM000361	微纳米实验室6	物理楼裙楼实验室
359	CAM000362	微纳米实验室7	物理楼裙楼实验室
360	CAM000363	实验A楼主楼电梯	校区新增电梯2023
361	CAM000365	实验B楼主楼电梯	校区新增电梯2023
362	CAM000366	实验B楼裙楼电梯	校区新增电梯2023
363	CAM000367	实验C裙楼电梯	校区新增电梯2023
364	CAM000368	实验C楼主楼电梯	校区新增电梯2023
365	CAM000369	实验D楼电梯	校区新增电梯2023
366	CAM000370	光学楼B103普通实验室1	光学大楼
367	CAM000371	光学楼D128超静实验室	光学大楼
368	CAM000372	光学楼A113普通实验室	光学大楼
369	CAM000373	光学楼A510电子实验室1	光学大楼
370	CAM000374	光学楼A510电子实验室2	光学大楼
371	CAM000375	IPC光学楼A531电子实验室1	光学大楼
372	CAM000376	光学楼A531电子实验室2	光学大楼
373	CAM000377	光学楼A529普通实验室1	光学大楼
374	CAM000378	光学楼A514高温实验室	光学大楼
375	CAM000379	光学楼A516高温实验室	光学大楼
376	CAM000380	B区  3F-西污物走廊（南北向）-JK-23	SPF动物实验中心-1
377	CAM000381	B区  3F-中污物走廊（东西向）-1-JK-36	SPF动物实验中心-1
378	CAM000382	B区  3F-中污物走廊（东西向）-2-JK-41	SPF动物实验中心-1
379	CAM000383	B区  3F-东南走道（南北向）-JK-52	SPF动物实验中心-1
380	CAM000384	B区  3F-A-B区进出口（东侧）-JK-53	SPF动物实验中心-1
381	CAM000385	B区  3F-南混合走廊（东西向）-1-JK-68	SPF动物实验中心-1
382	CAM000386	B区  3F-中混合走廊（东西向）-1-JK-70	SPF动物实验中心-1
383	CAM000387	B区  3F-中混合走廊（东西向）-2-JK-74	SPF动物实验中心-1
384	CAM000388	B区  3F-南混合走廊（东西向）-2-JK-76	SPF动物实验中心-1
385	CAM000389	B区  3F-西南走道（南北向）-JK-85	SPF动物实验中心-1
386	CAM000390	B区  3F-A-B区进出口（西侧）-JK-86	SPF动物实验中心-1
387	CAM000391	B区  3FA-夹层电梯厅-JK-01	SPF动物实验中心-1
388	CAM000392	B区  3FA-夹层楼梯-2（东侧）-JK-02	SPF动物实验中心-1
389	CAM000393	B区  3FA-夹层楼梯-1（西侧）-JK-03	SPF动物实验中心-1
390	CAM000394	B区  3FA-夹层楼梯-3（西侧）-JK-04	SPF动物实验中心-1
391	CAM000395	A区  3FA-进出走道区域-1-JK-06	SPF动物实验中心-1
392	CAM000396	A区  3FA -进出走道区域-2-JK-12	SPF动物实验中心-1
393	CAM000397	A区  3FA-进出走道区域-3-JK-13	SPF动物实验中心-1
394	CAM000398	B区  4F-楼梯-2（东侧）-JK-03	SPF动物实验中心-1
395	CAM000399	B区  4F-公共走道-1（南北向）-JK-04	SPF动物实验中心-1
396	CAM000400	B区  4F-楼梯-1（西侧）-JK-05	SPF动物实验中心-1
397	CAM000401	A区  4F-楼梯-3（西侧）-JK-10	SPF动物实验中心-1
398	CAM000402	A区  4F-公共走道-2（东西向）-JK-11	SPF动物实验中心-1
399	CAM000403	A区  4F-进出走道区域-1-JK-17	SPF动物实验中心-1
400	CAM000404	A区  4F-进出走道区域-2-JK-18	SPF动物实验中心-1
401	CAM000405	A区 4F-公共走道-3（南北向）-JK-20	SPF动物实验中心-1
402	CAM000406	A区  4F-公共走道-4（东西向）-JK-21	SPF动物实验中心-1
403	CAM000407	西侧大门进出区域-1	SPF动物实验中心-1
404	CAM000408	西侧大门进出区域-1	SPF动物实验中心-1
405	CAM000409	西侧大门进出区域-2	SPF动物实验中心-1
406	CAM000410	西侧大门进出区域-2	SPF动物实验中心-1
407	CAM000411	B区  B1F-D109清洗区-1-JK-03	SPF动物实验中心-2
408	CAM000412	B区  B1F-D109清洗区-2-JK-04	SPF动物实验中心-2
409	CAM000413	B区  B1F-D109清洗区-3-JK-07	SPF动物实验中心-2
410	CAM000414	B区  B1F-D109清洗区-4-JK-08	SPF动物实验中心-2
411	CAM000415	B区  1F-B107隔离检疫室-1-JK-01	SPF动物实验中心-2
412	CAM000416	B区  1F-B107隔离检疫室-2-JK-02	SPF动物实验中心-2
413	CAM000417	B区  1F-B110实验室-1-JK-05	SPF动物实验中心-2
414	CAM000418	B区  1F-B111大鼠待净化室-1-JK-07	SPF动物实验中心-2
415	CAM000419	B区  1F-B111大鼠待净化室-2-JK-08	SPF动物实验中心-2
416	CAM000420	B区  1F-B110实验室-2-JK-10	SPF动物实验中心-2
417	CAM000421	B区  1F-B113内准备室-JK-11	SPF动物实验中心-2
418	CAM000422	B区  1F-B112小鼠待净化室-1-JK-12	SPF动物实验中心-2
419	CAM000423	B区 1F-B112小鼠待净化室-2-JK-13	SPF动物实验中心-2
420	CAM000424	B区  1F-B107隔离检疫室-3-JK-14	SPF动物实验中心-2
421	CAM000425	B区  1F-B107隔离检疫室-4-JK-15	SPF动物实验中心-2
422	CAM000426	B区  1F-清洗区外准备-1-JK-22	SPF动物实验中心-2
423	CAM000427	B区  1F-B118饲养室2-1-JK-24	SPF动物实验中心-2
424	CAM000428	B区  1F-B118饲养室2-2-JK-25	SPF动物实验中心-2
425	CAM000429	B区  1F-B118饲养室2-3-JK-26	SPF动物实验中心-2
426	CAM000430	B区  1F-B119饲养室1-1-JK-27	SPF动物实验中心-2
427	CAM000431	B区  1F-B119饲养室1-2-JK-28	SPF动物实验中心-2
428	CAM000432	B区  1F-B115-117无菌鼠检疫室-JK-29	SPF动物实验中心-2
429	CAM000433	B区  1F-B119饲养室1-3-JK-31	SPF动物实验中心-2
430	CAM000434	B区  1F-B130洗消间-1-JK-33	SPF动物实验中心-2
431	CAM000435	B区  1F-B122-1解剖室-1-JK-34	SPF动物实验中心-2
432	CAM000436	B区  1F-B126-128检疫室-1-JK-35	SPF动物实验中心-2
433	CAM000437	B区  1F-动物接收区域-JK-36	SPF动物实验中心-2
434	CAM000438	B区  1F-B124检疫室-1-JK-37	SPF动物实验中心-2
435	CAM000439	B区  1F-B122-1解剖室-2-JK-38	SPF动物实验中心-2
436	CAM000440	西侧大门进出区域-2	SPF动物实验中心-2
437	CAM000441	西侧大门进出区域-2	SPF动物实验中心-2
438	CAM000442	B区  1F-B124检疫室-2-JK-42	SPF动物实验中心-3
439	CAM000443	B区  1F-B123手术室-1-JK-43	SPF动物实验中心-3
440	CAM000444	B区  1F-B126-128检疫室-2-JK-44	SPF动物实验中心-3
441	CAM000445	B区  1F-B130洗消间-2-JK-47	SPF动物实验中心-3
442	CAM000446	B区  1F-B132-1兔饲养室-1-JK-48	SPF动物实验中心-3
443	CAM000447	B区  1F-B125大动物实验室-1-JK-49	SPF动物实验中心-3
444	CAM000448	B区  1F-B127大动物实验室-1-JK-50	SPF动物实验中心-3
445	CAM000449	B区  1F-B125大动物实验室-2-JK-51	SPF动物实验中心-3
446	CAM000450	B区  1F-B123手术室-2-JK-52	SPF动物实验中心-3
447	CAM000451	A区  1F-A101培训室-1-JK-60	SPF动物实验中心-3
448	CAM000452	A区  1F-A101培训室-2-JK-64	SPF动物实验中心-3
449	CAM000453	A区  1F-B131饲料间-1-JK-66	SPF动物实验中心-3
450	CAM000454	A区  1F-B129大动物实验室-1-JK-67	SPF动物实验中心-3
451	CAM000455	A区  1F-B127大动物实验室-2-JK-68	SPF动物实验中心-3
452	CAM000456	A区  1F-B129大动物实验室-2-JK-69	SPF动物实验中心-3
453	CAM000457	A区  1F-B131饲料间-2-JK-70	SPF动物实验中心-3
454	CAM000458	A区  1F-B132-2兔饲养室-1-JK-73	SPF动物实验中心-3
455	CAM000459	A区  1F-B132-1兔饲养室-2-JK-74	SPF动物实验中心-3
456	CAM000460	A区  1F-B132-2兔饲养室-2-JK-75	SPF动物实验中心-3
457	CAM000461	A区  1F-清洗区外准备-2-JK-82	SPF动物实验中心-3
458	CAM000462	B区  2F-外准备区域-1-JK-02	SPF动物实验中心-3
459	CAM000463	B区  2F-B209观察适应室-JK-05	SPF动物实验中心-3
460	CAM000464	B区  2F-缓冲区域-JK-06	SPF动物实验中心-3
461	CAM000465	B区  2F-B208洁净物品库-JK-08	SPF动物实验中心-3
462	CAM000466	B区  2F-B208-1内准备室-1-JK-09	SPF动物实验中心-3
463	CAM000467	B区  2F-B207实验室-1-JK-11	SPF动物实验中心-3
464	CAM000468	B区  2F-B208-1内准备室-2-JK-12	SPF动物实验中心-3
465	CAM000469	B区 2F-B205兽医室-JK-13	SPF动物实验中心-3
466	CAM000470	B区  2F-外准备区域-2-JK-15	SPF动物实验中心-3
467	CAM000471	B区  2F-B207实验室-2-JK-18	SPF动物实验中心-4
468	CAM000472	B区  2F-B206解剖室-1-JK-19	SPF动物实验中心-4
469	CAM000473	B区  2F-B206解剖室-2-JK-20	SPF动物实验中心-4
470	CAM000474	B区  2F-B213-2饲养室8-JK-22	SPF动物实验中心-4
471	CAM000475	B区  2F-B213-1饲养室7-JK-23	SPF动物实验中心-4
472	CAM000476	B区  2F-B213饲养室-JK-24	SPF动物实验中心-4
473	CAM000477	B区  2F- B212-2饲养室6-1-JK-25	SPF动物实验中心-4
474	CAM000478	B区  2F-B212-2饲养室6-2-JK-26	SPF动物实验中心-4
475	CAM000479	B区  2F-B212-1饲养室5-JK-30	SPF动物实验中心-4
476	CAM000480	B区  2F-B212饲养室-JK-31	SPF动物实验中心-4
477	CAM000481	B区  2F-B211-2饲养室-1-JK-32	SPF动物实验中心-4
478	CAM000482	B区  2F-B211-2饲养室-2-JK-33	SPF动物实验中心-4
479	CAM000483	B区  2F-B211-1饲养室3-JK-35	SPF动物实验中心-4
480	CAM000484	B区  2F-B211饲养室-JK-36	SPF动物实验中心-4
481	CAM000485	B区  2F-B210-2饲养室2-JK-37	SPF动物实验中心-4
482	CAM000486	B区  2F-B210-1饲养室1-JK-38	SPF动物实验中心-4
483	CAM000487	B区  2F-B210饲养室-JK-39	SPF动物实验中心-4
484	CAM000488	B区  2F- B214代谢室-1-JK-40	SPF动物实验中心-4
485	CAM000489	B区  2F-B216小动物核磁成像室-1-JK-41	SPF动物实验中心-4
486	CAM000490	B区  2F-B214代谢室-2-JK-42	SPF动物实验中心-4
487	CAM000491	B区  2F-B216小动物核磁成像室-2-JK-43	SPF动物实验中心-4
488	CAM000492	B区  2F-B218室-1-JK-44	SPF动物实验中心-4
489	CAM000493	B区  2F-B218室-2-JK-45	SPF动物实验中心-4
490	CAM000494	B区  2F-B220小动物超声成像室-1-JK-46	SPF动物实验中心-4
491	CAM000495	B区  2F-B220小动物超声成像室-2-JK-48	SPF动物实验中心-4
492	CAM000496	B区  2F-B222实验室一-1-JK-49	SPF动物实验中心-4
493	CAM000497	B区  2F-B222实验室一-2-JK-50	SPF动物实验中心-4
494	CAM000498	B区  2F-B224小动物活体间-1-JK-52	SPF动物实验中心-4
495	CAM000499	B区  2F-B226小动物辐照仪-1-JK-53	SPF动物实验中心-4
496	CAM000500	B区  2F-B224小动物活体间-2-JK-54	SPF动物实验中心-5
497	CAM000501	B区  2F-B226小动物辐照仪-2-JK-55	SPF动物实验中心-5
498	CAM000502	B区  2F-B228小动物水迷宫-1-JK-56	SPF动物实验中心-5
499	CAM000503	B区  2F-B228小动物水迷宫-2-JK-57	SPF动物实验中心-5
500	CAM000504	B区  2F-B229室-1-JK-58	SPF动物实验中心-5
501	CAM000505	B区  2F-B229室-2-JK-61	SPF动物实验中心-5
502	CAM000506	B区  2F-B227室-1-JK-62	SPF动物实验中心-5
503	CAM000507	B区  2F-B227室-2-JK-63	SPF动物实验中心-5
504	CAM000508	B区  2F-B232-2饲养室14-JK-64	SPF动物实验中心-5
505	CAM000509	B区  2F-B225小动物活体成像-1-JK-65	SPF动物实验中心-5
506	CAM000510	B区  2F-B225小动物活体成像-2-JK-66	SPF动物实验中心-5
507	CAM000511	B区  2F-B232-1饲养室13-JK-67	SPF动物实验中心-5
508	CAM000512	B区  2F-B223实验室三-1-JK-69	SPF动物实验中心-5
509	CAM000513	B区  2F-B223实验室三-2-JK-70	SPF动物实验中心-5
510	CAM000514	B区  2F-B231-2饲养室12-JK-71	SPF动物实验中心-5
511	CAM000515	B区  2F-B221实验室二-1-JK-72	SPF动物实验中心-5
512	CAM000516	B区  2F-B231-1饲养室11-JK-74	SPF动物实验中心-5
513	CAM000517	B区  2F-B221实验室二-2-JK-75	SPF动物实验中心-5
514	CAM000518	B区  2F-B219室-1-JK-76	SPF动物实验中心-5
515	CAM000519	B区  2F-B230-2饲养室10-JK-77	SPF动物实验中心-5
516	CAM000520	B区  2F-B219室-2-JK-78	SPF动物实验中心-5
517	CAM000521	B区  2F-B217 PET-CT室-1-JK-79	SPF动物实验中心-5
518	CAM000522	B区  2F-B217 PET-CT室-2-JK-80	SPF动物实验中心-5
519	CAM000523	B区  2F-B215温控室-1-JK-81	SPF动物实验中心-5
520	CAM000524	B区  2F-B215温控室-2-JK-82	SPF动物实验中心-5
521	CAM000525	B区  2F-B230-1室-1-JK-84	SPF动物实验中心-5
522	CAM000526	B区   2F-B230-1室-2-JK-85	SPF动物实验中心-5
523	CAM000527	A区  2F-A202细胞室一-JK-90	SPF动物实验中心-5
524	CAM000528	A区  2F-A204细胞室二-JK-91	SPF动物实验中心-5
525	CAM000529	A区  2F-A205-207仪器区域-1-JK-92	SPF动物实验中心-6
526	CAM000530	A区  2F-A205-207仪器区域-2-JK-93	SPF动物实验中心-6
527	CAM000531	A区  2F-A205-207仪器区域-2-JK-95	SPF动物实验中心-6
528	CAM000532	A区  2F-A205-207仪器区域-4-JK-97	SPF动物实验中心-6
529	CAM000533	B区  2FA-A305-307仪器区域-1-JK-05	SPF动物实验中心-6
530	CAM000534	A区  2FA-A305-307仪器区域-2-JK-07	SPF动物实验中心-6
531	CAM000535	A区  2FA-A305-307仪器区域-3-JK-08	SPF动物实验中心-6
532	CAM000536	A区  2FA-A305-307仪器区域-4-JK-09	SPF动物实验中心-6
533	CAM000537	A区  2FA-A304细胞室-JK-10	SPF动物实验中心-6
534	CAM000538	A区  2FA-A302细胞室-JK-11	SPF动物实验中心-6
535	CAM000539	B区  3F-B309观察适应室-JK-02	SPF动物实验中心-6
536	CAM000540	B区  3F-B309-1物品接受室-JK-03	SPF动物实验中心-6
537	CAM000541	B区  3F-外准备区域-1-JK-05	SPF动物实验中心-6
538	CAM000542	B区  3F -B308-1内准备室-1-JK-08	SPF动物实验中心-6
539	CAM000543	B区  3F-B308洁净物品库-JK-09	SPF动物实验中心-6
540	CAM000544	B区  3F-B307显微移植室-JK-12	SPF动物实验中心-6
541	CAM000545	B区  3F-外准备区域-2-JK-13	SPF动物实验中心-6
542	CAM000546	B区  3F-B308-1内准备室-2-JK-17	SPF动物实验中心-6
543	CAM000547	B区  3F-B304显微注射室-1-JK-19	SPF动物实验中心-6
544	CAM000548	B区  3F-B304显微注射室-2-JK-20	SPF动物实验中心-6
545	CAM000549	B区  3F-B306动物打包室-JK-21	SPF动物实验中心-6
546	CAM000550	B区  3F-B305动物发放室-JK-22	SPF动物实验中心-6
547	CAM000551	B区  3F-B314饲养室5-1-JK-24	SPF动物实验中心-6
548	CAM000552	B区  3F-B314饲养室5-2-JK-25	SPF动物实验中心-6
549	CAM000553	B区  3F-B317-3饲养室14-1-JK-26	SPF动物实验中心-6
550	CAM000554	B区  3F-B317-3饲养室14-2-JK-27	SPF动物实验中心-6
551	CAM000555	B区  3F-B317-2饲养室13-JK-28	SPF动物实验中心-6
552	CAM000556	B区  3F-B314饲养室5-3-JK-29	SPF动物实验中心-6
553	CAM000557	B区  3F-B313饲养室4-1-JK-30	SPF动物实验中心-6
554	CAM000558	B区  3F-B317-1饲养室12-JK-31	SPF动物实验中心-7
555	CAM000559	B区  3F-B317饲养室-JK-32	SPF动物实验中心-7
556	CAM000560	B区  3F-B316饲养室-JK-33	SPF动物实验中心-7
557	CAM000561	B区  3F-B316-3饲养室11-JK-34	SPF动物实验中心-7
558	CAM000562	B区  3F-B313饲养室4-2-JK-35	SPF动物实验中心-7
559	CAM000563	B区  3F-B313饲养室4-3-JK-37	SPF动物实验中心-7
560	CAM000564	B区  3F-B312饲养室3-1-JK-38	SPF动物实验中心-7
561	CAM000565	B区  3F-B316-2饲养室10-JK-39	SPF动物实验中心-7
562	CAM000566	B区  3F-B312饲养室3-2-JK-40	SPF动物实验中心-7
563	CAM000567	B区  3F-B312饲养室3-3-JK-42	SPF动物实验中心-7
564	CAM000568	B区  3F-B316-1饲养室9-JK-43	SPF动物实验中心-7
565	CAM000569	B区  3F-B315饲养室-JK-44	SPF动物实验中心-7
566	CAM000570	B区  3F-B315-3饲养室8-JK-45	SPF动物实验中心-7
567	CAM000571	B区  3F-B311饲养室2-1-JK-46	SPF动物实验中心-7
568	CAM000572	B区  3F-B311饲养室2-2-JK-47	SPF动物实验中心-7
569	CAM000573	B区  3F-B315-2饲养室7-JK-48	SPF动物实验中心-7
570	CAM000574	B区  3F-B311饲养室2-3-JK-49	SPF动物实验中心-7
571	CAM000575	B区  3F-B315-1饲养室6-1-JK-50	SPF动物实验中心-7
572	CAM000576	B区  3F-B315-1饲养室6-2-JK-51	SPF动物实验中心-7
573	CAM000577	B区  3F-B318-1饲养室15-1-JK-54	SPF动物实验中心-7
574	CAM000578	B区  3F-B318-1饲养室15-2-JK-56	SPF动物实验中心-7
575	CAM000579	B区  3F-B318饲养室-JK-57	SPF动物实验中心-7
576	CAM000580	B区  3F-B318-2饲养室16-1-JK-58	SPF动物实验中心-7
577	CAM000581	B区  3F-B318-2饲养室16-2-JK-59	SPF动物实验中心-7
578	CAM000582	B区  3F-B320-1饲养室19-1-JK-61	SPF动物实验中心-7
579	CAM000583	B区  3F-B320-1饲养室19-2-JK-62	SPF动物实验中心-7
580	CAM000584	B区  3F-B320-2饲养室20-JK-63	SPF动物实验中心-7
581	CAM000585	B区  3F-B320-3饲养室21-JK-64	SPF动物实验中心-7
582	CAM000586	B区  3F-B320饲养室-JK-65	SPF动物实验中心-7
583	CAM000587	B区  3F-B321饲养室-JK-66	SPF动物实验中心-8
584	CAM000588	B区  3F-B321-1饲养室22-JK-67	SPF动物实验中心-8
585	CAM000589	B区  3F-B319-1饲养室17-1-JK-71	SPF动物实验中心-8
586	CAM000590	B区  3F-B319-1饲养室17-2-JK-72	SPF动物实验中心-8
587	CAM000591	B区  3F-B321-2饲养室23-JK-77	SPF动物实验中心-8
588	CAM000592	B区  3F-B321-3饲养室24-1-JK-78	SPF动物实验中心-8
589	CAM000593	B区  3F-B321-3饲养室24-2-JK-79	SPF动物实验中心-8
590	CAM000594	B区  3F-B319饲养室-JK-80	SPF动物实验中心-8
591	CAM000595	B区  3F-B19-2饲养室18-1-JK-81	SPF动物实验中心-8
592	CAM000596	B区   3F-B19-2饲养室18-2-JK-84	SPF动物实验中心-8
593	CAM000597	B区   3F-B310饲养室1-JK-87	SPF动物实验中心-8
594	CAM000598	A区3FA-A405-407实验区域1-JK-05	SPF动物实验中心-8
595	CAM000599	A区3FA-A405-407实验区域2-JK-07	SPF动物实验中心-8
596	CAM000600	A区3FA-A405-407实验区域3-JK-08	SPF动物实验中心-8
597	CAM000601	A区3FA-A405-407实验区域4-JK-09	SPF动物实验中心-8
598	CAM000602	A区  3FA-A404细胞室-JK-10	SPF动物实验中心-8
599	CAM000603	A区  3FA-A402细胞室-JK-11	SPF动物实验中心-8
600	CAM000604	A区  4F-B402-1细胞室-JK-12	SPF动物实验中心-8
601	CAM000605	A区  4F-B403细胞室-JK-13	SPF动物实验中心-8
602	CAM000606	A区  4F-B401细胞室-JK-14	SPF动物实验中心-8
603	CAM000607	A区  4F-B407-1细胞室-JK-15	SPF动物实验中心-8
604	CAM000608	1F-JK-72    7号梯	SPF动物实验中心-8
605	CAM000609	4F-JK-01  3号梯	SPF动物实验中心-8
606	CAM000610	4F-JK-02   4号梯	SPF动物实验中心-8
607	CAM000611	4F-JK-06  1号梯	SPF动物实验中心-8
608	CAM000612	4F-JK-07   2号梯	SPF动物实验中心-8
609	CAM000613	4F-JK-16  5号梯	SPF动物实验中心-8
610	CAM000614	4F-JK-19   6号梯	SPF动物实验中心-8
611	CAM000615	B区  B1F-货物电梯厅-JK-01	SPF动物实验中心-9
612	CAM000616	B区  B1F-楼梯-2（东侧）-JK-02	SPF动物实验中心-9
613	CAM000617	B区  B1F-污物电梯厅-JK-05	SPF动物实验中心-9
614	CAM000618	B区  B1F-楼梯-1（西侧）-JK-06	SPF动物实验中心-9
615	CAM000619	B区  B1F-北侧走道（东西向）-JK-09	SPF动物实验中心-9
616	CAM000620	B区  B1F-西侧走道（南北向）-JK-10	SPF动物实验中心-9
617	CAM000621	B区  B1F-7号梯进出区域-JK-11	SPF动物实验中心-9
618	CAM000622	B区  B1F -锅炉房-1-JK-12	SPF动物实验中心-9
619	CAM000623	B区  B1F-东侧走道（南北向)-JK-13	SPF动物实验中心-9
620	CAM000624	B区  B1F-锅炉房-2-JK-14	SPF动物实验中心-9
621	CAM000625	B区  B1F-中间走道（东西向）-JK-15	SPF动物实验中心-9
622	CAM000626	B区  B1F-楼梯-3（西侧）-JK-16	SPF动物实验中心-9
623	CAM000627	A区  B1F-消防水泵房-1-JK-17	SPF动物实验中心-9
624	CAM000628	A区  B1F-生活水泵房-JK-18	SPF动物实验中心-9
625	CAM000629	A区  B1F-西南走道（南北向）-JK-19	SPF动物实验中心-9
626	CAM000630	A区  B1F-消防水泵房-2-JK-20	SPF动物实验中心-9
627	CAM000631	A区  B1F-南侧走道-1（东西向）-JK-21	SPF动物实验中心-9
628	CAM000632	A区  B1F-南侧走道-2（东西向）-JK-22	SPF动物实验中心-9
629	CAM000633	A区  B1F-锅炉房-3-JK-23	SPF动物实验中心-9
630	CAM000634	B区  1F-货物电梯厅-JK-03	SPF动物实验中心-9
631	CAM000635	B区  1F-楼梯-2（东侧)-JK-04	SPF动物实验中心-9
632	CAM000636	B区  1F-东侧走道-1（南北向）-JK-06	SPF动物实验中心-9
633	CAM000637	B区  1F-清洁走道-JK-09	SPF动物实验中心-9
634	CAM000638	B区   1F-室外区域（北侧）-1-JK-16	SPF动物实验中心-9
635	CAM000639	B区  1F-室外区域（北侧）-2-JK-17	SPF动物实验中心-9
636	CAM000640	B区  1F-污物电梯厅-JK-18	SPF动物实验中心-9
637	CAM000641	B区  1F-楼梯-1（西侧)-JK-19	SPF动物实验中心-9
638	CAM000642	B区  1F-西侧走道-1（向南）-JK-20	SPF动物实验中心-9
639	CAM000643	B区  1F-西侧走道-2（向北）-JK-21	SPF动物实验中心-9
640	CAM000644	B区  1F-污物暂存间-1-JK-23	SPF动物实验中心-9
641	CAM000645	B区  1F-清洁走道-JK-30	SPF动物实验中心-11
642	CAM000646	B区  1F-疏散出入口区域-1-JK-32	SPF动物实验中心-11
643	CAM000647	B区  1F-室外区域（西侧）-1-JK-39	SPF动物实验中心-11
644	CAM000648	B区  1F-污物暂存间-2-JK-40	SPF动物实验中心-11
645	CAM000649	B区  1F-室外区域（西侧）-2-JK-41	SPF动物实验中心-11
646	CAM000650	B区  1F-南侧走道（东西向）-JK-45	SPF动物实验中心-11
647	CAM000651	B区  1F-疏散出入口区域-2-JK-46	SPF动物实验中心-11
648	CAM000652	A区  1F-配电房-1-JK-53	SPF动物实验中心-11
649	CAM000653	A区  1F-配电房-2-JK-54	SPF动物实验中心-11
650	CAM000654	A区  1F-配电房-3-JK-55	SPF动物实验中心-11
651	CAM000655	A区  1F-消防控制室-1-JK-56	SPF动物实验中心-11
652	CAM000656	A区  1F-室外区域(南侧）-1-JK-57	SPF动物实验中心-11
653	CAM000657	A区  1F-室外区域(南侧）-1-JK-58	SPF动物实验中心-11
654	CAM000658	A区  1F-消防控制室-2-JK-59	SPF动物实验中心-11
655	CAM000659	A区  1F-大厅区域-1-JK-61	SPF动物实验中心-11
656	CAM000660	A区  1F-大厅区域-2-JK-62	SPF动物实验中心-11
657	CAM000661	A区  1F-大厅区域-3-JK-63	SPF动物实验中心-11
658	CAM000662	A区  1F-辅助出入口区域（东侧）-JK-65	SPF动物实验中心-11
659	CAM000663	A区  1F-7号梯进出区域-JK-71	SPF动物实验中心-11
660	CAM000664	B区  1F-室外区域（东侧)-1-JK-76	SPF动物实验中心-11
661	CAM000665	B区  1F-室外区域（东侧)-2-JK-77	SPF动物实验中心-11
662	CAM000666	B区  1F-B101接待室-JK-78	SPF动物实验中心-11
663	CAM000667	A区  1F- B103档案室-JK-79	SPF动物实验中心-11
664	CAM000668	B区  1F-大厅区域-JK-80	SPF动物实验中心-11
665	CAM000669	A区  1F-东侧走道-1（向南）-JK-81	SPF动物实验中心-11
666	CAM000670	B区  2F-货物电梯厅-JK-01	SPF动物实验中心-11
667	CAM000671	B区  2F-楼梯-2（东侧)-JK-03	SPF动物实验中心-11
668	CAM000672	B区  2F-东洁净走廊（南北向）-JK-04	SPF动物实验中心-11
669	CAM000673	B区  2F-北洁净走廊（东西向）-1-JK-07	SPF动物实验中心-11
670	CAM000674	B区  2F-北洁净走廊（东西向）-2-JK-10	SPF动物实验中心-11
671	CAM000675	B区  2F-西侧走道-1（南北向）-JK-14	SPF动物实验中心-11
672	CAM000676	B区  2F-污物电梯厅-JK-16	SPF动物实验中心-11
673	CAM000677	B区  2F-楼梯-1（西侧)-JK-17	SPF动物实验中心-10
674	CAM000678	B区  2F-西侧走道-2（东西向）-JK-21	SPF动物实验中心-10
675	CAM000679	B区  2F-北混合走廊（东西向）-1-JK-29	SPF动物实验中心-10
676	CAM000680	B区  2F-北混合走廊（东西向）-2-JK-34	SPF动物实验中心-10
677	CAM000681	B区  2F-中混合走廊（东西向）-1-JK-47	SPF动物实验中心-10
678	CAM000682	B区  2F-中混合走廊（东西向）-2-JK-51	SPF动物实验中心-10
679	CAM000683	B区  2F-A-B区进出口（西侧）-JK-59	SPF动物实验中心-10
680	CAM000684	B区  2F-西污物走廊(南北向）-JK-60	SPF动物实验中心-10
681	CAM000685	B区  2F-南混合走廊（东西向）-1-JK-68	SPF动物实验中心-10
682	CAM000686	B区  2F-南混合走廊（东西向）-2-JK-73	SPF动物实验中心-10
683	CAM000687	B区  2F-A-B区进出口（东侧）-JK-83	SPF动物实验中心-10
684	CAM000688	A区  2F-进出走道区域-1-JK-88	SPF动物实验中心-10
685	CAM000689	A区  2F-进出走道区域-2-JK-89	SPF动物实验中心-10
686	CAM000690	A区  2F-进出过道区域-3-JK-94	SPF动物实验中心-10
687	CAM000691	A区  2F-进出过道区域-4-JK-96	SPF动物实验中心-10
688	CAM000692	B区  2FA-夹层电梯厅-JK-01	SPF动物实验中心-10
689	CAM000693	B区  2FA-夹层楼梯-2（东侧）-JK-02	SPF动物实验中心-10
690	CAM000694	B区  2FA-夹层楼梯-1（西侧）-JK-03	SPF动物实验中心-10
691	CAM000695	B区  2FA-夹层楼梯-3（西侧）-JK-04	SPF动物实验中心-10
692	CAM000696	A区  2FA-进出走道区域-1-JK-06	SPF动物实验中心-10
693	CAM000697	A区  2FA-进出走道区域-2-JK-12	SPF动物实验中心-10
694	CAM000698	A区  2FA-进出走道区域-3-JK-13	SPF动物实验中心-10
695	CAM000699	B区  3F-东洁净走廊-（南北向）-JK-01	SPF动物实验中心-10
696	CAM000700	B区  3F-货物电梯厅-JK-04	SPF动物实验中心-10
697	CAM000701	B区  3F-楼梯-2（东侧）-JK-06	SPF动物实验中心-10
698	CAM000702	B区  3F-B302屏障入口-JK-07	SPF动物实验中心-10
699	CAM000703	B区  3F-北洁净走廊（东西向）-1-JK-10	SPF动物实验中心-10
700	CAM000704	B区  3F-北洁净走廊（东西向）-2-JK-11	SPF动物实验中心-10
701	CAM000705	B区  3F-西走道-1（南北向）-JK-14	SPF动物实验中心-10
702	CAM000706	B区  3F-污物电梯厅-JK-15	SPF动物实验中心-10
703	CAM000707	B区  3F-楼梯-1（西侧）-JK-16	SPF动物实验中心-10
704	CAM000708	B区  3F-西走道-2（东西向）-JK-18	SPF动物实验中心-10
705	CAM000709	实验A楼341-1	2019新增实验A楼
706	CAM000710	实验A楼341-2	ISC6800实验室A楼
707	CAM000711	化学馆330-1房间	化学馆实验室  2024
708	CAM000712	实验D楼1F走道	平台摄像机
709	CAM000713	实验B楼西面停车处	平台摄像机
710	CAM000714	实验D楼外停车处	平台摄像机
711	CAM000715	实验B楼东面停车处	平台摄像机
712	CAM000716	实验AB楼之间通道	平台摄像机
713	CAM000717	实验A群楼门口	平台摄像机
714	CAM000718	化学馆1F正大门	化学馆实验室  2024
715	CAM000719	实验C裙楼新增0	ISC6800实验室C楼
716	CAM000720	化学馆330-2房间	化学馆实验室  2024
717	CAM000721	实验A楼裙楼1F数控机房1	ISC6800实验室A楼
718	CAM000722	化学馆202-204房间	化学馆实验室  2024
719	CAM000723	实验A楼裙楼数控机房2	ISC6800实验室A楼
720	CAM000724	实验A楼裙楼1F数控机房2	ISC6800实验室A楼
721	CAM000725	实验C楼主楼大门	平台摄像机
722	CAM000726	实验C楼2F主楼通道东照	平台摄像机
723	CAM000727	实验C楼走道2	平台摄像机
724	CAM000728	实验C楼1F裙楼通道东照	平台摄像机
725	CAM000729	实验C楼1F裙楼主大门内2	平台摄像机
726	CAM000730	实验C楼1F裙楼主大门内1	平台摄像机
727	CAM000731	实验C楼1F主楼主消防入口	平台摄像机
728	CAM000732	实验C楼4F裙楼通道西照	平台摄像机
729	CAM000733	实验C楼5F裙楼通道西照	平台摄像机
730	CAM000734	实验C楼3F主楼向裙楼照	平台摄像机
731	CAM000735	实验C楼3F主楼向裙楼照	平台摄像机
732	CAM000736	实验C楼4F裙楼通道东照	平台摄像机
733	CAM000737	实验C楼2F裙楼通道西照	平台摄像机
734	CAM000738	实验C楼5F裙楼西楼梯	平台摄像机
735	CAM000739	实验C楼4F主楼向裙楼照	平台摄像机
736	CAM000740	实验C楼2F裙楼通道北照	平台摄像机
737	CAM000741	实验C楼3F裙楼通道东照	平台摄像机
738	CAM000742	实验C楼3F裙楼通道北照	平台摄像机
739	CAM000743	实验C楼1F裙楼侧门电梯	平台摄像机
740	CAM000744	实验C楼5F主楼侧消防通道	平台摄像机
741	CAM000745	实验C楼5F主楼消防通道	平台摄像机
742	CAM000746	实验楼C裙楼5F东消防通道口	平台摄像机
743	CAM000747	实验C楼1F主楼大门全景	平台摄像机
744	CAM000748	实验C楼1F主楼电梯	平台摄像机
745	CAM000749	实验C楼3F裙楼通道西照	平台摄像机
746	CAM000750	实验C楼2F主楼向裙楼照	平台摄像机
747	CAM000751	实验C楼5F主楼向裙楼照	平台摄像机
748	CAM000752	实验C楼5F裙楼通道东照	平台摄像机
749	CAM000753	实验C楼3F主楼通道东照	平台摄像机
750	CAM000754	实验C楼1F裙楼东消防通道口	平台摄像机
751	CAM000755	实验C楼4F主楼通道西照	平台摄像机
752	CAM000756	实验C楼2F主楼通道西照	平台摄像机
753	CAM000757	实验C楼5F主楼通道东照	平台摄像机
754	CAM000758	实验C楼3F主楼通道西照	平台摄像机
755	CAM000759	实验C楼1F主楼通道东照	平台摄像机
756	CAM000760	实验C楼1F主楼侧门	平台摄像机
757	CAM000761	实验C楼5F主楼通道西照	平台摄像机
758	CAM000762	实验C楼5F裙楼通道北照	平台摄像机
759	CAM000763	实验C楼4F裙楼通道北照	平台摄像机
760	CAM000764	实验C主楼通道东照	平台摄像机
761	CAM000765	实验B楼裙楼1F大门	平台摄像机
762	CAM000766	实验B楼监控室	平台摄像机
763	CAM000767	实验B楼1F大厅	平台摄像机
764	CAM000768	实验B楼裙房1F侧大门	平台摄像机
765	CAM000769	实验B楼2F裙楼通道西照	平台摄像机
766	CAM000770	实验B楼主楼1F消防通道门	平台摄像机
767	CAM000771	实验B楼5F主楼通道南照	平台摄像机
768	CAM000772	实验B楼裙楼5F通道西照	平台摄像机
769	CAM000773	实验B楼5F主楼通道北照	平台摄像机
770	CAM000774	实验B楼5F主楼储物间	平台摄像机
771	CAM000775	实验B楼裙楼1F通道东照	平台摄像机
772	CAM000776	实验B楼主楼3F主通道北照	平台摄像机
773	CAM000777	实验B楼主楼4F连廊裙楼向主楼照	平台摄像机
774	CAM000778	实验B楼裙楼1F通道西照	平台摄像机
775	CAM000779	实验B楼主楼3F连廊裙楼向主楼照	平台摄像机
776	CAM000780	实验B楼主楼2F主通道北照	平台摄像机
777	CAM000781	实验B楼裙楼5F通道东照	平台摄像机
778	CAM000782	实验B楼裙楼3F通道西照	平台摄像机
779	CAM000783	实验B楼裙楼4F通道西照	平台摄像机
780	CAM000784	实验B楼5F连廊裙楼向主楼照	平台摄像机
781	CAM000785	实验B楼裙楼3F通道东照	平台摄像机
782	CAM000786	实验B楼裙楼4F通道东照	平台摄像机
783	CAM000787	实验B楼主楼3F主通道南照	平台摄像机
784	CAM000788	实验B楼1F裙房东消防入口	平台摄像机
785	CAM000789	实验B楼主楼5F主楼侧消防通道	平台摄像机
786	CAM000790	实验B楼5F裙房东楼梯出入	平台摄像机
787	CAM000791	实验B楼5F主楼主消防通道	平台摄像机
788	CAM000792	实验B楼主楼1F主电梯出入口	平台摄像机
789	CAM000793	实验B楼主楼4F主楼主通道北照	平台摄像机
790	CAM000794	实验B楼主楼4F主楼主通道南照	平台摄像机
791	CAM000795	实验B楼主楼1F侧楼梯入口	平台摄像机
792	CAM000796	实验B楼主楼1F主电梯旁走道	平台摄像机
793	CAM000797	实验B楼主楼2F主通道南照	平台摄像机
794	CAM000798	实验B楼主楼1F侧大门口	平台摄像机
795	CAM000799	实验B楼1F裙房主大门全景	平台摄像机
796	CAM000800	实验B楼2F裙楼连廊	平台摄像机
797	CAM000801	实验B楼2F裙楼通道东照	平台摄像机
798	CAM000802	实验A楼机房	平台摄像机
799	CAM000803	实验A楼1F裙楼侧门	平台摄像机
800	CAM000804	实验A楼1F裙楼主门	平台摄像机
801	CAM000805	实验A楼3F主楼东消防楼梯	平台摄像机
802	CAM000806	实验A楼4F裙楼西照	平台摄像机
803	CAM000807	实验A楼5F裙楼西照	平台摄像机
804	CAM000808	实验A楼3F裙楼东南照	平台摄像机
805	CAM000809	实验A楼4F裙楼东南照	平台摄像机
806	CAM000810	实验A楼1F主楼电梯口	平台摄像机
807	CAM000811	实验A楼4F裙楼通道西南照	平台摄像机
808	CAM000812	实验A楼5F裙楼通道西南照	平台摄像机
809	CAM000813	实验A楼1F裙楼西通道北照	平台摄像机
810	CAM000814	实验A楼1F裙楼通道西南照	平台摄像机
811	CAM000815	实验A楼2F主楼主通道东照	平台摄像机
812	CAM000816	实验A楼2F主楼强电间南照	平台摄像机
813	CAM000817	实验A楼3F裙楼西照	平台摄像机
814	CAM000818	实验A楼1F裙楼通道东南照	平台摄像机
815	CAM000819	实验A楼2F裙楼西照	平台摄像机
816	CAM000820	实验A楼2F裙楼通道西南照	平台摄像机
817	CAM000821	实验A楼2F裙楼东南照	平台摄像机
818	CAM000822	实验A楼3F主楼通道东照	平台摄像机
819	CAM000823	实验A楼3F裙楼通道西南照	平台摄像机
820	CAM000824	实验A楼3F主楼强电间门口南照	平台摄像机
821	CAM000825	实验A楼1F主楼主通道东照	平台摄像机
822	CAM000826	实验A楼1F裙楼通道西北照	平台摄像机
823	CAM000827	实验A楼1F主楼北消防楼梯	平台摄像机
824	CAM000828	实验A楼1F主楼南消防楼梯	平台摄像机
825	CAM000829	实验A楼1F裙楼东消防梯侧门	平台摄像机
826	CAM000830	实验A楼5F主楼强电间旁楼梯	平台摄像机
827	CAM000831	实验A楼5F裙楼南消防梯	平台摄像机
828	CAM000832	实验A楼1F裙楼西消防楼梯	平台摄像机
829	CAM000833	实验A楼5F裙楼北消防梯	平台摄像机
830	CAM000834	实验A楼1F裙楼电梯口	平台摄像机
831	CAM000835	实验A楼1F裙楼门厅全景	平台摄像机
832	CAM000836	实验A楼5F裙楼通道东北照	平台摄像机
833	CAM000837	实验A楼4F裙楼通道东北照	平台摄像机
834	CAM000838	实验A楼2F裙楼通道东北照	平台摄像机
835	CAM000839	实验A楼5F裙楼东南照	平台摄像机
836	CAM000840	实验A楼2F主楼主通道西照	平台摄像机
837	CAM000841	实验A楼3F主楼通道西照	平台摄像机
838	CAM000842	实验A楼3F裙楼通道东北照	平台摄像机
839	CAM000843	实验A楼1F主楼大门2	平台摄像机
840	CAM000844	实验A楼1F主楼大门口1	平台摄像机
841	CAM000845	实验楼花坛西向	华师大道路监控
842	CAM000846	实验B楼裙楼后道路东向	平台摄像机
843	CAM000847	实验A楼前小路西	华师大道路监控
844	CAM000848	实验A楼前小路东	华师大道路监控
845	CAM000849	实验A楼主楼前道路东向	河道及道路
846	CAM000850	实验A楼前小路南	河道及道路
847	CAM000851	化学楼226-2	化学馆实验室  2024
848	CAM000852	化学楼249-1	化学馆实验室  2024
849	CAM000853	化学楼249-2	化学馆实验室  2024
850	CAM000854	化学楼226-1	化学馆实验室  2024
851	CAM000855	实验A楼430-428	ISC6800实验室A楼
852	CAM000856	实验A楼233	ISC6800实验室A楼
853	CAM000857	实验A楼424	ISC6800实验室A楼
854	CAM000858	实验A楼426	ISC6800实验室A楼
855	CAM000859	实验A楼431	ISC6800实验室A楼
856	CAM000860	实验A楼433	ISC6800实验室A楼
857	CAM000861	实验A楼435-2	ISC6800实验室A楼
858	CAM000862	实验A楼436	ISC6800实验室A楼
859	CAM000863	实验A楼437	ISC6800实验室A楼
860	CAM000864	实验A楼438	ISC6800实验室A楼
861	CAM000865	实验A楼216	ISC6800实验室A楼
862	CAM000866	实验A楼225	ISC6800实验室A楼
863	CAM000867	实验A楼227	ISC6800实验室A楼
864	CAM000868	实验A楼230	ISC6800实验室A楼
865	CAM000869	实验A楼231	ISC6800实验室A楼
866	CAM000870	实验A楼234	ISC6800实验室A楼
867	CAM000871	实验A楼236	ISC6800实验室A楼
868	CAM000872	实验A楼238	ISC6800实验室A楼
869	CAM000873	实验A楼447	ISC6800实验室A楼
870	CAM000874	实验A楼240	ISC6800实验室A楼
871	CAM000875	实验A楼242	ISC6800实验室A楼
872	CAM000876	实验A楼243	ISC6800实验室A楼
873	CAM000877	实验A楼244-1	ISC6800实验室A楼
874	CAM000878	实验A楼244-2	ISC6800实验室A楼
875	CAM000879	实验A楼247	ISC6800实验室A楼
876	CAM000880	实验A楼249	ISC6800实验室A楼
877	CAM000881	实验A楼251	ISC6800实验室A楼
878	CAM000882	实验A楼327	ISC6800实验室A楼
879	CAM000883	实验A楼455-457	ISC6800实验室A楼
880	CAM000884	实验A楼330	ISC6800实验室A楼
881	CAM000885	实验A楼333	ISC6800实验室A楼
882	CAM000886	实验A楼335	ISC6800实验室A楼
883	CAM000887	实验A楼337	ISC6800实验室A楼
884	CAM000888	实验A楼339	ISC6800实验室A楼
885	CAM000889	实验A楼340	ISC6800实验室A楼
886	CAM000890	实验A楼341	ISC6800实验室A楼
887	CAM000891	实验A楼344	ISC6800实验室A楼
888	CAM000892	实验A楼345	ISC6800实验室A楼
889	CAM000893	实验A楼346	ISC6800实验室A楼
890	CAM000894	实验A楼524	ISC6800实验室A楼
891	CAM000895	实验A楼347	ISC6800实验室A楼
892	CAM000896	实验A楼348	ISC6800实验室A楼
893	CAM000897	实验A楼350	ISC6800实验室A楼
894	CAM000898	实验A楼440-442	ISC6800实验室A楼
895	CAM000899	实验A楼129	ISC6800实验室A楼
896	CAM000900	实验A楼427	ISC6800实验室A楼
897	CAM000901	实验A楼429	ISC6800实验室A楼
898	CAM000902	实验A楼434	ISC6800实验室A楼
899	CAM000903	实验A楼439	ISC6800实验室A楼
900	CAM000904	实验A楼441	ISC6800实验室A楼
901	CAM000905	实验A楼443-445	ISC6800实验室A楼
902	CAM000906	实验A楼527	ISC6800实验室A楼
903	CAM000907	实验A楼529	ISC6800实验室A楼
904	CAM000908	实验A楼140	ISC6800实验室A楼
905	CAM000909	实验A楼237	ISC6800实验室A楼
906	CAM000910	实验A楼218-220	ISC6800实验室A楼
907	CAM000911	实验A楼221	ISC6800实验室A楼
908	CAM000912	实验A楼222	ISC6800实验室A楼
909	CAM000913	实验A楼543	ISC6800实验室A楼
910	CAM000914	实验A楼223	ISC6800实验室A楼
911	CAM000915	实验A楼224	ISC6800实验室A楼
912	CAM000916	实验A楼228-226	ISC6800实验室A楼
913	CAM000917	实验A楼239	ISC6800实验室A楼
914	CAM000918	实验A楼246	ISC6800实验室A楼
915	CAM000919	实验A楼248	ISC6800实验室A楼
916	CAM000920	实验A楼321	ISC6800实验室A楼
917	CAM000921	实验A楼323	ISC6800实验室A楼
918	CAM000922	实验A楼326	ISC6800实验室A楼
919	CAM000923	实验A楼328	ISC6800实验室A楼
920	CAM000924	实验A楼545	ISC6800实验室A楼
921	CAM000925	实验A楼329	ISC6800实验室A楼
922	CAM000926	实验A楼331	ISC6800实验室A楼
923	CAM000927	实验A楼112	ISC6800实验室A楼
924	CAM000928	实验A楼332	ISC6800实验室A楼
925	CAM000929	实验A楼334	ISC6800实验室A楼
926	CAM000930	实验A楼336	ISC6800实验室A楼
927	CAM000931	实验A楼338	ISC6800实验室A楼
928	CAM000932	实验A楼114	ISC6800实验室A楼
929	CAM000933	实验A楼349	ISC6800实验室A楼
930	CAM000934	实验A楼351	ISC6800实验室A楼
931	CAM000935	实验A楼121	ISC6800实验室A楼
932	CAM000936	实验A楼355	ISC6800实验室A楼
933	CAM000937	实验A楼356	ISC6800实验室A楼
934	CAM000938	实验A楼357	ISC6800实验室A楼
935	CAM000939	实验A楼358	ISC6800实验室A楼
936	CAM000940	实验A楼359	ISC6800实验室A楼
937	CAM000941	实验A楼360	ISC6800实验室A楼
938	CAM000942	实验A楼362	ISC6800实验室A楼
939	CAM000943	实验A楼142	ISC6800实验室A楼
940	CAM000944	实验A楼363	ISC6800实验室A楼
941	CAM000945	实验A楼123	ISC6800实验室A楼
942	CAM000946	实验A楼412	ISC6800实验室A楼
943	CAM000947	实验A楼420-1	ISC6800实验室A楼
944	CAM000948	实验A楼420-2	ISC6800实验室A楼
945	CAM000949	实验A楼435-1	ISC6800实验室A楼
946	CAM000950	实验A楼422	ISC6800实验室A楼
947	CAM000951	实验A楼325	ISC6800实验室A楼
948	CAM000952	实验A楼354	ISC6800实验室A楼
949	CAM000953	实验A楼416	ISC6800实验室A楼
950	CAM000954	实验A楼551-553	ISC6800实验室A楼
951	CAM000955	实验A楼353	ISC6800实验室A楼
952	CAM000956	实验A楼410	ISC6800实验室A楼
953	CAM000957	实验B楼-506	ISC6800实验室B楼
954	CAM000958	实验B楼-516	ISC6800实验室B楼
955	CAM000959	实验B楼-B408	ISC6800实验室B楼
956	CAM000960	实验B楼-B409	ISC6800实验室B楼
957	CAM000961	实验B楼-B410	ISC6800实验室B楼
958	CAM000962	实验B楼-414-416	ISC6800实验室B楼
959	CAM000963	实验B楼-415-417	ISC6800实验室B楼
960	CAM000964	实验B楼-422	ISC6800实验室B楼
961	CAM000965	实验B楼-422	ISC6800实验室B楼
962	CAM000966	实验B楼-424-1	ISC6800实验室B楼
963	CAM000967	实验B楼-425	ISC6800实验室B楼
964	CAM000968	实验B楼-109-2	ISC6800实验室B楼
965	CAM000969	实验B楼-109-1	ISC6800实验室B楼
966	CAM000970	实验B楼-424-2	ISC6800实验室B楼
967	CAM000971	实验B楼-424-3	ISC6800实验室B楼
968	CAM000972	实验B楼-429	ISC6800实验室B楼
969	CAM000973	实验B楼-433	ISC6800实验室B楼
970	CAM000974	实验B楼-走道4F-1	ISC6800实验室B楼
971	CAM000975	实验B楼-走道4F-2	ISC6800实验室B楼
972	CAM000976	实验B楼-走道4F-3	ISC6800实验室B楼
973	CAM000977	实验B楼-走道4F-4	ISC6800实验室B楼
974	CAM000978	实验B楼-503	ISC6800实验室B楼
975	CAM000979	实验B楼-517	ISC6800实验室B楼
976	CAM000980	实验B楼-505	ISC6800实验室B楼
977	CAM000981	实验B楼-2F走道-4	ISC6800实验室B楼
978	CAM000982	实验B楼-518	ISC6800实验室B楼
979	CAM000983	实验B楼-519-521	ISC6800实验室B楼
980	CAM000984	实验B楼-522	ISC6800实验室B楼
981	CAM000985	实验B楼-523	ISC6800实验室B楼
982	CAM000986	实验B楼-524-1	ISC6800实验室B楼
983	CAM000987	实验B楼-525	ISC6800实验室B楼
984	CAM000988	实验B楼-507-1	ISC6800实验室B楼
985	CAM000989	实验B楼-524-2	ISC6800实验室B楼
986	CAM000990	实验B楼-527-529	ISC6800实验室B楼
987	CAM000991	实验B楼-110	ISC6800实验室B楼
988	CAM000992	实验B楼-531	ISC6800实验室B楼
989	CAM000993	实验B楼-5F走道-1	ISC6800实验室B楼
990	CAM000994	实验B楼-5F走道-2	ISC6800实验室B楼
991	CAM000995	实验B楼-5F走道-3	ISC6800实验室B楼
992	CAM000996	实验B楼-5F走道-4	ISC6800实验室B楼
993	CAM000997	实验B楼-1F走道-4	ISC6800实验室B楼
994	CAM000998	实验B楼-527-529-2	ISC6800实验室B楼
995	CAM000999	实验B楼-507-2	ISC6800实验室B楼
996	CAM001000	实验B楼-502	ISC6800实验室B楼
997	CAM001001	实验B楼-111-113	ISC6800实验室B楼
998	CAM001002	实验B楼-114-1	ISC6800实验室B楼
999	CAM001003	实验B楼-114-2	ISC6800实验室B楼
1000	CAM001004	实验B楼-115	ISC6800实验室B楼
1001	CAM001005	实验B楼-116-1	ISC6800实验室B楼
1002	CAM001006	实验B楼-116-2	ISC6800实验室B楼
1003	CAM001007	实验B楼-117	ISC6800实验室B楼
1004	CAM001008	实验B楼-118-1	ISC6800实验室B楼
1005	CAM001009	实验B楼-118-2	ISC6800实验室B楼
1006	CAM001010	实验B楼-508	ISC6800实验室B楼
1007	CAM001011	实验B楼-119-121	ISC6800实验室B楼
1008	CAM001012	实验B楼-120-1	ISC6800实验室B楼
1009	CAM001013	实验B楼-120-2	ISC6800实验室B楼
1010	CAM001014	实验B楼-122	ISC6800实验室B楼
1011	CAM001015	实验B楼-123	ISC6800实验室B楼
1012	CAM001016	实验B楼-125	ISC6800实验室B楼
1013	CAM001017	实验B楼-1F走道-2	ISC6800实验室B楼
1014	CAM001018	实验B楼-202	ISC6800实验室B楼
1015	CAM001019	实验B楼-204	ISC6800实验室B楼
1016	CAM001020	实验B楼-206-208-1	ISC6800实验室B楼
1017	CAM001021	实验B楼-509-1	ISC6800实验室B楼
1018	CAM001022	实验B楼-206-208-2	ISC6800实验室B楼
1019	CAM001023	实验B楼-207-209-1	ISC6800实验室B楼
1020	CAM001024	实验B楼-207-209-2	ISC6800实验室B楼
1021	CAM001025	实验B楼-211	ISC6800实验室B楼
1022	CAM001026	实验B楼-215	ISC6800实验室B楼
1023	CAM001027	实验B楼-216	ISC6800实验室B楼
1024	CAM001028	实验B楼-217	ISC6800实验室B楼
1025	CAM001029	实验B楼-218	ISC6800实验室B楼
1026	CAM001030	实验B楼-219-221	ISC6800实验室B楼
1027	CAM001031	实验B楼-220	ISC6800实验室B楼
1028	CAM001032	实验B楼-509-2	ISC6800实验室B楼
1029	CAM001033	实验B楼-222	ISC6800实验室B楼
1030	CAM001034	实验B楼-223	ISC6800实验室B楼
1031	CAM001035	实验B楼-224	ISC6800实验室B楼
1032	CAM001036	实验B楼-225	ISC6800实验室B楼
1033	CAM001037	实验B楼-2F走道-1	ISC6800实验室B楼
1034	CAM001038	实验B楼-2F走道-2	ISC6800实验室B楼
1035	CAM001039	实验B楼-2F走道-3	ISC6800实验室B楼
1036	CAM001040	实验B楼-108-1	ISC6800实验室B楼
1037	CAM001041	实验B楼-301	ISC6800实验室B楼
1038	CAM001042	实验B楼-303	ISC6800实验室B楼
1039	CAM001043	实验B楼-512	ISC6800实验室B楼
1040	CAM001044	实验B楼-304	ISC6800实验室B楼
1041	CAM001045	实验B楼-308	ISC6800实验室B楼
1042	CAM001046	实验B楼-311	ISC6800实验室B楼
1043	CAM001047	实验B楼-312	ISC6800实验室B楼
1044	CAM001048	实验B楼-313	ISC6800实验室B楼
1045	CAM001049	实验B楼-314	ISC6800实验室B楼
1046	CAM001050	实验B楼-315	ISC6800实验室B楼
1047	CAM001051	实验B楼-108-2	ISC6800实验室B楼
1048	CAM001052	实验B楼-316-1	ISC6800实验室B楼
1049	CAM001053	实验B楼-316-2	ISC6800实验室B楼
1050	CAM001054	实验B楼-514	ISC6800实验室B楼
1051	CAM001055	实验B楼-317	ISC6800实验室B楼
1052	CAM001056	实验B楼-319	ISC6800实验室B楼
1053	CAM001057	实验B楼-320-322	ISC6800实验室B楼
1054	CAM001058	实验B楼-321	ISC6800实验室B楼
1055	CAM001059	实验B楼-323	ISC6800实验室B楼
1056	CAM001060	实验B楼-324	ISC6800实验室B楼
1057	CAM001061	实验B楼-326	ISC6800实验室B楼
1058	CAM001062	实验B楼-3F走道-1	ISC6800实验室B楼
1059	CAM001063	实验B楼-107-1	ISC6800实验室B楼
1060	CAM001064	实验B楼-3F走道-2	ISC6800实验室B楼
1061	CAM001065	实验B楼-515	ISC6800实验室B楼
1062	CAM001066	实验B楼-3F走道-3	ISC6800实验室B楼
1063	CAM001067	实验B楼-3F走道-4	ISC6800实验室B楼
1064	CAM001068	实验B楼-B401	ISC6800实验室B楼
1065	CAM001069	实验B楼-B402	ISC6800实验室B楼
1066	CAM001070	实验B楼-B403	ISC6800实验室B楼
1067	CAM001071	实验B楼-B404	ISC6800实验室B楼
1068	CAM001072	实验B楼-B405	ISC6800实验室B楼
1069	CAM001073	实验B楼-B406	ISC6800实验室B楼
1070	CAM001074	实验B楼-B407	ISC6800实验室B楼
1071	CAM001075	实验B楼-107-2	ISC6800实验室B楼
1072	CAM001076	实验B楼附楼1F弱电间	ISC6800实验室B楼
1073	CAM001077	实验B楼裙楼1F大门	ISC6800实验室B楼
1074	CAM001078	实验B楼监控室	ISC6800实验室B楼
1075	CAM001079	实验B楼1F大厅	ISC6800实验室B楼
1076	CAM001080	实验C楼101	ISC6800实验室C楼
1077	CAM001081	实验C楼107-2	ISC6800实验室C楼
1078	CAM001082	实验C楼大厅出入口	ISC6800实验室C楼
1079	CAM001083	实验C楼110-1	ISC6800实验室C楼
1080	CAM001084	实验C楼218	ISC6800实验室C楼
1081	CAM001085	实验C楼509	ISC6800实验室C楼
1082	CAM001086	实验C楼518	ISC6800实验室C楼
1083	CAM001087	实验C楼103	ISC6800实验室C楼
1084	CAM001088	实验C楼111-1	ISC6800实验室C楼
1085	CAM001089	实验C楼101-2	ISC6800实验室C楼
1086	CAM001090	实验C楼111-2	ISC6800实验室C楼
1087	CAM001091	实验C楼113	ISC6800实验室C楼
1088	CAM001092	实验C楼114	ISC6800实验室C楼
1089	CAM001093	实验C楼115	ISC6800实验室C楼
1090	CAM001094	实验C楼116-1	ISC6800实验室C楼
1091	CAM001095	实验C楼116-2	ISC6800实验室C楼
1092	CAM001096	实验C楼118	ISC6800实验室C楼
1093	CAM001097	实验C楼120-1	ISC6800实验室C楼
1094	CAM001098	实验C楼120-2	ISC6800实验室C楼
1095	CAM001099	实验C楼211-213	ISC6800实验室C楼
1096	CAM001100	实验C楼109	ISC6800实验室C楼
1097	CAM001101	实验C楼215	ISC6800实验室C楼
1098	CAM001102	实验C楼217	ISC6800实验室C楼
1099	CAM001103	实验C楼220-1	ISC6800实验室C楼
1100	CAM001104	实验C楼220-2	ISC6800实验室C楼
1101	CAM001105	实验C楼222	ISC6800实验室C楼
1102	CAM001106	实验C楼224-1	ISC6800实验室C楼
1103	CAM001107	实验C楼224-2	ISC6800实验室C楼
1104	CAM001108	实验C楼301	ISC6800实验室C楼
1105	CAM001109	实验C楼303	ISC6800实验室C楼
1106	CAM001110	实验C楼312	ISC6800实验室C楼
1107	CAM001111	实验C楼314	ISC6800实验室C楼
1108	CAM001112	实验C楼315	ISC6800实验室C楼
1109	CAM001113	实验C楼317	ISC6800实验室C楼
1110	CAM001114	实验C楼318	ISC6800实验室C楼
1111	CAM001115	实验C楼320	ISC6800实验室C楼
1112	CAM001116	实验C楼322	ISC6800实验室C楼
1113	CAM001117	实验C楼324	ISC6800实验室C楼
1114	CAM001118	实验C楼424	ISC6800实验室C楼
1115	CAM001119	实验C楼501	ISC6800实验室C楼
1116	CAM001120	实验C楼503	ISC6800实验室C楼
1117	CAM001121	实验C楼511-1	ISC6800实验室C楼
1118	CAM001122	实验C楼511-2	ISC6800实验室C楼
1119	CAM001123	实验C楼513-1	ISC6800实验室C楼
1120	CAM001124	实验C楼513-2	ISC6800实验室C楼
1121	CAM001125	实验C群楼走道1	ISC6800实验室C楼
1122	CAM001126	实验C楼107-1	ISC6800实验室C楼
1123	CAM001127	实验C楼2F走道-1	ISC6800实验室C楼
1124	CAM001128	实验C楼2F走道-2	ISC6800实验室C楼
1125	CAM001129	实验C楼3F走道-1	ISC6800实验室C楼
1126	CAM001130	实验C楼3F走道-2	ISC6800实验室C楼
1127	CAM001131	实验D楼518-3	ISC6800实验室D楼
1128	CAM001132	实验D楼206	ISC6800实验室D楼
1129	CAM001133	实验D楼212	ISC6800实验室D楼
1130	CAM001134	实验D楼214	ISC6800实验室D楼
1131	CAM001135	实验D楼215	ISC6800实验室D楼
1132	CAM001136	实验D楼216-1	ISC6800实验室D楼
1133	CAM001137	实验D楼216-2	ISC6800实验室D楼
1134	CAM001138	实验D楼217-1	ISC6800实验室D楼
1135	CAM001139	实验D楼217-2	ISC6800实验室D楼
1136	CAM001140	实验D楼520	ISC6800实验室D楼
1137	CAM001141	实验D楼218	ISC6800实验室D楼
1138	CAM001142	实验D楼220	ISC6800实验室D楼
1139	CAM001143	实验D楼222-1	ISC6800实验室D楼
1140	CAM001144	实验D楼222-2	ISC6800实验室D楼
1141	CAM001145	实验D楼224	ISC6800实验室D楼
1142	CAM001146	实验D楼2F走道1	ISC6800实验室D楼
1143	CAM001147	实验D楼2F走道2	ISC6800实验室D楼
1144	CAM001148	实验D楼304	ISC6800实验室D楼
1145	CAM001149	实验D楼305	ISC6800实验室D楼
1146	CAM001150	实验D楼306-1	ISC6800实验室D楼
1147	CAM001151	实验D楼5F走道-1	ISC6800实验室D楼
1148	CAM001152	实验D楼306-2	ISC6800实验室D楼
1149	CAM001153	实验D楼307-1	ISC6800实验室D楼
1150	CAM001154	实验D楼307-2	ISC6800实验室D楼
1151	CAM001155	实验D楼308	ISC6800实验室D楼
1152	CAM001156	实验D楼310	ISC6800实验室D楼
1153	CAM001157	实验D楼312	ISC6800实验室D楼
1154	CAM001158	实验D楼313	ISC6800实验室D楼
1155	CAM001159	实验D楼314	ISC6800实验室D楼
1156	CAM001160	实验D楼315-1	ISC6800实验室D楼
1157	CAM001161	实验D楼315-2	ISC6800实验室D楼
1158	CAM001162	实验D楼5F走道-2	ISC6800实验室D楼
1159	CAM001163	实验D楼316	ISC6800实验室D楼
1160	CAM001164	实验D楼318-1	ISC6800实验室D楼
1161	CAM001165	实验D楼318-2	ISC6800实验室D楼
1162	CAM001166	实验D楼104	ISC6800实验室D楼
1163	CAM001167	实验D楼320	ISC6800实验室D楼
1164	CAM001168	实验D楼322	ISC6800实验室D楼
1165	CAM001169	实验D楼326	ISC6800实验室D楼
1166	CAM001170	实验D楼328	ISC6800实验室D楼
1167	CAM001171	实验D楼330	ISC6800实验室D楼
1168	CAM001172	实验D楼3F走道1	ISC6800实验室D楼
1169	CAM001173	实验D楼110	ISC6800实验室D楼
1170	CAM001174	实验D楼3F走道2	ISC6800实验室D楼
1171	CAM001175	实验D楼404	ISC6800实验室D楼
1172	CAM001176	实验D楼405	ISC6800实验室D楼
1173	CAM001177	实验D楼406-1	ISC6800实验室D楼
1174	CAM001178	实验D楼406-2	ISC6800实验室D楼
1175	CAM001179	实验D楼407-1	ISC6800实验室D楼
1176	CAM001180	实验D楼407-2	ISC6800实验室D楼
1177	CAM001181	实验D楼408	ISC6800实验室D楼
1178	CAM001182	实验D楼410	ISC6800实验室D楼
1179	CAM001183	实验D楼1F走道2	ISC6800实验室D楼
1180	CAM001184	实验D楼411	ISC6800实验室D楼
1181	CAM001185	实验D楼412	ISC6800实验室D楼
1182	CAM001186	实验D楼413	ISC6800实验室D楼
1183	CAM001187	实验D楼414	ISC6800实验室D楼
1184	CAM001188	实验D楼415-1	ISC6800实验室D楼
1185	CAM001189	实验D楼106	ISC6800实验室D楼
1186	CAM001190	实验D楼415-2	ISC6800实验室D楼
1187	CAM001191	实验D楼422-1	ISC6800实验室D楼
1188	CAM001192	实验D楼420	ISC6800实验室D楼
1189	CAM001193	实验D楼424-1	ISC6800实验室D楼
1190	CAM001194	实验D楼424-2	ISC6800实验室D楼
1191	CAM001195	实验D楼4F走道1	ISC6800实验室D楼
1192	CAM001196	实验D楼4F走道2	ISC6800实验室D楼
1193	CAM001197	实验D楼504-1	ISC6800实验室D楼
1194	CAM001198	实验D楼504-2	ISC6800实验室D楼
1195	CAM001199	实验D楼504-3	ISC6800实验室D楼
1196	CAM001200	实验D楼505-1	ISC6800实验室D楼
1197	CAM001201	实验D楼203	ISC6800实验室D楼
1198	CAM001202	实验D楼505-2	ISC6800实验室D楼
1199	CAM001203	实验D楼505-3	ISC6800实验室D楼
1200	CAM001204	实验D楼506-1	ISC6800实验室D楼
1201	CAM001205	实验D楼506-2	ISC6800实验室D楼
1202	CAM001206	实验D楼506-3	ISC6800实验室D楼
1203	CAM001207	实验D楼507-1	ISC6800实验室D楼
1204	CAM001208	实验D楼507-2	ISC6800实验室D楼
1205	CAM001209	实验D楼108	ISC6800实验室D楼
1206	CAM001210	实验D楼507-3	ISC6800实验室D楼
1207	CAM001211	实验D楼508	ISC6800实验室D楼
1208	CAM001212	实验D楼204	ISC6800实验室D楼
1209	CAM001213	实验D楼510	ISC6800实验室D楼
1210	CAM001214	实验D楼512	ISC6800实验室D楼
1211	CAM001215	实验D楼514	ISC6800实验室D楼
1212	CAM001216	实验D楼516-1	ISC6800实验室D楼
1213	CAM001217	实验D楼516-2	ISC6800实验室D楼
1214	CAM001218	实验D楼516-3	ISC6800实验室D楼
1215	CAM001219	实验D楼518-1	ISC6800实验室D楼
1216	CAM001220	实验D楼518-2	ISC6800实验室D楼
1217	CAM001221	实验楼CD间路口南向	平台摄像机
1218	CAM001222	实验楼CD间路口北向	平台摄像机
1219	CAM001223	实验楼CD间路口东向	平台摄像机
1220	CAM001224	实验楼花坛北向	平台摄像机
1221	CAM001225	化学馆5F走道2	化学馆实验室  2024
1222	CAM001226	化学馆2F走道1	化学馆实验室  2024
1223	CAM001227	化学馆208-210	化学馆实验室  2024
1224	CAM001228	化学馆214-2	化学馆实验室  2024
1225	CAM001229	化学馆216	化学馆实验室  2024
1226	CAM001230	化学馆214-1	化学馆实验室  2024
1227	CAM001231	化学馆218	化学馆实验室  2024
1228	CAM001232	化学馆220	化学馆实验室  2024
1229	CAM001233	化学馆222	化学馆实验室  2024
1230	CAM001234	化学馆238-240	化学馆实验室  2024
1231	CAM001235	化学馆5F走道3	化学馆实验室  2024
1232	CAM001236	化学馆245	化学馆实验室  2024
1233	CAM001237	化学馆247	化学馆实验室  2024
1234	CAM001238	化学馆253	化学馆实验室  2024
1235	CAM001239	化学馆255-1	化学馆实验室  2024
1236	CAM001240	化学馆255-2	化学馆实验室  2024
1237	CAM001241	化学馆261	化学馆实验室  2024
1238	CAM001242	化学馆263	化学馆实验室  2024
1239	CAM001243	化学馆2F走道2	化学馆实验室  2024
1240	CAM001244	化学馆2F走道3	化学馆实验室  2024
1241	CAM001245	化学馆2F走道4	化学馆实验室  2024
1242	CAM001246	化学馆5F走道4	化学馆实验室  2024
1243	CAM001247	化学馆2F走道5	化学馆实验室  2024
1244	CAM001248	化学馆301-303	化学馆实验室  2024
1245	CAM001249	化学馆305-307	化学馆实验室  2024
1246	CAM001250	化学馆308-310	化学馆实验室  2024
1247	CAM001251	化学馆309-311	化学馆实验室  2024
1248	CAM001252	化学馆312	化学馆实验室  2024
1249	CAM001253	化学馆316	化学馆实验室  2024
1250	CAM001254	化学馆318	化学馆实验室  2024
1251	CAM001255	化学馆320	化学馆实验室  2024
1252	CAM001256	化学馆430	化学馆实验室  2024
1253	CAM001257	化学馆342	化学馆实验室  2024
1254	CAM001258	化学馆343-1	化学馆实验室  2024
1255	CAM001259	化学馆343-2	化学馆实验室  2024
1256	CAM001260	化学楼459-461-2	化学馆实验室  2024
1257	CAM001261	化学馆344	化学馆实验室  2024
1258	CAM001262	化学馆345	化学馆实验室  2024
1259	CAM001263	化学馆347	化学馆实验室  2024
1260	CAM001264	化学馆348	化学馆实验室  2024
1261	CAM001265	化学馆350-1	化学馆实验室  2024
1262	CAM001266	化学馆350-2	化学馆实验室  2024
1263	CAM001267	化学楼2楼机房	化学馆实验室  2024
1264	CAM001268	化学馆359	化学馆实验室  2024
1265	CAM001269	化学馆3F走道1	化学馆实验室  2024
1266	CAM001270	化学馆3F走道2	化学馆实验室  2024
1267	CAM001271	化学馆3F走道3	化学馆实验室  2024
1268	CAM001272	化学楼457	化学馆实验室  2024
1269	CAM001273	化学馆3F走道4	化学馆实验室  2024
1270	CAM001274	化学馆401-403	化学馆实验室  2024
1271	CAM001275	化学馆402	化学馆实验室  2024
1272	CAM001276	化学馆404	化学馆实验室  2024
1273	CAM001277	化学馆405	化学馆实验室  2024
1274	CAM001278	化学馆115	化学馆实验室  2024
1275	CAM001279	化学馆407	化学馆实验室  2024
1276	CAM001280	化学馆410-1	化学馆实验室  2024
1277	CAM001281	化学馆410-2	化学馆实验室  2024
1278	CAM001282	化学馆414	化学馆实验室  2024
1279	CAM001283	化学馆110	化学馆实验室  2024
1280	CAM001284	化学馆453	化学馆实验室  2024
1281	CAM001285	化学馆422-1	化学馆实验室  2024
1282	CAM001286	化学馆422-2	化学馆实验室  2024
1283	CAM001287	化学馆445	化学馆实验室  2024
1284	CAM001288	化学馆1F走道1	化学馆实验室  2024
1285	CAM001289	化学馆443-1	化学馆实验室  2024
1286	CAM001290	化学馆448-1	化学馆实验室  2024
1287	CAM001291	化学馆448-2	化学馆实验室  2024
1288	CAM001292	化学馆448-3	化学馆实验室  2024
1289	CAM001293	化学馆4F走道1	化学馆实验室  2024
1290	CAM001294	化学馆112	化学馆实验室  2024
1291	CAM001295	化学馆4F走道2	化学馆实验室  2024
1292	CAM001296	化学馆4F走道3	化学馆实验室  2024
1293	CAM001297	化学馆4F走道4	化学馆实验室  2024
1294	CAM001298	化学馆1F走道3	化学馆实验室  2024
1295	CAM001299	化学馆509	化学馆实验室  2024
1296	CAM001300	化学馆510-1	化学馆实验室  2024
1297	CAM001301	化学馆510-2	化学馆实验室  2024
1298	CAM001302	化学馆511	化学馆实验室  2024
1299	CAM001303	化学馆512-1	化学馆实验室  2024
1300	CAM001304	化学馆512-2	化学馆实验室  2024
1301	CAM001305	化学馆516	化学馆实验室  2024
1302	CAM001306	化学馆114	化学馆实验室  2024
1303	CAM001307	化学馆518	化学馆实验室  2024
1304	CAM001308	化学馆522	化学馆实验室  2024
1305	CAM001309	化学馆1F走道4	化学馆实验室  2024
1306	CAM001310	化学馆543-1	化学馆实验室  2024
1307	CAM001311	化学馆543-2	化学馆实验室  2024
1308	CAM001312	化学馆545-1	化学馆实验室  2024
1309	CAM001313	化学馆545-2	化学馆实验室  2024
1310	CAM001314	化学馆547	化学馆实验室  2024
1311	CAM001315	化学馆549	化学馆实验室  2024
1312	CAM001316	化学馆551	化学馆实验室  2024
1313	CAM001317	化学馆5F走道1	化学馆实验室  2024
1314	CAM001318	实验C群楼新增1	ISC6800实验室C楼
1315	CAM001319	实验C裙楼新增2	ISC6800实验室C楼
1316	CAM001320	实验C裙楼新增3	ISC6800实验室C楼
1317	CAM001321	实验C裙楼新增00	ISC6800实验室C楼
\.


--
-- Data for Name: t_buildings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_buildings (id, name) FROM stdin;
1	物理楼
2	化学楼
3	河口海岸大楼
4	数学楼
5	生科楼
\.


--
-- Data for Name: t_camera_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_camera_info (camera_id, camera_name, camera_status, org_name, id) FROM stdin;
083398197413263802831_1	化学馆1F东大门	1	化学馆实验室  2024	CAM000001
12	实验A楼201-1	1	ISC6800实验室A楼	CAM000002
121	实验A楼122-2	1	2019新增实验A楼	CAM000003
122-1	实验A楼122-1	1	2019新增实验A楼	CAM000004
13	实验A楼201-2	1	ISC6800实验室A楼	CAM000005
13100000001320001202	JK12外细胞间	1	生命科学院实验室	CAM000006
13100000001320001203	JK02亮室	1	生命科学院实验室	CAM000007
13100000001320001204	JK07显微镜室-1	1	生命科学院实验室	CAM000008
13100000001320001205	JK05生化分析室-1	1	生命科学院实验室	CAM000009
13100000001320001206	JK04活细胞工作站	1	生命科学院实验室	CAM000010
13100000001320001207	JK03基因组平台	1	生命科学院实验室	CAM000011
13100000001320001208	JK21储藏室	1	生命科学院实验室	CAM000012
13100000001320001209	JK26过道-2	1	生命科学院实验室	CAM000013
13100000001320001210	JK31内细胞室-2	1	生命科学院实验室	CAM000014
13100000001320001211	JK23样品准备室-3	1	生命科学院实验室	CAM000015
13100000001320001212	JK17病理切片室	1	生命科学院实验室	CAM000016
13100000001320001213	JK14过道-1	1	生命科学院实验室	CAM000017
13100000001320001214	JK28样品准备室-1	1	生命科学院实验室	CAM000018
13100000001320001215	JK01暗室	1	生命科学院实验室	CAM000019
13100000001320001216	JK30生化分析室-4	1	生命科学院实验室	CAM000020
13100000001320001217	JK20准备室	1	生命科学院实验室	CAM000021
13100000001320001218	JK22样品准备室-2	1	生命科学院实验室	CAM000022
13100000001320001219	JK23共聚焦缓冲间	1	生命科学院实验室	CAM000023
13100000001320001220	JK19制氮间	1	生命科学院实验室	CAM000024
13100000001320001221	JK24显微镜室-2	1	生命科学院实验室	CAM000025
13100000001320001222	JK16液相室	1	生命科学院实验室	CAM000026
13100000001320001223	JK29生化分析室-2	1	生命科学院实验室	CAM000027
13100000001320001224	JK15过道-3	1	生命科学院实验室	CAM000028
13100000001320001225	JK11冷库间	1	生命科学院实验室	CAM000029
13100000001320001226	JK06生化分析室-3	1	生命科学院实验室	CAM000030
13100000001320001227	JK18质谱室-1	1	生命科学院实验室	CAM000031
13100000001320001228	JK13流室	1	生命科学院实验室	CAM000032
13100000001320001229	JK10内细胞间-1	1	生命科学院实验室	CAM000033
13100000001320001230	JK08暗室-1	1	生命科学院实验室	CAM000034
13100000001320001231	JK25质谱室-2	1	生命科学院实验室	CAM000035
13100000001320001232	JK27样品准备室-4	1	生命科学院实验室	CAM000036
13100000001320001233	JK32暗室-2	1	生命科学院实验室	CAM000037
137-1	实验A楼137-1	1	2019新增实验A楼	CAM000038
137-2	实验A楼137-2	1	2019新增实验A楼	CAM000039
139-141-1	实验A楼141-1	1	2019新增实验A楼	CAM000040
139-141-2	实验A楼141-2	1	2019新增实验A楼	CAM000041
139-141-3	实验A楼141-3	1	2019新增实验A楼	CAM000042
172-17-188-63	A510-508-1	1	ISC6800河口海岸实验室	CAM000043
172_17_188_147	B109-1	1	ISC6800河口海岸实验室	CAM000044
172_17_188_148	B109-2	1	ISC6800河口海岸实验室	CAM000045
172_17_188_149	B109-3	1	ISC6800河口海岸实验室	CAM000046
172_17_188_150	B104-106-1	1	ISC6800河口海岸实验室	CAM000047
172_17_188_151	B104-106-2	1	ISC6800河口海岸实验室	CAM000048
172_17_188_152	B108-1	1	ISC6800河口海岸实验室	CAM000049
172_17_188_153	B108-2	1	ISC6800河口海岸实验室	CAM000050
172_17_188_154	B113-115-1	1	ISC6800河口海岸实验室	CAM000051
172_17_188_155	B113-115-2	1	ISC6800河口海岸实验室	CAM000052
172_17_188_156	B113-115-3	1	ISC6800河口海岸实验室	CAM000053
172_17_188_157	B110-1	1	ISC6800河口海岸实验室	CAM000054
172_17_188_158	B110-2	1	ISC6800河口海岸实验室	CAM000055
172_17_188_159	B119-1	1	ISC6800河口海岸实验室	CAM000056
172_17_188_16	A111-113-1	1	ISC6800河口海岸实验室	CAM000057
172_17_188_160	B119-2	1	ISC6800河口海岸实验室	CAM000058
172_17_188_161	B125-1	1	ISC6800河口海岸实验室	CAM000059
172_17_188_162	B125-2	1	ISC6800河口海岸实验室	CAM000060
172_17_188_163	B127-1	1	ISC6800河口海岸实验室	CAM000061
172_17_188_164	B127-2	1	ISC6800河口海岸实验室	CAM000062
172_17_188_165	B214-1	1	ISC6800河口海岸实验室	CAM000063
172_17_188_166	B214-2	1	ISC6800河口海岸实验室	CAM000064
172_17_188_167	B111-1	1	ISC6800河口海岸实验室	CAM000065
172_17_188_168	B117	1	ISC6800河口海岸实验室	CAM000066
172_17_188_169	B121-123-1	1	ISC6800河口海岸实验室	CAM000067
172_17_188_17	A111-113-2	1	ISC6800河口海岸实验室	CAM000068
172_17_188_170	B121-123-2	1	ISC6800河口海岸实验室	CAM000069
172_17_188_171	B212-1	1	ISC6800河口海岸实验室	CAM000070
172_17_188_172	B210-1	1	ISC6800河口海岸实验室	CAM000071
172_17_188_173	B210-2	1	ISC6800河口海岸实验室	CAM000072
172_17_188_174	A310	1	ISC6800河口海岸实验室	CAM000073
172_17_188_175	B210-4	1	ISC6800河口海岸实验室	CAM000074
172_17_188_176	B216-1	1	ISC6800河口海岸实验室	CAM000075
172_17_188_177	B520-1	1	ISC6800河口海岸实验室	CAM000076
172_17_188_178	B520-2	1	ISC6800河口海岸实验室	CAM000077
172_17_188_179	D126-2	1	ISC6800河口海岸实验室	CAM000078
172_17_188_18	A111-113-3	1	ISC6800河口海岸实验室	CAM000079
172_17_188_180	B302	1	ISC6800河口海岸实验室	CAM000080
172_17_188_181	D112人工气候室	1	ISC6800河口海岸实验室	CAM000081
172_17_188_182	D132	1	ISC6800河口海岸实验室	CAM000082
172_17_188_183	D120冷库	1	ISC6800河口海岸实验室	CAM000083
172_17_188_184	A504-2	1	ISC6800河口海岸实验室	CAM000084
172_17_188_185	A502-1	1	ISC6800河口海岸实验室	CAM000085
172_17_188_186	A502-2	1	ISC6800河口海岸实验室	CAM000086
172_17_188_19	A111-113-4	1	ISC6800河口海岸实验室	CAM000087
172_17_188_190	B210-3	1	ISC6800河口海岸实验室	CAM000088
172_17_188_191	D126-1	1	ISC6800河口海岸实验室	CAM000089
172_17_188_192	B304-1	1	ISC6800河口海岸实验室	CAM000090
172_17_188_193	D122-1	1	ISC6800河口海岸实验室	CAM000091
172_17_188_194	D122-2	1	ISC6800河口海岸实验室	CAM000092
172_17_188_195	D103-109人工气候室	1	ISC6800河口海岸实验室	CAM000093
172_17_188_196	A504-1	1	ISC6800河口海岸实验室	CAM000094
172_17_188_198	B216-2	1	ISC6800河口海岸实验室	CAM000095
172_17_188_20	A104-108-1	1	ISC6800河口海岸实验室	CAM000096
172_17_188_200	超净实验室1	1	ISC6800河口海岸实验室	CAM000097
172_17_188_202	超净实验室2	1	ISC6800河口海岸实验室	CAM000098
172_17_188_203	超净实验室3	1	ISC6800河口海岸实验室	CAM000099
172_17_188_204	超净实验室4	1	ISC6800河口海岸实验室	CAM000100
172_17_188_205	超净实验室5	1	ISC6800河口海岸实验室	CAM000101
172_17_188_206	超净实验室6	1	ISC6800河口海岸实验室	CAM000102
172_17_188_207	超净实验室7	1	ISC6800河口海岸实验室	CAM000103
172_17_188_208	超净实验室8	1	ISC6800河口海岸实验室	CAM000104
172_17_188_209	超净实验室9	1	ISC6800河口海岸实验室	CAM000105
172_17_188_21	A104-108-2	1	ISC6800河口海岸实验室	CAM000106
172_17_188_210	超净实验室10	1	ISC6800河口海岸实验室	CAM000107
172_17_188_211	超净实验室11	1	ISC6800河口海岸实验室	CAM000108
172_17_188_212	超净实验室12	1	ISC6800河口海岸实验室	CAM000109
172_17_188_22	A104-108-3	1	ISC6800河口海岸实验室	CAM000110
172_17_188_220	A104-108-5	1	ISC6800河口海岸实验室	CAM000111
172_17_188_221	A104-108-6	1	ISC6800河口海岸实验室	CAM000112
172_17_188_222	A104-108-7	1	ISC6800河口海岸实验室	CAM000113
172_17_188_223	A104-108-8	1	ISC6800河口海岸实验室	CAM000114
172_17_188_224	A104-108-9	1	ISC6800河口海岸实验室	CAM000115
172_17_188_225	A104-108-10	1	ISC6800河口海岸实验室	CAM000116
172_17_188_23	A104-108-4	1	ISC6800河口海岸实验室	CAM000117
172_17_188_235	B楼4F厕所走道	1	ISC6800河口海岸实验室	CAM000118
172_17_188_236	B楼4F西楼梯出入口	1	ISC6800河口海岸实验室	CAM000119
172_17_188_237	B楼429-431-1	1	ISC6800河口海岸实验室	CAM000120
172_17_188_238	B楼429-431-2	1	ISC6800河口海岸实验室	CAM000121
172_17_188_24	A117-115-1	1	ISC6800河口海岸实验室	CAM000122
172_17_188_25	A117-115-2	1	ISC6800河口海岸实验室	CAM000123
172_17_188_26	A117-115-3	2	ISC6800河口海岸实验室	CAM000124
172_17_188_27	A119-121-1	1	ISC6800河口海岸实验室	CAM000125
172_17_188_28	A119-121-2	1	ISC6800河口海岸实验室	CAM000126
172_17_188_29	A119-121-3	1	ISC6800河口海岸实验室	CAM000127
172_17_188_30	A125-1	1	ISC6800河口海岸实验室	CAM000128
172_17_188_31	A125-2	1	ISC6800河口海岸实验室	CAM000129
172_17_188_32	A1F显微镜实验室	1	ISC6800河口海岸实验室	CAM000130
172_17_188_33	A1F酸缸间	1	ISC6800河口海岸实验室	CAM000131
172_17_188_34	A216酸缸间	1	ISC6800河口海岸实验室	CAM000132
172_17_188_35	A322水制备室	1	ISC6800河口海岸实验室	CAM000133
172_17_188_36	A320酸缸间	1	ISC6800河口海岸实验室	CAM000134
172_17_188_37	A316-318-1	1	ISC6800河口海岸实验室	CAM000135
172_17_188_38	A316-318-2	1	ISC6800河口海岸实验室	CAM000136
172_17_188_39	A316-318-3	1	ISC6800河口海岸实验室	CAM000137
172_17_188_40	A316-318-4	1	ISC6800河口海岸实验室	CAM000138
172_17_188_41	A314-1	1	ISC6800河口海岸实验室	CAM000139
172_17_188_42	A314-2	1	ISC6800河口海岸实验室	CAM000140
172_17_188_43	A312-1	1	ISC6800河口海岸实验室	CAM000141
172_17_188_44	A312-2	1	ISC6800河口海岸实验室	CAM000142
172_17_188_45	A308-1	1	ISC6800河口海岸实验室	CAM000143
172_17_188_46	A308-2	1	ISC6800河口海岸实验室	CAM000144
172_17_188_47	A308-3	1	ISC6800河口海岸实验室	CAM000145
172_17_188_48	A408-410-1	1	ISC6800河口海岸实验室	CAM000146
172_17_188_49	A408-410-2	1	ISC6800河口海岸实验室	CAM000147
172_17_188_50	A408-410-3	1	ISC6800河口海岸实验室	CAM000148
172_17_188_51	A408-410-4	2	ISC6800河口海岸实验室	CAM000149
172_17_188_52	A412-1	1	ISC6800河口海岸实验室	CAM000150
172_17_188_53	A414-1	2	ISC6800河口海岸实验室	CAM000151
172_17_188_54	A420酸缸间	1	ISC6800河口海岸实验室	CAM000152
172_17_188_55	A422水制备室	1	ISC6800河口海岸实验室	CAM000153
172_17_188_56	A406-1	1	ISC6800河口海岸实验室	CAM000154
172_17_188_57	A406-2	1	ISC6800河口海岸实验室	CAM000155
172_17_188_58	A522-1	1	ISC6800河口海岸实验室	CAM000156
172_17_188_59	A512-514-1	1	ISC6800河口海岸实验室	CAM000157
172_17_188_60	A512-514-2	1	ISC6800河口海岸实验室	CAM000158
172_17_188_61	A512-514-3	1	ISC6800河口海岸实验室	CAM000159
172_17_188_62	A512-514-4	1	ISC6800河口海岸实验室	CAM000160
172_17_188_64	A510-508-2	1	ISC6800河口海岸实验室	CAM000161
172_17_188_65	A510-508-3	1	ISC6800河口海岸实验室	CAM000162
172_17_188_66	A510-508-4	1	ISC6800河口海岸实验室	CAM000163
172_17_250_140	实验A楼259-261-1	1	ISC6800实验室A楼	CAM000164
172_17_250_141	实验A楼259-261-2	1	ISC6800实验室A楼	CAM000165
172_17_250_142	实验A楼255-257-1	1	ISC6800实验室A楼	CAM000166
172_17_250_143	实验A楼255-257-2	1	ISC6800实验室A楼	CAM000167
172_17_250_144	实验A楼354-256	1	ISC6800实验室A楼	CAM000168
172_17_250_145	实验A楼352	1	ISC6800实验室A楼	CAM000169
172_17_250_146	实验A楼135	1	ISC6800实验室A楼	CAM000170
17217188240	河口海岸A楼2F洗手间出入口	1	ISC6800河口海岸实验室	CAM000171
17217188243	河口海岸A楼2F茶水间	1	ISC6800河口海岸实验室	CAM000172
17217188245	河口海岸B楼3F中间通道	1	ISC6800河口海岸实验室	CAM000173
17217188246	河口海岸B楼2F中间通道	1	ISC6800河口海岸实验室	CAM000174
17217188247	河口海岸A楼2F215财务室	1	ISC6800河口海岸实验室	CAM000175
17217247200	化学楼303	1	化学馆实验室  2024	CAM000176
1721724726_1	化学馆240	1	化学馆实验室  2024	CAM000177
205-1	实验A楼205-1	1	ISC6800实验室A楼	CAM000178
205-2	实验A楼205-2	1	ISC6800实验室A楼	CAM000179
207-2	实验A楼209-2	1	ISC6800实验室A楼	CAM000180
209-1	实验A楼209-1	1	ISC6800实验室A楼	CAM000181
210-1	实验A楼210-1	1	ISC6800实验室A楼	CAM000182
210-2	实验A楼210-2	1	ISC6800实验室A楼	CAM000183
213-1	实验A楼213-1	1	ISC6800实验室A楼	CAM000184
213-2	实验A楼213-2	1	ISC6800实验室A楼	CAM000185
213-3	实验A楼213-3	1	ISC6800实验室A楼	CAM000186
217-1	实验A楼217-1	1	ISC6800实验室A楼	CAM000187
217-2	实验A楼217-2	1	ISC6800实验室A楼	CAM000188
217-3	实验A楼217-3	1	ISC6800实验室A楼	CAM000189
23-69-02_1	实验楼花坛东向	1	平台摄像机	CAM000190
241	实验A楼241	1	2019新增实验A楼	CAM000191
303-1	实验A楼303-1	1	ISC6800实验室A楼	CAM000192
303-2	实验A楼303-2	1	ISC6800实验室A楼	CAM000193
31010700111320230008	化学馆B209-2房间	1	化学馆实验室2	CAM000194
31010700111320230010	219-1门口	1	化学馆实验室2	CAM000195
31010700111320230011	化学馆B219-2房间	1	化学馆实验室2	CAM000196
31011000111322250001	114房间-1	1	闵行物理楼实验室	CAM000197
31011000111322250003	116房间-2	1	闵行物理楼实验室	CAM000198
31011000111322250004	118房间	1	闵行物理楼实验室	CAM000199
31011000111322250006	133房间	1	闵行物理楼实验室	CAM000200
31011000111322250011	121房间	1	闵行物理楼实验室	CAM000201
31011000111322250014	142房间	1	闵行物理楼实验室	CAM000202
31011000111322250015	144房间	1	闵行物理楼实验室	CAM000203
31011000111322250016	146房间	1	闵行物理楼实验室	CAM000204
31011000111322250017	148房间	1	闵行物理楼实验室	CAM000205
31011000111322250018	150房间	1	闵行物理楼实验室	CAM000206
31011000111322250019	140房间	1	闵行物理楼实验室	CAM000207
31011000111322250020	物理楼1F120房间	1	闵行物理楼实验室	CAM000208
34000000001320000056	实验C楼群楼212-214-1	1	实验室C楼新增	CAM000209
34000000001320000057	实验C楼群楼212-214-2	1	实验室C楼新增	CAM000210
34000000001320000058	实验C楼群楼212-214-3	1	实验室C楼新增	CAM000211
34000000001320000059	实验C楼群楼212-214-4	1	实验室C楼新增	CAM000212
34000000001320000060	实验C楼群楼204	1	实验室C楼新增	CAM000213
34000000001320000061	实验C楼裙楼207	1	实验室C楼新增	CAM000214
34000000001320000062	实验C楼裙楼201-1	1	实验室C楼新增	CAM000215
34000000001320000063	实验C楼裙楼201-2	1	实验室C楼新增	CAM000216
34000000001320000064	实验CD楼中间通道	1	实验室C楼新增	CAM000217
34000000013200000928	实验D208-210-1	1	实验D楼新增	CAM000218
34000000013200000929	实验D116-118-1	1	实验D楼新增	CAM000219
34000000013200000930	实验D116-118-2	1	实验D楼新增	CAM000220
34000000013200000931	实验D208-210-2	1	实验D楼新增	CAM000221
34000000013200000932	实验D楼418-7	1	实验D楼新增	CAM000222
34000000013200000933	实验D楼418-8	1	实验D楼新增	CAM000223
34000000013200000934	实验D楼418-5	1	实验D楼新增	CAM000224
34000000013200000935	实验D楼418-4	1	实验D楼新增	CAM000225
34000000013200000936	实验D楼418-3	1	实验D楼新增	CAM000226
34000000013200000937	实验D楼418-2	1	实验D楼新增	CAM000227
34000000013200000938	实验D楼418-1	1	实验D楼新增	CAM000228
34000000013200000939	实验D楼418-6	1	实验D楼新增	CAM000229
34000000013200000940	华闵食堂三楼天台-3	1	实验D楼新增	CAM000230
34000000013200000941	华闵食堂三楼天台-2	1	实验D楼新增	CAM000231
34000000013200000942	华闵食堂三楼天台-1	1	实验D楼新增	CAM000232
34000000013200000943	实验A517-2	1	实验D楼新增	CAM000233
34000000013200000944	实验A楼517-1	1	实验D楼新增	CAM000234
34000000013200000945	实验A楼517-3	1	实验D楼新增	CAM000235
34000000013200000946	实验D楼420	1	实验D楼新增	CAM000236
34000000013200000947	实验D楼422-424-1	1	实验D楼新增	CAM000237
34000000013200000948	实验D楼422-424-2	1	实验D楼新增	CAM000238
34000000013200000949	实验D楼422-424-3	1	实验D楼新增	CAM000239
34000000013200000950	实验D楼422-424-4	1	实验D楼新增	CAM000240
34000000013200000951	实验D楼422-424-5	1	实验D楼新增	CAM000241
34000000013200000952	实验D楼422-424-6	1	实验D楼新增	CAM000242
34000000013200001021	实验楼工地东通道	1	实验楼工地	CAM000243
34000000013200001022	生态科学院后通道向北	1	实验楼工地	CAM000244
34000000013200001023	生态科学院后通道向南	1	实验楼工地	CAM000245
34000000013200001024	实验楼工地北通道	1	实验楼工地	CAM000246
34000000013200001025	实验楼西通道向北	1	实验楼工地	CAM000247
34000000013200001026	实验楼南通道向西	1	实验楼工地	CAM000248
34000000013200001027	实验楼工地通道向南	1	实验楼工地	CAM000249
34000000013200001028	实验楼工地食堂边门	1	实验楼工地	CAM000250
34000000013200001029	实验楼工地B楼与C 楼之间	1	实验楼工地	CAM000251
34000000013200001030	校医院书林桥河边西小路	1	实验楼工地	CAM000252
34000000013200004104	动物实验室1F系统外走廊	1	动物实验室旧	CAM000253
34000000013200004105	动物实验室1F洗刷区过道	1	动物实验室旧	CAM000254
34000000013200004109	动物实验室1F大门出入口	1	动物实验室旧	CAM000255
34000000013200004110	动物实验室1F洗刷区外区域	1	动物实验室旧	CAM000256
34000000013200004111	动物实验室1F外厕门	1	动物实验室旧	CAM000257
34000000013200004112	动物实验室1F南通道东照	1	动物实验室旧	CAM000258
34000000013200004113	动物实验室1F南通道西照	1	动物实验室旧	CAM000259
34000000013200004116	动物实验室1F北通道西照	1	动物实验室旧	CAM000260
34000000013200004117	动物实验室1F门厅	1	动物实验室旧	CAM000261
34000000013200004118	动物实验室1F门厅走廊	1	动物实验室旧	CAM000262
34000000013200004961	化学楼210	1	化学楼实验室2024新增	CAM000263
34000000013200004962	化学楼211	1	化学楼实验室2024新增	CAM000264
34000000013200004963	化学楼236	1	化学楼实验室2024新增	CAM000265
34000000013200004964	化学楼232	1	化学楼实验室2024新增	CAM000266
34000000013200004965	化学楼304	1	化学楼实验室2024新增	CAM000267
34000000013200004966	化学楼306	1	化学楼实验室2024新增	CAM000268
34000000013200004967	化学楼314	1	化学楼实验室2024新增	CAM000269
34000000013200004968	化学楼326	1	化学楼实验室2024新增	CAM000270
34000000013200004969	化学楼338	1	化学楼实验室2024新增	CAM000271
34000000013200004970	化学楼346	1	化学楼实验室2024新增	CAM000272
34000000013200004971	化学楼349	1	化学楼实验室2024新增	CAM000273
34000000013200004972	化学楼351	1	化学楼实验室2024新增	CAM000274
34000000013200004973	化学楼314	1	化学楼实验室2024新增	CAM000275
34000000013200004974	化学楼408	1	化学楼实验室2024新增	CAM000276
34000000013200004975	化学楼408-2	1	化学楼实验室2024新增	CAM000277
34000000013200004976	化学楼412	1	化学楼实验室2024新增	CAM000278
34000000013200004977	化学楼413	1	化学楼实验室2024新增	CAM000279
34000000013200004978	化学楼415	1	化学楼实验室2024新增	CAM000280
34000000013200004979	化学楼416	1	化学楼实验室2024新增	CAM000281
34000000013200004980	化学楼420	1	化学楼实验室2024新增	CAM000282
34000000013200004981	化学楼424-1	1	化学楼实验室2024新增	CAM000283
34000000013200004982	化学楼424-2	1	化学楼实验室2024新增	CAM000284
34000000013200004983	化学楼442	1	化学楼实验室2024新增	CAM000285
34000000013200004984	化学楼438	1	化学楼实验室2024新增	CAM000286
34000000013200004985	化学楼444-1	1	化学楼实验室2024新增	CAM000287
34000000013200004986	化学楼444-2	1	化学楼实验室2024新增	CAM000288
34000000013200004987	化学楼451	1	化学楼实验室2024新增	CAM000289
34000000013200004988	化学楼513	1	化学楼实验室2024新增	CAM000290
34000000013200004989	化学楼534	1	化学楼实验室2024新增	CAM000291
34000000013200004990	化学楼203-1	1	化学楼实验室2024新增	CAM000292
34000000013200004991	化学楼203-2	1	化学楼实验室2024新增	CAM000293
34000000013200004992	化学楼226-1	1	化学楼实验室2024新增	CAM000294
34000000013200005301	实验A楼后停车场	1	充电桩2	CAM000295
34000000013200006017	实验D楼后樱桃河人行步道东	1	河道景观2023	CAM000296
34000000013200006018	实验C楼后樱桃河人行步道东-1	1	河道景观2023	CAM000297
34000000013200006019	实验D楼后樱桃河人行步道西	1	河道景观2023	CAM000298
34000000013200006020	实验C楼后樱桃河人行步道东-2	1	河道景观2023	CAM000299
34000000013200006021	实验C楼后樱桃河人行步道东-3	1	河道景观2023	CAM000300
34000000013200006022	实验C楼后樱桃河人行步道西	1	河道景观2023	CAM000301
34000000013200006412	实验D楼2F门厅旁走廊	1	实验D楼	CAM000302
34000000013200006413	实验D楼2F房间走廊东照	1	实验D楼	CAM000303
34000000013200006414	实验D楼2F长走廊西照	1	实验D楼	CAM000304
34000000013200006415	实验D楼4F长走廊东照	1	实验D楼	CAM000305
34000000013200006416	实验D楼2F长走廊东照	1	实验D楼	CAM000306
34000000013200006417	实验D楼4F门厅旁走廊	1	实验D楼	CAM000307
34000000013200006418	实验D楼1F117走廊东照	1	实验D楼	CAM000308
34000000013200006419	实验D楼1F房间124消防通道	1	实验D楼	CAM000309
34000000013200006420	实验D楼5F长走廊西照	1	实验D楼	CAM000310
34000000013200006421	实验D楼5F长走廊东照	1	实验D楼	CAM000311
34000000013200006422	实验D楼4F房间417走廊东照	1	实验D楼	CAM000312
34000000013200006423	实验D楼1F大门门厅全景	1	实验D楼	CAM000313
34000000013200006424	实验D楼5F电梯旁主消防通道	1	实验D楼	CAM000314
34000000013200006425	实验D楼1F侧电梯和侧门	1	实验D楼	CAM000315
34000000013200006426	实验D楼3F长走廊西照	1	实验D楼	CAM000316
34000000013200006427	实验D楼4F长走廊西照	1	实验D楼	CAM000317
34000000013200006428	实验D楼5F电梯旁侧消防通道	1	实验D楼	CAM000318
34000000013200006429	实验D楼5F房间507东照	1	实验D楼	CAM000319
34000000013200006430	实验D楼3F长走廊东照	1	实验D楼	CAM000320
34000000013200006431	实验D楼1F侧消防通道	1	实验D楼	CAM000321
34000000013200006432	实验D楼3F317走廊东照	1	实验D楼	CAM000322
34000000013200006433	实验D楼3F门厅旁走廊	1	实验D楼	CAM000323
34000000013200006434	实验D楼1F大门门厅	1	实验D楼	CAM000324
34000000013200006435	实验D楼1F大厅	1	实验D楼	CAM000325
34000000013200009541	化学楼药品室通道1	1	实验D楼药品室	CAM000326
34000000013200009542	化学楼药品室通道4	1	实验D楼药品室	CAM000327
34000000013200009543	化学楼药品室通道进口	1	实验D楼药品室	CAM000328
34000000013200009544	化学楼药品室通道3	1	实验D楼药品室	CAM000329
34000000013200009545	化学楼药品室通道2	1	实验D楼药品室	CAM000330
34000000013200009641	实验D楼前机动车充电桩	1	充电桩	CAM000331
34000000013200098590	通用实验室2-1-1	1	物理楼裙楼实验室	CAM000332
34000000013200098591	通风实验室2-1-2	1	物理楼裙楼实验室	CAM000333
34000000013200098592	通用实验室2-4-1	1	物理楼裙楼实验室	CAM000334
34000000013200098593	通用实验室2-4-2	1	物理楼裙楼实验室	CAM000335
34000000013200098594	通用实验室走廊东照	1	物理楼裙楼实验室	CAM000336
34000000013200098595	通用实验室走廊西照	1	物理楼裙楼实验室	CAM000337
34000000013200098596	通用实验室1-3-1	1	物理楼裙楼实验室	CAM000338
34000000013200098597	通用实验室1-3-2	1	物理楼裙楼实验室	CAM000339
34000000013200098598	通用实验室1-3-3	1	物理楼裙楼实验室	CAM000340
34000000013200098599	通用实验室1-2	1	物理楼裙楼实验室	CAM000341
34000000013200098600	通风实验室1-1	1	物理楼裙楼实验室	CAM000342
34000000013200098601	 通风实验室2-3-1	1	物理楼裙楼实验室	CAM000343
34000000013200098602	通风实验室2-3-2	1	物理楼裙楼实验室	CAM000344
34000000013200098603	通风实验室2-2-1	1	物理楼裙楼实验室	CAM000345
34000000013200098604	通风实验室2-2-2	1	物理楼裙楼实验室	CAM000346
34000000013200098605	通用实验室2-5-1	1	物理楼裙楼实验室	CAM000347
34000000013200098606	通用实验室2-5-2	1	物理楼裙楼实验室	CAM000348
34000000013200098607	万级超净实验室1	1	物理楼裙楼实验室	CAM000349
34000000013200098608	万级超净实验室2	1	物理楼裙楼实验室	CAM000350
34000000013200098609	微纳制备及表征实验室-1	1	物理楼裙楼实验室	CAM000351
34000000013200098610	微纳制备及表征实验室-2	1	物理楼裙楼实验室	CAM000352
34000000013200098611	微纳制备及表征实验室-3	1	物理楼裙楼实验室	CAM000353
34000000013200098612	光刻实验室	1	物理楼裙楼实验室	CAM000354
34000000013200098613	更衣室	1	物理楼裙楼实验室	CAM000355
34000000013200098614	微纳米实验室1	1	物理楼裙楼实验室	CAM000356
34000000013200098615	微纳米实验室2	1	物理楼裙楼实验室	CAM000357
34000000013200098616	微纳米实验室3	1	物理楼裙楼实验室	CAM000358
34000000013200098617	微纳米实验室4	1	物理楼裙楼实验室	CAM000359
34000000013200098618	微纳米实验室5	1	物理楼裙楼实验室	CAM000360
34000000013200098619	微纳米实验室6	1	物理楼裙楼实验室	CAM000361
34000000013200098620	微纳米实验室7	1	物理楼裙楼实验室	CAM000362
34000000013200100021	实验A楼主楼电梯	1	校区新增电梯2023	CAM000363
34000000013200100022	实验A楼裙楼电梯	2	校区新增电梯2023	CAM000364
34000000013200100023	实验B楼主楼电梯	1	校区新增电梯2023	CAM000365
34000000013200100024	实验B楼裙楼电梯	1	校区新增电梯2023	CAM000366
34000000013200100025	实验C裙楼电梯	1	校区新增电梯2023	CAM000367
34000000013200100028	实验C楼主楼电梯	1	校区新增电梯2023	CAM000368
34000000013200100029	实验D楼电梯	1	校区新增电梯2023	CAM000369
34020000001320019002	光学楼B103普通实验室1	1	光学大楼	CAM000370
34020000001320019003	光学楼D128超静实验室	1	光学大楼	CAM000371
34020000001320019007	光学楼A113普通实验室	1	光学大楼	CAM000372
34020000001320019012	光学楼A510电子实验室1	1	光学大楼	CAM000373
34020000001320019013	光学楼A510电子实验室2	1	光学大楼	CAM000374
34020000001320019014	IPC光学楼A531电子实验室1	1	光学大楼	CAM000375
34020000001320019015	光学楼A531电子实验室2	1	光学大楼	CAM000376
34020000001320019016	光学楼A529普通实验室1	1	光学大楼	CAM000377
34020000001320019017	光学楼A514高温实验室	1	光学大楼	CAM000378
34020000001320019018	光学楼A516高温实验室	1	光学大楼	CAM000379
34020000001320177001	B区  3F-西污物走廊（南北向）-JK-23	1	SPF动物实验中心-1	CAM000380
34020000001320177002	B区  3F-中污物走廊（东西向）-1-JK-36	1	SPF动物实验中心-1	CAM000381
34020000001320177003	B区  3F-中污物走廊（东西向）-2-JK-41	1	SPF动物实验中心-1	CAM000382
34020000001320177004	B区  3F-东南走道（南北向）-JK-52	1	SPF动物实验中心-1	CAM000383
34020000001320177005	B区  3F-A-B区进出口（东侧）-JK-53	1	SPF动物实验中心-1	CAM000384
34020000001320177006	B区  3F-南混合走廊（东西向）-1-JK-68	1	SPF动物实验中心-1	CAM000385
34020000001320177007	B区  3F-中混合走廊（东西向）-1-JK-70	1	SPF动物实验中心-1	CAM000386
34020000001320177008	B区  3F-中混合走廊（东西向）-2-JK-74	1	SPF动物实验中心-1	CAM000387
34020000001320177009	B区  3F-南混合走廊（东西向）-2-JK-76	1	SPF动物实验中心-1	CAM000388
34020000001320177010	B区  3F-西南走道（南北向）-JK-85	1	SPF动物实验中心-1	CAM000389
34020000001320177011	B区  3F-A-B区进出口（西侧）-JK-86	1	SPF动物实验中心-1	CAM000390
34020000001320177012	B区  3FA-夹层电梯厅-JK-01	1	SPF动物实验中心-1	CAM000391
34020000001320177013	B区  3FA-夹层楼梯-2（东侧）-JK-02	1	SPF动物实验中心-1	CAM000392
34020000001320177014	B区  3FA-夹层楼梯-1（西侧）-JK-03	1	SPF动物实验中心-1	CAM000393
34020000001320177015	B区  3FA-夹层楼梯-3（西侧）-JK-04	1	SPF动物实验中心-1	CAM000394
34020000001320177016	A区  3FA-进出走道区域-1-JK-06	1	SPF动物实验中心-1	CAM000395
34020000001320177017	A区  3FA -进出走道区域-2-JK-12	1	SPF动物实验中心-1	CAM000396
34020000001320177018	A区  3FA-进出走道区域-3-JK-13	1	SPF动物实验中心-1	CAM000397
34020000001320177019	B区  4F-楼梯-2（东侧）-JK-03	1	SPF动物实验中心-1	CAM000398
34020000001320177020	B区  4F-公共走道-1（南北向）-JK-04	1	SPF动物实验中心-1	CAM000399
34020000001320177021	B区  4F-楼梯-1（西侧）-JK-05	1	SPF动物实验中心-1	CAM000400
34020000001320177022	A区  4F-楼梯-3（西侧）-JK-10	1	SPF动物实验中心-1	CAM000401
34020000001320177023	A区  4F-公共走道-2（东西向）-JK-11	1	SPF动物实验中心-1	CAM000402
34020000001320177024	A区  4F-进出走道区域-1-JK-17	1	SPF动物实验中心-1	CAM000403
34020000001320177025	A区  4F-进出走道区域-2-JK-18	1	SPF动物实验中心-1	CAM000404
34020000001320177026	A区 4F-公共走道-3（南北向）-JK-20	1	SPF动物实验中心-1	CAM000405
34020000001320177027	A区  4F-公共走道-4（东西向）-JK-21	1	SPF动物实验中心-1	CAM000406
34020000001320177028	西侧大门进出区域-1	1	SPF动物实验中心-1	CAM000407
34020000001320177029	西侧大门进出区域-1	1	SPF动物实验中心-1	CAM000408
34020000001320177030	西侧大门进出区域-2	1	SPF动物实验中心-1	CAM000409
34020000001320177031	西侧大门进出区域-2	1	SPF动物实验中心-1	CAM000410
34020000001320178001	B区  B1F-D109清洗区-1-JK-03	1	SPF动物实验中心-2	CAM000411
34020000001320178002	B区  B1F-D109清洗区-2-JK-04	1	SPF动物实验中心-2	CAM000412
34020000001320178003	B区  B1F-D109清洗区-3-JK-07	1	SPF动物实验中心-2	CAM000413
34020000001320178004	B区  B1F-D109清洗区-4-JK-08	1	SPF动物实验中心-2	CAM000414
34020000001320178005	B区  1F-B107隔离检疫室-1-JK-01	1	SPF动物实验中心-2	CAM000415
34020000001320178006	B区  1F-B107隔离检疫室-2-JK-02	1	SPF动物实验中心-2	CAM000416
34020000001320178007	B区  1F-B110实验室-1-JK-05	1	SPF动物实验中心-2	CAM000417
34020000001320178008	B区  1F-B111大鼠待净化室-1-JK-07	1	SPF动物实验中心-2	CAM000418
34020000001320178009	B区  1F-B111大鼠待净化室-2-JK-08	1	SPF动物实验中心-2	CAM000419
34020000001320178010	B区  1F-B110实验室-2-JK-10	1	SPF动物实验中心-2	CAM000420
34020000001320178011	B区  1F-B113内准备室-JK-11	1	SPF动物实验中心-2	CAM000421
34020000001320178012	B区  1F-B112小鼠待净化室-1-JK-12	1	SPF动物实验中心-2	CAM000422
34020000001320178013	B区 1F-B112小鼠待净化室-2-JK-13	1	SPF动物实验中心-2	CAM000423
34020000001320178014	B区  1F-B107隔离检疫室-3-JK-14	1	SPF动物实验中心-2	CAM000424
34020000001320178015	B区  1F-B107隔离检疫室-4-JK-15	1	SPF动物实验中心-2	CAM000425
34020000001320178016	B区  1F-清洗区外准备-1-JK-22	1	SPF动物实验中心-2	CAM000426
34020000001320178017	B区  1F-B118饲养室2-1-JK-24	1	SPF动物实验中心-2	CAM000427
34020000001320178018	B区  1F-B118饲养室2-2-JK-25	1	SPF动物实验中心-2	CAM000428
34020000001320178019	B区  1F-B118饲养室2-3-JK-26	1	SPF动物实验中心-2	CAM000429
34020000001320178020	B区  1F-B119饲养室1-1-JK-27	1	SPF动物实验中心-2	CAM000430
34020000001320178021	B区  1F-B119饲养室1-2-JK-28	1	SPF动物实验中心-2	CAM000431
34020000001320178022	B区  1F-B115-117无菌鼠检疫室-JK-29	1	SPF动物实验中心-2	CAM000432
34020000001320178023	B区  1F-B119饲养室1-3-JK-31	1	SPF动物实验中心-2	CAM000433
34020000001320178024	B区  1F-B130洗消间-1-JK-33	1	SPF动物实验中心-2	CAM000434
34020000001320178025	B区  1F-B122-1解剖室-1-JK-34	1	SPF动物实验中心-2	CAM000435
34020000001320178026	B区  1F-B126-128检疫室-1-JK-35	1	SPF动物实验中心-2	CAM000436
34020000001320178027	B区  1F-动物接收区域-JK-36	1	SPF动物实验中心-2	CAM000437
34020000001320178028	B区  1F-B124检疫室-1-JK-37	1	SPF动物实验中心-2	CAM000438
34020000001320178029	B区  1F-B122-1解剖室-2-JK-38	1	SPF动物实验中心-2	CAM000439
34020000001320178030	西侧大门进出区域-2	1	SPF动物实验中心-2	CAM000440
34020000001320178031	西侧大门进出区域-2	1	SPF动物实验中心-2	CAM000441
34020000001320179001	B区  1F-B124检疫室-2-JK-42	1	SPF动物实验中心-3	CAM000442
34020000001320179002	B区  1F-B123手术室-1-JK-43	1	SPF动物实验中心-3	CAM000443
34020000001320179003	B区  1F-B126-128检疫室-2-JK-44	1	SPF动物实验中心-3	CAM000444
34020000001320179004	B区  1F-B130洗消间-2-JK-47	1	SPF动物实验中心-3	CAM000445
34020000001320179005	B区  1F-B132-1兔饲养室-1-JK-48	1	SPF动物实验中心-3	CAM000446
34020000001320179006	B区  1F-B125大动物实验室-1-JK-49	1	SPF动物实验中心-3	CAM000447
34020000001320179007	B区  1F-B127大动物实验室-1-JK-50	1	SPF动物实验中心-3	CAM000448
34020000001320179008	B区  1F-B125大动物实验室-2-JK-51	1	SPF动物实验中心-3	CAM000449
34020000001320179009	B区  1F-B123手术室-2-JK-52	1	SPF动物实验中心-3	CAM000450
34020000001320179010	A区  1F-A101培训室-1-JK-60	1	SPF动物实验中心-3	CAM000451
34020000001320179011	A区  1F-A101培训室-2-JK-64	1	SPF动物实验中心-3	CAM000452
34020000001320179012	A区  1F-B131饲料间-1-JK-66	1	SPF动物实验中心-3	CAM000453
34020000001320179013	A区  1F-B129大动物实验室-1-JK-67	1	SPF动物实验中心-3	CAM000454
34020000001320179014	A区  1F-B127大动物实验室-2-JK-68	1	SPF动物实验中心-3	CAM000455
34020000001320179015	A区  1F-B129大动物实验室-2-JK-69	1	SPF动物实验中心-3	CAM000456
34020000001320179016	A区  1F-B131饲料间-2-JK-70	1	SPF动物实验中心-3	CAM000457
34020000001320179017	A区  1F-B132-2兔饲养室-1-JK-73	1	SPF动物实验中心-3	CAM000458
34020000001320179018	A区  1F-B132-1兔饲养室-2-JK-74	1	SPF动物实验中心-3	CAM000459
34020000001320179019	A区  1F-B132-2兔饲养室-2-JK-75	1	SPF动物实验中心-3	CAM000460
34020000001320179020	A区  1F-清洗区外准备-2-JK-82	1	SPF动物实验中心-3	CAM000461
34020000001320179021	B区  2F-外准备区域-1-JK-02	1	SPF动物实验中心-3	CAM000462
34020000001320179022	B区  2F-B209观察适应室-JK-05	1	SPF动物实验中心-3	CAM000463
34020000001320179023	B区  2F-缓冲区域-JK-06	1	SPF动物实验中心-3	CAM000464
34020000001320179024	B区  2F-B208洁净物品库-JK-08	1	SPF动物实验中心-3	CAM000465
34020000001320179025	B区  2F-B208-1内准备室-1-JK-09	1	SPF动物实验中心-3	CAM000466
34020000001320179026	B区  2F-B207实验室-1-JK-11	1	SPF动物实验中心-3	CAM000467
34020000001320179027	B区  2F-B208-1内准备室-2-JK-12	1	SPF动物实验中心-3	CAM000468
34020000001320179028	B区 2F-B205兽医室-JK-13	1	SPF动物实验中心-3	CAM000469
34020000001320179029	B区  2F-外准备区域-2-JK-15	1	SPF动物实验中心-3	CAM000470
34020000001320180001	B区  2F-B207实验室-2-JK-18	1	SPF动物实验中心-4	CAM000471
34020000001320180002	B区  2F-B206解剖室-1-JK-19	1	SPF动物实验中心-4	CAM000472
34020000001320180003	B区  2F-B206解剖室-2-JK-20	1	SPF动物实验中心-4	CAM000473
34020000001320180004	B区  2F-B213-2饲养室8-JK-22	1	SPF动物实验中心-4	CAM000474
34020000001320180005	B区  2F-B213-1饲养室7-JK-23	1	SPF动物实验中心-4	CAM000475
34020000001320180006	B区  2F-B213饲养室-JK-24	1	SPF动物实验中心-4	CAM000476
34020000001320180007	B区  2F- B212-2饲养室6-1-JK-25	1	SPF动物实验中心-4	CAM000477
34020000001320180008	B区  2F-B212-2饲养室6-2-JK-26	1	SPF动物实验中心-4	CAM000478
34020000001320180009	B区  2F-B212-1饲养室5-JK-30	1	SPF动物实验中心-4	CAM000479
34020000001320180010	B区  2F-B212饲养室-JK-31	1	SPF动物实验中心-4	CAM000480
34020000001320180011	B区  2F-B211-2饲养室-1-JK-32	1	SPF动物实验中心-4	CAM000481
34020000001320180012	B区  2F-B211-2饲养室-2-JK-33	1	SPF动物实验中心-4	CAM000482
34020000001320180013	B区  2F-B211-1饲养室3-JK-35	1	SPF动物实验中心-4	CAM000483
34020000001320180014	B区  2F-B211饲养室-JK-36	1	SPF动物实验中心-4	CAM000484
34020000001320180015	B区  2F-B210-2饲养室2-JK-37	1	SPF动物实验中心-4	CAM000485
34020000001320180016	B区  2F-B210-1饲养室1-JK-38	1	SPF动物实验中心-4	CAM000486
34020000001320180017	B区  2F-B210饲养室-JK-39	1	SPF动物实验中心-4	CAM000487
34020000001320180018	B区  2F- B214代谢室-1-JK-40	1	SPF动物实验中心-4	CAM000488
34020000001320180019	B区  2F-B216小动物核磁成像室-1-JK-41	1	SPF动物实验中心-4	CAM000489
34020000001320180020	B区  2F-B214代谢室-2-JK-42	1	SPF动物实验中心-4	CAM000490
34020000001320180021	B区  2F-B216小动物核磁成像室-2-JK-43	1	SPF动物实验中心-4	CAM000491
34020000001320180022	B区  2F-B218室-1-JK-44	1	SPF动物实验中心-4	CAM000492
34020000001320180023	B区  2F-B218室-2-JK-45	1	SPF动物实验中心-4	CAM000493
34020000001320180024	B区  2F-B220小动物超声成像室-1-JK-46	1	SPF动物实验中心-4	CAM000494
34020000001320180025	B区  2F-B220小动物超声成像室-2-JK-48	1	SPF动物实验中心-4	CAM000495
34020000001320180026	B区  2F-B222实验室一-1-JK-49	1	SPF动物实验中心-4	CAM000496
34020000001320180027	B区  2F-B222实验室一-2-JK-50	1	SPF动物实验中心-4	CAM000497
34020000001320180028	B区  2F-B224小动物活体间-1-JK-52	1	SPF动物实验中心-4	CAM000498
34020000001320180029	B区  2F-B226小动物辐照仪-1-JK-53	1	SPF动物实验中心-4	CAM000499
34020000001320181001	B区  2F-B224小动物活体间-2-JK-54	1	SPF动物实验中心-5	CAM000500
34020000001320181002	B区  2F-B226小动物辐照仪-2-JK-55	1	SPF动物实验中心-5	CAM000501
34020000001320181003	B区  2F-B228小动物水迷宫-1-JK-56	1	SPF动物实验中心-5	CAM000502
34020000001320181004	B区  2F-B228小动物水迷宫-2-JK-57	1	SPF动物实验中心-5	CAM000503
34020000001320181005	B区  2F-B229室-1-JK-58	1	SPF动物实验中心-5	CAM000504
34020000001320181006	B区  2F-B229室-2-JK-61	1	SPF动物实验中心-5	CAM000505
34020000001320181007	B区  2F-B227室-1-JK-62	1	SPF动物实验中心-5	CAM000506
34020000001320181008	B区  2F-B227室-2-JK-63	1	SPF动物实验中心-5	CAM000507
34020000001320181009	B区  2F-B232-2饲养室14-JK-64	1	SPF动物实验中心-5	CAM000508
34020000001320181010	B区  2F-B225小动物活体成像-1-JK-65	1	SPF动物实验中心-5	CAM000509
34020000001320181011	B区  2F-B225小动物活体成像-2-JK-66	1	SPF动物实验中心-5	CAM000510
34020000001320181012	B区  2F-B232-1饲养室13-JK-67	1	SPF动物实验中心-5	CAM000511
34020000001320181013	B区  2F-B223实验室三-1-JK-69	1	SPF动物实验中心-5	CAM000512
34020000001320181014	B区  2F-B223实验室三-2-JK-70	1	SPF动物实验中心-5	CAM000513
34020000001320181015	B区  2F-B231-2饲养室12-JK-71	1	SPF动物实验中心-5	CAM000514
34020000001320181016	B区  2F-B221实验室二-1-JK-72	1	SPF动物实验中心-5	CAM000515
34020000001320181017	B区  2F-B231-1饲养室11-JK-74	1	SPF动物实验中心-5	CAM000516
34020000001320181018	B区  2F-B221实验室二-2-JK-75	1	SPF动物实验中心-5	CAM000517
34020000001320181019	B区  2F-B219室-1-JK-76	1	SPF动物实验中心-5	CAM000518
34020000001320181020	B区  2F-B230-2饲养室10-JK-77	1	SPF动物实验中心-5	CAM000519
34020000001320181021	B区  2F-B219室-2-JK-78	1	SPF动物实验中心-5	CAM000520
34020000001320181022	B区  2F-B217 PET-CT室-1-JK-79	1	SPF动物实验中心-5	CAM000521
34020000001320181023	B区  2F-B217 PET-CT室-2-JK-80	1	SPF动物实验中心-5	CAM000522
34020000001320181024	B区  2F-B215温控室-1-JK-81	1	SPF动物实验中心-5	CAM000523
34020000001320181025	B区  2F-B215温控室-2-JK-82	1	SPF动物实验中心-5	CAM000524
34020000001320181026	B区  2F-B230-1室-1-JK-84	1	SPF动物实验中心-5	CAM000525
34020000001320181027	B区   2F-B230-1室-2-JK-85	1	SPF动物实验中心-5	CAM000526
34020000001320181028	A区  2F-A202细胞室一-JK-90	1	SPF动物实验中心-5	CAM000527
34020000001320181029	A区  2F-A204细胞室二-JK-91	1	SPF动物实验中心-5	CAM000528
34020000001320182001	A区  2F-A205-207仪器区域-1-JK-92	1	SPF动物实验中心-6	CAM000529
34020000001320182002	A区  2F-A205-207仪器区域-2-JK-93	1	SPF动物实验中心-6	CAM000530
34020000001320182003	A区  2F-A205-207仪器区域-2-JK-95	1	SPF动物实验中心-6	CAM000531
34020000001320182004	A区  2F-A205-207仪器区域-4-JK-97	1	SPF动物实验中心-6	CAM000532
34020000001320182005	B区  2FA-A305-307仪器区域-1-JK-05	1	SPF动物实验中心-6	CAM000533
34020000001320182006	A区  2FA-A305-307仪器区域-2-JK-07	1	SPF动物实验中心-6	CAM000534
34020000001320182007	A区  2FA-A305-307仪器区域-3-JK-08	1	SPF动物实验中心-6	CAM000535
34020000001320182008	A区  2FA-A305-307仪器区域-4-JK-09	1	SPF动物实验中心-6	CAM000536
34020000001320182009	A区  2FA-A304细胞室-JK-10	1	SPF动物实验中心-6	CAM000537
34020000001320182010	A区  2FA-A302细胞室-JK-11	1	SPF动物实验中心-6	CAM000538
34020000001320182011	B区  3F-B309观察适应室-JK-02	1	SPF动物实验中心-6	CAM000539
34020000001320182012	B区  3F-B309-1物品接受室-JK-03	1	SPF动物实验中心-6	CAM000540
34020000001320182013	B区  3F-外准备区域-1-JK-05	1	SPF动物实验中心-6	CAM000541
34020000001320182014	B区  3F -B308-1内准备室-1-JK-08	1	SPF动物实验中心-6	CAM000542
34020000001320182015	B区  3F-B308洁净物品库-JK-09	1	SPF动物实验中心-6	CAM000543
34020000001320182016	B区  3F-B307显微移植室-JK-12	1	SPF动物实验中心-6	CAM000544
34020000001320182017	B区  3F-外准备区域-2-JK-13	1	SPF动物实验中心-6	CAM000545
34020000001320182018	B区  3F-B308-1内准备室-2-JK-17	1	SPF动物实验中心-6	CAM000546
34020000001320182019	B区  3F-B304显微注射室-1-JK-19	1	SPF动物实验中心-6	CAM000547
34020000001320182020	B区  3F-B304显微注射室-2-JK-20	1	SPF动物实验中心-6	CAM000548
34020000001320182021	B区  3F-B306动物打包室-JK-21	1	SPF动物实验中心-6	CAM000549
34020000001320182022	B区  3F-B305动物发放室-JK-22	1	SPF动物实验中心-6	CAM000550
34020000001320182023	B区  3F-B314饲养室5-1-JK-24	1	SPF动物实验中心-6	CAM000551
34020000001320182024	B区  3F-B314饲养室5-2-JK-25	1	SPF动物实验中心-6	CAM000552
34020000001320182025	B区  3F-B317-3饲养室14-1-JK-26	1	SPF动物实验中心-6	CAM000553
34020000001320182026	B区  3F-B317-3饲养室14-2-JK-27	1	SPF动物实验中心-6	CAM000554
34020000001320182027	B区  3F-B317-2饲养室13-JK-28	1	SPF动物实验中心-6	CAM000555
34020000001320182028	B区  3F-B314饲养室5-3-JK-29	1	SPF动物实验中心-6	CAM000556
34020000001320182029	B区  3F-B313饲养室4-1-JK-30	1	SPF动物实验中心-6	CAM000557
34020000001320183001	B区  3F-B317-1饲养室12-JK-31	1	SPF动物实验中心-7	CAM000558
34020000001320183002	B区  3F-B317饲养室-JK-32	1	SPF动物实验中心-7	CAM000559
34020000001320183003	B区  3F-B316饲养室-JK-33	1	SPF动物实验中心-7	CAM000560
34020000001320183004	B区  3F-B316-3饲养室11-JK-34	1	SPF动物实验中心-7	CAM000561
34020000001320183005	B区  3F-B313饲养室4-2-JK-35	1	SPF动物实验中心-7	CAM000562
34020000001320183006	B区  3F-B313饲养室4-3-JK-37	1	SPF动物实验中心-7	CAM000563
34020000001320183007	B区  3F-B312饲养室3-1-JK-38	1	SPF动物实验中心-7	CAM000564
34020000001320183008	B区  3F-B316-2饲养室10-JK-39	1	SPF动物实验中心-7	CAM000565
34020000001320183009	B区  3F-B312饲养室3-2-JK-40	1	SPF动物实验中心-7	CAM000566
34020000001320183010	B区  3F-B312饲养室3-3-JK-42	1	SPF动物实验中心-7	CAM000567
34020000001320183011	B区  3F-B316-1饲养室9-JK-43	1	SPF动物实验中心-7	CAM000568
34020000001320183012	B区  3F-B315饲养室-JK-44	1	SPF动物实验中心-7	CAM000569
34020000001320183013	B区  3F-B315-3饲养室8-JK-45	1	SPF动物实验中心-7	CAM000570
34020000001320183014	B区  3F-B311饲养室2-1-JK-46	1	SPF动物实验中心-7	CAM000571
34020000001320183015	B区  3F-B311饲养室2-2-JK-47	1	SPF动物实验中心-7	CAM000572
34020000001320183016	B区  3F-B315-2饲养室7-JK-48	1	SPF动物实验中心-7	CAM000573
34020000001320183017	B区  3F-B311饲养室2-3-JK-49	1	SPF动物实验中心-7	CAM000574
34020000001320183018	B区  3F-B315-1饲养室6-1-JK-50	1	SPF动物实验中心-7	CAM000575
34020000001320183019	B区  3F-B315-1饲养室6-2-JK-51	1	SPF动物实验中心-7	CAM000576
34020000001320183020	B区  3F-B318-1饲养室15-1-JK-54	1	SPF动物实验中心-7	CAM000577
34020000001320183021	B区  3F-B318-1饲养室15-2-JK-56	1	SPF动物实验中心-7	CAM000578
34020000001320183022	B区  3F-B318饲养室-JK-57	1	SPF动物实验中心-7	CAM000579
34020000001320183023	B区  3F-B318-2饲养室16-1-JK-58	1	SPF动物实验中心-7	CAM000580
34020000001320183024	B区  3F-B318-2饲养室16-2-JK-59	1	SPF动物实验中心-7	CAM000581
34020000001320183025	B区  3F-B320-1饲养室19-1-JK-61	1	SPF动物实验中心-7	CAM000582
34020000001320183026	B区  3F-B320-1饲养室19-2-JK-62	1	SPF动物实验中心-7	CAM000583
34020000001320183027	B区  3F-B320-2饲养室20-JK-63	1	SPF动物实验中心-7	CAM000584
34020000001320183028	B区  3F-B320-3饲养室21-JK-64	1	SPF动物实验中心-7	CAM000585
34020000001320183029	B区  3F-B320饲养室-JK-65	1	SPF动物实验中心-7	CAM000586
34020000001320184001	B区  3F-B321饲养室-JK-66	1	SPF动物实验中心-8	CAM000587
34020000001320184002	B区  3F-B321-1饲养室22-JK-67	1	SPF动物实验中心-8	CAM000588
34020000001320184003	B区  3F-B319-1饲养室17-1-JK-71	1	SPF动物实验中心-8	CAM000589
34020000001320184004	B区  3F-B319-1饲养室17-2-JK-72	1	SPF动物实验中心-8	CAM000590
34020000001320184005	B区  3F-B321-2饲养室23-JK-77	1	SPF动物实验中心-8	CAM000591
34020000001320184006	B区  3F-B321-3饲养室24-1-JK-78	1	SPF动物实验中心-8	CAM000592
34020000001320184007	B区  3F-B321-3饲养室24-2-JK-79	1	SPF动物实验中心-8	CAM000593
34020000001320184008	B区  3F-B319饲养室-JK-80	1	SPF动物实验中心-8	CAM000594
34020000001320184009	B区  3F-B19-2饲养室18-1-JK-81	1	SPF动物实验中心-8	CAM000595
34020000001320184012	B区   3F-B19-2饲养室18-2-JK-84	1	SPF动物实验中心-8	CAM000596
34020000001320184013	B区   3F-B310饲养室1-JK-87	1	SPF动物实验中心-8	CAM000597
34020000001320184014	A区3FA-A405-407实验区域1-JK-05	1	SPF动物实验中心-8	CAM000598
34020000001320184015	A区3FA-A405-407实验区域2-JK-07	1	SPF动物实验中心-8	CAM000599
34020000001320184016	A区3FA-A405-407实验区域3-JK-08	1	SPF动物实验中心-8	CAM000600
34020000001320184017	A区3FA-A405-407实验区域4-JK-09	1	SPF动物实验中心-8	CAM000601
34020000001320184018	A区  3FA-A404细胞室-JK-10	1	SPF动物实验中心-8	CAM000602
34020000001320184019	A区  3FA-A402细胞室-JK-11	1	SPF动物实验中心-8	CAM000603
34020000001320184020	A区  4F-B402-1细胞室-JK-12	1	SPF动物实验中心-8	CAM000604
34020000001320184021	A区  4F-B403细胞室-JK-13	1	SPF动物实验中心-8	CAM000605
34020000001320184022	A区  4F-B401细胞室-JK-14	1	SPF动物实验中心-8	CAM000606
34020000001320184023	A区  4F-B407-1细胞室-JK-15	1	SPF动物实验中心-8	CAM000607
34020000001320184024	1F-JK-72    7号梯	1	SPF动物实验中心-8	CAM000608
34020000001320184025	4F-JK-01  3号梯	1	SPF动物实验中心-8	CAM000609
34020000001320184026	4F-JK-02   4号梯	1	SPF动物实验中心-8	CAM000610
34020000001320184027	4F-JK-06  1号梯	1	SPF动物实验中心-8	CAM000611
34020000001320184028	4F-JK-07   2号梯	1	SPF动物实验中心-8	CAM000612
34020000001320184029	4F-JK-16  5号梯	1	SPF动物实验中心-8	CAM000613
34020000001320184030	4F-JK-19   6号梯	1	SPF动物实验中心-8	CAM000614
34020000001320185001	B区  B1F-货物电梯厅-JK-01	1	SPF动物实验中心-9	CAM000615
34020000001320185002	B区  B1F-楼梯-2（东侧）-JK-02	1	SPF动物实验中心-9	CAM000616
34020000001320185003	B区  B1F-污物电梯厅-JK-05	1	SPF动物实验中心-9	CAM000617
34020000001320185004	B区  B1F-楼梯-1（西侧）-JK-06	1	SPF动物实验中心-9	CAM000618
34020000001320185005	B区  B1F-北侧走道（东西向）-JK-09	1	SPF动物实验中心-9	CAM000619
34020000001320185006	B区  B1F-西侧走道（南北向）-JK-10	1	SPF动物实验中心-9	CAM000620
34020000001320185007	B区  B1F-7号梯进出区域-JK-11	1	SPF动物实验中心-9	CAM000621
34020000001320185008	B区  B1F -锅炉房-1-JK-12	1	SPF动物实验中心-9	CAM000622
34020000001320185009	B区  B1F-东侧走道（南北向)-JK-13	1	SPF动物实验中心-9	CAM000623
34020000001320185010	B区  B1F-锅炉房-2-JK-14	1	SPF动物实验中心-9	CAM000624
34020000001320185011	B区  B1F-中间走道（东西向）-JK-15	1	SPF动物实验中心-9	CAM000625
34020000001320185012	B区  B1F-楼梯-3（西侧）-JK-16	1	SPF动物实验中心-9	CAM000626
34020000001320185013	A区  B1F-消防水泵房-1-JK-17	1	SPF动物实验中心-9	CAM000627
34020000001320185014	A区  B1F-生活水泵房-JK-18	1	SPF动物实验中心-9	CAM000628
34020000001320185015	A区  B1F-西南走道（南北向）-JK-19	1	SPF动物实验中心-9	CAM000629
34020000001320185016	A区  B1F-消防水泵房-2-JK-20	1	SPF动物实验中心-9	CAM000630
34020000001320185017	A区  B1F-南侧走道-1（东西向）-JK-21	1	SPF动物实验中心-9	CAM000631
34020000001320185018	A区  B1F-南侧走道-2（东西向）-JK-22	1	SPF动物实验中心-9	CAM000632
34020000001320185019	A区  B1F-锅炉房-3-JK-23	1	SPF动物实验中心-9	CAM000633
34020000001320185020	B区  1F-货物电梯厅-JK-03	1	SPF动物实验中心-9	CAM000634
34020000001320185021	B区  1F-楼梯-2（东侧)-JK-04	1	SPF动物实验中心-9	CAM000635
34020000001320185022	B区  1F-东侧走道-1（南北向）-JK-06	1	SPF动物实验中心-9	CAM000636
34020000001320185023	B区  1F-清洁走道-JK-09	1	SPF动物实验中心-9	CAM000637
34020000001320185024	B区   1F-室外区域（北侧）-1-JK-16	1	SPF动物实验中心-9	CAM000638
34020000001320185025	B区  1F-室外区域（北侧）-2-JK-17	1	SPF动物实验中心-9	CAM000639
34020000001320185026	B区  1F-污物电梯厅-JK-18	1	SPF动物实验中心-9	CAM000640
34020000001320185027	B区  1F-楼梯-1（西侧)-JK-19	1	SPF动物实验中心-9	CAM000641
34020000001320185028	B区  1F-西侧走道-1（向南）-JK-20	1	SPF动物实验中心-9	CAM000642
34020000001320185029	B区  1F-西侧走道-2（向北）-JK-21	1	SPF动物实验中心-9	CAM000643
34020000001320185030	B区  1F-污物暂存间-1-JK-23	1	SPF动物实验中心-9	CAM000644
34020000001320186001	B区  1F-清洁走道-JK-30	1	SPF动物实验中心-11	CAM000645
34020000001320186002	B区  1F-疏散出入口区域-1-JK-32	1	SPF动物实验中心-11	CAM000646
34020000001320186003	B区  1F-室外区域（西侧）-1-JK-39	1	SPF动物实验中心-11	CAM000647
34020000001320186004	B区  1F-污物暂存间-2-JK-40	1	SPF动物实验中心-11	CAM000648
34020000001320186005	B区  1F-室外区域（西侧）-2-JK-41	1	SPF动物实验中心-11	CAM000649
34020000001320186006	B区  1F-南侧走道（东西向）-JK-45	1	SPF动物实验中心-11	CAM000650
34020000001320186007	B区  1F-疏散出入口区域-2-JK-46	1	SPF动物实验中心-11	CAM000651
34020000001320186008	A区  1F-配电房-1-JK-53	1	SPF动物实验中心-11	CAM000652
34020000001320186009	A区  1F-配电房-2-JK-54	1	SPF动物实验中心-11	CAM000653
34020000001320186010	A区  1F-配电房-3-JK-55	1	SPF动物实验中心-11	CAM000654
34020000001320186011	A区  1F-消防控制室-1-JK-56	1	SPF动物实验中心-11	CAM000655
34020000001320186012	A区  1F-室外区域(南侧）-1-JK-57	1	SPF动物实验中心-11	CAM000656
34020000001320186013	A区  1F-室外区域(南侧）-1-JK-58	1	SPF动物实验中心-11	CAM000657
34020000001320186014	A区  1F-消防控制室-2-JK-59	1	SPF动物实验中心-11	CAM000658
34020000001320186015	A区  1F-大厅区域-1-JK-61	1	SPF动物实验中心-11	CAM000659
34020000001320186016	A区  1F-大厅区域-2-JK-62	1	SPF动物实验中心-11	CAM000660
34020000001320186017	A区  1F-大厅区域-3-JK-63	1	SPF动物实验中心-11	CAM000661
34020000001320186018	A区  1F-辅助出入口区域（东侧）-JK-65	1	SPF动物实验中心-11	CAM000662
34020000001320186019	A区  1F-7号梯进出区域-JK-71	1	SPF动物实验中心-11	CAM000663
34020000001320186020	B区  1F-室外区域（东侧)-1-JK-76	1	SPF动物实验中心-11	CAM000664
34020000001320186021	B区  1F-室外区域（东侧)-2-JK-77	1	SPF动物实验中心-11	CAM000665
34020000001320186022	B区  1F-B101接待室-JK-78	1	SPF动物实验中心-11	CAM000666
34020000001320186023	A区  1F- B103档案室-JK-79	1	SPF动物实验中心-11	CAM000667
34020000001320186024	B区  1F-大厅区域-JK-80	1	SPF动物实验中心-11	CAM000668
34020000001320186025	A区  1F-东侧走道-1（向南）-JK-81	1	SPF动物实验中心-11	CAM000669
34020000001320186026	B区  2F-货物电梯厅-JK-01	1	SPF动物实验中心-11	CAM000670
34020000001320186027	B区  2F-楼梯-2（东侧)-JK-03	1	SPF动物实验中心-11	CAM000671
34020000001320186028	B区  2F-东洁净走廊（南北向）-JK-04	1	SPF动物实验中心-11	CAM000672
34020000001320186029	B区  2F-北洁净走廊（东西向）-1-JK-07	1	SPF动物实验中心-11	CAM000673
34020000001320186030	B区  2F-北洁净走廊（东西向）-2-JK-10	1	SPF动物实验中心-11	CAM000674
34020000001320186031	B区  2F-西侧走道-1（南北向）-JK-14	1	SPF动物实验中心-11	CAM000675
34020000001320186032	B区  2F-污物电梯厅-JK-16	1	SPF动物实验中心-11	CAM000676
34020000001320187001	B区  2F-楼梯-1（西侧)-JK-17	1	SPF动物实验中心-10	CAM000677
34020000001320187002	B区  2F-西侧走道-2（东西向）-JK-21	1	SPF动物实验中心-10	CAM000678
34020000001320187003	B区  2F-北混合走廊（东西向）-1-JK-29	1	SPF动物实验中心-10	CAM000679
34020000001320187004	B区  2F-北混合走廊（东西向）-2-JK-34	1	SPF动物实验中心-10	CAM000680
34020000001320187005	B区  2F-中混合走廊（东西向）-1-JK-47	1	SPF动物实验中心-10	CAM000681
34020000001320187006	B区  2F-中混合走廊（东西向）-2-JK-51	1	SPF动物实验中心-10	CAM000682
34020000001320187007	B区  2F-A-B区进出口（西侧）-JK-59	1	SPF动物实验中心-10	CAM000683
34020000001320187008	B区  2F-西污物走廊(南北向）-JK-60	1	SPF动物实验中心-10	CAM000684
34020000001320187009	B区  2F-南混合走廊（东西向）-1-JK-68	1	SPF动物实验中心-10	CAM000685
34020000001320187010	B区  2F-南混合走廊（东西向）-2-JK-73	1	SPF动物实验中心-10	CAM000686
34020000001320187011	B区  2F-A-B区进出口（东侧）-JK-83	1	SPF动物实验中心-10	CAM000687
34020000001320187012	A区  2F-进出走道区域-1-JK-88	1	SPF动物实验中心-10	CAM000688
34020000001320187013	A区  2F-进出走道区域-2-JK-89	1	SPF动物实验中心-10	CAM000689
34020000001320187014	A区  2F-进出过道区域-3-JK-94	1	SPF动物实验中心-10	CAM000690
34020000001320187015	A区  2F-进出过道区域-4-JK-96	1	SPF动物实验中心-10	CAM000691
34020000001320187016	B区  2FA-夹层电梯厅-JK-01	1	SPF动物实验中心-10	CAM000692
34020000001320187017	B区  2FA-夹层楼梯-2（东侧）-JK-02	1	SPF动物实验中心-10	CAM000693
34020000001320187018	B区  2FA-夹层楼梯-1（西侧）-JK-03	1	SPF动物实验中心-10	CAM000694
34020000001320187019	B区  2FA-夹层楼梯-3（西侧）-JK-04	1	SPF动物实验中心-10	CAM000695
34020000001320187020	A区  2FA-进出走道区域-1-JK-06	1	SPF动物实验中心-10	CAM000696
34020000001320187021	A区  2FA-进出走道区域-2-JK-12	1	SPF动物实验中心-10	CAM000697
34020000001320187022	A区  2FA-进出走道区域-3-JK-13	1	SPF动物实验中心-10	CAM000698
34020000001320187023	B区  3F-东洁净走廊-（南北向）-JK-01	1	SPF动物实验中心-10	CAM000699
34020000001320187024	B区  3F-货物电梯厅-JK-04	1	SPF动物实验中心-10	CAM000700
34020000001320187025	B区  3F-楼梯-2（东侧）-JK-06	1	SPF动物实验中心-10	CAM000701
34020000001320187026	B区  3F-B302屏障入口-JK-07	1	SPF动物实验中心-10	CAM000702
34020000001320187027	B区  3F-北洁净走廊（东西向）-1-JK-10	1	SPF动物实验中心-10	CAM000703
34020000001320187028	B区  3F-北洁净走廊（东西向）-2-JK-11	1	SPF动物实验中心-10	CAM000704
34020000001320187029	B区  3F-西走道-1（南北向）-JK-14	1	SPF动物实验中心-10	CAM000705
34020000001320187030	B区  3F-污物电梯厅-JK-15	1	SPF动物实验中心-10	CAM000706
34020000001320187031	B区  3F-楼梯-1（西侧）-JK-16	1	SPF动物实验中心-10	CAM000707
34020000001320187032	B区  3F-西走道-2（东西向）-JK-18	1	SPF动物实验中心-10	CAM000708
341	实验A楼341-1	1	2019新增实验A楼	CAM000709
341-2	实验A楼341-2	1	ISC6800实验室A楼	CAM000710
39-9D-69-1_1	化学馆330-1房间	1	化学馆实验室  2024	CAM000711
48-EA-63-02-98-C6_1	实验D楼1F走道	1	平台摄像机	CAM000712
48-EA-63-02-98-C7_1	实验B楼西面停车处	1	平台摄像机	CAM000713
48-EA-63-02-98-E7_1	实验D楼外停车处	1	平台摄像机	CAM000714
48-EA-63-02-98-F0_1	实验B楼东面停车处	1	平台摄像机	CAM000715
48-EA-63-03-C4-2A_1	实验AB楼之间通道	1	平台摄像机	CAM000716
48-EA-63-03-EB-E4_1	实验A群楼门口	1	平台摄像机	CAM000717
509999162713225145821_1	化学馆1F正大门	1	化学馆实验室  2024	CAM000718
51026020861326233938	实验C裙楼新增0	1	ISC6800实验室C楼	CAM000719
5B-0F-05-1_1	化学馆330-2房间	1	化学馆实验室  2024	CAM000720
5B-3E-35_1	实验A楼裙楼1F数控机房1	1	ISC6800实验室A楼	CAM000721
5B-3E-40-1_1	化学馆202-204房间	1	化学馆实验室  2024	CAM000722
5B-3E-E0_1	实验A楼裙楼数控机房2	1	ISC6800实验室A楼	CAM000723
5B-3F-87_1	实验A楼裙楼1F数控机房2	1	ISC6800实验室A楼	CAM000724
6304b41c17217232100X0	实验C楼主楼大门	1	平台摄像机	CAM000725
6304b41c17217232139X0	实验C楼2F主楼通道东照	1	平台摄像机	CAM000726
6304b41c1721723281X0	实验C楼走道2	1	平台摄像机	CAM000727
6304b41c48-EA-63-03-FC-76_001X0	实验C楼1F裙楼通道东照	1	平台摄像机	CAM000728
6304b41c48-EA-63-08-41-A0_001X0	实验C楼1F裙楼主大门内2	1	平台摄像机	CAM000729
6304b41c48-EA-63-08-41-C0_001X0	实验C楼1F裙楼主大门内1	1	平台摄像机	CAM000730
6304b41c48-EA-63-08-6B-C8_001X0	实验C楼1F主楼主消防入口	1	平台摄像机	CAM000731
6304b41c48-EA-63-09-2E-47_001X0	实验C楼4F裙楼通道西照	1	平台摄像机	CAM000732
6304b41c48-EA-63-09-2E-52_001X0	实验C楼5F裙楼通道西照	1	平台摄像机	CAM000733
6304b41c48-EA-63-09-2E-5A_001X0	实验C楼3F主楼向裙楼照	1	平台摄像机	CAM000734
6304b41c48-EA-63-09-2E-7F_001X0	实验C楼3F主楼向裙楼照	1	平台摄像机	CAM000735
6304b41c48-EA-63-09-2E-80_001X0	实验C楼4F裙楼通道东照	1	平台摄像机	CAM000736
6304b41c48-EA-63-09-2E-87_001X0	实验C楼2F裙楼通道西照	1	平台摄像机	CAM000737
6304b41c48-EA-63-09-2E-CB_001X0	实验C楼5F裙楼西楼梯	1	平台摄像机	CAM000738
6304b41c48-EA-63-09-2F-3B_001X0	实验C楼4F主楼向裙楼照	1	平台摄像机	CAM000739
6304b41c48-EA-63-09-2F-5C_001X0	实验C楼2F裙楼通道北照	1	平台摄像机	CAM000740
6304b41c48-EA-63-09-2F-6E_001X0	实验C楼3F裙楼通道东照	1	平台摄像机	CAM000741
6304b41c48-EA-63-09-2F-7A_001X0	实验C楼3F裙楼通道北照	1	平台摄像机	CAM000742
6304b41c48-EA-63-09-36-13_001X0	实验C楼1F裙楼侧门电梯	1	平台摄像机	CAM000743
6304b41c48-EA-63-09-60-37_001X0	实验C楼5F主楼侧消防通道	1	平台摄像机	CAM000744
6304b41c48-EA-63-09-61-3B_001X0	实验C楼5F主楼消防通道	1	平台摄像机	CAM000745
6304b41c48-EA-63-09-61-62_001X0	实验楼C裙楼5F东消防通道口	1	平台摄像机	CAM000746
6304b41c48-EA-63-0A-F3-CF_001X0	实验C楼1F主楼大门全景	1	平台摄像机	CAM000747
6304b41c48-EA-63-0A-F4-40_001X0	实验C楼1F主楼电梯	1	平台摄像机	CAM000748
6304b41c48-EA-63-0B-0F-9C_001X0	实验C楼3F裙楼通道西照	1	平台摄像机	CAM000749
6304b41c48-EA-63-0B-0F-E7_001X0	实验C楼2F主楼向裙楼照	1	平台摄像机	CAM000750
6304b41c48-EA-63-0B-0F-E8_001X0	实验C楼5F主楼向裙楼照	1	平台摄像机	CAM000751
6304b41c48-EA-63-0B-10-00_001X0	实验C楼5F裙楼通道东照	1	平台摄像机	CAM000752
6304b41c48-EA-63-0B-1E-28_001X0	实验C楼3F主楼通道东照	1	平台摄像机	CAM000753
6304b41c48-EA-63-0B-1E-40_001X0	实验C楼1F裙楼东消防通道口	1	平台摄像机	CAM000754
6304b41c48-EA-63-0B-1E-42_001X0	实验C楼4F主楼通道西照	1	平台摄像机	CAM000755
6304b41c48-EA-63-0B-1E-43_001X0	实验C楼2F主楼通道西照	1	平台摄像机	CAM000756
6304b41c48-EA-63-0B-1E-44_001X0	实验C楼5F主楼通道东照	1	平台摄像机	CAM000757
6304b41c48-EA-63-0B-1E-61_001X0	实验C楼3F主楼通道西照	1	平台摄像机	CAM000758
6304b41c48-EA-63-0B-1E-77_001X0	实验C楼1F主楼通道东照	1	平台摄像机	CAM000759
6304b41c48-EA-63-0B-1E-81_001X0	实验C楼1F主楼侧门	1	平台摄像机	CAM000760
6304b41c48-EA-63-0B-1E-84_001X0	实验C楼5F主楼通道西照	1	平台摄像机	CAM000761
6304b41c48-EA-63-0C-AC-16_001X0	实验C楼5F裙楼通道北照	1	平台摄像机	CAM000762
6304b41c48-EA-63-0C-AC-D0_001X0	实验C楼4F裙楼通道北照	1	平台摄像机	CAM000763
6304b41cSYCZLTDX0	实验C主楼通道东照	1	平台摄像机	CAM000764
6304b42c17217251125X0	实验B楼裙楼1F大门	1	平台摄像机	CAM000765
6304b42c17217251130X0	实验B楼监控室	1	平台摄像机	CAM000766
6304b42c1721725128X0	实验B楼1F大厅	1	平台摄像机	CAM000767
6304b42c48-EA-63-08-41-B3_001X0	实验B楼裙房1F侧大门	1	平台摄像机	CAM000768
6304b42c48-EA-63-08-6C-D7_001X0	实验B楼2F裙楼通道西照	1	平台摄像机	CAM000769
6304b42c48-EA-63-08-6F-0B_001X0	实验B楼主楼1F消防通道门	1	平台摄像机	CAM000770
6304b42c48-EA-63-09-2E-2E_001X0	实验B楼5F主楼通道南照	1	平台摄像机	CAM000771
6304b42c48-EA-63-09-2E-34_001X0	实验B楼裙楼5F通道西照	1	平台摄像机	CAM000772
6304b42c48-EA-63-09-2E-4C_001X0	实验B楼5F主楼通道北照	1	平台摄像机	CAM000773
6304b42c48-EA-63-09-2E-4E_001X0	实验B楼5F主楼储物间	1	平台摄像机	CAM000774
6304b42c48-EA-63-09-2E-56_001X0	实验B楼裙楼1F通道东照	1	平台摄像机	CAM000775
6304b42c48-EA-63-09-2E-6D_001X0	实验B楼主楼3F主通道北照	1	平台摄像机	CAM000776
6304b42c48-EA-63-09-2E-74_001X0	实验B楼主楼4F连廊裙楼向主楼照	1	平台摄像机	CAM000777
6304b42c48-EA-63-09-2E-76_001X0	实验B楼裙楼1F通道西照	1	平台摄像机	CAM000778
6304b42c48-EA-63-09-2E-8D_001X0	实验B楼主楼3F连廊裙楼向主楼照	1	平台摄像机	CAM000779
6304b42c48-EA-63-09-2E-8F_001X0	实验B楼主楼2F主通道北照	1	平台摄像机	CAM000780
6304b42c48-EA-63-09-2E-92_001X0	实验B楼裙楼5F通道东照	1	平台摄像机	CAM000781
6304b42c48-EA-63-09-2E-A1_001X0	实验B楼裙楼3F通道西照	1	平台摄像机	CAM000782
6304b42c48-EA-63-09-2E-A3_001X0	实验B楼裙楼4F通道西照	1	平台摄像机	CAM000783
6304b42c48-EA-63-09-2E-A4_001X0	实验B楼5F连廊裙楼向主楼照	1	平台摄像机	CAM000784
6304b42c48-EA-63-09-2E-A8_001X0	实验B楼裙楼3F通道东照	1	平台摄像机	CAM000785
6304b42c48-EA-63-09-2E-CF_001X0	实验B楼裙楼4F通道东照	1	平台摄像机	CAM000786
6304b42c48-EA-63-09-2E-D6_001X0	实验B楼主楼3F主通道南照	1	平台摄像机	CAM000787
6304b42c48-EA-63-09-36-66_001X0	实验B楼1F裙房东消防入口	1	平台摄像机	CAM000788
6304b42c48-EA-63-09-36-E3_001X0	实验B楼主楼5F主楼侧消防通道	1	平台摄像机	CAM000789
6304b42c48-EA-63-09-60-2D_001X0	实验B楼5F裙房东楼梯出入	1	平台摄像机	CAM000790
6304b42c48-EA-63-09-61-38_001X0	实验B楼5F主楼主消防通道	1	平台摄像机	CAM000791
6304b42c48-EA-63-0B-0C-EB_001X0	实验B楼主楼1F主电梯出入口	1	平台摄像机	CAM000792
6304b42c48-EA-63-0B-0F-6A_001X0	实验B楼主楼4F主楼主通道北照	1	平台摄像机	CAM000793
6304b42c48-EA-63-0B-0F-B1_001X0	实验B楼主楼4F主楼主通道南照	1	平台摄像机	CAM000794
6304b42c48-EA-63-0B-0F-FC_001X0	实验B楼主楼1F侧楼梯入口	1	平台摄像机	CAM000795
6304b42c48-EA-63-0B-0F-FF_001X0	实验B楼主楼1F主电梯旁走道	1	平台摄像机	CAM000796
6304b42c48-EA-63-0B-10-06_001X0	实验B楼主楼2F主通道南照	1	平台摄像机	CAM000797
6304b42c48-EA-63-0B-1E-58_001X0	实验B楼主楼1F侧大门口	1	平台摄像机	CAM000798
6304b42c48-EA-63-0B-4F-73_001X0	实验B楼1F裙房主大门全景	1	平台摄像机	CAM000799
6304b42c48-EA-63-0C-A8-E6_001X0	实验B楼2F裙楼连廊	1	平台摄像机	CAM000800
6304b42csybl2fX0	实验B楼2F裙楼通道东照	1	平台摄像机	CAM000801
6304b4361721723463X0	实验A楼机房	1	平台摄像机	CAM000802
6304b43648-EA-63-09-0F-69_001X0	实验A楼1F裙楼侧门	1	平台摄像机	CAM000803
6304b43648-EA-63-09-0F-71_001X0	实验A楼1F裙楼主门	1	平台摄像机	CAM000804
6304b43648-EA-63-09-2E-39_001X0	实验A楼3F主楼东消防楼梯	1	平台摄像机	CAM000805
6304b43648-EA-63-09-2E-7B_001X0	实验A楼4F裙楼西照	1	平台摄像机	CAM000806
6304b43648-EA-63-09-2E-9B_001X0	实验A楼5F裙楼西照	1	平台摄像机	CAM000807
6304b43648-EA-63-09-2E-AE_001X0	实验A楼3F裙楼东南照	1	平台摄像机	CAM000808
6304b43648-EA-63-09-2E-C0_001X0	实验A楼4F裙楼东南照	1	平台摄像机	CAM000809
6304b43648-EA-63-09-2E-E1_001X0	实验A楼1F主楼电梯口	1	平台摄像机	CAM000810
6304b43648-EA-63-09-2E-EA_001X0	实验A楼4F裙楼通道西南照	1	平台摄像机	CAM000811
6304b43648-EA-63-09-2E-F1_001X0	实验A楼5F裙楼通道西南照	1	平台摄像机	CAM000812
6304b43648-EA-63-09-2F-13_001X0	实验A楼1F裙楼西通道北照	1	平台摄像机	CAM000813
6304b43648-EA-63-09-2F-34_001X0	实验A楼1F裙楼通道西南照	1	平台摄像机	CAM000814
6304b43648-EA-63-09-2F-3F_001X0	实验A楼2F主楼主通道东照	1	平台摄像机	CAM000815
6304b43648-EA-63-09-2F-5B_001X0	实验A楼2F主楼强电间南照	1	平台摄像机	CAM000816
6304b43648-EA-63-09-2F-5D_001X0	实验A楼3F裙楼西照	1	平台摄像机	CAM000817
6304b43648-EA-63-09-2F-60_001X0	实验A楼1F裙楼通道东南照	1	平台摄像机	CAM000818
6304b43648-EA-63-09-2F-61_001X0	实验A楼2F裙楼西照	1	平台摄像机	CAM000819
6304b43648-EA-63-09-2F-68_001X0	实验A楼2F裙楼通道西南照	1	平台摄像机	CAM000820
6304b43648-EA-63-09-2F-70_001X0	实验A楼2F裙楼东南照	1	平台摄像机	CAM000821
6304b43648-EA-63-09-2F-72_001X0	实验A楼3F主楼通道东照	1	平台摄像机	CAM000822
6304b43648-EA-63-09-2F-74_001X0	实验A楼3F裙楼通道西南照	1	平台摄像机	CAM000823
6304b43648-EA-63-09-2F-7C_001X0	实验A楼3F主楼强电间门口南照	1	平台摄像机	CAM000824
6304b43648-EA-63-0B-1E-29_001X0	实验A楼1F主楼主通道东照	1	平台摄像机	CAM000825
6304b43648-EA-63-0B-1E-3C_001X0	实验A楼1F裙楼通道西北照	1	平台摄像机	CAM000826
6304b43648-EA-63-0B-1E-46_001X0	实验A楼1F主楼北消防楼梯	1	平台摄像机	CAM000827
6304b43648-EA-63-0B-1E-48_001X0	实验A楼1F主楼南消防楼梯	1	平台摄像机	CAM000828
6304b43648-EA-63-0B-1E-4C_001X0	实验A楼1F裙楼东消防梯侧门	1	平台摄像机	CAM000829
6304b43648-EA-63-0B-1E-5D_001X0	实验A楼5F主楼强电间旁楼梯	1	平台摄像机	CAM000830
6304b43648-EA-63-0B-1E-62_001X0	实验A楼5F裙楼南消防梯	1	平台摄像机	CAM000831
6304b43648-EA-63-0B-1E-66_001X0	实验A楼1F裙楼西消防楼梯	1	平台摄像机	CAM000832
6304b43648-EA-63-0B-1E-7A_001X0	实验A楼5F裙楼北消防梯	1	平台摄像机	CAM000833
6304b43648-EA-63-0B-24-B0_001X0	实验A楼1F裙楼电梯口	1	平台摄像机	CAM000834
6304b43648-EA-63-0B-24-B3_001X0	实验A楼1F裙楼门厅全景	1	平台摄像机	CAM000835
a_70	实验A楼329	1	ISC6800实验室A楼	CAM000925
6304b43648-EA-63-0C-A7-EC_001X0	实验A楼5F裙楼通道东北照	1	平台摄像机	CAM000836
6304b43648-EA-63-0C-A8-F5_001X0	实验A楼4F裙楼通道东北照	1	平台摄像机	CAM000837
6304b43648-EA-63-0C-AB-6A_001X0	实验A楼2F裙楼通道东北照	1	平台摄像机	CAM000838
6304b43648-EA-63-0C-AB-B3_001X0	实验A楼5F裙楼东南照	1	平台摄像机	CAM000839
6304b43648-EA-63-0C-AC-2A_001X0	实验A楼2F主楼主通道西照	1	平台摄像机	CAM000840
6304b43648-EA-63-0C-AC-5B_001X0	实验A楼3F主楼通道西照	1	平台摄像机	CAM000841
6304b43648-EA-63-0C-AC-DB_001X0	实验A楼3F裙楼通道东北照	1	平台摄像机	CAM000842
6304b4365B-40-5FX0	实验A楼1F主楼大门2	1	平台摄像机	CAM000843
6304b436EF-8D-8EX0	实验A楼1F主楼大门口1	1	平台摄像机	CAM000844
68-C5-A6_1	实验楼花坛西向	1	华师大道路监控	CAM000845
90-9B-5A_1	实验B楼裙楼后道路东向	1	平台摄像机	CAM000846
90-9B-5B_1	实验A楼前小路西	1	华师大道路监控	CAM000847
90-9B-5F_1	实验A楼前小路东	1	华师大道路监控	CAM000848
90-9B-89_1	实验A楼主楼前道路东向	1	河道及道路	CAM000849
90-9B-EE_1	实验A楼前小路南	1	河道及道路	CAM000850
9C-B0-9A_1	化学楼226-2	1	化学馆实验室  2024	CAM000851
9C-B0-9D_1	化学楼249-1	1	化学馆实验室  2024	CAM000852
9C-B0-A0_1	化学楼249-2	1	化学馆实验室  2024	CAM000853
9C-B0-A8_1	化学楼226-1	1	化学馆实验室  2024	CAM000854
a_1	实验A楼430-428	1	ISC6800实验室A楼	CAM000855
a_10	实验A楼233	1	ISC6800实验室A楼	CAM000856
a_100	实验A楼424	1	ISC6800实验室A楼	CAM000857
a_101	实验A楼426	1	ISC6800实验室A楼	CAM000858
a_102	实验A楼431	1	ISC6800实验室A楼	CAM000859
a_103	实验A楼433	1	ISC6800实验室A楼	CAM000860
a_104	实验A楼435-2	1	ISC6800实验室A楼	CAM000861
a_105	实验A楼436	1	ISC6800实验室A楼	CAM000862
a_106	实验A楼437	1	ISC6800实验室A楼	CAM000863
a_107	实验A楼438	1	ISC6800实验室A楼	CAM000864
a_11	实验A楼216	1	ISC6800实验室A楼	CAM000865
a_12	实验A楼225	1	ISC6800实验室A楼	CAM000866
a_13	实验A楼227	1	ISC6800实验室A楼	CAM000867
a_15	实验A楼230	1	ISC6800实验室A楼	CAM000868
a_16	实验A楼231	1	ISC6800实验室A楼	CAM000869
a_17	实验A楼234	1	ISC6800实验室A楼	CAM000870
a_18	实验A楼236	1	ISC6800实验室A楼	CAM000871
a_19	实验A楼238	1	ISC6800实验室A楼	CAM000872
a_2	实验A楼447	1	ISC6800实验室A楼	CAM000873
a_20	实验A楼240	1	ISC6800实验室A楼	CAM000874
a_21	实验A楼242	1	ISC6800实验室A楼	CAM000875
a_22	实验A楼243	1	ISC6800实验室A楼	CAM000876
a_23	实验A楼244-1	1	ISC6800实验室A楼	CAM000877
a_24	实验A楼244-2	1	ISC6800实验室A楼	CAM000878
a_25	实验A楼247	1	ISC6800实验室A楼	CAM000879
a_26	实验A楼249	1	ISC6800实验室A楼	CAM000880
a_27	实验A楼251	1	ISC6800实验室A楼	CAM000881
a_29	实验A楼327	1	ISC6800实验室A楼	CAM000882
a_3	实验A楼455-457	1	ISC6800实验室A楼	CAM000883
a_30	实验A楼330	1	ISC6800实验室A楼	CAM000884
a_31	实验A楼333	1	ISC6800实验室A楼	CAM000885
a_32	实验A楼335	1	ISC6800实验室A楼	CAM000886
a_33	实验A楼337	1	ISC6800实验室A楼	CAM000887
a_34	实验A楼339	1	ISC6800实验室A楼	CAM000888
a_35	实验A楼340	1	ISC6800实验室A楼	CAM000889
a_36	实验A楼341	1	ISC6800实验室A楼	CAM000890
a_37	实验A楼344	1	ISC6800实验室A楼	CAM000891
a_38	实验A楼345	1	ISC6800实验室A楼	CAM000892
a_39	实验A楼346	1	ISC6800实验室A楼	CAM000893
a_4	实验A楼524	1	ISC6800实验室A楼	CAM000894
a_40	实验A楼347	1	ISC6800实验室A楼	CAM000895
a_41	实验A楼348	1	ISC6800实验室A楼	CAM000896
a_42	实验A楼350	1	ISC6800实验室A楼	CAM000897
a_45	实验A楼440-442	1	ISC6800实验室A楼	CAM000898
a_46	实验A楼129	1	ISC6800实验室A楼	CAM000899
a_47	实验A楼427	1	ISC6800实验室A楼	CAM000900
a_48	实验A楼429	1	ISC6800实验室A楼	CAM000901
a_49	实验A楼434	1	ISC6800实验室A楼	CAM000902
a_50	实验A楼439	1	ISC6800实验室A楼	CAM000903
a_51	实验A楼441	1	ISC6800实验室A楼	CAM000904
a_52	实验A楼443-445	1	ISC6800实验室A楼	CAM000905
a_53	实验A楼527	1	ISC6800实验室A楼	CAM000906
a_54	实验A楼529	1	ISC6800实验室A楼	CAM000907
a_55	实验A楼140	1	ISC6800实验室A楼	CAM000908
a_56	实验A楼237	1	ISC6800实验室A楼	CAM000909
a_57	实验A楼218-220	1	ISC6800实验室A楼	CAM000910
a_58	实验A楼221	1	ISC6800实验室A楼	CAM000911
a_59	实验A楼222	1	ISC6800实验室A楼	CAM000912
a_6	实验A楼543	1	ISC6800实验室A楼	CAM000913
a_60	实验A楼223	1	ISC6800实验室A楼	CAM000914
a_61	实验A楼224	1	ISC6800实验室A楼	CAM000915
a_62	实验A楼228-226	1	ISC6800实验室A楼	CAM000916
a_63	实验A楼239	1	ISC6800实验室A楼	CAM000917
a_64	实验A楼246	1	ISC6800实验室A楼	CAM000918
a_65	实验A楼248	1	ISC6800实验室A楼	CAM000919
a_66	实验A楼321	1	ISC6800实验室A楼	CAM000920
a_67	实验A楼323	1	ISC6800实验室A楼	CAM000921
a_68	实验A楼326	1	ISC6800实验室A楼	CAM000922
a_69	实验A楼328	1	ISC6800实验室A楼	CAM000923
a_7	实验A楼545	1	ISC6800实验室A楼	CAM000924
a_71	实验A楼331	1	ISC6800实验室A楼	CAM000926
a_72	实验A楼112	1	ISC6800实验室A楼	CAM000927
a_73	实验A楼332	1	ISC6800实验室A楼	CAM000928
a_74	实验A楼334	1	ISC6800实验室A楼	CAM000929
a_75	实验A楼336	1	ISC6800实验室A楼	CAM000930
a_76	实验A楼338	1	ISC6800实验室A楼	CAM000931
a_77	实验A楼114	1	ISC6800实验室A楼	CAM000932
a_78	实验A楼349	1	ISC6800实验室A楼	CAM000933
a_79	实验A楼351	1	ISC6800实验室A楼	CAM000934
a_81	实验A楼121	1	ISC6800实验室A楼	CAM000935
a_82	实验A楼355	1	ISC6800实验室A楼	CAM000936
a_83	实验A楼356	1	ISC6800实验室A楼	CAM000937
a_84	实验A楼357	1	ISC6800实验室A楼	CAM000938
a_85	实验A楼358	1	ISC6800实验室A楼	CAM000939
a_86	实验A楼359	1	ISC6800实验室A楼	CAM000940
a_87	实验A楼360	1	ISC6800实验室A楼	CAM000941
a_89	实验A楼362	1	ISC6800实验室A楼	CAM000942
a_9	实验A楼142	1	ISC6800实验室A楼	CAM000943
a_90	实验A楼363	1	ISC6800实验室A楼	CAM000944
a_92	实验A楼123	1	ISC6800实验室A楼	CAM000945
a_93	实验A楼412	1	ISC6800实验室A楼	CAM000946
a_94	实验A楼420-1	1	ISC6800实验室A楼	CAM000947
a_95	实验A楼420-2	1	ISC6800实验室A楼	CAM000948
a_96	实验A楼435-1	1	ISC6800实验室A楼	CAM000949
a_98	实验A楼422	1	ISC6800实验室A楼	CAM000950
a28_1	实验A楼325	1	ISC6800实验室A楼	CAM000951
a43_1	实验A楼354	1	ISC6800实验室A楼	CAM000952
a44_1	实验A楼416	1	ISC6800实验室A楼	CAM000953
a8_1	实验A楼551-553	1	ISC6800实验室A楼	CAM000954
a80_1	实验A楼353	1	ISC6800实验室A楼	CAM000955
a91_1	实验A楼410	1	ISC6800实验室A楼	CAM000956
b-1	实验B楼-506	1	ISC6800实验室B楼	CAM000957
b-10	实验B楼-516	1	ISC6800实验室B楼	CAM000958
b-100	实验B楼-B408	1	ISC6800实验室B楼	CAM000959
b-101	实验B楼-B409	1	ISC6800实验室B楼	CAM000960
b-102	实验B楼-B410	1	ISC6800实验室B楼	CAM000961
b-103	实验B楼-414-416	1	ISC6800实验室B楼	CAM000962
b-104	实验B楼-415-417	1	ISC6800实验室B楼	CAM000963
b-106	实验B楼-422	1	ISC6800实验室B楼	CAM000964
b-107	实验B楼-422	1	ISC6800实验室B楼	CAM000965
b-108	实验B楼-424-1	1	ISC6800实验室B楼	CAM000966
b-109	实验B楼-425	1	ISC6800实验室B楼	CAM000967
b-11	实验B楼-109-2	1	ISC6800实验室B楼	CAM000968
b-110	实验B楼-109-1	1	ISC6800实验室B楼	CAM000969
b-111	实验B楼-424-2	1	ISC6800实验室B楼	CAM000970
b-112	实验B楼-424-3	1	ISC6800实验室B楼	CAM000971
b-113	实验B楼-429	1	ISC6800实验室B楼	CAM000972
b-114	实验B楼-433	1	ISC6800实验室B楼	CAM000973
b-115	实验B楼-走道4F-1	1	ISC6800实验室B楼	CAM000974
b-116	实验B楼-走道4F-2	1	ISC6800实验室B楼	CAM000975
b-117	实验B楼-走道4F-3	1	ISC6800实验室B楼	CAM000976
b-118	实验B楼-走道4F-4	1	ISC6800实验室B楼	CAM000977
b-119	实验B楼-503	1	ISC6800实验室B楼	CAM000978
b-12	实验B楼-517	1	ISC6800实验室B楼	CAM000979
b-120	实验B楼-505	1	ISC6800实验室B楼	CAM000980
b-121	实验B楼-2F走道-4	1	ISC6800实验室B楼	CAM000981
b-13	实验B楼-518	1	ISC6800实验室B楼	CAM000982
b-14	实验B楼-519-521	1	ISC6800实验室B楼	CAM000983
b-16	实验B楼-522	1	ISC6800实验室B楼	CAM000984
b-17	实验B楼-523	1	ISC6800实验室B楼	CAM000985
b-18	实验B楼-524-1	1	ISC6800实验室B楼	CAM000986
b-19	实验B楼-525	1	ISC6800实验室B楼	CAM000987
b-2	实验B楼-507-1	1	ISC6800实验室B楼	CAM000988
b-20	实验B楼-524-2	1	ISC6800实验室B楼	CAM000989
b-21	实验B楼-527-529	1	ISC6800实验室B楼	CAM000990
b-22	实验B楼-110	1	ISC6800实验室B楼	CAM000991
b-23	实验B楼-531	1	ISC6800实验室B楼	CAM000992
b-24	实验B楼-5F走道-1	1	ISC6800实验室B楼	CAM000993
b-25	实验B楼-5F走道-2	1	ISC6800实验室B楼	CAM000994
b-26	实验B楼-5F走道-3	1	ISC6800实验室B楼	CAM000995
b-27	实验B楼-5F走道-4	1	ISC6800实验室B楼	CAM000996
b-28	实验B楼-1F走道-4	1	ISC6800实验室B楼	CAM000997
b-29	实验B楼-527-529-2	1	ISC6800实验室B楼	CAM000998
b-3	实验B楼-507-2	1	ISC6800实验室B楼	CAM000999
b-30	实验B楼-502	1	ISC6800实验室B楼	CAM001000
b-31	实验B楼-111-113	1	ISC6800实验室B楼	CAM001001
b-32	实验B楼-114-1	1	ISC6800实验室B楼	CAM001002
b-33	实验B楼-114-2	1	ISC6800实验室B楼	CAM001003
b-34	实验B楼-115	1	ISC6800实验室B楼	CAM001004
b-35	实验B楼-116-1	1	ISC6800实验室B楼	CAM001005
b-36	实验B楼-116-2	1	ISC6800实验室B楼	CAM001006
b-37	实验B楼-117	1	ISC6800实验室B楼	CAM001007
b-38	实验B楼-118-1	1	ISC6800实验室B楼	CAM001008
b-39	实验B楼-118-2	1	ISC6800实验室B楼	CAM001009
b-4	实验B楼-508	1	ISC6800实验室B楼	CAM001010
b-40	实验B楼-119-121	1	ISC6800实验室B楼	CAM001011
b-41	实验B楼-120-1	1	ISC6800实验室B楼	CAM001012
b-42	实验B楼-120-2	1	ISC6800实验室B楼	CAM001013
b-43	实验B楼-122	1	ISC6800实验室B楼	CAM001014
b-44	实验B楼-123	1	ISC6800实验室B楼	CAM001015
b-45	实验B楼-125	1	ISC6800实验室B楼	CAM001016
b-46	实验B楼-1F走道-2	1	ISC6800实验室B楼	CAM001017
b-47	实验B楼-202	1	ISC6800实验室B楼	CAM001018
b-48	实验B楼-204	1	ISC6800实验室B楼	CAM001019
b-49	实验B楼-206-208-1	1	ISC6800实验室B楼	CAM001020
b-5	实验B楼-509-1	1	ISC6800实验室B楼	CAM001021
b-50	实验B楼-206-208-2	1	ISC6800实验室B楼	CAM001022
b-51	实验B楼-207-209-1	1	ISC6800实验室B楼	CAM001023
b-52	实验B楼-207-209-2	1	ISC6800实验室B楼	CAM001024
b-53	实验B楼-211	1	ISC6800实验室B楼	CAM001025
b-54	实验B楼-215	1	ISC6800实验室B楼	CAM001026
b-55	实验B楼-216	1	ISC6800实验室B楼	CAM001027
b-56	实验B楼-217	1	ISC6800实验室B楼	CAM001028
b-57	实验B楼-218	1	ISC6800实验室B楼	CAM001029
b-58	实验B楼-219-221	1	ISC6800实验室B楼	CAM001030
b-59	实验B楼-220	1	ISC6800实验室B楼	CAM001031
b-6	实验B楼-509-2	1	ISC6800实验室B楼	CAM001032
b-60	实验B楼-222	1	ISC6800实验室B楼	CAM001033
b-61	实验B楼-223	1	ISC6800实验室B楼	CAM001034
b-62	实验B楼-224	1	ISC6800实验室B楼	CAM001035
b-63	实验B楼-225	1	ISC6800实验室B楼	CAM001036
b-64	实验B楼-2F走道-1	1	ISC6800实验室B楼	CAM001037
b-65	实验B楼-2F走道-2	1	ISC6800实验室B楼	CAM001038
b-66	实验B楼-2F走道-3	1	ISC6800实验室B楼	CAM001039
b-67	实验B楼-108-1	1	ISC6800实验室B楼	CAM001040
b-68	实验B楼-301	1	ISC6800实验室B楼	CAM001041
b-69	实验B楼-303	1	ISC6800实验室B楼	CAM001042
b-7	实验B楼-512	1	ISC6800实验室B楼	CAM001043
b-70	实验B楼-304	1	ISC6800实验室B楼	CAM001044
b-71	实验B楼-308	1	ISC6800实验室B楼	CAM001045
b-72	实验B楼-311	1	ISC6800实验室B楼	CAM001046
b-73	实验B楼-312	1	ISC6800实验室B楼	CAM001047
b-74	实验B楼-313	1	ISC6800实验室B楼	CAM001048
b-75	实验B楼-314	1	ISC6800实验室B楼	CAM001049
b-76	实验B楼-315	1	ISC6800实验室B楼	CAM001050
b-77	实验B楼-108-2	1	ISC6800实验室B楼	CAM001051
b-78	实验B楼-316-1	1	ISC6800实验室B楼	CAM001052
b-79	实验B楼-316-2	1	ISC6800实验室B楼	CAM001053
b-8	实验B楼-514	1	ISC6800实验室B楼	CAM001054
b-80	实验B楼-317	1	ISC6800实验室B楼	CAM001055
b-81	实验B楼-319	1	ISC6800实验室B楼	CAM001056
b-82	实验B楼-320-322	1	ISC6800实验室B楼	CAM001057
b-83	实验B楼-321	1	ISC6800实验室B楼	CAM001058
b-84	实验B楼-323	1	ISC6800实验室B楼	CAM001059
b-85	实验B楼-324	1	ISC6800实验室B楼	CAM001060
b-86	实验B楼-326	1	ISC6800实验室B楼	CAM001061
b-87	实验B楼-3F走道-1	1	ISC6800实验室B楼	CAM001062
b-88	实验B楼-107-1	1	ISC6800实验室B楼	CAM001063
b-89	实验B楼-3F走道-2	1	ISC6800实验室B楼	CAM001064
b-9	实验B楼-515	1	ISC6800实验室B楼	CAM001065
b-90	实验B楼-3F走道-3	1	ISC6800实验室B楼	CAM001066
b-91	实验B楼-3F走道-4	1	ISC6800实验室B楼	CAM001067
b-92	实验B楼-B401	1	ISC6800实验室B楼	CAM001068
b-93	实验B楼-B402	1	ISC6800实验室B楼	CAM001069
b-94	实验B楼-B403	1	ISC6800实验室B楼	CAM001070
b-95	实验B楼-B404	1	ISC6800实验室B楼	CAM001071
b-96	实验B楼-B405	1	ISC6800实验室B楼	CAM001072
b-97	实验B楼-B406	1	ISC6800实验室B楼	CAM001073
b-98	实验B楼-B407	1	ISC6800实验室B楼	CAM001074
b-99	实验B楼-107-2	1	ISC6800实验室B楼	CAM001075
b122_1	实验B楼附楼1F弱电间	1	ISC6800实验室B楼	CAM001076
b123_1	实验B楼裙楼1F大门	1	ISC6800实验室B楼	CAM001077
b130_1	实验B楼监控室	1	ISC6800实验室B楼	CAM001078
b131_1	实验B楼1F大厅	1	ISC6800实验室B楼	CAM001079
c1_1	实验C楼101	1	ISC6800实验室C楼	CAM001080
c11_1	实验C楼107-2	1	ISC6800实验室C楼	CAM001081
c12_1	实验C楼大厅出入口	1	ISC6800实验室C楼	CAM001082
c13_1	实验C楼110-1	1	ISC6800实验室C楼	CAM001083
c14_1	实验C楼218	1	ISC6800实验室C楼	CAM001084
c15_1	实验C楼509	1	ISC6800实验室C楼	CAM001085
c16_1	实验C楼518	1	ISC6800实验室C楼	CAM001086
c17_1	实验C楼103	1	ISC6800实验室C楼	CAM001087
c19_1	实验C楼111-1	1	ISC6800实验室C楼	CAM001088
c2_1	实验C楼101-2	1	ISC6800实验室C楼	CAM001089
c20_1	实验C楼111-2	1	ISC6800实验室C楼	CAM001090
c21_1	实验C楼113	1	ISC6800实验室C楼	CAM001091
c22_1	实验C楼114	1	ISC6800实验室C楼	CAM001092
c23_1	实验C楼115	1	ISC6800实验室C楼	CAM001093
c24_1	实验C楼116-1	1	ISC6800实验室C楼	CAM001094
c25_1	实验C楼116-2	1	ISC6800实验室C楼	CAM001095
c26_1	实验C楼118	1	ISC6800实验室C楼	CAM001096
c27_1	实验C楼120-1	1	ISC6800实验室C楼	CAM001097
c28_1	实验C楼120-2	1	ISC6800实验室C楼	CAM001098
c29_1	实验C楼211-213	1	ISC6800实验室C楼	CAM001099
c3_1	实验C楼109	1	ISC6800实验室C楼	CAM001100
c30_1	实验C楼215	1	ISC6800实验室C楼	CAM001101
c31_1	实验C楼217	1	ISC6800实验室C楼	CAM001102
c32_1	实验C楼220-1	1	ISC6800实验室C楼	CAM001103
c33_1	实验C楼220-2	1	ISC6800实验室C楼	CAM001104
c34_1	实验C楼222	1	ISC6800实验室C楼	CAM001105
c35_1	实验C楼224-1	1	ISC6800实验室C楼	CAM001106
c36_1	实验C楼224-2	1	ISC6800实验室C楼	CAM001107
c37_1	实验C楼301	1	ISC6800实验室C楼	CAM001108
c38_1	实验C楼303	1	ISC6800实验室C楼	CAM001109
c39_1	实验C楼312	1	ISC6800实验室C楼	CAM001110
c40_1	实验C楼314	1	ISC6800实验室C楼	CAM001111
c41_1	实验C楼315	1	ISC6800实验室C楼	CAM001112
c42_1	实验C楼317	1	ISC6800实验室C楼	CAM001113
c43_1	实验C楼318	1	ISC6800实验室C楼	CAM001114
c44_1	实验C楼320	1	ISC6800实验室C楼	CAM001115
c45_1	实验C楼322	1	ISC6800实验室C楼	CAM001116
c46_1	实验C楼324	1	ISC6800实验室C楼	CAM001117
c47_1	实验C楼424	1	ISC6800实验室C楼	CAM001118
c48_1	实验C楼501	1	ISC6800实验室C楼	CAM001119
c49_1	实验C楼503	1	ISC6800实验室C楼	CAM001120
c50_1	实验C楼511-1	1	ISC6800实验室C楼	CAM001121
c51_1	实验C楼511-2	1	ISC6800实验室C楼	CAM001122
c52_1	实验C楼513-1	1	ISC6800实验室C楼	CAM001123
c53_1	实验C楼513-2	1	ISC6800实验室C楼	CAM001124
c54_1	实验C群楼走道1	1	ISC6800实验室C楼	CAM001125
c55_1	实验C楼107-1	1	ISC6800实验室C楼	CAM001126
c62_1	实验C楼2F走道-1	1	ISC6800实验室C楼	CAM001127
c63_1	实验C楼2F走道-2	1	ISC6800实验室C楼	CAM001128
c64_1	实验C楼3F走道-1	1	ISC6800实验室C楼	CAM001129
c65_1	实验C楼3F走道-2	1	ISC6800实验室C楼	CAM001130
d1_1	实验D楼518-3	1	ISC6800实验室D楼	CAM001131
d10_1	实验D楼206	1	ISC6800实验室D楼	CAM001132
d13_1	实验D楼212	1	ISC6800实验室D楼	CAM001133
d14_1	实验D楼214	1	ISC6800实验室D楼	CAM001134
d15_1	实验D楼215	1	ISC6800实验室D楼	CAM001135
d16_1	实验D楼216-1	1	ISC6800实验室D楼	CAM001136
d17_1	实验D楼216-2	1	ISC6800实验室D楼	CAM001137
d18_1	实验D楼217-1	1	ISC6800实验室D楼	CAM001138
d19_1	实验D楼217-2	1	ISC6800实验室D楼	CAM001139
d2_1	实验D楼520	1	ISC6800实验室D楼	CAM001140
d20_1	实验D楼218	1	ISC6800实验室D楼	CAM001141
d21_1	实验D楼220	1	ISC6800实验室D楼	CAM001142
d22_1	实验D楼222-1	1	ISC6800实验室D楼	CAM001143
d23_1	实验D楼222-2	1	ISC6800实验室D楼	CAM001144
d24_1	实验D楼224	1	ISC6800实验室D楼	CAM001145
d25_1	实验D楼2F走道1	1	ISC6800实验室D楼	CAM001146
d26_1	实验D楼2F走道2	1	ISC6800实验室D楼	CAM001147
d27_1	实验D楼304	1	ISC6800实验室D楼	CAM001148
d28_1	实验D楼305	1	ISC6800实验室D楼	CAM001149
d29_1	实验D楼306-1	1	ISC6800实验室D楼	CAM001150
d3_1	实验D楼5F走道-1	1	ISC6800实验室D楼	CAM001151
d30_1	实验D楼306-2	1	ISC6800实验室D楼	CAM001152
d31_1	实验D楼307-1	1	ISC6800实验室D楼	CAM001153
d32_1	实验D楼307-2	1	ISC6800实验室D楼	CAM001154
d33_1	实验D楼308	1	ISC6800实验室D楼	CAM001155
d34_1	实验D楼310	1	ISC6800实验室D楼	CAM001156
d35_1	实验D楼312	1	ISC6800实验室D楼	CAM001157
d36_1	实验D楼313	1	ISC6800实验室D楼	CAM001158
d37_1	实验D楼314	1	ISC6800实验室D楼	CAM001159
d38_1	实验D楼315-1	1	ISC6800实验室D楼	CAM001160
d39_1	实验D楼315-2	1	ISC6800实验室D楼	CAM001161
d4_1	实验D楼5F走道-2	1	ISC6800实验室D楼	CAM001162
d40_1	实验D楼316	1	ISC6800实验室D楼	CAM001163
d41_1	实验D楼318-1	1	ISC6800实验室D楼	CAM001164
d42_1	实验D楼318-2	1	ISC6800实验室D楼	CAM001165
d43_1	实验D楼104	1	ISC6800实验室D楼	CAM001166
d44_1	实验D楼320	1	ISC6800实验室D楼	CAM001167
d45_1	实验D楼322	1	ISC6800实验室D楼	CAM001168
d46_1	实验D楼326	1	ISC6800实验室D楼	CAM001169
d47_1	实验D楼328	1	ISC6800实验室D楼	CAM001170
d48_1	实验D楼330	1	ISC6800实验室D楼	CAM001171
d49_1	实验D楼3F走道1	1	ISC6800实验室D楼	CAM001172
d5_1	实验D楼110	1	ISC6800实验室D楼	CAM001173
d50_1	实验D楼3F走道2	1	ISC6800实验室D楼	CAM001174
d51_1	实验D楼404	1	ISC6800实验室D楼	CAM001175
d52_1	实验D楼405	1	ISC6800实验室D楼	CAM001176
d53_1	实验D楼406-1	1	ISC6800实验室D楼	CAM001177
d55_1	实验D楼406-2	1	ISC6800实验室D楼	CAM001178
d56_1	实验D楼407-1	1	ISC6800实验室D楼	CAM001179
d57_1	实验D楼407-2	1	ISC6800实验室D楼	CAM001180
d58_1	实验D楼408	1	ISC6800实验室D楼	CAM001181
d59_1	实验D楼410	1	ISC6800实验室D楼	CAM001182
d6_1	实验D楼1F走道2	1	ISC6800实验室D楼	CAM001183
d60_1	实验D楼411	1	ISC6800实验室D楼	CAM001184
d61_1	实验D楼412	1	ISC6800实验室D楼	CAM001185
d62_1	实验D楼413	1	ISC6800实验室D楼	CAM001186
d63_1	实验D楼414	1	ISC6800实验室D楼	CAM001187
d64_1	实验D楼415-1	1	ISC6800实验室D楼	CAM001188
d65_1	实验D楼106	1	ISC6800实验室D楼	CAM001189
d66_1	实验D楼415-2	1	ISC6800实验室D楼	CAM001190
d69_1	实验D楼422-1	1	ISC6800实验室D楼	CAM001191
d70_1	实验D楼420	1	ISC6800实验室D楼	CAM001192
d71_1	实验D楼424-1	1	ISC6800实验室D楼	CAM001193
d72_1	实验D楼424-2	1	ISC6800实验室D楼	CAM001194
d73_1	实验D楼4F走道1	1	ISC6800实验室D楼	CAM001195
d74_1	实验D楼4F走道2	1	ISC6800实验室D楼	CAM001196
d75_1	实验D楼504-1	1	ISC6800实验室D楼	CAM001197
d77_1	实验D楼504-2	1	ISC6800实验室D楼	CAM001198
d78_1	实验D楼504-3	1	ISC6800实验室D楼	CAM001199
d79_1	实验D楼505-1	1	ISC6800实验室D楼	CAM001200
d8_1	实验D楼203	1	ISC6800实验室D楼	CAM001201
d80_1	实验D楼505-2	1	ISC6800实验室D楼	CAM001202
d81_1	实验D楼505-3	1	ISC6800实验室D楼	CAM001203
d82_1	实验D楼506-1	1	ISC6800实验室D楼	CAM001204
d83_1	实验D楼506-2	1	ISC6800实验室D楼	CAM001205
d84_1	实验D楼506-3	1	ISC6800实验室D楼	CAM001206
d85_1	实验D楼507-1	1	ISC6800实验室D楼	CAM001207
d86_1	实验D楼507-2	1	ISC6800实验室D楼	CAM001208
d87_1	实验D楼108	1	ISC6800实验室D楼	CAM001209
d88_1	实验D楼507-3	1	ISC6800实验室D楼	CAM001210
d89_1	实验D楼508	1	ISC6800实验室D楼	CAM001211
d9_1	实验D楼204	1	ISC6800实验室D楼	CAM001212
d90_1	实验D楼510	1	ISC6800实验室D楼	CAM001213
d91_1	实验D楼512	1	ISC6800实验室D楼	CAM001214
d92_1	实验D楼514	1	ISC6800实验室D楼	CAM001215
d93_1	实验D楼516-1	1	ISC6800实验室D楼	CAM001216
d94_1	实验D楼516-2	1	ISC6800实验室D楼	CAM001217
d95_1	实验D楼516-3	1	ISC6800实验室D楼	CAM001218
d96_1	实验D楼518-1	1	ISC6800实验室D楼	CAM001219
d97_1	实验D楼518-2	1	ISC6800实验室D楼	CAM001220
hic5401e-222-2_1	实验楼CD间路口南向	1	平台摄像机	CAM001221
hic5401e-222-3_1	实验楼CD间路口北向	1	平台摄像机	CAM001222
hic5401e-222-4_1	实验楼CD间路口东向	1	平台摄像机	CAM001223
hic5401e-232-128-1	实验楼花坛北向	1	平台摄像机	CAM001224
HXG1_1	化学馆5F走道2	1	化学馆实验室  2024	CAM001225
HXG10_1	化学馆2F走道1	1	化学馆实验室  2024	CAM001226
HXG11_1	化学馆208-210	1	化学馆实验室  2024	CAM001227
HXG12_1	化学馆214-2	1	化学馆实验室  2024	CAM001228
HXG13_1	化学馆216	1	化学馆实验室  2024	CAM001229
HXG14_1	化学馆214-1	1	化学馆实验室  2024	CAM001230
HXG15_1	化学馆218	1	化学馆实验室  2024	CAM001231
HXG16_1	化学馆220	1	化学馆实验室  2024	CAM001232
HXG17_1	化学馆222	1	化学馆实验室  2024	CAM001233
HXG18_1	化学馆238-240	1	化学馆实验室  2024	CAM001234
HXG2_1	化学馆5F走道3	1	化学馆实验室  2024	CAM001235
HXG20_1	化学馆245	1	化学馆实验室  2024	CAM001236
HXG21_1	化学馆247	1	化学馆实验室  2024	CAM001237
HXG22_1	化学馆253	1	化学馆实验室  2024	CAM001238
HXG231_1	化学馆255-1	1	化学馆实验室  2024	CAM001239
HXG241_1	化学馆255-2	1	化学馆实验室  2024	CAM001240
HXG251_1	化学馆261	1	化学馆实验室  2024	CAM001241
HXG261_1	化学馆263	1	化学馆实验室  2024	CAM001242
HXG27_1	化学馆2F走道2	1	化学馆实验室  2024	CAM001243
HXG28_1	化学馆2F走道3	1	化学馆实验室  2024	CAM001244
HXG29_1	化学馆2F走道4	1	化学馆实验室  2024	CAM001245
HXG3_1	化学馆5F走道4	1	化学馆实验室  2024	CAM001246
HXG30_1	化学馆2F走道5	1	化学馆实验室  2024	CAM001247
HXG31_1	化学馆301-303	1	化学馆实验室  2024	CAM001248
HXG32_1	化学馆305-307	1	化学馆实验室  2024	CAM001249
HXG33_1	化学馆308-310	1	化学馆实验室  2024	CAM001250
HXG34_1	化学馆309-311	1	化学馆实验室  2024	CAM001251
HXG35_1	化学馆312	1	化学馆实验室  2024	CAM001252
HXG36_1	化学馆316	1	化学馆实验室  2024	CAM001253
HXG37_1	化学馆318	1	化学馆实验室  2024	CAM001254
HXG38_1	化学馆320	1	化学馆实验室  2024	CAM001255
HXG4_1	化学馆430	1	化学馆实验室  2024	CAM001256
HXG40_1	化学馆342	1	化学馆实验室  2024	CAM001257
HXG41_1	化学馆343-1	1	化学馆实验室  2024	CAM001258
HXG42_1	化学馆343-2	1	化学馆实验室  2024	CAM001259
HXG432_1	化学楼459-461-2	1	化学馆实验室  2024	CAM001260
HXG44_1	化学馆344	1	化学馆实验室  2024	CAM001261
HXG45_1	化学馆345	1	化学馆实验室  2024	CAM001262
HXG46_1	化学馆347	1	化学馆实验室  2024	CAM001263
HXG47_1	化学馆348	1	化学馆实验室  2024	CAM001264
HXG48_1	化学馆350-1	1	化学馆实验室  2024	CAM001265
HXG49_1	化学馆350-2	1	化学馆实验室  2024	CAM001266
HXG5_1	化学楼2楼机房	1	化学馆实验室  2024	CAM001267
HXG50_1	化学馆359	1	化学馆实验室  2024	CAM001268
HXG51_1	化学馆3F走道1	1	化学馆实验室  2024	CAM001269
HXG52_1	化学馆3F走道2	1	化学馆实验室  2024	CAM001270
HXG53_1	化学馆3F走道3	1	化学馆实验室  2024	CAM001271
HXG541_1	化学楼457	1	化学馆实验室  2024	CAM001272
HXG55_1	化学馆3F走道4	1	化学馆实验室  2024	CAM001273
HXG56_1	化学馆401-403	1	化学馆实验室  2024	CAM001274
HXG57_1	化学馆402	1	化学馆实验室  2024	CAM001275
HXG58_1	化学馆404	1	化学馆实验室  2024	CAM001276
HXG59_1	化学馆405	1	化学馆实验室  2024	CAM001277
HXG6_1	化学馆115	1	化学馆实验室  2024	CAM001278
HXG60_1	化学馆407	1	化学馆实验室  2024	CAM001279
HXG61_1	化学馆410-1	1	化学馆实验室  2024	CAM001280
HXG62_1	化学馆410-2	1	化学馆实验室  2024	CAM001281
HXG63_1	化学馆414	1	化学馆实验室  2024	CAM001282
HXG65_1	化学馆110	1	化学馆实验室  2024	CAM001283
HXG66_1	化学馆453	1	化学馆实验室  2024	CAM001284
HXG67_1	化学馆422-1	1	化学馆实验室  2024	CAM001285
HXG68_1	化学馆422-2	1	化学馆实验室  2024	CAM001286
HXG69_1	化学馆445	1	化学馆实验室  2024	CAM001287
HXG7_1	化学馆1F走道1	1	化学馆实验室  2024	CAM001288
HXG70_1	化学馆443-1	1	化学馆实验室  2024	CAM001289
HXG72_1	化学馆448-1	1	化学馆实验室  2024	CAM001290
HXG73_1	化学馆448-2	1	化学馆实验室  2024	CAM001291
HXG74_1	化学馆448-3	1	化学馆实验室  2024	CAM001292
HXG75_1	化学馆4F走道1	1	化学馆实验室  2024	CAM001293
HXG76_1	化学馆112	1	化学馆实验室  2024	CAM001294
HXG77_1	化学馆4F走道2	1	化学馆实验室  2024	CAM001295
HXG78_1	化学馆4F走道3	1	化学馆实验室  2024	CAM001296
HXG79_1	化学馆4F走道4	1	化学馆实验室  2024	CAM001297
HXG8_1	化学馆1F走道3	1	化学馆实验室  2024	CAM001298
HXG80_1	化学馆509	1	化学馆实验室  2024	CAM001299
HXG81_1	化学馆510-1	1	化学馆实验室  2024	CAM001300
HXG82_1	化学馆510-2	1	化学馆实验室  2024	CAM001301
HXG83_1	化学馆511	1	化学馆实验室  2024	CAM001302
HXG84_1	化学馆512-1	1	化学馆实验室  2024	CAM001303
HXG85_1	化学馆512-2	1	化学馆实验室  2024	CAM001304
HXG86_1	化学馆516	1	化学馆实验室  2024	CAM001305
HXG87_1	化学馆114	1	化学馆实验室  2024	CAM001306
HXG88_1	化学馆518	1	化学馆实验室  2024	CAM001307
HXG89_1	化学馆522	1	化学馆实验室  2024	CAM001308
HXG9_1	化学馆1F走道4	1	化学馆实验室  2024	CAM001309
HXG90_1	化学馆543-1	1	化学馆实验室  2024	CAM001310
HXG91_1	化学馆543-2	1	化学馆实验室  2024	CAM001311
HXG92_1	化学馆545-1	1	化学馆实验室  2024	CAM001312
HXG93_1	化学馆545-2	1	化学馆实验室  2024	CAM001313
HXG94_1	化学馆547	1	化学馆实验室  2024	CAM001314
HXG95_1	化学馆549	1	化学馆实验室  2024	CAM001315
HXG96_1	化学馆551	1	化学馆实验室  2024	CAM001316
HXG97_1	化学馆5F走道1	1	化学馆实验室  2024	CAM001317
SXCXZ	实验C群楼新增1	1	ISC6800实验室C楼	CAM001318
SYLXZ2	实验C裙楼新增2	1	ISC6800实验室C楼	CAM001319
SYLXZ3	实验C裙楼新增3	1	ISC6800实验室C楼	CAM001320
ZHL640_1	实验C裙楼新增00	1	ISC6800实验室C楼	CAM001321
\.


--
-- Data for Name: t_cameras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_cameras (id, name, rtsp_id, lab_id, x, y, height, heading, pitch) FROM stdin;
\.


--
-- Data for Name: t_eventpara; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_eventpara (id, camera_id, event_id, para) FROM stdin;
1	1	1	{"mask": "区域A"}
2	2	2	{"mask": "区域B"}
3	3	3	{"mask": "区域C"}
4	4	1	{"mask": "区域D"}
5	5	2	{"mask": "区域E"}
\.


--
-- Data for Name: t_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_events (id, name, description, structured_params) FROM stdin;
1	占用安全通道	检测到有人占用了安全通道，影响通行安全	{"restricted_area": "安全通道"}
2	未穿着白大褂	检测到实验人员未穿着白大褂，存在安全隐患	{"required_attire": "白大褂"}
3	夜间一人做实验	检测到22:00至次日8:00时间段内仅有一人在实验室工作	{"time_range": "22:00-08:00", "min_person_count": 2}
\.


--
-- Data for Name: t_floors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_floors (id, building_id, floor_plan) FROM stdin;
1	1	\N
2	1	\N
3	1	\N
4	2	\N
5	2	\N
6	2	\N
7	3	\N
8	3	\N
9	3	\N
10	4	\N
11	4	\N
12	4	\N
13	5	\N
14	5	\N
15	5	\N
\.


--
-- Data for Name: t_labs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_labs (id, name, room_no, floor_id, administrator, phone_no, risk_level, lab_type, room_plan) FROM stdin;
1	Lab-105	105	1	张三	13800000001	2	化学实验	\N
2	Lab-210	210	2	李四	13800000002	3	物理实验	\N
3	Lab-304	304	3	王五	13800000003	1	生物实验	\N
4	Lab-421	421	4	赵六	13800000004	2	海洋实验	\N
5	Lab-502	502	5	钱七	13800000005	3	数学实验	\N
6	Lab-615	615	1	孙八	13800000006	2	地质实验	\N
7	Lab-342	342	2	周九	13800000007	1	环境实验	\N
8	Lab-253	253	3	吴十	13800000008	2	医学实验	\N
9	Lab-109	109	4	郑一	13800000009	3	材料实验	\N
10	Lab-468	468	5	冯二	13800000010	1	食品实验	\N
\.


--
-- Data for Name: t_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_logs (id, type, content, "time") FROM stdin;
1	INFO	系统启动成功	2025-06-20 08:00:00
2	WARN	摄像头RTSP连接失败	2025-06-20 09:15:00
3	ERROR	模型加载失败	2025-06-21 10:30:00
4	INFO	抽检任务开始	2025-06-22 11:45:00
5	DEBUG	事件检测中间结果	2025-06-23 12:00:00
\.


--
-- Data for Name: t_models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_models (id, name, event_id, modelfile, configfile, date) FROM stdin;
1	模型A	1	modelA.bin	configA.json	2025-06-01
2	模型B	2	modelB.bin	configB.json	2025-06-05
3	模型C	3	modelC.bin	configC.json	2025-06-10
4	模型D	1	modelD.bin	configD.json	2025-06-15
5	模型E	2	modelE.bin	configE.json	2025-06-20
\.


--
-- Data for Name: t_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_permissions (id, lab_id_list) FROM stdin;
1	[1, 2, 3]
2	[4, 5]
3	[6, 7, 8, 9]
4	[2, 4, 6]
5	[10]
6	[1, 2, 3]
7	[4, 5]
8	[6, 7, 8, 9]
9	[2, 4, 6]
10	[10]
\.


--
-- Data for Name: t_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_results (id, task_id, event_id, description, time1, time2, picture1, picture2, picture3) FROM stdin;
2	2	2	0.88	2025-06-21 09:15:00	2025-06-21 09:20:00	\N	\N	\N
4	4	4	0.97	2025-06-23 11:45:00	2025-06-23 11:50:00	\N	\N	\N
3	3	3	0.92	2025-06-22 10:30:00	2025-06-22 10:35:00	\N	\N	\N
1	1	1	0.95	2025-06-20 08:00:00	2025-06-20 08:05:00	\N	\N	\N
5	5	5	0.99	2025-06-24 12:00:00	2025-06-24 12:05:00	\N	\N	\N
\.


--
-- Data for Name: t_results_whitecoat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_results_whitecoat (id, "timestamp", room_id, camera_id, alarm_category, photo, message) FROM stdin;
\.


--
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_roles (id, name, description) FROM stdin;
1	管理员	系统最高权限，拥有所有功能
2	普通用户	一般用户，权限受限
3	审核员	负责审核和管理任务
4	访客	只读权限
5	维护员	系统维护相关权限
\.


--
-- Data for Name: t_rtsp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_rtsp (id, res_code, res_name, res_type, res_sub_type, res_status, res_ext_status, res_is_be_share, org_code, stream_num, res_is_foreign, org_name, res_attribute, dev_encode_set, voice_status, has_brd_sub_res, is_bind, res_bind_code, sub_type_of_sub_type, is_super_ipc, is_cam_in_complex_ipc, reserve) FROM stdin;
\.


--
-- Data for Name: t_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_tasks (id, date, camera_id) FROM stdin;
6	2025-07-02	1
7	2025-07-02	2
8	2025-07-02	3
9	2025-07-02	4
10	2025-07-02	5
11	2025-07-02	6
12	2025-07-02	7
13	2025-07-02	8
14	2025-07-02	9
15	2025-07-02	10
16	2025-07-02	11
17	2025-07-02	12
18	2025-07-02	13
19	2025-07-02	14
20	2025-07-02	15
21	2025-07-02	16
22	2025-07-02	17
23	2025-07-02	18
24	2025-07-02	19
25	2025-07-02	20
26	2025-07-02	21
27	2025-07-02	22
28	2025-07-02	23
29	2025-07-02	24
30	2025-07-02	25
31	2025-07-02	26
32	2025-07-02	27
33	2025-07-02	28
34	2025-07-02	29
35	2025-07-02	30
36	2025-07-02	31
37	2025-07-02	32
38	2025-07-02	33
39	2025-07-02	34
40	2025-07-02	35
41	2025-07-02	36
42	2025-07-02	37
43	2025-07-02	38
44	2025-07-02	39
45	2025-07-02	40
46	2025-07-02	41
47	2025-07-02	42
48	2025-07-02	43
49	2025-07-02	44
\.


--
-- Data for Name: t_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_users (id, realname, username, password, role_id, permission_id) FROM stdin;
1	张三	zhangsan	123456	1	1
2	李四	lisi	abcdef	2	2
3	王五	wangwu	password	1	1
4	赵六	zhaoliu	qwerty	3	3
5	钱七	qianqi	letmein	2	2
\.


--
-- Name: t_buildings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_buildings_id_seq', 5, true);


--
-- Name: t_cameras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_cameras_id_seq', 1, false);


--
-- Name: t_eventpara_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_eventpara_id_seq', 5, true);


--
-- Name: t_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_events_id_seq', 3, true);


--
-- Name: t_floors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_floors_id_seq', 15, true);


--
-- Name: t_labs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_labs_id_seq', 10, true);


--
-- Name: t_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_logs_id_seq', 5, true);


--
-- Name: t_models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_models_id_seq', 5, true);


--
-- Name: t_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_permissions_id_seq', 10, true);


--
-- Name: t_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_results_id_seq', 5, true);


--
-- Name: t_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_roles_id_seq', 5, true);


--
-- Name: t_rtsp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_rtsp_id_seq', 1, false);


--
-- Name: t_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_tasks_id_seq', 49, true);


--
-- Name: t_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_users_id_seq', 5, true);


--
-- Name: t_buildings t_buildings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_buildings
    ADD CONSTRAINT t_buildings_pkey PRIMARY KEY (id);


--
-- Name: t_camera_info t_camera_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_camera_info
    ADD CONSTRAINT t_camera_info_pkey PRIMARY KEY (id);


--
-- Name: t_cameras t_cameras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_cameras
    ADD CONSTRAINT t_cameras_pkey PRIMARY KEY (id);


--
-- Name: t_eventpara t_eventpara_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_eventpara
    ADD CONSTRAINT t_eventpara_pkey PRIMARY KEY (id);


--
-- Name: t_events t_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_events
    ADD CONSTRAINT t_events_pkey PRIMARY KEY (id);


--
-- Name: t_floors t_floors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_floors
    ADD CONSTRAINT t_floors_pkey PRIMARY KEY (id);


--
-- Name: t_labs t_labs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_labs
    ADD CONSTRAINT t_labs_pkey PRIMARY KEY (id);


--
-- Name: t_logs t_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_logs
    ADD CONSTRAINT t_logs_pkey PRIMARY KEY (id);


--
-- Name: t_models t_models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_models
    ADD CONSTRAINT t_models_pkey PRIMARY KEY (id);


--
-- Name: t_permissions t_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_permissions
    ADD CONSTRAINT t_permissions_pkey PRIMARY KEY (id);


--
-- Name: t_results t_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_results
    ADD CONSTRAINT t_results_pkey PRIMARY KEY (id);


--
-- Name: t_roles t_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT t_roles_pkey PRIMARY KEY (id);


--
-- Name: t_rtsp t_rtsp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_rtsp
    ADD CONSTRAINT t_rtsp_pkey PRIMARY KEY (id);


--
-- Name: t_tasks t_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tasks
    ADD CONSTRAINT t_tasks_pkey PRIMARY KEY (id);


--
-- Name: t_users t_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_users
    ADD CONSTRAINT t_users_pkey PRIMARY KEY (id);


--
-- Name: t_users t_users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_users
    ADD CONSTRAINT t_users_username_key UNIQUE (username);


--
-- Name: t_floors t_floors_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_floors
    ADD CONSTRAINT t_floors_building_id_fkey FOREIGN KEY (building_id) REFERENCES public.t_buildings(id);


--
-- Name: t_labs t_labs_floor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_labs
    ADD CONSTRAINT t_labs_floor_id_fkey FOREIGN KEY (floor_id) REFERENCES public.t_floors(id);


--
-- PostgreSQL database dump complete
--

