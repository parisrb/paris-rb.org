--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: simonc
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO simonc;

--
-- Name: rails_admin_histories; Type: TABLE; Schema: public; Owner: simonc
--

CREATE TABLE public.rails_admin_histories (
    id integer NOT NULL,
    message text,
    username character varying(255),
    item integer,
    "table" character varying(255),
    month smallint,
    year bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.rails_admin_histories OWNER TO simonc;

--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: simonc
--

CREATE SEQUENCE public.rails_admin_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rails_admin_histories_id_seq OWNER TO simonc;

--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simonc
--

ALTER SEQUENCE public.rails_admin_histories_id_seq OWNED BY public.rails_admin_histories.id;


--
-- Name: rake_tasks; Type: TABLE; Schema: public; Owner: simonc
--

CREATE TABLE public.rake_tasks (
    id bigint NOT NULL,
    version character varying
);


ALTER TABLE public.rake_tasks OWNER TO simonc;

--
-- Name: rake_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: simonc
--

CREATE SEQUENCE public.rake_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rake_tasks_id_seq OWNER TO simonc;

--
-- Name: rake_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simonc
--

ALTER SEQUENCE public.rake_tasks_id_seq OWNED BY public.rake_tasks.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: simonc
--

CREATE TABLE public.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO simonc;

--
-- Name: sponsors; Type: TABLE; Schema: public; Owner: simonc
--

CREATE TABLE public.sponsors (
    id integer NOT NULL,
    name character varying(255),
    website character varying(255),
    logo character varying(255),
    "from" timestamp without time zone,
    until timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.sponsors OWNER TO simonc;

--
-- Name: sponsors_id_seq; Type: SEQUENCE; Schema: public; Owner: simonc
--

CREATE SEQUENCE public.sponsors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sponsors_id_seq OWNER TO simonc;

--
-- Name: sponsors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simonc
--

ALTER SEQUENCE public.sponsors_id_seq OWNED BY public.sponsors.id;


--
-- Name: talks; Type: TABLE; Schema: public; Owner: simonc
--

CREATE TABLE public.talks (
    id integer NOT NULL,
    title character varying(255),
    speaker_name character varying(255),
    speaker_email character varying(255),
    level character varying(255),
    duration character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    happened_on date,
    slides character varying(255),
    video_url character varying(255),
    speaker_twitter character varying(255),
    preferred_month_talk character varying(255),
    time_position timestamp without time zone,
    pitch text
);


ALTER TABLE public.talks OWNER TO simonc;

--
-- Name: talks_id_seq; Type: SEQUENCE; Schema: public; Owner: simonc
--

CREATE SEQUENCE public.talks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.talks_id_seq OWNER TO simonc;

--
-- Name: talks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simonc
--

ALTER SEQUENCE public.talks_id_seq OWNED BY public.talks.id;


--
-- Name: tweets; Type: TABLE; Schema: public; Owner: simonc
--

CREATE TABLE public.tweets (
    id integer NOT NULL,
    text character varying(255),
    author character varying(255),
    twitter_handle character varying(255),
    cool_projects character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.tweets OWNER TO simonc;

--
-- Name: tweets_id_seq; Type: SEQUENCE; Schema: public; Owner: simonc
--

CREATE SEQUENCE public.tweets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tweets_id_seq OWNER TO simonc;

--
-- Name: tweets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simonc
--

ALTER SEQUENCE public.tweets_id_seq OWNED BY public.tweets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: simonc
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO simonc;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: simonc
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO simonc;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simonc
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: videos; Type: TABLE; Schema: public; Owner: simonc
--

CREATE TABLE public.videos (
    id integer NOT NULL,
    vimeo_url character varying(255),
    vimeo_thumbnail character varying(255),
    title character varying(255),
    description text,
    event_date date,
    slug character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.videos OWNER TO simonc;

--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: simonc
--

CREATE SEQUENCE public.videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videos_id_seq OWNER TO simonc;

--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simonc
--

ALTER SEQUENCE public.videos_id_seq OWNED BY public.videos.id;


--
-- Name: rails_admin_histories id; Type: DEFAULT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.rails_admin_histories ALTER COLUMN id SET DEFAULT nextval('public.rails_admin_histories_id_seq'::regclass);


--
-- Name: rake_tasks id; Type: DEFAULT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.rake_tasks ALTER COLUMN id SET DEFAULT nextval('public.rake_tasks_id_seq'::regclass);


--
-- Name: sponsors id; Type: DEFAULT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.sponsors ALTER COLUMN id SET DEFAULT nextval('public.sponsors_id_seq'::regclass);


--
-- Name: talks id; Type: DEFAULT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.talks ALTER COLUMN id SET DEFAULT nextval('public.talks_id_seq'::regclass);


--
-- Name: tweets id; Type: DEFAULT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.tweets ALTER COLUMN id SET DEFAULT nextval('public.tweets_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: videos id; Type: DEFAULT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.videos ALTER COLUMN id SET DEFAULT nextval('public.videos_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: simonc
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-02-11 18:08:55.267849	2019-02-11 18:08:55.267849
\.


--
-- Data for Name: rails_admin_histories; Type: TABLE DATA; Schema: public; Owner: simonc
--

COPY public.rails_admin_histories (id, message, username, item, "table", month, year, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: rake_tasks; Type: TABLE DATA; Schema: public; Owner: simonc
--

COPY public.rake_tasks (id, version) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: simonc
--

COPY public.schema_migrations (version) FROM stdin;
20140106172254
20131124225118
20131201175242
20131201202915
20140106172253
20140107180320
20140220114849
20140221114249
20140224181029
20140702174558
20141104103459
20170812131957
20170812140829
20170812155652
20190112012520
20190211181458
\.


--
-- Data for Name: sponsors; Type: TABLE DATA; Schema: public; Owner: simonc
--

COPY public.sponsors (id, name, website, logo, "from", until, created_at, updated_at) FROM stdin;
29	Numa	https://paris-en.numa.co/	v1465226571/dkajpqx60qirjmlhgit4.png	2016-11-30 23:00:00	2016-12-30 23:00:00	2016-06-06 15:22:49.469639	2016-11-24 09:28:13.413419
34	Scalingo	http://scalingo.com	v1491822288/vrkte7eqvwng47bnof3a.png	2017-04-10 05:00:00	2017-06-14 22:00:00	2017-04-10 11:04:14.633405	2017-04-10 11:04:48.784686
19	Marcel.cab	http://marcel.cab/	v1417436734/adajhmgyr4twyzo9hxng.png	2014-11-30 23:00:00	2014-12-30 23:00:00	2014-12-01 12:24:34.019332	2014-12-01 12:25:34.358723
10	Simplon	http://simplon.co/	v1391204349/ptfi68hqnduiaycr9khp.png	2013-01-29 23:00:00	2014-01-29 23:00:00	2014-01-31 13:58:26.037642	2016-01-30 12:15:41.266076
11	Freelance Booking	http://freelancebooking.pro	v1391204333/qydnd1xyx1uqdohhhelh.jpg	2013-01-29 23:00:00	2016-01-29 23:00:00	2014-01-31 13:59:30.550626	2016-01-30 12:15:55.579343
21	Breaz.io	breaz.io	v1417546253/mxewwl3bx4zxyevafopf.png	2015-10-05 22:00:00	2015-11-01 23:00:00	2014-12-02 18:49:51.00467	2015-09-21 16:02:00.883395
16	Les Jeudis	http://www.lesjeudis.com/	v1401805761/ktsrb34eqqpcipyczeme.png	2014-06-02 22:00:00	2015-05-31 22:00:00	2014-06-03 14:27:25.957684	2014-06-03 14:29:21.450204
9	Shopify	http://www.shopify.com/	v1391204362/thp1dfpwd6vtmecab4xw.png	\N	2014-02-27 23:00:00	2014-01-31 13:55:39.388032	2014-03-01 18:19:06.762315
8	Google	http://google.fr	v1391204383/szqrpstuin4j2glxpaw5.jpg	\N	2014-02-27 23:00:00	2014-01-31 13:55:11.687759	2014-03-01 18:19:19.870988
6	Human Coders	http://humancoders.com/	v1391204417/tqwgyeiof6bfspucndk7.png	\N	2014-02-27 23:00:00	2014-01-31 13:53:53.28145	2014-03-01 18:19:30.87959
5	Jumboweb	http://www.jumboweb.fr/	v1391204433/esw3ihmiyjfkvz1e6fls.jpg	\N	2014-02-27 23:00:00	2014-01-31 13:50:42.728294	2014-03-01 18:19:40.006501
4	Simplib	http://simplib.com/	v1391204446/m2e3zfhghxin4kc6r1tx.jpg	\N	2014-02-27 23:00:00	2014-01-31 13:49:51.614712	2014-03-01 18:19:50.470233
14	Followanalytics	http://follow-apps.com/	v1401806153/rnvyzyijxnj2abqxezhl.png	2014-06-02 22:00:00	2014-08-03 22:00:00	2014-06-03 14:21:22.942568	2014-06-03 14:35:53.819078
7	Mipise	http://www.mipise.com/	v1391204399/sriqrtn6uiylxoe4tuqu.png	2014-10-01 22:00:00	2014-11-12 23:00:00	2014-01-31 13:54:28.396953	2014-12-02 18:51:36.560413
13	Appsdeck	https://appsdeck.eu/	v1399400070/iswlftjhkcztty0z3h0f.jpg	\N	2014-06-01 22:00:00	2014-05-06 18:14:29.229486	2014-06-03 14:41:05.5014
15	Vodeclic	http://www.vodeclic.com/fr	v1401806411/xmyrl4ga2k8xkna2a2xk.png	2014-06-02 22:00:00	2014-06-30 22:00:00	2014-06-03 14:26:24.664984	2014-06-30 11:46:20.226251
23	Vodeclic	http://www.vodeclic.com/	v1446212403/ws3hdjgnl2r8mc1gbi8t.png	2015-10-29 23:00:00	2016-11-29 23:00:00	2015-10-30 13:40:03.282669	2015-10-30 13:40:03.282669
17	Fitnext	http://www.fitnext.com/	v1404129148/sccibzenhbux2x2wnacr.jpg	2014-06-30 22:00:00	2014-08-04 22:00:00	2014-06-30 11:47:47.209092	2014-06-30 11:52:28.205477
20	42	42.fr	v1417436824/hmj5puyypy2xplm2f3ch.png	2014-12-31 23:00:00	2015-11-29 23:00:00	2014-12-01 12:27:04.355841	2015-12-01 12:46:55.304181
3	Epita	http://epita.fr	v1391204465/audlcyaxeqzrexxjypfe.jpg	2014-12-31 23:00:00	2015-11-29 23:00:00	2014-01-31 13:48:56.771285	2015-12-01 12:47:23.159266
2	Epitech	http://epitech.eu/	v1391204477/awg3irvbyk6scb5hgl6p.png	2014-12-31 23:00:00	2015-11-29 23:00:00	2014-01-31 13:40:31.429866	2015-12-01 12:47:33.10482
27	TopFive	http://www.top-five.fr/	v1459766143/fbrywuvbfcni4z43siev.png	2016-04-03 22:00:00	2016-04-03 22:00:00	2016-04-04 10:33:43.207982	2016-04-04 10:49:32.452168
24	NUMA	numa.paris	v1448974934/dvxnlk4agrhrsjd9riz6.png	2015-11-30 23:00:00	2015-12-30 23:00:00	2015-12-01 12:46:24.17043	2015-12-01 13:02:14.56862
28	Talent.io	http://www.talent.io	v1480585720/mdsxjottz54h4w0o6kcp.png	2016-11-30 23:00:00	2016-12-30 23:00:00	2016-05-03 17:21:56.940133	2016-12-01 09:48:40.214488
30	Logmatic.io	http://logmatic.io/	v1469092690/cm1l8ccvsyc3mtsrkqri.png	2016-12-31 23:00:00	2017-01-31 23:00:00	2016-07-21 09:15:19.499116	2017-01-03 13:31:26.624574
36	Hired	https://hired.com	v1493723823/jcqgwbl9wa3pz1u19pwa.png	2017-05-01 22:00:00	2017-06-04 22:00:00	2017-05-02 11:16:17.434436	2017-05-02 11:17:03.739595
26	Le Wagon	lewagon.org	v1453219415/a8byeq0daj7cqjeaiyew.png	2016-10-02 22:00:00	2016-10-30 23:00:00	2016-01-19 16:03:35.24564	2016-10-04 16:04:59.868767
22	JobTeaser	http://www.jobteaser.com/	v1442851530/c3l8qdrgy8vho6fabjkn.png	2017-01-31 23:00:00	2017-02-27 23:00:00	2015-09-21 15:57:22.551637	2017-02-06 19:21:22.202193
31	Drivy	drivy.com	v1499171913/pd2wa7wseh7cabwn7scw.png	2017-06-26 22:00:00	2017-07-27 22:00:00	2016-09-06 17:26:57.416231	2017-07-04 12:38:33.018824
33	KeyCoopt	https://www.keycoopt.com/	v1486409098/es4evknso7fp4bd5nrgs.png	2017-01-31 23:00:00	2017-07-30 22:00:00	2017-02-06 19:22:12.00516	2017-03-07 13:54:30.940099
37	Kosmogo	https://www.kosmogo.com/	v1499172075/aq9rzykrxfkgs8gh4wmh.png	2017-07-02 22:00:00	2018-07-03 22:00:00	2017-07-04 12:37:56.781311	2017-07-04 12:41:15.339929
35	Doctolib	doctolib.com	image/upload/v1549227136/jaaw1wi31ealkpij0afk.png	\N	\N	2017-04-10 13:32:57.927022	2019-02-03 20:52:16.515197
38	Appaloosa	https://www.appaloosa-store.com/	v1504260280/onvqg6gtoznpi9hylwnx.png	2017-08-31 22:00:00	2017-11-29 23:00:00	2017-09-01 10:02:17.336313	2017-09-01 10:04:40.145695
12	ChooseYourBoss	http://chooseyourboss.com/?utm_source=MeetUp-Ruby-fevrier&utm_medium=link&utm_campaign=Meetup-ruby-fevrier	image/upload/v1516631190/ezgcnxbxroddrqautujn.png	2018-01-21 23:00:00	2019-01-22 23:00:00	2014-03-01 18:16:32.093918	2018-01-22 14:31:14.816589
32	Hexagonal Consulting	http://hexagonalconsulting.com/	v1483452876/wo1v9thtfx3dxf9d4ftv.png	\N	2018-02-06 23:00:00	2017-01-03 14:04:30.278736	2018-01-22 14:37:27.574135
25	ESGI	esgi.fr	v1448974827/v1ad4nt4onljwoz5qvaz.jpg	\N	2018-01-20 23:00:00	2015-12-01 12:48:14.38441	2018-01-22 14:39:02.235387
18	Aircall	https://aircall.io/	image/upload/v1512486499/l1utrpg3fisrwghhuduk.png	\N	2018-01-20 23:00:00	2014-07-29 11:32:41.566496	2018-01-22 14:39:28.623573
42	KissKissBankBank	https://www.kisskissbankbank.com/	image/upload/v1538500590/huawuxmyg5negubirblz.png	\N	\N	2018-10-02 17:12:46.950334	2018-10-02 17:16:30.650468
39	Freelance Academy	https://freelance.academy/	image/upload/v1512486078/lruei3fd2sntanspyxj1.png	2017-12-03 23:00:00	2018-01-09 23:00:00	2017-12-05 15:01:17.92118	2017-12-05 15:38:48.616268
40	Microsoft	https://www.microsoftevents.com/profile/form/index.cfm?PKformID=0x3095443abcd&ls=Website&lsd=AzureWebsite	image/upload/v1516201956/xlufj0bkhgk8krkbvdfu.png	\N	2019-02-01 00:00:00	2018-01-17 15:12:35.955677	2018-01-17 15:19:20.206782
41	Malt	malt.fr	image/upload/v1535466849/v4ujepwzjt2wfm29bkmf.png	\N	\N	2018-08-28 14:34:08.841741	2018-08-28 14:34:08.841741
43	Github	https://github.com/	image/upload/v1543778353/z6yaet8fxggdfjo6rlvg.png	\N	\N	2018-12-02 19:19:13.434772	2018-12-02 19:19:13.434772
\.


--
-- Data for Name: talks; Type: TABLE DATA; Schema: public; Owner: simonc
--

COPY public.talks (id, title, speaker_name, speaker_email, level, duration, created_at, updated_at, happened_on, slides, video_url, speaker_twitter, preferred_month_talk, time_position, pitch) FROM stdin;
202	Ruralité et numérique	Mathieu CARBONEL	carbonel.mathieu@gmail.com	easy	lightning	2015-04-13 12:55:28.014754	2015-04-13 12:55:28.014754	\N	\N	\N	\N	\N	\N	\N
7	GetText, une alternative à i18n standard	Sylvain Abélard	sly@gouv.be	beginner	lightning	\N	\N	2011-01-01	http://fr.slideshare.net/abelar_s/gettext-rails-fr	\N	\N	\N	\N	\N
8	Rails Devise Cancan	Benjamin Lan Sun Luk	lsl.benjamin@gmail.com	beginner	lightning	\N	\N	2011-11-08	\N	/videos/rails-devise-cancan	\N	\N	\N	\N
9	RubyLive	Matthieu Segret	matthieu.segret@gmail.com	beginner	lightning	\N	\N	2011-11-08	\N	/videos/rubylive-matthieu-segret	\N	\N	\N	\N
10	Commander	Simon Courtois	scourtois@cubyx.fr	intermediate	lightning	\N	\N	2011-11-08	\N	/videos/commander-simon-courtois	\N	\N	\N	\N
11	Ruby On Rails	Thibaut Assus	thibaut@milesrock.com	intermediate	lightning	\N	\N	2011-11-08	\N	/videos/ruby-on-rails-livecoding-thibaut-assus	\N	\N	\N	\N
12	Présentation de MongoDB / Mongoid	Benjamin Lan Sun Luk	lsl.benjamin@gmail.com	beginner	lightning	\N	\N	2011-12-06	\N	/videos/presentation-de-mongodb-mongoid	\N	\N	\N	\N
13	Cucumber et Pivotal Tracker	Thibaut Assus	Thibaut@milesrock.com	intermediate	lightning	\N	\N	2011-12-06	\N	/videos/cucumber-et-pivotal-tracker-thibaut-assus	\N	\N	\N	\N
14	Retour d'expérience sur Liquid, et présentation de Solid	Jean Boussier	jean.boussier@tigerlilyapps.com	intermediate	long	\N	\N	2012-01-10	\N	\N	\N	\N	\N	\N
15	Pourquoi Ruby on Rails ?	Simon Courtois	scourtois@cubyx.fr	beginner	lightning	\N	\N	2012-01-10	http://www.slideshare.net/happynoff/pourquoi-ruby-on-rails-a-dchire	\N	\N	\N	\N	\N
16	Le projet de Geekli.st	Audrey Stewart	audrey@geekli.st	beginner	lightning	\N	\N	2012-02-06	\N	\N	\N	\N	\N	\N
17	Manage Open Source Project	Christopher Dell	chris@tigrish.com	beginner	lightning	\N	\N	2012-02-06	\N	http://lacantine.ubicast.eu/videos/paris-rb-12/	\N	\N	\N	\N
18	OAuth2 en bref	Nicolas Blanco	slainer68@gmail.com	intermediate	lightning	\N	\N	2012-02-06	\N	http://lacantine.ubicast.eu/videos/paris-rb-12/	\N	\N	\N	\N
19	Reprendre un (gros) projet Ruby on Rails	Yann Klis	yann.klis@novelys.com	expert	lightning	\N	\N	2012-02-06	\N	http://lacantine.ubicast.eu/videos/paris-rb-12/	\N	\N	\N	\N
20	MongoDB 2	Yassine Zenati	zenati@directentreprise.fr	beginner	lightning	\N	\N	2012-02-06	\N	http://lacantine.ubicast.eu/videos/paris-rb-12/	\N	\N	\N	\N
21	Vendez Ruby on Rails à votre patron	Sylvain Abélard	sly@gouv.be	beginner	long	\N	\N	2012-02-28	\N	\N	\N	\N	\N	\N
22	VCR	Thibaut Assus	thibaut@milesrock.com	beginner	lightning	\N	\N	2012-02-28	\N	\N	\N	\N	\N	\N
23	Enlarge your Apdex Naturally! (Proven methods to enhance your Rails performance when trafic increases X times)	Vlad Zloteanu	vlad.zloteanu@gmail.com	expert	long	\N	\N	2012-02-28	http://www.slideshare.net/dimelo_RD/enhance-you-apdex-naturally	\N	\N	\N	\N	\N
24	PJAX : HTML5 pushState & Ajax dans Rails en 5 minutes	Florian Lamache	florian@oocto.com	beginner	long	\N	\N	2012-04-11	http://www.slideshare.net/florianlamache/html5-pushstate	\N	\N	\N	\N	\N
26	La concurrence en Ruby - (Boldr) – Asynchronie avec Ruby	Nicolas Mérouze	nicolas.merouze@gmail.com	intermediate	long	\N	\N	2012-04-11	\N	\N	\N	\N	\N	\N
27	Quelques patterns asynchrones, d'EM à Celluloid	Pierre Couzy	piercou@microsoft.com	intermediate	long	\N	\N	2012-04-11	http://www.slideshare.net/LeTesteur/eventmachine-12572664	\N	\N	\N	\N	\N
28	Ariane	Simon Courtois	scourtois@cubyx.fr	beginner	lightning	\N	\N	2012-04-11	http://www.slideshare.net/happynoff/ariane	\N	\N	\N	\N	\N
29	Salesforce/Heroku/Rails WTF ?	Vincent Spehner	vzmind@gmail.com	intermediate	long	\N	\N	2012-04-11	\N	\N	\N	\N	\N	\N
30	Réaliser une application web avec Sinatra, knockout.js et CoffeeScript	Mourad Hammiche	mourad.hammiche@gmail.com	intermediate	long	\N	\N	2012-05-10	\N	\N	\N	\N	\N	\N
31	Lean Startup - développement en flux tendu grâce au cycle Build / Measure / Learn	Vianney Lecroart	acemtp@gmail.com	beginner	long	\N	\N	2012-05-10	\N	\N	\N	\N	\N	\N
32	La Prévoyance et la retraite des indépendants	Diane Pringalle	dpringalle@hotmail.com	intermediate	long	\N	\N	2012-06-04	\N	\N	\N	\N	\N	\N
33	Founder & CEO Verseau	Tracy Loisel	tracy.loisel@verseauparis.com	beginner	long	\N	\N	2012-06-04	\N	\N	\N	\N	\N	\N
34	Responsive Design	Tracy Loisel	tracy.loisel@verseauparis.com	beginner	lightning	\N	\N	2012-06-04	\N	\N	\N	\N	\N	\N
35	Exceptions in Ruby Tips and tricks	Vlad Zloteanu	vlad.zloteanu@gmail.com	intermediate	long	\N	\N	2012-07-02	http://www.slideshare.net/dimelo_RD/exceptions-in-ruby-tips-and-tricks	/videos/exceptions-in-ruby-tips-and-tricks-vlad-zloteanu	\N	\N	\N	\N
36	Présentation de la gem rails-canhaz et introduction à la création d'une gem	Adrien Siami	adrien@siami.fr	beginner	long	\N	\N	2012-07-03	\N	\N	\N	\N	\N	\N
37	Vos RegExps sont fausses	Simon Courtois	scourtois@cubyx.fr	intermediate	lightning	\N	\N	2012-07-03	\N	/videos/vos-regexps-sont-fausses-lightning-talk-simon-courtois	\N	\N	\N	\N
38	Validate-website - Web crawler for checking the validity of your documents	Laurent Arnoud	larnoud@af83.com	beginner	lightning	\N	\N	2012-07-04	\N	\N	\N	\N	\N	\N
40	Pas clair mais super cool (owf? wlw?).	Ori Pekelman	ori@pekelman.com	beginner	lightning	\N	\N	2012-10-10	\N	\N	\N	\N	\N	\N
41	tent.io	Ori Pekelman	ori@pekelman.com	intermediate	long	\N	\N	2012-10-10	\N	\N	\N	\N	\N	\N
43	ActiveModelSerializers	Paul Chavard	paul@capitainetrain.com	intermediate	long	\N	\N	2012-10-10	\N	\N	\N	\N	\N	\N
39	Draper	Jean-Philippe Moal	philippe.moal@laposte.net	intermediate	long	\N	2014-02-24 18:46:56.274432	2012-10-10	http://skateinmars.github.io/presentation-draper/		\N	\N	\N	\N
25	Measure anything, measure everything : suivre son application Rails en temps réel.	Jean-Daniel Guyot	jean-daniel.guyot@capitainetrain.com	expert	long	\N	2014-02-24 18:47:33.845106	2012-04-11	https://speakerdeck.com/jdguyot/measure-your-rails-app		\N	\N	\N	\N
42	Présentation de AngularJS et comment l'intégrer à Rails	Patrick Aljord	patcito@gmail.com	intermediate	long	\N	2014-02-24 18:48:16.876436	2012-10-10	http://pub.ricodigo.com/patcito/angularjs-slides/		\N	\N	\N	\N
6	Predictive analysis in real time with Ruby and R	Benjamin Lan Sun Luk	benjamin@wisemetrics.com	intermediate	long	2014-02-21 12:12:59.656303	2014-03-01 17:58:54.383594	2014-02-04	http://cl.ly/0B0a1g262C0h	/videos/faire-de-l-analyse-predictive-en-temps-reel-avec-ruby-et-r-benjamin-lan-sun-luk	\N	\N	\N	\N
1	Pry as replacement for irb and debugger	Kevin Soltysiak	kevin.soltysiak@novelys.com	intermediate	lightning	2014-02-01 11:31:30.16658	2014-03-01 17:59:32.070711	2014-02-04	https://speakerdeck.com/ksol/lightning-talk-pry	/videos/pry-as-replacement-for-irb-kevin-soltysiak	\N	\N	\N	\N
3	Fake your files	Simon Courtois	scourtois_rubyparis@cubyx.fr	intermediate	lightning	2014-02-01 11:34:10.248122	2014-03-01 17:59:56.551337	2014-02-04	http://www.slideshare.net/happynoff/memfs	/videos/fake-your-files-simon-courtois	\N	\N	\N	\N
4	Relecture POODR - Single Responsibility	Thomas Petrachi	thomas.petrachi@vodeclic.com	intermediate	long	2014-02-01 11:35:44.099445	2014-03-01 18:00:36.320915	2014-02-04	http://slid.es/thomaspetrachi/srp	/videos/relecture-de-poodr-single-responsibility-principle-thomas-petrachi	\N	\N	\N	\N
127	Localize your files in Mongoid | A mongoid Paperclip fork	Antoine Mary	antoine@milky.fr	intermediate	lightning	2014-05-20 17:16:47.131612	2014-07-14 22:02:36.958945	2014-07-01			\N	\N	\N	\N
111	Un sitemap generator	Alex Centar	acentar@jumboweb.fr	intermediate	lightning	2014-03-18 09:34:12.911621	2014-09-01 12:16:03.702657	2014-06-03		/videos/un-sitemap-generator-alex-centar 	\N	\N	\N	\N
160	Speed dating ruby - Retours d'expérience	Laura Lebovic	laura@fitnext.com	easy	lightning	2014-10-31 10:11:48.701138	2014-11-04 16:14:17.858301	2014-11-04			\N	\N	\N	\N
2	Pragmatic Web Components	Nicolas Mérouze	nicolas@merouze.me	intermediate	long	2014-02-01 11:33:21.209654	2014-03-01 18:00:59.693197	2014-02-04		/videos/pragmatic-web-components-nicolas-merouze	\N	\N	\N	\N
46	Mustdown	Simon Courtois	scourtois@cubyx.fr	intermediate	lightning	\N	\N	2012-11-12	http://www.slideshare.net/happynoff/mustdown	/videos/mustdown-simon-courtois	\N	\N	\N	\N
47	Ce que j'aurais voulu savoir	Sylvain Abélard	sly@gouv.be	beginner	long	\N	\N	2012-11-12	http://fr.slideshare.net/abelar_s/ce-que-jaurais-voulu-savoir-15177456	/videos/ce-que-j-aurais-voulu-savoir-sylvain-abelard	\N	\N	\N	\N
48	LAB - architectural kata	Sylvain Abélard	sly@gouv.be	expert	long	\N	\N	2012-11-12	\N	\N	\N	\N	\N	\N
49	TDDium, Push Notifications et LaunchRock	Thibaut Assus	thibaut@milesrock.com	beginner	lightning	\N	\N	2012-11-12	\N	/videos/tddium-push-notifications-et-launchrock-thibaut-assus	\N	\N	\N	\N
50	ObjectID in MongoDB	Vlad Zloteanu	vlad.zloteanu@gmail.com	intermediate	lightning	\N	\N	2012-11-12	http://www.slideshare.net/dimelo_RD/objectid-in-mongodb	/videos/objectid-in-mongodb-lightning-talk-vlad-zloteanu	\N	\N	\N	\N
51	Block, Proc et Lambda	Matthieu Segret	matthieu@humancoders.com	intermediate	long	\N	\N	2012-12-10	http://www.slideshare.net/MatthieuSegret/ruby-block-proc-and-lambda	/videos/blocks-procs-et-lambdas-matthieu-segret	\N	\N	\N	\N
52	SOA on Rails	Nicolas Blanco	nicolas@nicolasblanco.fr	intermediate	long	\N	\N	2012-12-10	\N	/videos/soa-on-rails-nicolas-blanco	\N	\N	\N	\N
213	⚡ Materialize	Maxime Orefice	orefice.maxime@gmail.com	easy	lightning	2015-05-13 09:43:34.516002	2015-07-14 13:04:59.700675	2015-07-01	http://fr.slideshare.net/goldenson_/materializecss		\N	\N	\N	\N
54	EventMachine et websocket 	Olivier Gosse-Gardet	olivier.gosse.gardet@gmail.com	intermediate	long	\N	\N	2012-12-10	\N	\N	\N	\N	\N	\N
55	Santé des Geeks	Sylvain Abélard	sly@gouv.be	beginner	long	\N	\N	2012-12-10	\N	/videos/sante-des-geeks-sylvain-abelard	\N	\N	\N	\N
56	De Rails 2.0 A Rails 4.0	WeLoveCode	ori@pekelman.com	intermediate	long	\N	\N	2012-12-10	\N	\N	\N	\N	\N	\N
57	Lightning Talks Suck!	Christopher Dell	chris@tigrish.com	beginner	lightning	\N	\N	2013-01-07	\N	/videos/lightning-talk-suck-lightning-talk-christopher-dell	\N	\N	\N	\N
58	Coconut Freelancing	Jean-Hadrien Chabran	jh@chabran.fr	beginner	lightning	\N	\N	2013-01-07	\N	\N	\N	\N	\N	\N
59	Websockets Rails	Julien Ballet	elthariel@gmail.com	intermediate	lightning	\N	\N	2013-01-07	\N	/videos/websockets-rails-julien-lta-ballet	\N	\N	\N	\N
60	Gérer son auto-entreprise et créer une SAS avant de se lancer	Philippe Nenert	papilip@nenert.net	beginner	lightning	\N	\N	2013-01-07	\N	/videos/gerer-son-auto-entreprise-et-creer-une-sas-avant-de-se-lancer-philippe-nenert	\N	\N	\N	\N
61	AXLSX Vos fichiers Excel tout simplement en Ruby	Pierre Merlin	pierre@apido.org	intermediate	long	\N	\N	2013-01-07	\N	/videos/axlsx-vos-fichiers-excel-tout-simplement-en-ruby-pierre-merlin	\N	\N	\N	\N
62	Ruby et DCI	Simon Courtois	scourtois@cubyx.fr	intermediate	lightning	\N	\N	2013-01-07	http://www.slideshare.net/happynoff/ruby-and-dci	/videos/ruby-et-dci-lightning-talk-simon-courtois	\N	\N	\N	\N
63	Chef Solo & Capistrano	Stéphane Toth	stephan@kosmogo.com	beginner	lightning	\N	\N	2013-01-07	\N	/videos/chef-solo-capistrano-lightning-talk-stephane-toth	\N	\N	\N	\N
64	Ruby Press Pack	Sylvain Abélard	sly@gouv.be	beginner	lightning	\N	\N	2013-01-07	\N	/videos/ruby-press-pack-lightning-talk-sylvain-abelard	\N	\N	\N	\N
65	Vagrant : Faire du dev dans une VM	Hadrien Dorio	hadrien.dorio@gmail.com	beginner	lightning	\N	\N	2013-02-04	\N	\N	\N	\N	\N	\N
66	Rubymotion	Laurent Sansonetti	lrz@chopine.be	expert	long	\N	\N	2013-02-04	\N	\N	\N	\N	\N	\N
67	Créer une API avec Netty et JRuby	Nicolas Mérouze	nicolas.merouze@gmail.com	expert	long	\N	\N	2013-02-04	\N	\N	\N	\N	\N	\N
68	Réseautez ! (qui est freelance, qui cherche un job?)	Sylvain Abélard	sly@gouv.be	beginner	lightning	\N	\N	2013-02-04	\N	\N	\N	\N	\N	\N
69	Annonce de la conférence dotRB	Sylvain Zimmer	sylvain@sylvainzimmer.com	beginner	lightning	\N	\N	2013-02-04	\N	/videos/annonce-de-la-conference-dotrb-lightning-talk-sylvain-zimmer	\N	\N	\N	\N
70	Apprendre Rails en partant de zéro	Thomas Bancel	thomas.bancel@fidbacks.com	beginner	lightning	\N	\N	2013-02-04	\N	/videos/apprendre-rails-en-partant-de-zero-lightning-talk-thomas-bancel	\N	\N	\N	\N
71	Comment appréhender RoR quand on vient du développement web traditionnel ?	Alex Centar	contact@jumboweb.fr	beginner	lightning	\N	\N	2013-03-06	\N	/videos/comment-apprehender-ror-quand-on-vient-du-developpement-web-traditionnel-alexandre-centar 	\N	\N	\N	\N
72	Multiplayer Game	Marc Gauthier	marcg.gauthier@gmail.com	beginner	long	\N	\N	2013-03-06	\N	/videos/multiplayer-game-marc-gauthier	\N	\N	\N	\N
73	Cloudinary	Thibaut Assus	thibaut@milesrock.com	expert	lightning	\N	\N	2013-03-06	\N	\N	\N	\N	\N	\N
74	Do we deserve the Wooden Spoon?	Christopher Dell	chris@tigrish.com	beginner	lightning	\N	\N	2013-04-02	\N	\N	\N	\N	\N	\N
75	Comment j’ai trouvé une copine avec Node.js	Etienne Folio	ornthalas@gmail.com	beginner	long	\N	\N	2013-04-02	http://partage.ornthalas.net/public/Documents/Slides/Comment%20j%27ai%20trouv%C3%A9%20une%20copine%20avec%20Node%20v3.pdf	/videos/comment-j-ai-trouve-une-copine-avec-node-js-etienne-folio	\N	\N	\N	\N
76	How (not) to design a modern API legacy systems	Ori Pekelman	ori@pekelman.com	intermediate	long	\N	\N	2013-04-02	\N	/videos/how-not-to-design-a-modern-api-legacy-systems-ori-pekelman	\N	\N	\N	\N
77	Hack your brain!	Sylvain Abélard	sly@gouv.be	intermediate	long	\N	\N	2013-04-02	https://speakerdeck.com/abelar_s/hack-your-brain	/videos/hack-your-brain-sylvain-abelard	\N	\N	\N	\N
78	Une API rapide et de qualité avec Weasel-Diesel	Julien Bordellier	julienbordellier@gmail.com	intermediate	lightning	\N	\N	2013-04-06	\N	/videos/une-api-rapide-et-de-qualite-avec-weasel-diesel-lightning-talk-julien-bordellier	\N	\N	\N	\N
79	RuLu 2013	Fabien Catteau	fabien@rulu.eu	beginner	lightning	\N	\N	2013-05-07	\N	/videos/rulu-2013-lightning-talk-fabien-catteau-et-ferdinand-boas	\N	\N	\N	\N
80	Les BrownBagLunch (BBL)	François Sarradin	fsarradin@gmail.com	beginner	lightning	\N	\N	2013-05-07	\N	/videos/les-brownbaglunch-bbl-francois-sarradin	\N	\N	\N	\N
81	Recréer EventMachine à partir de zéro, en Ruby	Marc-André Cournoyer	macournoyer@gmail.com	expert	long	\N	\N	2013-05-07	\N	/videos/recreer-eventmachine-a-partir-de-zero-en-ruby-marc-andre-cournoyer	\N	\N	\N	\N
82	Make Hypermedia APIs in Ruby	Nicolas Mérouze	nicolas@merouze.me	intermediate	long	\N	\N	2013-05-07	\N	/videos/make-hypermedia-apis-in-ruby-nicolas-merouze	\N	\N	\N	\N
83	Must Have des gems de débug visuel pour Rails	Thomas Romera	contact@thomas-romera.com	beginner	lightning	\N	\N	2013-05-07	\N	/videos/must-have-gems-de-debug-visuel-thomas-romera	\N	\N	\N	\N
84	Meteor 101 : A better way to build web apps 100% in Javascript	Vianney Lecroart	acemtp@gmail.com	beginner	long	\N	\N	2013-06-07	\N	/videos/meteor-101-a-better-way-to-build-web-apps-100-in-javascript-vianney-lecroart	\N	\N	\N	\N
85	Discourse : la plateforme de discussion nouvelle génération	Nicolas Blanco	slainer68@gmail.com	beginner	lightning	\N	\N	2013-07-02	\N	/videos/discourse-la-plateforme-de-discussion-nouvelle-generation-nicolas-blanco	\N	\N	\N	\N
44	Comment faire de votre client une oasis dans le désert	Thibaut Assus	thibaut@milesrock.com	easy	long	\N	2014-02-24 18:49:00.576525	2012-10-10	https://speakerdeck.com/tibastral/presentation-freelancing-dot-key		\N	\N	\N	\N
45	It's time to learn the basics!	Nima Izadi	nim.izadi@gmail.com	easy	long	\N	2014-02-24 18:51:34.076686	2012-11-12	https://speakerdeck.com/nima/its-time-to-learn-the-basics	/videos/html-css-nima-izadi	\N	\N	\N	\N
86	State Machine	Nicolas Mondollot	nicolas@drivy.com	intermediate	lightning	\N	\N	2013-07-02	\N	/videos/state-machine-nicolas-mondollot	\N	\N	\N	\N
87	REST with Her	Simon Courtois	scourtois@cubyx.fr	intermediate	lightning	\N	\N	2013-07-02	http://www.slideshare.net/happynoff/her-23784246	/videos/rest-with-her-simon-courtois	\N	\N	\N	\N
89	Porteurs de projets, mettez vous au développement !	Thibaut Assus	thibaut@milesrock.com	beginner	long	\N	\N	2013-07-02	\N	/videos/porteur-de-projet-mettez-vous-au-developpement-michel-ivanovsky-et-thibaut-assus	\N	\N	\N	\N
90	Sécuriser son application Ruby on Rails	Vlad Zloteanu	vlad.zloteanu@gmail.com	intermediate	long	\N	\N	2013-07-02	\N	/videos/securiser-son-application-ruby-on-rails-vlad-zloteanu	\N	\N	\N	\N
91	HTTP Cache en Rails 4	Christopher Cocchi-Perrier	cocchi.c@gmail.com	intermediate	long	\N	\N	2013-11-05	\N	/videos/http-cache-en-rails-4-christopher-cocchi-perrier	\N	\N	\N	\N
92	La bibliothèque Gosu	Matthieu Segret	matthieu@humancoders.com	beginner	lightning	\N	\N	2013-11-05	\N	/videos/la-bibliotheque-gosu-matthieu-segret	\N	\N	\N	\N
93	Zeus & Zeus Parallel tests	Dimitri Jorge	jorge.dimitri@gmail.com	intermediate	lightning	\N	\N	2013-12-03	\N	/videos/zeus-zeus-parallel-tests-dimitri-jorge	\N	\N	\N	\N
94	Recent technical advances in Passenger	Hongli Lai	hongli@phusion.nl	intermediate	long	\N	\N	2013-12-03	\N	/videos/recent-technical-advances-in-passenger-hongli-lai	\N	\N	\N	\N
95	gmaps4rails	Benjamin Roth	benjamin@rubyist.fr	intermediate	long	\N	\N	2014-01-07	\N	/videos/gmaps4rails-benjamin-roth	\N	\N	\N	\N
96	ActionController::Live	Guillaume Troppée	hyrule@hotmail.fr	intermediate	long	\N	\N	2014-01-07	\N	/videos/actioncontroller-live-guillaume-troppee	\N	\N	\N	\N
97	Palette de couleur Web	Igor Cheloudiakoff	igor41@gmail.com	beginner	long	\N	\N	2014-01-07	\N	/videos/palette-de-couleur-web-igor-cheloudiakoff	\N	\N	\N	\N
98	ActiveRecord Serialization	Jean Boussier	jean.boussier@gmail.com	intermediate	long	\N	\N	2014-01-07	\N	/videos/activerecord-serialization-jean-boussier	\N	\N	\N	\N
99	Applications Mobiles Natives	Marc Gauthier	marcg.gauthier@gmail.com	intermediate	long	\N	\N	2014-01-07	\N	/videos/applications-mobiles-natives-marc-gauthier	\N	\N	\N	\N
100	Form Objects	Nicolas Mondollot	nicolas@drivy.com	expert	lightning	\N	\N	2014-01-07	\N	/videos/form-objects-nicolas-mondollot	\N	\N	\N	\N
101	Bootstrapping d'un SaaS	Thibaut Barrère	thibaut.barrere@gmail.com	beginner	long	\N	\N	2014-01-07	\N	/videos/bootstrapping-d-un-saas-thibaut-barrere	\N	\N	\N	\N
102	Server-Sent Events	Étienne Barrié	etienne.barrie@gmail.com	beginner	lightning	\N	\N	2014-01-07	\N	/videos/server-sent-events-etienne-barrie	\N	\N	\N	\N
53	Responsive Web Design	Nima Izadi	nim.izadi@gmail.com	easy	lightning	\N	2014-02-24 18:40:07.411549	2012-12-10	https://speakerdeck.com/nima/responsive-web-design-is-not-a-buzz-word	/videos/responsive-web-design-lightning-talk-nima-izadi	\N	\N	\N	\N
103	Le Code est un jeu de Piste: Codez pour des humains, pas pour des machines	Martin Van Aken	martin.vanaken@8thcolor.com	intermediate	long	2014-03-01 17:26:37.670305	2014-03-11 13:08:04.330256	2014-03-04	https://speakerdeck.com/vanakenm/code-trails	/videos/le-code-est-un-jeu-de-piste-martin-van-aken 	\N	\N	\N	\N
104	Known unknowns	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	long	2014-03-04 14:23:15.317278	2014-03-11 13:08:17.197435	2014-03-04	https://speakerdeck.com/abelar_s/known-unknowns	/videos/known-unknowns-sylvain-abelard 	\N	\N	\N	\N
105	Multi-tenant/lang application	Simon Courtois	scourtois_rubyparis@cubyx.fr	intermediate	lightning	2014-03-04 18:06:50.759256	2014-03-11 13:08:34.311187	2014-03-04	http://www.slideshare.net/happynoff/multi-tenant	/videos/multi-tenant-lang-application-with-ruby-on-rails-simon-courtois	\N	\N	\N	\N
112	Ruby par la pratique	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	lightning	2014-03-30 18:00:32.089127	2014-05-04 09:35:59.710784	2014-04-01	https://github.com/abelards/Ruby-par-l-exemple/blob/master/ruby_practice.rb	/videos/ruby-par-la-pratique-sylvain-abelard	\N	\N	\N	\N
5	Cherche coachs pour initier des collégiennes à la programmation	Salwa Toko	s.toko@fondationface.org	easy	lightning	2014-02-01 11:36:52.865096	2014-05-27 08:12:18.41995	2014-04-01			\N	\N	\N	\N
108	Trouvez vous un partenaire de jeu	Martin Van Aken	martin.vanaken@8thcolor.com	easy	lightning	2014-03-11 15:52:09.559533	2014-05-04 09:33:16.179374	2014-04-01		/videos/trouvez-vous-un-partenaire-de-jeu-martin-van-aken 	\N	\N	\N	\N
175	ActiveAdmin	Benjamin Crouzier	pinouchon@gmail.com	intermediate	lightning	2015-01-05 15:41:36.12711	2015-01-05 16:47:00.88599	2015-01-06			\N	\N	\N	\N
157	Construisons une pyramide !	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	lightning	2014-10-07 07:07:28.599263	2014-11-04 09:37:28.580037	2014-10-07	https://speakerdeck.com/abelar_s/lets-build-pyramids		\N	\N	\N	\N
123	Get Slim!	Simon Courtois	scourtois_ruby@cubyx.fr	easy	lightning	2014-05-06 20:48:06.536014	2014-07-02 15:32:19.985908	2014-06-03	http://www.slideshare.net/happynoff/get-slim-35443888	/videos/get-slim-simon-courtois	\N	\N	\N	\N
107	Et si quelqu'un venait de la part de Cassandre, Ouvre-lui tôt la porte et ne le fais pas attendre	Ori Pekelman	ori@pekelman.com	intermediate	lightning	2014-03-10 17:59:01.702652	2014-05-04 09:32:33.333015	2014-04-01		/videos/cassandra-ori-pekelmam 	\N	\N	\N	\N
109	Bye Google Maps, welcome Mapbox: 10 raisons pour migrer tout de suite	Cassio Melo	melo.cassio@gmail.com	easy	lightning	2014-03-11 17:43:43.203099	2014-05-04 09:33:48.31903	2014-04-01		/videos/bye-google-maps-welcome-mapbox-cassio-melo	\N	\N	\N	\N
114	Alzheimer's Shell	Benjamin Crouzier	pinouchon@gmail.com	intermediate	long	2014-04-01 10:14:32.080892	2014-05-04 09:34:59.219535	2014-04-01		/videos/alzheimer-s-shell-benjamin-crouzier	\N	\N	\N	\N
161	Effets de la sociologie sur les devs	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	long	2014-11-04 09:40:54.450904	2014-11-04 16:14:19.914099	2014-11-04	https://speakerdeck.com/abelar_s/effects-of-sociology-on-devs		\N	\N	\N	\N
116	Linters	Thomas Darde	thomas@rougecardinal.fr	intermediate	lightning	2014-04-03 16:45:48.773886	2014-07-04 10:15:52.022449	2014-06-03		/videos/linters-thomas-darde 	\N	\N	\N	\N
106	A/B Testing on Rails	Hassen Taidirt	htaidirt@gmail.com	easy	long	2014-03-05 12:46:18.818339	2014-10-06 09:45:47.60736	2014-05-06		/videos/a-b-testing-on-rails-hassen-taidirt 	\N	\N	\N	\N
129	"Infrastructure as code" avec Chef	Nicolas Ledez	rubyparis@ledez.net	intermediate	long	2014-05-27 19:48:27.882831	2014-09-01 12:10:02.646591	2014-06-03	http://www.slideshare.net/nledez/chef-infrastructure-as-code-parisrb	/videos/chef-infrastructure-as-code-nicolas-ledez	\N	\N	\N	\N
126	Table Driven Testing	Nicolas Mérouze	nicolas@merouze.me	intermediate	lightning	2014-05-08 08:59:41.467539	2014-09-01 12:11:59.83954	2014-06-03		/videos/table-driven-testing-nicolas-merouze	\N	\N	\N	\N
115	Reverse engineering du QLobe	Loïc Boutet	loic@boutet.com	expert	lightning	2014-04-02 09:52:02.96865	2014-09-01 12:15:30.401838	2014-06-03		/videos/reverse-engineering-du-qlobe-loic-boutet 	\N	\N	\N	\N
119	Crawling the web using Import.io & Sidekiq	Cassio Melo	melo.cassio@gmail.com	intermediate	long	2014-04-12 09:13:59.226384	2014-10-06 09:42:07.475775	2014-05-06		/videos/crawling-the-web-with-import-io-and-sidekiq-cassio-melo 	\N	\N	\N	\N
118	Rails as a build tool or why Rails is awesome ( or FU** Grunt)	Michael Bensoussan	mbensoussan.is@gmail.com	expert	long	2014-04-09 16:38:57.910657	2014-10-06 09:52:37.421542	2014-05-06		/videos/rails-as-a-build-tool-or-why-rails-is-awesome-or-fu-grunt-michael-bensoussan	\N	\N	\N	\N
156	PullReview	Christophe Philemotte	christophe.philemotte@8thcolor.com	easy	long	2014-10-02 13:44:56.987218	2014-10-26 19:12:41.740442	2014-10-07			\N	\N	\N	\N
120	Build Realtime Search with Algolia	Sylvain Utard	sylvain@algolia.com	intermediate	lightning	2014-04-16 15:16:47.131264	2014-10-06 09:29:23.046309	2014-05-06	http://www.slideshare.net/SylvainUtard/paris-rb-34357814	/videos/build-realtime-search-with-algolia-sylvain-utard 	\N	\N	\N	\N
117	The treasures of Ruby core, one for each day	Christophe Philemotte	christophe.philemotte@8thcolor.com	easy	long	2014-04-04 15:43:32.216414	2014-10-06 09:42:48.454695	2014-05-06	https://cdn.rawgit.com/8thcolor/parisrb-140506/master/presentation.html#/	/videos/the-treasures-of-ruby-one-for-each-day-christophe-philemotte 	\N	\N	\N	\N
165	Zombie, Braaaaaaaaain, and Ruby	Christophe Philemotte	christophe.philemotte@8thcolor.com	intermediate	long	2014-11-24 11:09:20.374959	2015-01-05 15:42:28.977783	2015-01-06			\N	\N	\N	\N
148	Être développeur ruby au Japon	Julien Feltesse	julien.feltesse@gmail.com	easy	lightning	2014-08-22 10:57:50.340139	2014-10-06 09:57:48.507928	2014-09-02		/videos/dev-ruby-au-japon-julien-feltesse	\N	\N	\N	\N
122	Zapper	Philippe Maziere	philippe.maziere@zapper.com	intermediate	lightning	2014-05-05 12:59:07.187004	2014-07-14 22:01:19.234531	2014-07-01			\N	\N	\N	\N
131	SSH pour un dévelopeur Ruby	Nicolas Ledez	rubyparis@ledez.net	easy	long	2014-06-05 12:13:05.566145	2014-07-15 14:00:52.801497	2014-07-01			\N	\N	\N	\N
146	Ce que j'ai appris en ratant mon side project	Philippe Bourgau	philippe.bourgau@gmail.com	easy	long	2014-08-18 06:16:41.747378	2014-10-06 10:00:35.443552	2014-09-02		/videos/side-project-lessons-learned-philippe-bourgau	\N	\N	\N	\N
145	Ruby is not only for your servers anymore	Loïc Boutet	loic@boutet.com	intermediate	long	2014-08-13 12:16:13.075865	2014-10-06 10:03:39.398477	2014-09-02		/videos/ruby-not-only-for-servers-loic-boutet	\N	\N	\N	\N
134	Text Tools	Sylvain Abélard	sylvain.abelard+rails@gmail.com 	intermediate	lightning	2014-07-02 17:27:20.178149	2014-09-01 12:06:32.582153	2014-07-01	sylvain.abelard+rails@gmail.com 	/videos/text-tools-sylvain-abelard	\N	\N	\N	\N
124	From a development work flow to a flow that works	Martin Van Aken	martin.vanaken@8thcolor.com	intermediate	long	2014-05-07 07:27:44.869314	2014-09-01 12:07:21.405933	2014-06-03	https://speakerdeck.com/vanakenm/from-a-workflow-to-a-flow-that-works	/videos/from-a-development-workflow-to-a-flow-that-works-martin-van-aken	\N	\N	\N	\N
132	Pub / Sub in Ruby	Adrien Siami	adrien@siami.fr	intermediate	long	2014-06-13 13:08:59.837129	2014-09-01 12:08:08.01852	2014-07-01	http://www.slideshare.net/AdrienSiami/pub-sub-in-ruby	/videos/pub-sub-in-ruby-adrien-siami	\N	\N	\N	\N
130	Live Coding - Mon site perso en 20 minutes avec Rails+Olala	Benjamin Crouzier	pinouchon@gmail.com 	easy	long	2014-06-03 19:56:24.449951	2014-09-01 12:09:23.797786	2014-06-03		/videos/mon-site-perso-en-20-minutes-live-coding-benjamin-crouzier	\N	\N	\N	\N
141	Un peu de contrôle	Nicolas Blanco	nicolas@nicolasblanco.fr	easy	lightning	2014-07-16 14:28:59.732015	2014-08-05 19:24:34.82279	2014-08-05			\N	\N	\N	\N
154	Présentation Prelang	André Baudin-Laurencin	abaudin@gmail.com	intermediate	long	2014-09-30 06:47:45.792212	2014-10-26 19:12:52.647215	2014-10-07			\N	\N	\N	\N
125	Hosting and optimizing with heroku	Thibaut Assus	thibaut@milesrock.com	intermediate	long	2014-05-07 16:01:44.933783	2014-09-01 12:11:24.911569	2014-07-01		/videos/9-rules-to-perform-better-russian-dolls-and-friends-thibaut-assus	\N	\N	\N	\N
153	Différences/liens entre Cucumber, Capybara/Webrat, Selenium, RSpec, FactoryGirl	Boubacar Diallo	boubacar@tutorys.com	easy	long	2014-09-25 09:11:00.129699	2014-10-26 19:13:04.169737	2014-10-07			\N	\N	\N	\N
128	Managing dynamic domains with Rails	Guillaume Montard	guillaume.montard@vodeclic.com	intermediate	lightning	2014-05-27 07:56:06.752132	2014-09-01 12:13:15.412637	2014-06-03	https://docs.google.com/presentation/d/1OdgbbIhGj3Q4SmxgVZ8_49W2_t4XiiPt7i9DxYZf2g0/edit	/videos/managing-domains-constraints-in-rails-guillaume-montard	\N	\N	\N	\N
147	Time & Money: The Startup Equation	Martin Van Aken	martin.vanaken@8thcolor.com	intermediate	lightning	2014-08-20 07:04:28.695563	2014-08-20 07:04:28.695563	\N	\N	\N	\N	\N	\N	\N
139	Rails on Rio (Rails fait tourner la coupe du monde de foot)	Stéphan Toth	stephan@kosmogo.com	easy	lightning	2014-07-08 16:18:23.3216	2014-09-01 11:49:36.928214	2014-08-05		/videos/rails-on-rio-stephan-toth	\N	\N	\N	\N
138	J'ai une idée - je vais en faire une webapp... Ou pas.	Martin Van Aken	martin.vanaken@8thcolor.com	intermediate	long	2014-07-07 17:17:24.973174	2014-09-01 12:03:17.066965	2014-08-05	https://speakerdeck.com/vanakenm/ive-an-idea-lets-do-a-webapp-or-not	/videos/j-ai-une-idee-webapp-ou-pas-martin-van-aken 	\N	\N	\N	\N
143	Mon premier mois dans une start-up	Alexandre Tadros	alexandre@capitainepizza.com	easy	lightning	2014-07-28 15:09:56.338586	2014-09-01 12:03:45.679806	2014-08-05		/videos/mon-premier-mois-dans-une-start-up-alexandre-tadrosh 	\N	\N	\N	\N
140	10 Rails Pro tips	Michel Pigassou	michel@fidzup.com	intermediate	lightning	2014-07-14 15:09:34.102983	2014-09-01 12:04:23.816251	2014-08-05	http://www.slideshare.net/michelpigassou/10-ruby-and-rails-pro-tips	/videos/ruby-and-rails-pro-tips-michel-pigassou	\N	\N	\N	\N
136	IT Management	Pierre Urban	urban.pierre@gmail.com	easy	lightning	2014-07-03 10:51:29.001777	2014-09-01 12:06:05.517648	2014-08-05		/videos/it-management-pierre-urban	\N	\N	\N	\N
133	Comment générer du CA et des clients sans budget marketing ?	Céline Ruffet	c.ruffet@fitnext.com	intermediate	lightning	2014-06-20 15:46:30.170594	2014-09-01 12:13:54.9666	2014-07-01		/videos/fitnext-ca-et-clients-sans-marketing-celine-ruffet	\N	\N	\N	\N
110	12 mois dans la peau d'une application d'entreprise en mode LEAN STARTUP	Christopher Parola, Jeremy Venezia	veneziajeremy@gmail.com	intermediate	long	2014-03-14 13:29:28.269171	2014-09-01 12:16:29.684851	2014-06-03	http://fr.slideshare.net/christopherparola/paris-rb-un-an-dans-la-peau-dune-equipe-lean-startup-elcurator	/videos/12-mois-dans-la-peau-d-une-application-d-entreprise-en-mode-lean-startup-christopher-parola 	\N	\N	\N	\N
152	rspec-preloader : Démarrer rspec instantanément	Victor Mours	victor.mours@gmail.com	easy	lightning	2014-09-09 15:50:53.200951	2014-10-26 19:13:15.068818	2014-10-07			\N	\N	\N	\N
151	Gérer les heures ouvrées avec working_hours	Adrien Siami	adrien@siami.fr	easy	lightning	2014-09-04 07:57:51.135206	2014-10-26 19:13:24.86425	2014-10-07			\N	\N	\N	\N
149	RailsGirls Paris #4	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	lightning	2014-09-02 13:24:41.824173	2014-10-26 19:13:36.152416	2014-10-07			\N	\N	\N	\N
137	Stresser son app pour moins stresser (avec JMeter)	Christophe Robillard	christophe@merciedgar.com	easy	lightning	2014-07-03 10:53:03.41124	2014-11-04 09:39:11.817622	2014-12-02			\N	\N	\N	\N
162	CareerBuilder / lesjeudis	Vincent Bisserier	sylvain.abelard+rails@gmail.com	easy	lightning	2014-11-04 16:14:42.638124	2014-11-04 17:18:29.813773	2014-11-04			\N	\N	\N	\N
159	Top gems to start a new project	Michel Pigassou	michel@pigassou.fr	easy	lightning	2014-10-27 07:54:17.41128	2014-11-05 09:37:50.240676	2014-11-04	http://www.slideshare.net/michelpigassou/top-ruby-gems-to-start-a-project		\N	\N	\N	\N
158	Unidecoder	Simon Courtois	scourtois_rubyparis@cubyx.fr	expert	long	2014-10-26 19:09:45.251353	2014-11-05 09:39:07.568451	2014-11-04	http://bit.ly/unidecoder		\N	\N	\N	\N
142	Ten commandments of egoless programming	Philippe Tring	philippetring@gmail.com	easy	lightning	2014-07-18 13:56:32.558002	2014-11-05 17:38:59.581455	2014-11-04	philippetring.fr/egoless-presentation/		\N	\N	\N	\N
168	Entendre avec les yeux, voir avec les oreilles	Louise-Frédérique	louisefrederique@racontezvosreves.com	easy	lightning	2014-11-27 21:53:38.475669	2014-11-28 11:38:21.284436	2014-12-02			\N	\N	\N	\N
166	Moteurs d'optimisation avec Ruby On Rails : Retour d'expérience	Mounir Benchemeld / Béchir Tourki	mounir@classnco.com	intermediate	long	2014-11-25 15:13:23.592194	2014-11-28 11:38:28.295361	2014-12-02			\N	\N	\N	\N
150	Instrumenting your ruby infrastructure with the ELK stack	Vincent Boisard	boisard.v@gmail.com	intermediate	long	2014-09-04 07:57:23.831449	2014-11-28 11:40:18.421156	2014-10-02		http://www.youtube.com/watch?v=ZeCeFmeM3vI&feature=youtu.be	\N	\N	\N	\N
155	Booster son CV	Alexandre Vovan	a.vovan@rhezo-consulting.fr	intermediate	lightning	2014-09-30 09:30:56.151326	2014-11-28 13:00:35.073311	2015-01-06			\N	\N	\N	\N
144	Paris.rb : MVC avec Erlang et Ruby	Grégoire Lejeune	gregoire.lejeune@gmail.com	intermediate	long	2014-07-30 20:18:12.827	2014-11-30 11:35:17.521359	2015-01-06			\N	\N	\N	\N
216	Le fonctionnement interne de Rails	Guirec Corbel	guirec.corbel@gmail.com	intermediate	long	2015-06-03 15:44:54.730989	2015-07-14 13:05:29.688181	2015-07-01	http://slides.com/guireccorbel/parisrb2015/		\N	\N	\N	\N
169	Comment se faire connaître en temps que freelance	Thibaut Assus	thibaut@milesrock.com	easy	long	2014-11-28 14:57:37.301951	2014-11-28 14:59:51.89179	2014-12-02			\N	\N	\N	\N
172	42Grounds.io: Share code behavior	Adrien Folie	folie.adrien@gmail.com	easy	lightning	2014-12-09 11:48:59.403449	2015-01-06 15:49:31.844776	2015-02-03			\N	\N	\N	\N
170	Les extensions de browser	Matthieu Corcin	matthieu.corcin@gmail.com	easy	long	2014-11-29 10:16:52.267753	2014-11-29 16:58:24.176811	2014-12-02			\N	\N	\N	\N
164	6 mois pour rendre un-e débutant-e employable	Emilien Ah-Kiem	emilien.ak@gmail.com	easy	lightning	2014-11-18 09:29:47.472622	2014-11-29 17:02:05.054988	2014-12-02			\N	\N	\N	\N
194	⚡ Speed your app creation with templates	Simon Courtois	scourtois_rubyparis@cubyx.fr	intermediate	lightning	2015-03-16 08:39:45.801999	2015-04-08 11:01:52.155361	2015-04-07	http://www.slideshare.net/happynoff/templates-46763953		\N	\N	\N	\N
176	Aller au-delà de ce que vous croyez pouvoir aller (ou faire)	Louise-Frédérique	louisefrederique@racontezvosreves.com	easy	lightning	2015-01-05 23:01:34.377111	2015-01-12 15:21:31.411363	2015-01-06			\N	\N	\N	\N
171	20 ans de programmation ou pourquoi j'aime Ruby	Nicolas Mérouze	nicolas@merouze.me	easy	long	2014-12-02 20:56:04.939512	2014-12-10 10:20:11.074995	2015-01-06			\N	\N	\N	\N
188	Angular ou Backbone, choisir en 2015	David Boureau	davbohr@gmail.com	easy	long	2015-02-24 12:58:04.132712	2015-04-08 14:19:36.664316	2015-04-07	http://slides.com/davidborow/angular-vs-backbone		\N	\N	\N	\N
195	⚡ On a jeté le café avec l'eau du bain	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	lightning	2015-03-19 08:44:18.015806	2015-04-08 14:20:50.86396	2015-04-07	http://maitre-du-monde.fr/talks/TMNR.html		\N	\N	\N	\N
178	Pourquoi je passe au business model open source	Christophe Robillard	christophe@merciedgar.com	easy	long	2015-01-17 10:32:11.020297	2015-01-18 10:56:12.254849	2015-02-03			\N	\N	\N	\N
190	Il est temps d'utiliser les Flexbox en CSS	Freddy Harris	freddy03h@gmail.com	easy	long	2015-03-11 15:31:29.914268	2015-04-09 08:22:55.209094	2015-04-07	http://freddy03h.github.io/flexbox-presentation		\N	\N	\N	\N
177	Dependency Sorting with TSort	Simon Courtois	scourtois_rubyparis@cubyx.fr	expert	lightning	2015-01-12 15:20:47.127841	2015-01-28 16:53:10.536811	2015-03-03			\N	\N	\N	\N
173	Ruby Benchmark - Ne faites pas confiance à votre instinct	Sunny Ripert	sunny@sunfox.org	easy	long	2014-12-15 10:10:42.672907	2017-01-13 09:28:57.151526	2015-02-03			\N	\N	\N	\N
208	💬 service objects, light service, interactor and waterfall	apneadiving - Benjamin Roth	benjamin@rubyist.fr	intermediate	long	2015-05-06 12:17:11.353456	2016-01-29 08:18:24.199307	2016-03-01			\N	\N	\N	\N
182	Unix shortcuts	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	lightning	2015-02-01 10:17:44.487532	2015-02-02 17:55:33.919928	2015-02-03	http://maitre-du-monde.fr/talks/unix_shortcuts.html		\N	\N	\N	\N
181	Grace Murray Hopper, la créatrice du premier compilateur	Marc G Gauthier	marcg.gauthier@gmail.com	easy	lightning	2015-01-30 15:13:45.528718	2015-02-02 17:55:40.600172	2015-03-03			\N	\N	\N	\N
180	Cloudflare ou ssl gratuit et en 3 minutes	Thibaut Assus	thibaut@milesrock.com	easy	lightning	2015-01-29 08:40:28.066884	2015-02-02 17:55:45.64425	2015-02-03			\N	\N	\N	\N
183	Pourquoi vous allez contribuer à un projet open source	Christophe Robillard	christophe@merciedgar.com	easy	long	2015-02-03 23:46:26.080934	2015-02-22 12:21:45.643297	2015-04-07			\N	\N	\N	\N
184	Achieving full-stack reactivity to create modern apps with MeteorJS	Vianney Lecroart	acemtp@gmail.com	intermediate	long	2015-02-05 09:50:07.97594	2015-02-22 12:22:42.738002	2015-03-03			\N	\N	\N	\N
185	2015 : je n'ai presque plus de javascript dans mon projet	Thibaut Assus	thibaut@milesrock.com	intermediate	lightning	2015-02-23 15:28:45.087399	2015-02-23 15:39:24.214715	2015-03-03			\N	\N	\N	\N
174	Make your business SPOF-less	Alex CENTAR	acentar@jumboweb.fr	easy	long	2015-01-05 15:06:59.303324	2015-02-23 16:09:21.990516	2015-03-03			\N	\N	\N	\N
179	Hexagonal Architecture	Maxime	maxime@sush.io	expert	long	2015-01-21 15:52:09.096836	2015-02-23 16:28:15.178153	2015-03-03			\N	\N	\N	\N
189	GitHub Awards : Analyse des data GitHub	vincent daubry	vdaubry@gmail.com	easy	lightning	2015-03-02 08:31:58.691507	2015-03-02 09:16:48.824818	2015-03-03			\N	\N	\N	\N
193	⚡ Fun with docker in Ruby 	Adrien Siami 	adrien.siami@gmail.com	easy	lightning	2015-03-15 14:20:32.590714	2015-03-15 18:54:41.934368	2015-04-07			\N	\N	\N	\N
191	⚡ Comment négocier son salaire avec tact et efficacité	Jean-Loup Karst	jeanloup@breaz.io	easy	lightning	2015-03-13 11:39:59.079331	2015-03-15 18:54:53.282134	2015-04-07			\N	\N	\N	\N
186	⚡ PostgreSQL Dashboard : A real-time monitoring screen based on Dashing and Sinatra	Damien Clochard	damien@dalibo.info	easy	lightning	2015-02-23 15:39:06.618299	2015-03-15 18:55:06.818657	2015-04-07			\N	\N	\N	\N
196	⚡ Remote Freelancer, pourquoi pas moi ?	Pierre URBAN	urban.pierre@gmail.com	easy	lightning	2015-03-20 09:12:15.155649	2015-05-05 12:38:38.066893	2015-07-07			\N	\N	\N	\N
198	Avox - free calls over the world	Anton Malov	teo@avox.mobi	expert	long	2015-03-23 15:19:21.493982	2015-03-23 15:19:21.493982	\N	\N	\N	\N	\N	\N	\N
204	⚡ Développeurs, faites votre place dans la santé	What Health	frenoux@what-health.org	easy	lightning	2015-04-30 08:34:24.283239	2015-05-05 12:43:20.377998	2015-05-06			\N	\N	\N	\N
207	🔈 dotScale 2015	Ferdinand BOAS	ferdinand@dotconferences.io	easy	lightning	2015-05-05 08:30:33.15187	2015-05-06 15:08:26.928918	2015-05-06			\N	\N	\N	\N
201	💬 Concevoir des logiciels : structurer son code au-delà de l'algorithme	Emmanuel Gaillot	emmanuel.gaillot@gmail.com	intermediate	long	2015-04-08 19:17:22.530624	2015-05-06 15:09:06.984757	2015-05-06			\N	\N	\N	\N
200	💬 De Ruby & Rails aux microservices en Elixir & Phoenix	Charlie Eissen	ceissen@papayecube.com	intermediate	long	2015-04-05 12:25:47.623064	2015-05-06 15:09:10.200088	2015-05-06			\N	\N	\N	\N
205	💻 Science et magie	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	long	2015-05-01 11:17:56.931796	2015-05-06 15:12:44.894878	2015-05-06			\N	\N	\N	\N
206	💻 RubyMotion : live coding Android + iOS	Laurent Sansonetti	sylvain.abelard+rails@gmail.com	easy	long	2015-05-01 11:18:25.320806	2015-05-06 15:12:46.953432	2015-05-06			\N	\N	\N	\N
209	🔈 atelier stratégie des Apps - Paris, 21 mai, 16h	App Devs Alliance	sylvain.abelard+rails@gmail.com	easy	lightning	2015-05-06 15:04:24.89106	2015-05-06 15:48:42.426424	2015-05-06	http://bit.ly/ParisASW		\N	\N	\N	\N
212	⚡ Il faut bien bosser dans le web alors autant que ça se passe bien	JeBosseDansLeWeb	sylvain.abelard+rails@gmail.com	easy	lightning	2015-05-06 15:34:12.926954	2015-05-31 08:21:46.753476	2015-06-04			\N	\N	\N	\N
211	🔈 Concours de PR / Paris 5 juin	BestOfWeb	sylvain.abelard+rails@gmail.com	easy	lightning	2015-05-06 15:07:17.416371	2015-05-31 08:22:00.07621	2015-06-04	http://bestofweb.paris/		\N	\N	\N	\N
210	🔈 RailsGirls Paris 2015 - juillet	@RailsGirlsParis	sylvain.abelard+rails@gmail.com	easy	lightning	2015-05-06 15:04:59.231495	2015-05-31 08:22:07.582866	2015-06-04			\N	\N	\N	\N
197	Développer une API Rest avec Ruby On Rails	Xavier Carpentier	contact@xaviercarpentier.com	intermediate	long	2015-03-20 10:02:37.206485	2015-05-31 08:22:30.516814	\N			\N	\N	\N	\N
187	Développer avec PostgreSQL 	Damien 	damien@dalibo.info	easy	long	2015-02-23 15:41:36.08922	2015-05-31 08:23:29.069067	\N			\N	\N	\N	\N
203	💬 Building and Testing Resilient Applications	Jean Boussier	jean.boussier@shopify.com	expert	long	2015-04-17 12:06:34.644335	2015-06-07 08:00:06.672019	2015-06-04	http://byroot.github.io/presentations/resiliency/#1		\N	\N	\N	\N
192	💬 Organize your assets with Rails	Simon Courtois	scourtois_rubyparis@cubyx.fr	intermediate	long	2015-03-13 19:45:25.065352	2015-06-07 08:01:02.956653	2015-06-04	http://www.slideshare.net/happynoff/assets-49024541		\N	\N	\N	\N
217	⚡ Evil Gems	Daniel Sundström	daniel@monkeydancers.com	intermediate	lightning	2015-06-06 09:22:29.969826	2015-06-09 09:53:00.22832	2015-07-01			\N	\N	\N	\N
199	💬 CSS Grid : découvrez le futur de la mise en page des sites web	Mathieu Parisot	mathieu.parisot@gmail.com	easy	long	2015-04-01 15:56:46.011763	2015-06-07 07:59:31.410198	2015-06-04	http://fr.slideshare.net/matparisot/css-grid-layout-le-futur-de-vos-mises-en-page		\N	\N	\N	\N
220	Less Code	Michel Martens	soveran@gmail.com	intermediate	long	2015-08-06 16:25:54.231953	2015-08-07 07:28:13.334006	2015-09-01			\N	\N	\N	\N
274	⚡ First app with action-cable	@poilon	poilon@gmail.com	easy	lightning	2016-04-05 07:44:48.067681	2016-06-08 07:51:53.088554	2016-04-05	https://www.daskit.com/		\N	\N	\N	\N
235	5 Workplace Hacks	Philippe Bourgau	philippe.bourgau@gmail.com	easy	lightning	2015-10-23 04:17:23.622306	2015-11-03 17:03:52.429974	2015-11-03			\N	\N	\N	\N
223	Hiérarchie des classes et modules principaux de Ruby	Grégoire Clermont	gregoire@livementor.com	easy	lightning	2015-08-28 13:16:15.985625	2015-08-28 13:35:36.149992	2015-09-01			\N	\N	\N	\N
243	Ruby keyword args from the parser to the VM	Étienne Barrié	etienne.barrie@gmail.com	intermediate	long	2015-11-26 15:20:24.758888	2015-11-26 15:40:23.092478	2016-01-05			\N	\N	\N	\N
226	http://tinyurl.com/candidature-railsgirlsparis-6	@RailsGirlsParis	sylvain.abelard+rails@gmail.com	easy	lightning	2015-09-01 16:34:19.81882	2015-09-01 16:34:19.81882	2015-09-01			\N	\N	\N	\N
227	Rails assets	@tibastral	thibaut.assus@milesrock.com	easy	lightning	2015-09-01 17:31:14.24757	2015-09-01 17:31:14.24757	2015-09-01			\N	\N	\N	\N
228	http://tinyurl.com/ruby-paris-feedback	@ParisRB	sylvain.abelard+rails@gmail.com	easy	lightning	2015-09-01 17:32:24.378475	2015-09-01 17:32:24.378475	2015-09-01			\N	\N	\N	\N
225	Clean up your specs with Page Objects	Simon Courtois	scourtois_rubyparis@cubyx.fr	intermediate	lightning	2015-08-31 11:56:48.214396	2015-09-02 20:05:36.782694	2015-10-06			\N	\N	\N	\N
219	Comment recruter et comprendre un CTO quand on ne connait rien à la technique	Guillaume FAURE-DUMONT	fauredumont@gmail.com	easy	long	2015-06-24 18:22:12.496176	2015-09-02 20:06:03.962152	2015-09-01	https://www.dropbox.com/s/3lzt04pwkjpemgj/20150901-ParisRB-RecruterEtComprendreUnCTO-20min.pptx?dl=0		\N	\N	\N	\N
221	Mon premier mini machine learning en Ruby	Paul-Armand	poilon@gmail.com	intermediate	lightning	2015-08-26 13:59:10.901331	2015-09-02 20:06:35.550194	2015-09-01	http://dl.free.fr/my1wO2yb9	https://www.youtube.com/watch?v=UQ1q6aTdjfg	\N	\N	\N	\N
224	The C in Ruby - `%`	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	lightning	2015-08-28 13:36:19.032757	2015-09-02 20:08:04.479053	2015-09-01	http://maitre-du-monde.fr/talks/C_in_Ruby.html		\N	\N	\N	\N
240	Web Animation Performance	Freddy Harris	freddy03h@gmail.com	intermediate	long	2015-11-05 13:06:40.896102	2015-12-11 10:42:10.083299	2016-01-05			\N	\N	\N	\N
222	Le CTO à 2€ [1/2]	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	long	2015-08-27 07:57:50.762754	2015-09-23 20:15:51.802542	2015-10-06	http://maitre-du-monde.fr/talks/2e_tech_lead.html#1		\N	\N	\N	\N
230	JobTeaser	Paul-Armand	poilon@gmail.com	easy	lightning	2015-09-25 13:56:00.611702	2015-09-25 16:20:17.830282	2015-10-06			\N	\N	\N	\N
232	De quoi voulez-vous parler ?	Guillaume	guillaume@zikme.org	expert	lightning	2015-10-06 17:45:16.393988	2015-10-06 18:35:54.314423	2015-10-06			\N	\N	\N	\N
244	🎁 Surprise ;)	Laurent Bossavit	sylvain.abelard+rails@gmail.com	easy	long	2015-11-26 15:23:31.464429	2015-12-01 13:24:24.246863	2015-12-01			\N	\N	\N	\N
229	Add Rails security to your Continuous Development	Jean-Baptiste Aviat (@jbaviat)	jb@sqreen.io	intermediate	long	2015-09-10 18:17:08.319068	2015-10-18 14:37:51.50551	2015-10-06	http://fr.slideshare.net/Sqreen/ruby-on-rails-security-in-your-continuous-integration		\N	\N	\N	\N
247	My first ActionCable app	Pascal	pascal@knoth.fr	easy	lightning	2015-12-16 19:34:25.6163	2015-12-17 10:09:19.963175	2016-01-05			\N	\N	\N	\N
275	💬 Having fun with ruby (Sonic Pi & Dare)	Thibaut	thibaut@milesrock.com	easy	long	2016-04-05 15:02:23.938179	2016-05-25 08:18:22.878179	2016-07-05			\N	\N	\N	\N
234	Présentation de la gem synvert	Julien Michot	ju.michot@gmail.com	easy	lightning	2015-10-20 12:06:41.614374	2015-10-21 08:22:12.717138	2015-11-03			\N	\N	\N	\N
233	Moving data with Kiba ETL	Thibaut Barrère	thibaut.barrere@gmail.com	intermediate	long	2015-10-20 10:54:11.655489	2015-10-21 08:22:19.085872	2015-11-03			\N	\N	\N	\N
272	💬 The Crystal Programming Language	Michel Martens	soveran@gmail.com	intermediate	long	2016-04-04 23:01:13.496199	2016-06-08 07:50:47.572332	2016-06-07	http://files.soveran.com/crystal	https://www.bigmarker.com/remote-meetup/ParisRb-June-7	\N	\N	\N	\N
237	some Pry features	Yann Very	yann.very@gmail.com	easy	lightning	2015-10-29 18:39:38.623534	2015-10-29 20:44:25.956593	2015-11-03			\N	\N	\N	\N
231	❄️ Inuit, c'est inouï	David Boureau	davbohr@gmail.com	easy	lightning	2015-10-05 08:58:31.133471	2015-12-01 13:27:22.202665	2015-12-01			\N	\N	\N	\N
236	🎶 How we refactored our logging system	Pierre-Baptiste	pierre-baptiste@aircall.io	intermediate	long	2015-10-29 18:39:22.482887	2015-12-01 13:28:35.179832	2015-12-01			\N	\N	\N	\N
242	🎅 Storexplore transforme les boutiques en ligne en API	Philippe Bourgau	philippe.bourgau@gmail.com	intermediate	long	2015-11-22 22:02:23.475486	2015-12-01 13:31:48.619483	2015-12-01			\N	\N	\N	\N
239	Instrument Rack to visualize requests processing	Jean-Baptiste Aviat (@jbaviat)	jb@sqreen.io	intermediate	lightning	2015-11-02 12:08:07.147557	2015-11-02 12:54:00.664206	2015-11-03			\N	\N	\N	\N
238	React.rb, React... en ruby :)	Loïc Boutet	loic@boutet.com	intermediate	long	2015-11-01 20:23:09.499116	2015-11-02 12:54:06.535413	2015-11-03			\N	\N	\N	\N
246	💝 24pullrequests.com / thecodelesscode.com	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	lightning	2015-12-01 12:50:02.25182	2015-12-04 14:33:12.017532	2015-12-01	http://24pullrequests.com	http://thecodelesscode.com	\N	\N	\N	\N
245	Trailblazer	Sébastien Nicolaïdis	sebastien@nicolaidis.org	intermediate	long	2015-11-29 14:36:32.853851	2015-12-10 13:55:44.405188	2016-01-05			\N	\N	\N	\N
289	How not to design a state machine	Adrien di Pasquale	adrien@drivy.com	intermediate	lightning	2016-06-30 14:39:50.093683	2016-07-07 08:59:24.086357	2016-07-05	https://adipasquale.github.io/state-machines-lightning-talk/#1	https://www.bigmarker.com/remote-meetup/ParisRb-July-5-2016	\N	\N	\N	\N
254	⚡ Heroku workflow	julien michot	ju.michot@gmail.com	easy	lightning	2016-01-18 19:25:33.71036	2016-02-01 14:13:47.818828	2016-03-01			\N	\N	\N	\N
265	💬 Futur, Technologie, et Magie	Loïc Boutet	loic@boutet.com	easy	long	2016-02-10 11:49:50.070194	2016-02-10 15:28:01.038971	2016-04-05			\N	\N	\N	\N
248	💬 What is Rack?	Simon Courtois	scourtois_rubyparis@cubyx.fr	easy	long	2016-01-06 08:17:43.428971	2016-03-01 15:53:10.239146	2016-05-03			\N	\N	\N	\N
256	⚡ Reprise des CodeLabs !	@krichtof	christophe.robillard@gmail.com	easy	lightning	2016-01-20 13:42:22.355005	2016-01-29 08:14:35.623679	2016-02-02			\N	\N	\N	\N
253	⚡ Waste less time on bugs with exploratory testing	Philippe Bourgau	philippe.bourgau@gmail.com	easy	lightning	2016-01-16 07:44:17.801478	2016-02-03 14:59:33.322623	2016-02-02	https://docs.google.com/presentation/d/1m6S70jyDJQNCXlWYwq6LbZMIq5BzoAfJ3Jhuoms0AN0/pub?start=false&loop=false&delayms=3000#slide=id.p4		\N	\N	\N	\N
251	⚡ What's new in Ruby 2.3?	Simon Courtois	scourtois_rubyparis@cubyx.fr	intermediate	lightning	2016-01-06 08:29:00.825659	2016-02-03 14:59:49.233558	2016-02-02	http://www.tinci.fr/blog/quoi-de-neuf-dans-ruby-2-3/		\N	\N	\N	\N
250	⚡ Using UUID in ActiveRecord with PostgreSQL	Dorian LUPU	dorian@lupu.fr	intermediate	lightning	2016-01-06 08:26:34.100736	2016-02-03 14:59:59.443573	2016-02-02	http://slides.com/dorianlupu/using-uuid-in-active-record-with-postgresql#/		\N	\N	\N	\N
255	⚡ Prenez le contrôle de votre réseau avec Ownlan	Sidney SISSAOUI	sidney.sissaoui@gmail.com	intermediate	lightning	2016-01-19 16:26:36.255208	2016-02-03 15:00:08.871604	2016-02-02	https://docs.google.com/presentation/d/1H4CmYzxtmdn6cV-PDohPyU7Iki-97TZ3hEe8quUSem8/edit#slide=id.p		\N	\N	\N	\N
270	💬 Ember.JS	Guirec Corbel	guirec.corbel@gmail.com	intermediate	long	2016-03-02 12:45:53.908901	2016-03-02 15:43:16.551718	2016-05-03			\N	\N	\N	\N
269	💬 Resource Fool	Guillaume Troppée	gtroppee@gmail.com	intermediate	long	2016-03-01 18:21:16.483753	2016-03-02 15:43:26.867132	2016-06-07			\N	\N	\N	\N
257	💬 Fix - Simple, stupid testing framework for Ruby	Cyril Wack	contact@cyril.email	easy	long	2016-01-21 20:59:51.441197	2016-01-29 08:15:41.342399	2016-03-01			\N	\N	\N	\N
259	⚡ scalingo_databases_rake_tasks & other tricks	Yann Klis	yann.klis@gmail.com	intermediate	lightning	2016-01-28 10:29:06.545844	2016-01-29 08:16:14.911825	2016-03-01			\N	\N	\N	\N
266	⚡ Why I don't network on LinkedIn	@abelar_s	sylvain.abelard+rails@gmail.com	easy	lightning	2016-02-10 15:33:15.724418	2016-04-04 15:59:32.505839	2016-04-05	http://speakerdeck.com/abelar_s/why-i-dont-network-on-linkedin		\N	\N	\N	\N
260	💬 CSS Flags - compagnonnage & vexillologie	@pixelastic	tim@pixelastic.com	easy	long	2016-01-29 08:19:27.405033	2016-01-29 09:50:50.257062	2016-05-03	http://talks.pixelastic.com/css-flags-paris/#/		\N	\N	\N	\N
261	💬 Hacked via OWASP Top 10? Not “advanced” nor “sophisticated”	Dorian LUPU	dorian@lupu.fr	intermediate	long	2016-01-30 12:55:36.328516	2016-02-03 08:59:33.067592	2016-04-05			\N	\N	\N	\N
241	💬 Working with Rails Engines	Guillaume Troppée	gtroppee@gmail.com	intermediate	long	2015-11-18 11:59:58.847015	2016-02-03 14:59:18.758665	2016-02-02	https://drive.google.com/file/d/0BxADU4e80SSRM0xGNl8yUTBTME0/view		\N	\N	\N	\N
379	💬 Utilisez Mutant pour améliorer votre code	Thomas Darde	thomas@rougecardinal.fr	intermediate	long	2017-05-31 12:21:43.959556	2017-06-13 14:57:40.639101	2017-06-06	http://sigilium.com/static/mutant-sigilium-parisrb.pdf		\N	\N	\N	\N
262	💬 Tune your app perf (and get fit for summer)	@jbaviat	jb@sqreen.io	expert	long	2016-02-02 23:15:06.968448	2016-04-07 17:07:01.980514	2016-04-05	http://fr.slideshare.net/Sqreen/tune-your-app-perf-and-get-fit-for-summer-60563672		\N	\N	\N	\N
88	Manuel de survie de l'innovateur en entreprise	Simon Guimezanes	Simon.guimezanes@gmail.com	easy	long	\N	2016-04-11 09:10:50.976372	2013-07-02		/videos/manuel-de-survie-en-entreprise-simon-guimezanes	\N	\N	\N	\N
252	💬 Commencer avec React.rb	Loïc Boutet	loic@boutet.com	intermediate	long	2016-01-06 22:39:43.100837	2016-02-04 22:08:24.631112	2016-02-02	https://github.com/loicboutet/reactrb_tutorial		\N	\N	\N	\N
384	💬 /Expressions rationnelles/	@abelar_s	sylvain.abelard+rails@gmail.com	easy	long	2017-06-27 09:22:09.013877	2017-07-04 07:41:11.384069	2017-07-04	http://maitre-du-monde.fr/talks/regexen.html#2		\N	\N	\N	\N
258	💬 Working with Simple Tools	Michel Martens	soveran@gmail.com	easy	long	2016-01-26 09:01:14.626767	2016-02-10 15:26:20.953269	2016-03-01			\N	\N	\N	\N
278	⚡ Graph Theory behind Immutable.js	Franzé Jr.	franzejr@gmail.com	intermediate	lightning	2016-04-20 18:51:47.057045	2016-04-21 14:00:42.496414	2016-08-02			\N	\N	\N	\N
267	⚡ Remote Work Tools	Paul-Armand Assus	poilon@gmail.com	easy	lightning	2016-02-11 09:05:39.795142	2016-02-11 09:19:35.00547	2016-05-03			\N	\N	\N	\N
286	⚡ Security Tip #2 - Content Security Policy	Dorian LUPU	dorian@kundigo.pro	easy	lightning	2016-06-08 07:55:21.240924	2016-07-07 07:41:14.660632	2016-07-05	http://slides.com/kundigo/security-tip-02-content-security-policy/fullscreen#/	https://www.bigmarker.com/remote-meetup/ParisRb-July-5-2016	\N	\N	\N	\N
263	⚡ Getting Things Done	Christophe Robillard	christophe@robillard.pro	easy	lightning	2016-02-03 16:39:00.889669	2016-03-31 13:15:19.35823	2016-05-03			\N	\N	\N	\N
264	⚡ Practices of a remote extreme programmer	Philippe Bourgau	philippe.bourgau@gmail.com	easy	lightning	2016-02-03 21:26:42.677033	2016-03-31 13:15:33.296493	2016-05-03			\N	\N	\N	\N
281	⚡ Singa - aide aux réfugiés	Jean Guo	jean.guo@hospinnomics.eu	easy	lightning	2016-05-16 13:34:28.650695	2016-05-16 13:34:28.650695	2016-06-07			\N	\N	\N	\N
273	💬 The Kemal framework - Crystal's Sinatra	@sdogruyol	sylvain.abelard+rails@gmail.com	easy	long	2016-04-05 07:40:04.96456	2016-06-08 09:05:30.034231	2016-06-07	http://slides.com/sdogruyol/building-web-apps-with-kemal-parisrb#/	https://www.bigmarker.com/remote-meetup/ParisRb-June-7	\N	\N	\N	\N
287	⚡ CSP: from zero to production in 30 seconds	Jean-Baptiste Aviat	jb@sqreen.io	intermediate	lightning	2016-06-15 22:54:08.782652	2016-07-07 07:41:16.376926	2016-07-05	https://speakerdeck.com/aviat/content-security-policy-in-your-rails-apps-in-30s	https://www.bigmarker.com/remote-meetup/ParisRb-July-5-2016	\N	\N	\N	\N
288	Bugmastery	Marc Gauthier	marc@drivy.com	easy	lightning	2016-06-30 14:39:04.759819	2016-07-07 07:49:11.128564	2016-07-05	http://cl.ly/2w053f3A040o	https://www.bigmarker.com/remote-meetup/ParisRb-July-5-2016	\N	\N	\N	\N
271	⚡ Parlons rapidement d'optimisation de performance en Ruby	Loïc Boutet	loic@boutet.com	intermediate	lightning	2016-03-04 14:59:05.0493	2016-06-08 07:50:27.851834	2016-06-07		https://www.bigmarker.com/remote-meetup/ParisRb-June-7	\N	\N	\N	\N
276	Security Tip #1	Dorian LUPU	dorian@lupu.fr	easy	lightning	2016-04-06 05:57:15.556423	2016-06-08 07:52:48.462922	2016-06-07	https://slides.com/kundigo/security-tip-01-security-headers	https://www.bigmarker.com/remote-meetup/ParisRb-June-7	\N	\N	\N	\N
282	⚡ Daskit - attendees feedback with ActionCable	@poilon	poilon@gmail.com	easy	lightning	2016-05-16 14:07:22.211718	2016-06-08 07:58:43.828212	2016-06-07	http://daskit.com/		\N	\N	\N	\N
295	3. 💬 ReactRB la suite ;-)	Loïc Boutet	loic@boutet.com	intermediate	long	2016-08-31 09:55:44.886699	2016-09-05 12:24:38.207225	2016-09-06			\N	\N	\N	\N
293	⚡ How we switched from a monolithic app to isolated services - 3 takeaways	PB Béchu	pb@aircall.io	intermediate	lightning	2016-07-21 18:35:22.129278	2016-07-22 07:44:26.290995	2016-08-02			\N	\N	\N	\N
279	💬 No Downtime Deployment	@juniorjoanis	junior.joanis@gmail.com	intermediate	long	2016-04-21 13:47:57.393304	2016-07-07 07:41:09.428525	2016-07-05	https://docs.google.com/a/augment.com/presentation/d/1uvjlBAXla69nSVcAO_0jhQl_XEpMN-ZwVoEA-2__47Q/edit?usp=sharing	https://www.bigmarker.com/remote-meetup/ParisRb-July-5-2016	\N	\N	\N	\N
283	⚡ Plugin Algolia pour Jekyll	@pixelastic	tim@pixelastic.com	easy	lightning	2016-05-25 08:16:50.621119	2016-07-07 07:41:11.172496	2016-07-05	http://talks.pixelastic.com/jekyll-algolia-parisrb/#/	https://www.bigmarker.com/remote-meetup/ParisRb-July-5-2016	\N	\N	\N	\N
285	⚡ How to start blogging	Philippe Bourgau	philippe.bourgau@gmail.com	easy	lightning	2016-06-08 05:42:00.436859	2016-07-07 07:41:13.086517	2016-07-05	https://docs.google.com/presentation/d/147tzS4pGtLSSRaSZruwGVpuGML8_TPWqpHT56qDW7iQ/edit?usp=sharing	https://www.bigmarker.com/remote-meetup/ParisRb-July-5-2016	\N	\N	\N	\N
292	⚡ Ruby & le travel & les bots, compatible ?	Julien Nassar	julien@destygo.com	intermediate	lightning	2016-07-20 21:41:49.447732	2016-07-20 21:46:12.699907	2016-08-02			\N	\N	\N	\N
291	1. 💬 Parser des CSV avec ruby	Emilie Paillous	emilie.paillous@applidium.com	intermediate	long	2016-07-11 12:56:24.472266	2016-09-05 12:24:29.92014	2016-09-06			\N	\N	\N	\N
284	2. 💬 How (not) to use mocks	Philippe Bourgau	philippe.bourgau@gmail.com	intermediate	long	2016-06-08 05:41:36.157426	2016-09-05 12:24:32.718334	2016-09-06			\N	\N	\N	\N
298	⚡ Qu'est-ce qui nous motive vraiment ?	Christophe Robillard	christophe@robillard.pro	easy	lightning	2016-09-05 07:37:07.604562	2016-09-05 12:24:48.863554	2016-09-06			\N	\N	\N	\N
297	💬 Sous le capot de la Locomotive	Didier Lafforgue	did@locomotivecms.com	intermediate	long	2016-09-01 09:45:53.046505	2016-09-07 07:34:30.529418	2016-10-04			\N	\N	\N	\N
299	 ⚡ Repenser son workflow avec un piano USB 32 touches et du Ruby	Damian Le Nouaille	dam@dln.name	intermediate	lightning	2016-09-06 17:42:25.984686	2016-09-23 09:11:16.77245	2016-10-04			\N	\N	\N	\N
301	 ⚡ Comment recruter un(e) développeur(se) junior	Pierre Hersant	pierre.hersant@gmail.com	easy	lightning	2016-09-21 11:00:59.312782	2016-09-23 09:11:32.869065	2016-10-04			\N	\N	\N	\N
302	💬 Être cyberpunk en entreprise	Ronan Limon Duparcmeur	ronan@2-45.pm	easy	long	2016-09-23 08:27:33.586688	2016-09-23 09:12:53.154179	2016-11-08			\N	\N	\N	\N
290	💬 Continous Security	Adam Surak	adam.surak@algolia.com	easy	long	2016-07-07 09:27:55.496073	2016-10-04 11:54:12.555401	2016-10-04			\N	\N	\N	\N
294	Local SaaS: Comment développer une admin SaaS qui s'intègre directement dans l'application de vos clients	Sandro Munda	sandro@forestadmin.com	intermediate	long	2016-08-08 12:41:37.692929	2017-01-03 11:43:36.106911	2017-02-07			\N	\N	\N	\N
300	 ⚡ Refactoring grâce aux Concerns et Presenters	Victor	maxime@brandandcelebrities.com	intermediate	lightning	2016-09-13 13:24:57.72059	2016-09-23 09:11:21.860427	2016-10-04			\N	\N	\N	\N
380	How are we testing a "Voice" service at Aircall?	Pierre-Baptiste Béchu	pb@aircall.io	intermediate	lightning	2017-06-05 12:20:07.408116	2017-06-05 12:24:13.370619	2017-06-06			\N	\N	\N	\N
381	News : PolyConf	polyconf.com	sylvain.abelard+rails@gmail.com	easy	lightning	2017-06-06 16:09:27.774592	2017-06-06 16:09:27.774592	2017-06-06			\N	\N	\N	\N
305	💬 De Maître à Élève	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	long	2016-09-23 09:12:40.380373	2016-10-14 14:41:51.960764	2016-10-04	http://maitre-du-monde.fr/talks/master2student.html		\N	\N	\N	\N
387	 ⚡ Le Semantic Versioning dans une app web - pourquoi?	Samy Amar	samy@skello.io	easy	lightning	2017-07-14 08:30:04.180545	2017-07-15 09:38:50.575282	2017-08-01			\N	\N	\N	\N
388	 ⚡ Un Gemfile lisible	Sunny Ripert	sunny@sunfox.org	easy	lightning	2017-07-26 17:10:47.396188	2017-07-31 08:51:45.316563	2017-08-01			\N	\N	\N	\N
303	6⃣  💬 Dix choses que j'ai apprises sur le dev web grâce à Megadeth	@r3trofitted	ronan@2-45.pm	easy	long	2016-09-23 08:34:01.149309	2016-12-05 20:53:33.39931	2016-12-06			\N	\N	\N	\N
304	💬 Dix ans de lecture	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	long	2016-09-23 09:12:04.199833	2017-02-24 09:00:15.243474	2017-04-04	http://maitre-du-monde.fr/talks/10years_reads.html#24		\N	\N	\N	\N
392	💬 def <3	Ronan	ronan@2-45.pm	easy	long	2017-08-08 15:03:40.471061	2017-08-08 16:15:35.154614	2017-10-03			\N	\N	\N	\N
393	💬 Enseigner est apprendre : devenez un·e meilleur·e dev en partageant vos connaissances	@celine_m_s	celine@hello-birds.com	easy	long	2017-08-24 08:51:40.837446	2017-08-24 08:59:38.229128	2017-09-05			\N	\N	\N	\N
389	💬 Configuration de l'environnement de déploiement avec Gitlab - Hexappsetup	Julien Poncelet	julienponcelet7@gmail.com	easy	long	2017-08-03 12:37:54.285508	2017-08-25 15:16:09.584856	2017-09-05			\N	\N	\N	\N
377	💬 Internationalize your rails app (the stuff they don't tell you)	Austin FLORES	me@austinflores.com	easy	long	2017-05-17 13:14:49.870288	2017-06-13 14:57:35.733518	2017-06-06	https://speakerdeck.com/unflores/austin-flores		\N	\N	\N	\N
347	6⃣     ⚡   Ce que j'aurais aimé entendre il y a 1 an : faites un petit projet OS ;)	@guillaume_fd	fauredumont@gmail.com	easy	lightning	2016-11-07 18:59:47.883526	2016-12-05 20:52:23.836174	2016-12-06			\N	\N	\N	\N
353	 8⃣    💬   Lessons learned from a week blind: from tech to human experience	@arnlen	sylvain.abelard+guest@gmail.com	easy	long	2016-11-18 09:25:08.090485	2016-12-05 20:53:09.203041	2016-12-08			\N	\N	\N	\N
307	💬 Everyone's Lying to You: how to take the guesswork customer interviews	Patrick O'Malley	pomalley@gmail.com	easy	long	2016-10-06 13:22:30.795167	2016-10-06 13:38:18.598108	2016-11-08			\N	\N	\N	\N
308	⚡ Simplify your Ruby setup with Docker	Philippe Bourgau	philippe.bourgau@gmail.com	easy	lightning	2016-10-13 19:57:40.850646	2016-10-14 13:50:21.814041	2016-11-08			\N	\N	\N	\N
386	 ⚡  Des « user stories » aux « job stories » (avec exemples)	Mauko Quiroga	hello@mauko.me	easy	lightning	2017-07-03 20:58:28.534541	2017-07-04 11:16:45.230078	2017-07-04			\N	\N	\N	\N
357	FlameGraph	@loicboutet	sylvain.abelard+rails@gmail.com	easy	lightning	2017-01-03 18:35:57.012714	2017-01-03 18:35:57.012714	2017-01-03			\N	\N	\N	\N
310	💬 Macros, Rules and Roleplay	Guillaume Troppée	hyrule@hotmail.fr	intermediate	long	2016-10-17 07:45:57.592016	2016-10-20 07:52:47.83564	2016-11-08			\N	\N	\N	\N
383	💬 VCR - testez vos call http	Victor Mours	victor.mours@gmail.com	intermediate	long	2017-06-27 09:02:47.231925	2017-07-31 10:21:21.082567	2017-09-05			\N	\N	\N	\N
312	💬 From darkness to light	Guillaume Polaert (@gpolaert)	gpolaert@logmatic.io	easy	long	2016-11-02 14:11:52.555195	2016-11-04 15:04:55.771087	2017-01-03			\N	\N	\N	\N
390	💬 Utiliser API.ai pour mettre en place un bot rapidement	Balthazar Aubard	bataprod@gmail.com	intermediate	long	2017-08-03 12:41:04.847035	2017-08-25 15:16:24.279677	2017-10-03			\N	\N	\N	\N
349	Paris Ruby Workshop 💎 Rails Thematic Workshops	😘 FRIENDS 😍	sylvain.abelard+rails@gmail.com	easy	lightning	2016-11-08 15:08:01.257239	2016-11-08 15:08:01.257239	2016-11-08	https://www.meetup.com/fr-FR/Paris-Ruby-Workshop/	http://www.meetup.com/fr-FR/rails-thematic-workshops/	\N	\N	\N	\N
348	 RailsGirls #8 25/26 nov 💖 NUMA 6 dec 💝 Exceptional 8 dec	📣 NEWS 📢	sylvain.abelard+rails@gmail.com	easy	lightning	2016-11-08 11:15:36.115628	2016-11-08 15:08:26.446213	2016-11-08			\N	\N	\N	\N
309	 ⚡ The benefits of personal projects	Vlatka Pavišić	vlatka.pavisic@gmail.com	easy	lightning	2016-10-14 14:38:04.413675	2016-11-09 08:18:14.692211	2016-11-08	https://speakerdeck.com/vlatkapavisic/benefits-of-personal-projects-1		\N	\N	\N	\N
306	⚡ Mise en place d'une architecture Web en Crystal	Alexandre Lairan	a.lairan@open365.io	easy	lightning	2016-10-06 07:45:02.518826	2016-11-09 08:26:59.226692	2016-11-08	https://prezi.com/nomkymnx96wr/mise-en-place-d039une-architecture-web-en-crystal/		\N	\N	\N	\N
346	⚡ Just-a-Website Manifesto	Sylvain Abélard	sylvain.abelard+rails@gmail.com	easy	lightning	2016-11-04 15:08:17.890285	2016-11-18 09:19:24.106109	2017-01-03	http://maitre-du-monde.fr/talks/I_just_want_a_website.html#1		\N	\N	\N	\N
311	6⃣  💬 Comment construire un newsfeed de plusieurs modèles	Vincent Daubry	vdaubry@gmail.com	intermediate	long	2016-10-21 17:08:32.597178	2016-11-24 09:32:02.383831	2016-12-06			\N	\N	\N	\N
358	💬 Simulation du 'Manchester Baby'	Thomas Petrachi	tpetrachizago@gmail.com	intermediate	long	2017-01-05 12:18:24.004377	2017-01-05 13:49:39.689145	2017-02-07			\N	\N	\N	\N
354	💬 Réalité Virtuelle et Ruby	Loïc Boutet	lboutet@hexagonalconsulting.com	expert	long	2016-11-18 18:36:38.750271	2016-12-01 14:45:32.481094	2017-02-07			\N	\N	\N	\N
359	💬 Tribes, Guilds and Squads chez JobTeaser	@jobteaser	sylvain.abelard+rails@gmail.com	easy	long	2017-01-05 13:43:06.474556	2017-01-05 13:49:50.377336	2017-02-08			\N	\N	\N	\N
345	6⃣    ⚡   Remove noise from your environment	Thibaut Assus	thibaut@milesrock.com	easy	lightning	2016-11-04 01:54:54.997749	2016-12-05 20:47:36.739912	2016-12-06			\N	\N	\N	\N
350	💬 Mastering Arel (2013 @danschultz)	@abelar_s	sylvain.abelard+rails@gmail.com	intermediate	long	2016-11-10 14:02:01.241809	2016-12-05 20:48:06.385304	2017-01-03	https://danshultz.github.io/talks/mastering_activerecord_arel/#/		\N	\N	\N	\N
351	 8⃣    ⚡   Learned Helplessness -> Learned Optimism	@abelar_s	sylvain.abelard+rails@gmail.com	easy	lightning	2016-11-10 14:02:32.014764	2016-12-05 20:48:12.543551	2016-12-08	https://www.youtube.com/watch?v=2hHNq45rEnU		\N	\N	\N	\N
352	 8⃣    Ruby Together	@cczona	sylvain.abelard+guest@gmail.com	easy	long	2016-11-18 09:24:23.925858	2016-12-05 20:48:18.643557	2016-12-08			\N	\N	\N	\N
356	6⃣   💬   RubyTogether & CallbackWomen	@cczona	sylvain.abelard+rails@gmail.com	easy	long	2016-12-05 20:45:09.983379	2016-12-05 20:48:39.062109	2016-12-06			\N	\N	\N	\N
362	💬 Ruby et ses blocs	Sunny Ripert	sunny@sunfox.org	easy	long	2017-01-13 09:23:32.568705	2017-02-15 09:01:59.614554	2017-03-07			\N	\N	\N	\N
361	💬 Donjons & Dragons & Modules	Ronan Limon Duparcmeur	ronan@2-45.pm	intermediate	long	2017-01-11 08:00:05.563763	2017-02-15 09:02:27.486829	2017-03-07			\N	\N	\N	\N
360	💬 Design patterns for Rails Engines	Victor Mours	victor@ahaoho.io	expert	long	2017-01-09 10:23:09.91632	2017-02-15 09:02:44.74289	2017-03-07			\N	\N	\N	\N
363	 ⚡ dev.learn(stuff)	Philippe Bourgau	philippe.bourgau@gmail.com	easy	lightning	2017-02-15 08:28:15.317851	2017-02-15 09:03:23.125745	2017-03-07			\N	\N	\N	\N
364	⚡ DotScale & concours	DotScale	sylvain.abelard+rails@gmail.com	easy	lightning	2017-02-24 09:01:00.434898	2017-02-24 09:01:00.434898	2017-03-07			\N	\N	\N	\N
366	⚡ Qu'est ce que j'ai appris en 10 ans de rails	Stéphane Akkaoui	s.akkaoui@thesocialclient.com	easy	lightning	2017-03-07 18:38:05.829	2017-03-13 11:05:57.500038	2017-04-04			\N	\N	\N	\N
368	💬 Rack	Thibault Hamel	sylvain.abelard+rails@gmail.com	easy	long	2017-03-13 11:07:29.875406	2017-03-13 11:32:24.601104	2017-04-04			\N	\N	\N	\N
369	⚡ Reducing a gem from size from 147MB to 2.4MB	Jean-Baptiste Aviat	jb@sqreen.io	intermediate	lightning	2017-03-13 18:17:15.150144	2017-03-13 20:21:28.495684	2017-04-04			\N	\N	\N	\N
367	💬 Death to the Staging Env	@soulou	yann@scalingo.com	intermediate	long	2017-03-08 09:30:06.661664	2017-03-17 16:04:40.231915	2017-04-04			\N	\N	\N	\N
355	💬   Chanson du monolithe	@abelar_s	sylvain.abelard+rails@gmail.com	easy	lightning	2016-12-05 20:43:20.329654	2017-05-02 07:18:30.506012	\N	http://maitre-du-monde.fr/talks/chanson_monolithe.html		\N	\N	\N	\N
374	⚡ reads for the next 10 years	@abelar_s	sylvain.abelard+rails@gmail.com	easy	lightning	2017-05-02 07:29:39.396868	2017-05-02 07:29:39.396868	2017-05-02	http://maitre-du-monde.fr/talks/10years_reads.html		\N	\N	\N	\N
365	💬 Faire un bot en 20 minutes - live coding	Stéphane Akkaoui	s.akkaoui@thesocialclient.com	intermediate	long	2017-03-07 18:36:42.843999	2017-04-14 07:36:45.787263	2017-06-06			\N	\N	\N	\N
371	⚡ La différence entre to_s et to_str	Marc G Gauthier	marcg.gauthier@gmail.com	intermediate	lightning	2017-04-10 12:20:27.29042	2017-05-02 08:01:04.318736	2017-05-02	http://marcgg.com/blog/2017/01/23/ruby-to-s-to-str/		\N	\N	\N	\N
373	💬 MySQL 5.6, 5.7 and what's coming in 8.0	Michael Bensoussan	michael@drivy.com	intermediate	long	2017-04-10 14:06:59.700075	2017-05-02 08:01:12.465795	2017-05-02			\N	\N	\N	\N
372	💬 Elm Elegant : une bibliothèque pour écrire des inline styles de façon fonctionnelle	Thibaut Assus	thibaut@milesrock.com	intermediate	long	2017-04-10 13:17:36.178746	2017-05-02 08:01:15.225962	2017-05-02			\N	\N	\N	\N
375	💬 Simulating Deliveries at Stuart	Xavier Noria	fxn@hashref.com	intermediate	long	2017-05-10 10:00:51.262045	2017-05-11 12:35:25.21378	2017-07-04			\N	\N	\N	\N
378	 ⚡ Forgotten HTML 	@abelar_s	sylvain.abelard+rails@gmail.com	easy	lightning	2017-05-24 16:27:03.73368	2017-05-24 16:27:03.73368	2017-06-06	https://maitre-du-monde.fr/talks/forgotten_html.html		\N	\N	\N	\N
394	⚡ Git - Quel workflow utiliser ?	Fabien Chaynes	fabien.chaynes@gmail.com	intermediate	lightning	2017-08-28 12:02:42.667707	2017-09-01 15:49:00.484115	2017-09-05			\N	\N	\N	\N
395	⚡ Tepee, un outil de gestion de configuration pour les braves	@bankair	sylvain.abelard+rails@gmail.com	easy	lightning	2017-09-01 15:49:44.797395	2017-09-01 15:49:44.797395	2017-09-05			\N	\N	\N	\N
398	⚡ Snapchat Takeover Women in Tech	Vlatka Pavišić	sylvain.abelard+rails@gmail.com	easy	lightning	2017-10-03 13:05:28.7929	2017-10-03 13:05:28.7929	2017-10-03			@vlatkapavisic	september	\N	\N
399	⚡ Accélérez vos tests	@benoit_tgt	sylvain.abelard+rails@gmail.com	easy	lightning	2017-10-03 14:43:38.069511	2017-10-03 14:43:38.069511	2017-10-03			@benoit_tgt	october	\N	\N
400	💬 The DevOps culture & Ruby	@hugohenley	sylvain.abelard+rails@gmail.com	easy	long	2017-10-10 08:44:43.691395	2017-10-10 08:44:43.691395	2017-11-07			@hugohenley	november	\N	\N
397	💬 MRuby sur Raspberry	@loicboutet	sylvain.abelard+rails@gmail.com	easy	long	2017-10-03 07:52:26.449589	2017-11-10 08:28:43.48064	2017-12-05			@loicboutet	december	\N	\N
401	⚡ Rubocop	Alexandre Lairan	lairana+parisrb@free.fr	easy	lightning	2017-10-16 10:26:42.081521	2017-10-18 09:49:56.844314	2017-11-07			@Keios21	november	\N	\N
402	💬 Zero Downtime Deploys	Cyrille Courtière	cyrille@wayzup.com	intermediate	long	2017-10-23 13:15:27.902523	2017-10-23 15:31:12.081189	2017-11-07			@ccyrille	november	\N	\N
403	⚡ Science up your ruby with scientist !	Alexandre Ignjatovic	alexandre.ignjatovic@gmail.com	intermediate	lightning	2017-11-06 13:51:46.134002	2017-11-06 13:55:41.630459	2017-11-07			@bankair	november	\N	\N
416	⚡ Lancement de Ruby mentors	Ruby mentors team (Guillaume FAURE-DUMONT)	fauredumont@gmail.com	easy	lightning	2018-02-06 15:35:42.086231	2018-02-06 15:53:39.213765	2018-02-06			@BonjourBonjour	february	\N	\N
405	💬 How can automation help with development practices	@paulRb_r	sylvain.abelard+rails@gmail.com	easy	long	2017-11-07 16:17:55.202722	2017-11-10 15:56:49.954126	2017-12-05			@paulRb_r	december	\N	\N
406	💬 json:api with jsonapi_suite - sideloading & sideposting : one endpoint to rule-them-all	Cyril Duchon-Doris	cyril@myjobglasses.com	intermediate	long	2017-11-09 19:16:55.196174	2017-11-10 15:57:01.193787	2017-12-05			@CyrilDuchon	december	\N	\N
404	💬 La Méthode du Capitaine	@mehlah	sylvain.abelard+rails@gmail.com	easy	long	2017-11-07 16:17:48.183234	2017-12-05 14:49:25.364044	2017-12-05			@mehlah	december	\N	\N
407	Faire des review automatique de code sur GitHub avec Rubocop, Pronto et CircleCI	William Pollet	polletwilliam@gmail.com	intermediate	lightning	2017-12-06 12:09:03.543161	2017-12-06 17:02:28.644625	2018-01-09			@william_pollet	january	\N	\N
391	💬 Comment accueillir, accompagner et faire grandir un développeur junior 	Dorian LUPU	dlupu@hexagonalconsulting.com	easy	long	2017-08-04 11:36:44.748131	2017-12-06 17:02:43.286497	2018-01-09			@dorianlupu	january	\N	\N
411	Les conséquences du RGPD pour les développeurs	Yann Ricard	yann@captaincontrat.com	easy	long	2018-01-09 11:53:13.295646	2018-01-09 12:05:49.364756	2018-01-09			@captaincontrat	january	\N	\N
413	 💬 Extracts from "Clean code"	Vlatka Pavišić	vlatka.pavisic@gmail.com	intermediate	long	2018-01-17 10:41:58.088433	2018-02-06 13:01:10.4414	2018-02-06			@vlatkapavisic	february	\N	\N
410	💬 Présentation des services Rails et cas d'utilisation Kudoz	Benjamin Balanger && Guillaume Bonin	guillaume@getkudoz.com	easy	long	2017-12-19 15:09:58.331823	2018-02-06 13:01:16.124021	2018-02-06			@GetKudoz	february	\N	\N
409	💬 Trailblazer	Alexandre Lairan	lairana+parisrb@free.fr	intermediate	long	2017-12-07 15:50:02.876038	2018-02-06 13:01:21.486708	2018-02-06			@Keios21	february	\N	\N
412	 ⚡ Oubliez Foreman, voici Overmind	Sunny Ripert	sunny@sunfox.org	easy	lightning	2018-01-10 09:11:37.96376	2018-02-06 13:01:36.426238	2018-02-06			@sunfox	february	\N	\N
408	⚡ Gem gon pour récupérer ses données d'un controller en ruby à ses fichiers javascript	Isabelle Bonnet	isabellecorp@gmail.com	easy	lightning	2017-12-07 13:55:37.58403	2018-02-06 13:01:42.327653	2018-02-06			@isarceaux	february	\N	\N
415	💬 Introduction à GraphQL avec graphql-ruby 	Julien Michot	ju.michot@gmail.com	intermediate	long	2018-01-25 10:36:05.734124	2018-02-07 15:06:32.614139	2018-03-06			@jumichot	march	\N	\N
426	💬 The Life and Death of a Rails App	Olivier Lacan	hi@olivierlacan.com	intermediate	long	2018-03-16 19:28:35.100539	2018-03-16 19:45:59.46444	2018-04-03			@olivierlacan	april	\N	\N
418	💬 Le cadeau piégé, ou comment j'ai rétroengineeré un tracker GPS et l'API Strava	Yoann Lecuyer	yoann.lecuyer@gmail.com	intermediate	long	2018-02-07 19:49:30.130804	2018-02-08 11:00:28.826397	2018-03-06			@LecuyerYoann	march	\N	\N
419	💬 Hunting flaky tests	CHAMPIER Cyril	cyril.champier@doctolib.com	intermediate	long	2018-02-12 13:58:03.035701	2018-02-12 14:02:30.008666	2018-03-06			@doctolib	march	\N	\N
427	⚡ Regexp Implementation in Ruby	Mehdi Farsi	mehdi@zame.fr	intermediate	lightning	2018-03-26 12:01:16.312627	2018-03-26 14:38:43.075084	2018-05-15				may	\N	\N
421	💬 Demystifying blocks	Matthieu Prat	matthieuprat@gmail.com	intermediate	long	2018-02-12 16:04:01.851505	2018-04-02 20:32:52.356168	2018-05-15			@matthieuprat	april	\N	\N
417	⚡ Heroku Scheduler : faire des tasks régulières	Félix Gaudé	felix@thehackingproject.org	easy	lightning	2018-02-06 23:06:26.134181	2018-03-05 13:01:26.962577	2018-03-06	https://github.com/felhix/cheat_sheets/blob/master/Ruby/Scheduling_Tasks_Online.md		@the_hacking_pro	march	\N	\N
423	💬 Présentation d'Hanami	Alexandre Lairan	lairana@free.fr	easy	long	2018-03-06 14:11:05.346663	2018-03-06 14:21:23.75266	2018-04-03			@Keios21	april	\N	\N
425	⚡ SMS with Twilio & Rails	Dorian Marié	dorian@doma.io	expert	lightning	2018-03-09 17:29:06.127757	2018-03-12 09:14:53.386796	2018-04-03			@Bydorian	april	\N	\N
428	⚡Ne plus confondre ses environnements avec Firefox	Yoann Lecuyer	yoann.lecuyer@gmail.com	easy	lightning	2018-04-12 09:56:04.283272	2018-04-30 14:17:50.289647	\N				may	\N	\N
429	💬 Comment utiliser flamegraph pour améliorer ses perfs	Christophe Escobar	sylvain.abelard+cescobar@gmail.com	intermediate	long	2018-05-15 16:26:17.023782	2018-05-15 16:26:17.023782	2018-05-15				march	\N	\N
430	💬 Boostez votre travail d'équipe avec les Randoris	Philippe Bourgau	philippe.bourgau@gmail.com	easy	long	2018-05-17 04:42:59.498251	2018-05-17 12:40:50.956057	2018-07-03			@pbourgau	july	\N	\N
431	💬 Un truc avec ruby et raspberry	Loïc Boutet	lboutet@hexagonalconsulting.com	expert	long	2018-05-23 13:21:24.915309	2018-05-23 13:33:14.702648	2018-06-05				june	\N	\N
432	💬 Envufy: une extension pratique en 5 minutes	Yoann Lecuyer	yoann.lecuyer@gmail.com	intermediate	long	2018-06-04 20:18:16.341929	2018-06-04 20:59:40.202729	2018-06-05				june	\N	\N
435	⚡Decorators	Chaymae Bazzaoui	bazzaoui.chaymae@gmail.com	easy	lightning	2018-06-26 08:41:10.1401	2018-06-26 08:45:50.933295	2018-07-03			@chaymaebz	july	\N	\N
434	⚡Bien tester des ActiveJobs et ne pas se faire avoir par la désérialisation	Cyril Duchon-Doris	cyril@myjobglasses.com	easy	lightning	2018-06-20 19:10:26.997943	2018-06-26 08:45:56.956492	2018-07-03			@CyrilDuchon	july	\N	\N
433	⚡Le debugging n'a jamais été aussi cool 😎	Cyril Duchon-Doris	cyril@myjobglasses.com	easy	lightning	2018-06-20 19:09:31.931251	2018-06-26 08:46:02.233786	2018-07-03			@CyrilDuchon	july	\N	\N
436	⚡L'anti-pattern ActiveRecord	Alexandre Lairan	lairana@free.fr	intermediate	lightning	2018-06-26 09:20:23.087808	2018-06-26 09:34:11.739775	2018-07-03			@Keios21	july	\N	\N
437	💬 How an engineer learns japanese	Marion Kamoike-Bouguet	marion.bouguet@gmail.com	easy	long	2018-07-05 09:44:39.595997	2018-07-05 09:57:52.68915	2018-08-07			@oiorain	august	\N	\N
438	💬 Tests aquatiques 💧	Anne-sophie Rouaux	rouaux.annesophie@gmail.com	intermediate	long	2018-07-10 19:05:29.049375	2018-07-10 21:24:17.462271	2018-09-04				september	\N	\N
440	💬 Polymorphic associations and Single-table inheritance in rails	Chaymae Bazzaoui	bazzaoui.chaymae@gmail.com	intermediate	long	2018-08-03 10:35:56.459997	2018-08-03 11:22:39.931759	2018-08-07			@chaymaebz	august	\N	\N
442	💬 Maintenance et refactoring d'une application Rails - 3 tips	Hadrien Blanc	blanc.hadrien@gmail.com	intermediate	long	2018-08-04 14:30:01.834824	2018-08-06 07:58:50.202712	2018-08-07			@hadrienblanc	august	\N	\N
443	💬 Quitter le "papa/maman" en 18 min 42 sec	Jocelyn RICHARD	contact@mx.improv.chat	easy	long	2018-08-13 07:08:45.906692	2018-08-15 20:02:49.969618	2018-09-04			@42s_video	september	\N	\N
444	💬 Continuous Delivery for Rails App with Docker and Gitlab	Florian Wininger & Samy Kacimi	florian@cyberwatch.fr	intermediate	long	2018-08-23 06:41:46.864479	2018-08-23 13:03:30.078438	2018-10-02				october	\N	\N
446	⚡Organiser vos idee avec Dry-Transaction	Alexandre Lairan	alexandrelairan+parisrb@gmail.com	easy	lightning	2018-09-03 19:35:12.419747	2018-09-03 19:37:59.516642	2018-09-04			@alexlairan	september	\N	\N
445	🙋🙋‍♂️welcome @kaspth	@kaspth	sylvain.abelard+parisrb@gmail.com	easy	lightning	2018-09-03 13:11:01.462466	2018-09-03 19:39:35.741127	2018-09-04				september	\N	\N
447	💬 Récupérer la devise en cours sous Rails	Sunny Ripert	sunny@sunfox.org	intermediate	lightning	2018-09-14 12:28:24.467267	2018-09-14 13:09:42.878463	2018-10-02			@sunfox	october	\N	\N
448	⚡Les syntaxes avec { } peuvent être 😈	Cyril Duchon-Doris	cyril.duchon-doris@laposte.net	easy	lightning	2018-09-24 16:27:38.765349	2018-09-24 16:38:59.200662	2018-10-02				september	\N	\N
449	⚡Déployer un blog Jekyll sur OVH	Rémy Maucourt	remy.maucourt@yahoo.fr	easy	lightning	2018-09-24 20:53:23.184669	2018-09-25 07:50:09.103708	2018-10-02				october	\N	\N
450	💬 Créer un nouveau Cop (Rubocop)	Yoann Lecuyer	yoann.lecuyer@gmail.com	intermediate	long	2018-10-04 07:16:23.352013	2018-10-04 09:51:07.767069	2018-11-06				november	\N	\N
451	💬 Comment faire évoluer une app Rails de + de 6 ans	Vincent Daubry	clement@chooseyourboss.com	intermediate	long	2018-10-16 12:50:28.885276	2018-10-16 12:55:42.697987	2018-12-04			@ChooseYourBoss	december	\N	\N
484	💬 Machine Learning - théorie	Alexandre Lairan	alexandrelairan+parisrb@gmail.com	expert	long	2018-10-24 08:38:16.287929	2018-10-24 13:41:48.832734	2018-11-06			@alexlairan	november	\N	\N
485	💬 Comparaison d'algorithmes d'apprentissage	Alexandre Lairan	alexandrelairan+parisrb@gmail.com	expert	long	2018-10-24 12:15:35.849736	2018-10-24 13:42:01.311724	2018-11-06			@alexlairan	november	\N	\N
439	💬 Tom Hirschfield's 10 rules of thumb	@abelar_s	sylvain.abelard+parisrb@gmail.com	easy	long	2018-08-02 07:59:21.627444	2018-10-24 13:42:22.771791	2018-12-04	http://maitre-du-monde.fr/talks/10years_reads.html#35		@abelar_s	december	\N	\N
486	⚡Benchmarker avec micro_bench	Cyrille Courtière	cyrille@klaxit.com	easy	lightning	2018-10-29 21:24:26.871637	2018-10-30 15:09:21.310627	2018-12-04			@ccyrille	november	\N	\N
488	💬 idempotency with rack	salim semaoune	salim.semaoune@gmail.com	intermediate	long	2018-11-01 18:42:48.078677	2018-11-01 19:01:39.130031	2018-11-06			@salim_semaoune	november	\N	\N
489	⚡4 "Code smells" : un guide de simplification	Hadrien Blanc	blanc.hadrien@gmail.com	expert	lightning	2018-12-02 12:12:31.694997	2018-12-03 08:21:06.319048	2018-12-04			@hadrienblanc	december	\N	\N
491	💬 Restructurer ses équipes en squads	Amélie Certin	amelie.certin@gmail.com	easy	long	2018-12-12 16:13:21.650556	2018-12-20 15:39:07.170686	2019-01-08				january	\N	\N
490	💬 Ruby memory, ActiveRecord et Draper, une histoire de performance	Benoit Tigeot	benoit@appaloosa.io	expert	long	2018-12-04 14:08:17.063263	2018-12-21 10:22:26.575757	2019-01-08			@benoit_tgt	january	\N	\N
493	💬 Make your microservices converge!	Théo CARRIVE & Maxime GARCIA	theo@cheerz.com	intermediate	long	2019-01-03 14:35:50.936754	2019-01-03 15:15:27.074233	2019-01-08				january	\N	\N
494	💬 Structure de données et Complexité	Alexandre Lairan	alexandrelairan+parisrb@gmail.com	intermediate	long	2019-01-03 15:19:59.517807	2019-01-03 15:56:10.667784	2019-02-05			@alexlairan	february	\N	\N
528	💬  Tests techniques Ruby : Création / Réalisation / Évaluation	Hadrien Blanc	blanc.hadrien@gmail.com	intermediate	long	2019-01-07 10:24:04.210127	2019-01-30 08:14:14.495951	\N			@hadrienblanc	january	\N	\N
530	1h 💬 💬 💬 Foncteurs Applicatifs et Monades	Dr Jérémy Cochoy	jeremy.cochoy@gmail.com	intermediate	long	2019-02-03 16:58:18.330745	2019-02-03 20:43:32.080752	2019-03-05				march	\N	\N
529	⚡Astuces pour le debugging	Yoann Lecuyer	yoann.lecuyer@gmail.com	intermediate	lightning	2019-01-29 10:34:15.349028	2019-02-03 20:43:39.715401	2019-02-05				february	\N	\N
492	💬 Mise en conformité post RGPD, le REX Fidzup	Emmanuel Rudelle - Fabienne Bremond - Titouan Dessus	fabienne@fidzup.com	intermediate	long	2018-12-21 08:34:57.306429	2019-02-03 20:47:34.202088	2019-02-05				february	\N	\N
531	⚡From tribal knowledge to glorious automation	Alexandre Ignjatovic	alexandre.ignjatovic@doctolib.com	intermediate	lightning	2019-02-04 09:50:12.821569	2019-02-04 09:50:50.641496	2019-02-05			@bankair	february	\N	\N
\.


--
-- Data for Name: tweets; Type: TABLE DATA; Schema: public; Owner: simonc
--

COPY public.tweets (id, text, author, twitter_handle, cool_projects, created_at, updated_at) FROM stdin;
2	Very welcoming, with great people and well organized	Marc-André Cournoyer	macournoyer	Thin	2014-01-07 18:13:00.905183	2014-01-08 18:14:45.161856
1	Paris.rb was insanely great !	Laurent Sansonetti	lrz	RubyMotion	2014-01-07 18:05:02.449218	2014-01-08 18:14:51.787454
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: simonc
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
8	amandine.faynot@gmail.com	$2a$10$KAPQ7xIkJD5UoQUL4S0HmO/nh878unaoYNYZbxv7povIU3PDtJ10q	ac1c6b096aadd0eeb1421934644160242de4636b3216e843af336bf4b2e1a544	2014-03-04 14:37:07.915971	2014-05-13 17:43:28.794639	2014-02-03 22:22:51.087345	2014-05-13 17:43:28.797461
3	pol@milesrock.com	$2a$10$P/M3OyQ0ObH7/N2Q1xfk4Ogv.0/17v5TQaqzZNketvOMHuRiXn.1a	\N	\N	\N	2014-02-03 22:21:28.199099	2014-02-03 22:21:28.199099
4	nene@milesrock.com	$2a$10$Oj1PHgIy/VgKHeBg2R43hOQ1yQHYEs/wzT4E4ZWyEA/Z/7eLMmOuy	\N	\N	\N	2014-02-03 22:21:45.696936	2014-02-03 22:21:45.696936
5	sylvain.abelard@gmail.com	$2a$10$pzcbArw7v91BI/2WJ5wBZ.slXAdQmMGGqWvwi19JrW5IlOGSUCAJy	04a7b5e8ffad438200d9f269b3c9cf011c9764f5669a255f30b6e706768f963d	2014-11-04 09:17:20.263373	2017-05-02 07:16:49.364743	2014-02-03 22:22:01.519841	2017-05-02 07:16:49.366823
6	nim.izadi@gmail.com	$2a$10$x2RJHjZW6rO84R4/zzQXgeFaKuss7AAC2XhbbWBMTwpYAbU7B3o3W	\N	\N	\N	2014-02-03 22:22:17.031331	2014-02-03 22:22:17.031331
7	pierre.nespo@gmail.com	$2a$10$p6G03jCNHyJRozll9qqQrOSYgLGugf6B.fe.ftI5zNHlNQUxgM6Zu	\N	\N	\N	2014-02-03 22:22:35.469583	2014-02-03 22:22:35.469583
9	elthariel@gmail.com	$2a$10$WZ40GB4YMdpoM94n5ATCnu6k93urEd4T5XHz0viKKRhxmW.UucJIW	\N	\N	\N	2014-02-03 22:23:13.181291	2014-02-03 22:23:13.181291
10	berlimioz@gmail.com	$2a$10$QfhmEV8pVA9daeOFCAdXTO.7uDkS1sGMLvWyNh49A1YGvXEzJMyzK	\N	\N	\N	2014-02-03 22:23:27.812267	2015-05-21 10:24:49.068429
11	guillaume@milesrock.com	$2a$10$WBAmXauNYzlj.ESfF8bl5uf4DxMqfz/XdnZqIjJIcf2zkuqZFdvt6	\N	\N	\N	2017-07-04 12:09:20.557856	2017-07-04 12:09:20.557856
1	scourtois@cubyx.fr	$2a$10$B1iYmCxbaVPVu.RW8wiRFup4HzlIJoG9P1O0yfS1hRYLuQlw/IfcC	\N	\N	2015-07-14 13:03:31.70757	2014-01-06 18:46:30.156359	2015-07-14 13:03:31.710358
2	thibaut@milesrock.com	$2a$10$Afh9bBJbu7vJQRlUyidzW.3KPuO4Rr.sm4gbo3p4vwcPopvshLan2	\N	\N	\N	2014-02-03 22:21:12.244105	2018-12-05 16:23:09.100609
\.


--
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: simonc
--

COPY public.videos (id, vimeo_url, vimeo_thumbnail, title, description, event_date, slug, created_at, updated_at) FROM stdin;
3	https://vimeo.com/36291163	http://b.vimeocdn.com/ts/248/848/248848036_640.jpg	Ruby On Rails - Livecoding - Thibaut Assus	Livecoding pour présenter Ruby on Rails\n\n--IESA - 8 novembre 2011	2011-11-08	ruby-on-rails-livecoding-thibaut-assus	2014-01-07 15:32:04.034624	2014-01-07 15:32:04.034624
5	https://vimeo.com/36298413	http://b.vimeocdn.com/ts/248/893/248893500_640.jpg	RubyLive - Matthieu Segret	Présentation du site Rubyive, agrégation d'actualité autour du langage Ruby\n\nIESA	2011-11-08	rubylive-matthieu-segret	2014-01-07 16:02:14.975218	2014-01-07 16:02:14.975218
1	https://vimeo.com/36236409	https://secure-b.vimeocdn.com/ts/248/431/248431058_295.jpg	Commander - Simon Courtois	IEAS - Novembre 2011	2011-11-08	commander-simon-courtois	2014-01-06 18:52:49.747014	2014-01-07 16:07:54.949998
7	https://vimeo.com/36303599	http://b.vimeocdn.com/ts/248/919/248919407_640.jpg	Contest Dimelo 2011 et Présentation de JobTeaser	L'équipe de Dimelo présente son coding contest pour 2011.\nNicolas Lombard nous parle de JobTeaser.\n\nIESA	2011-12-06	contest-dimelo-2011-et-presentation-de-jobteaser	2014-01-07 16:08:41.358597	2014-01-07 16:08:41.358597
8	https://vimeo.com/36412002	http://b.vimeocdn.com/ts/249/869/249869470_640.jpg	Cucumber et Pivotal Tracker - Thibaut Assus	Cucumber est un outil qui automatise l’exécution de tests fonctionnels rédigés en anglais.\nPivotal Tracker est un outil collaboratif de gestion de projets agiles.\n\nIESA	2011-12-06	cucumber-et-pivotal-tracker-thibaut-assus	2014-01-07 16:08:41.38955	2014-01-07 16:08:41.38955
101	https://vimeo.com/99737189	http://i.vimeocdn.com/video/481018567_640.jpg	Get Slim! - Simon Courtois	Pourquoi utiliser Slim plutôt que ERB ou Haml ?\r\n\r\nÉcole 42	2014-06-03	get-slim-simon-courtois	2014-07-02 15:31:31.74092	2014-07-02 15:31:31.74092
10	https://vimeo.com/45214727	http://b.vimeocdn.com/ts/314/364/314364670_640.jpg	Manage Open Source Project - Mike Burns	Comment trouver un nom, construire une communauté, gérer votre dépôt, accepter (ou refuser) les Pull Requests, etc.\n\nAF83	2012-07-03	manage-open-source-project-mike-burns	2014-01-07 16:08:41.422547	2014-01-07 16:08:41.422547
11	https://vimeo.com/45315036	http://b.vimeocdn.com/ts/315/062/315062682_640.jpg	Vos RegExps sont fausses - Lightning Talk - Simon Courtois	Petite astuce pour corriger une erreur fréquente dans les expressions régulières\n\nAF83	2012-07-03	vos-regexps-sont-fausses-lightning-talk-simon-courtois	2014-01-07 16:08:41.448718	2014-01-07 16:08:41.448718
12	https://vimeo.com/45458405	http://b.vimeocdn.com/ts/316/135/316135767_640.jpg	Exceptions in Ruby Tips and tricks - Vlad Zloteanu	Quelques astuces relatives au fonctionnement des exceptions en Ruby\n\nAF83	2012-07-03	exceptions-in-ruby-tips-and-tricks-vlad-zloteanu	2014-01-07 16:08:41.467029	2014-01-07 16:08:41.467029
20	https://vimeo.com/56921997	http://b.vimeocdn.com/ts/394/450/394450817_640.jpg	SOA on Rails - Nicolas Blanco	Nicolas Blanco nous parle de Service Oriented Architecture avec Rails.\n\nEpita	2012-12-10	soa-on-rails-nicolas-blanco	2014-01-07 17:55:22.691562	2014-01-07 17:55:22.691562
21	https://vimeo.com/56921998	http://b.vimeocdn.com/ts/394/305/394305860_640.jpg	Responsive Web Design - Lightning Talk - Nima Izadi	Nima Izadi nous explique ce qu'est le Responsive Web Design.\n\nEpita	2012-12-10	responsive-web-design-lightning-talk-nima-izadi	2014-01-07 17:55:30.942461	2014-01-07 17:55:30.942461
22	https://vimeo.com/56922001	http://b.vimeocdn.com/ts/394/497/394497171_640.jpg	How (not) to design a modern API legacy systems - Ori Pekelman	Ori Pekelman nous donne son point de vue sur la conception d'un API en Ruby.\n\nEpita	2012-12-10	how-not-to-design-a-modern-api-legacy-systems-ori-pekelman	2014-01-07 17:55:32.923104	2014-01-07 17:55:32.923104
23	https://vimeo.com/58171698	http://b.vimeocdn.com/ts/403/640/403640476_640.jpg	AXLSX Vos fichiers Excel tout simplement en Ruby - Pierre Merlin	Pierre Merlin montre comment interagir facilement avec des fichiers Excel depuis Ruby grâce à AXLSX.\n\nEpita	2013-01-07	axlsx-vos-fichiers-excel-tout-simplement-en-ruby-pierre-merlin	2014-01-07 17:55:32.944253	2014-01-07 17:55:32.944253
19	https://vimeo.com/56921996	http://b.vimeocdn.com/ts/460/043/460043889_640.jpg	Blocks, Procs et Lambdas - Matthieu Segret	Matthieu Segret nous apprend les différences entre les Blocks, Procs et Lambda en Ruby.\r\n\r\nEpita	2012-12-10	blocks-procs-et-lambdas-matthieu-segret	2014-01-07 17:55:06.958922	2014-01-07 17:57:53.958679
18	https://vimeo.com/56858278	http://b.vimeocdn.com/ts/393/815/393815515_640.jpg	Santé des Geeks - Sylvain Abélard	Sylvain Abélard nous donne quelques conseils pour rester en bonne santé malgré notre passion du code.\r\n\r\nEpita	2012-12-10	sante-des-geeks-sylvain-abelard	2014-01-07 16:08:58.798837	2014-01-07 17:58:39.726751
14	https://vimeo.com/54960209	http://b.vimeocdn.com/ts/460/042/460042314_640.jpg	Ce que j'aurais voulu savoir - Sylvain Abélard	Sylvain donnes quelques pistes bien utiles pour faciliter notre développement et éviter l'erreur fréquente de réinventer la roue.\r\n\r\nOn parle ici, de state-machines, d'ETL, d'outils UNIX et de bases SQL/NoSQL.\r\n\r\nEpita	2012-11-12	ce-que-j-aurais-voulu-savoir-sylvain-abelard	2014-01-07 16:08:41.497848	2014-01-08 18:00:15.137532
17	https://vimeo.com/55277791	http://b.vimeocdn.com/ts/460/043/460043492_640.jpg	Mustdown - Simon Courtois	Mustdown est une gem Ruby qui fusionne Markdown et Mustache.\r\n\r\nEpita	2012-11-12	mustdown-simon-courtois	2014-01-07 16:08:41.547956	2014-01-08 18:00:55.12872
15	https://vimeo.com/54960210	http://b.vimeocdn.com/ts/380/359/380359767_640.jpg	TDDium, Push Notifications et LaunchRock - Thibaut Assus	TDDium est un service d'intégration continue.\r\nHipChat est un outil de collaboration d'équipe qui intègre de nombreuses notifications.\r\nLaunchrock est un service de création de pages "Coming Soon" pour suivre l’intérêt pour votre produit.\r\n\r\nEpita	2012-11-12	tddium-push-notifications-et-launchrock-thibaut-assus	2014-01-07 16:08:41.516065	2014-01-08 18:01:10.409698
16	https://vimeo.com/55054339	http://b.vimeocdn.com/ts/460/043/460043300_640.jpg	ObjectID in MongoDB - Lightning Talk - Vlad Zloteanu	Vlad nous explique le fonctionnement des ObjectID dans MongoDB.\r\n\r\nEpita	2012-11-12	objectid-in-mongodb-lightning-talk-vlad-zloteanu	2014-01-07 16:08:41.531105	2014-01-08 18:01:27.648452
25	https://vimeo.com/58171701	http://b.vimeocdn.com/ts/403/621/403621399_640.jpg	Photograph: Screenshots as a Service - Jean-Hadrien Chabran	Jean-Hadrien Chabran nous présente sa gem, Photograph, qui permet d'automatiser la création de screenshots de site web.\n\nEpita	2013-01-07	photograph-screenshots-as-a-service-jean-hadrien-chabran	2014-01-07 17:55:32.988024	2014-01-07 17:55:32.988024
26	https://vimeo.com/58171704	http://b.vimeocdn.com/ts/403/576/403576380_640.jpg	Ruby et DCI - Lightning Talk - Simon courtois	Simon Courtois montre ici le problème posé par l'implémentation de DCI en Ruby et propose un méthode alternative.\n\nEpita	2013-01-07	ruby-et-dci-lightning-talk-simon-courtois	2014-01-07 17:55:33.014936	2014-01-07 17:55:33.014936
2	https://vimeo.com/36240543	http://b.vimeocdn.com/ts/248/510/248510012_640.jpg	Rails Devise Cancan - Lan Sun Luk	Initiation Devise et Cancan qui permettent l'authentification et la gestion de droit dans une application Rails\r\n\r\nIESA	2011-11-08	rails-devise-cancan	2014-01-06 18:52:49.765019	2014-01-31 21:47:40.103764
24	https://vimeo.com/58171700	http://b.vimeocdn.com/ts/403/585/403585940_640.jpg	Lightning Talks Suck! - Lightning Talk - Christopher Dell	Christopher Dell nous explique pourquoi, dans les conférences, les Lightning Talks sont mal agencés et comment ils pourraient être mis en valeur.\r\n\r\nEpita	2013-01-07	lightning-talk-suck-lightning-talk-christopher-dell	2014-01-07 17:55:32.966642	2014-02-24 17:26:13.399348
13	https://vimeo.com/54960207	http://b.vimeocdn.com/ts/460/041/460041757_640.jpg	It's time to learn the basics! - Nima Izadi	Nima nous parle des bonnes pratiques du développement front-end.\r\n\r\nEpita	2012-11-12	html-css-nima-izadi	2014-01-07 16:08:41.482539	2014-02-24 18:43:03.591541
122	https://vimeo.com/107329734	http://i.vimeocdn.com/video/490707773_640.jpg	Appsdeck - Yann Klis	Présentation des services fournis par Appsdeck.\r\n\r\nNuma	2014-05-06	appsdeck-yann-klis	2014-10-06 09:26:14.63362	2014-10-06 09:26:14.63362
27	https://vimeo.com/58182463	http://b.vimeocdn.com/ts/403/664/403664266_640.jpg	Chef Solo & Capistrano - Lightning Talk - Stéphane Toth	Stéphane Toth nous offre un retour d'expérience sur deux outils très utiles que sont Chef Solo et Capistrano.\n\nEpita	2013-01-07	chef-solo-capistrano-lightning-talk-stephane-toth	2014-01-07 17:55:33.036756	2014-01-07 17:55:33.036756
28	https://vimeo.com/58183187	http://b.vimeocdn.com/ts/412/360/412360514_640.jpg	Ruby Press Pack - Lightning Talk - Sylvain Abélard	Sylvain Abélard présente le Ruby Press Pack dont le but est de faire connaitre Ruby et de lui donner plus de crédibilité auprès des grands comptes afin d'augmenter sa présence en France.\n\nEpita	2013-01-07	ruby-press-pack-lightning-talk-sylvain-abelard	2014-01-07 17:55:33.059727	2014-01-07 17:55:33.059727
29	https://vimeo.com/58217501	http://b.vimeocdn.com/ts/403/977/403977864_640.jpg	Gérer son auto-entreprise et créer une SAS avant de se lancer - Philippe Nenert	Philippe Nenert présente ici les deux types d'entreprises qui, selon lui, sont valables aujourd'hui en France. Quelques conseils, astuces et alertes sur la création d'entreprise et son contexte.\n\nEpita	2013-01-07	gerer-son-auto-entreprise-et-creer-une-sas-avant-de-se-lancer-philippe-nenert	2014-01-07 17:55:33.080452	2014-01-07 17:55:33.080452
30	https://vimeo.com/61575141	http://b.vimeocdn.com/ts/428/045/428045012_640.jpg	Annonce de la conférence dotRB - Lightning Talk - Sylvain Zimmer	Sylvain Zimmer nous en dit un peut plus sur la conférence dotRB qui aura lieu en octobre 2013 à Paris.\nPour en savoir plus, rendez-vous sur http://www.dotrb.eu/.\n\nEpita	2013-02-04	annonce-de-la-conference-dotrb-lightning-talk-sylvain-zimmer	2014-01-07 17:55:33.103618	2014-01-07 17:55:33.103618
31	https://vimeo.com/61575142	http://b.vimeocdn.com/ts/428/039/428039655_640.jpg	Apprendre Rails en partant de zéro - Lightning Talk - Thomas Bancel	Thomas Bancel nous propose un retour d'expérience sur l'apprentissage de Rails pour une personne non technique. Il donne quelques astuces et sources d'information pour faciliter son auto-formation.\n\nEpita	2013-02-04	apprendre-rails-en-partant-de-zero-lightning-talk-thomas-bancel	2014-01-07 17:55:33.126731	2014-01-07 17:55:33.126731
32	https://vimeo.com/64456135	http://b.vimeocdn.com/ts/435/561/435561189_640.jpg	MOOC - Lightning Talk - Jérémie Sicsic et Yannick Petit	Nous faisons partie du 1er MOOC Français organisé par l'école centrale de Lille = ABC Gestion de Projet. Nous sommes dans l'équipe d'organisation. Tous les deux, on s'occupe du parcours pédagogique et de son suivi (analytics) et l'intégration sur la plateforme Canvas.\n\nEpita	2013-04-02	mooc-lightning-talk-jeremie-sicsic-et-yannick-petit	2014-01-07 17:55:33.14853	2014-01-07 17:55:33.14853
33	https://vimeo.com/64483242	http://b.vimeocdn.com/ts/435/187/435187265_640.jpg	Hack your brain! - Sylvain Abélard	Nous sommes curieux, hackers et bricoleurs. Nous aimons affiner nos outils.\nMais le plus important et remarquable outil est notre cerveau.\nComment pouvons nous le comprendre et le hacker ?\n\nEpita	2013-04-02	hack-your-brain-sylvain-abelard	2014-01-07 17:55:33.171145	2014-01-07 17:55:33.171145
34	https://vimeo.com/64592407	http://b.vimeocdn.com/ts/460/046/460046630_640.jpg	Build a real time application with rails - Ori Pekelman	Ori nous montre comment développer une application "real-time" avec Ruby on Rails.\n\nEpita	2013-03-06	build-a-real-time-application-with-rails-ori-pekelman	2014-01-07 17:55:33.195372	2014-01-07 17:55:33.195372
35	https://vimeo.com/64902686	http://b.vimeocdn.com/ts/460/089/460089792_640.jpg	Unveilling Helios - Mattt Thompson (@mattt)	Helios.io est un framework open-source de développement de backend pour applications mobiles.\n\nEpita	2013-04-02	unveilling-helios-mattt-thompson-mattt	2014-01-07 17:55:33.21648	2014-01-07 17:55:33.21648
36	https://vimeo.com/64902709	http://b.vimeocdn.com/ts/436/265/436265563_640.jpg	Comment j’ai trouvé une copine avec Node.js - Etienne Folio	Étienne nous montre comment utiliser Node.js pour automatiser des tâches d’agrégation sur le net.\n\nEpita	2013-04-02	comment-j-ai-trouve-une-copine-avec-node-js-etienne-folio	2014-01-07 17:55:33.241114	2014-01-07 17:55:33.241114
37	https://vimeo.com/64902750	http://b.vimeocdn.com/ts/436/264/436264688_640.jpg	Technicolor - Lightning Talk - Lucas di Cioccio	Lucas nous parle de l'utilisation de Ruby chez Technicolor\n\nEpita	2013-04-02	technicolor-lightning-talk-lucas-di-cioccio	2014-01-07 17:55:33.261579	2014-01-07 17:55:33.261579
91	https://vimeo.com/88438664	http://b.vimeocdn.com/ts/466/908/466908782_640.jpg	SIMPLON.CO partenaire ParisRB	Fabrique de codeurs entrepreneurs à Montreuil #frenchtech\r\n\r\nEpita	2014-03-04	simplon-co-partenaire-parisrb-2	2014-03-11 12:48:44.008195	2014-03-11 12:48:44.008195
39	https://vimeo.com/65370121	http://b.vimeocdn.com/ts/436/383/436383683_640.jpg	Personal MBA and other inspirations - Julien 'Lta' Ballet	Epita	2013-04-02	personal-mba-and-other-inspirations-julien-lta-ballet	2014-01-07 17:55:33.305675	2014-01-07 17:55:33.305675
40	https://vimeo.com/65453897	http://b.vimeocdn.com/ts/436/504/436504332_640.jpg	Multiplayer Game - Marc Gauthier	Epita	2013-04-02	multiplayer-game-marc-gauthier	2014-01-07 17:55:33.3335	2014-01-07 17:55:33.3335
41	https://vimeo.com/65650889	http://b.vimeocdn.com/ts/436/800/436800333_640.jpg	Vim - Kévin Sztern	Epita	2013-04-02	vim-kevin-sztern	2014-01-07 17:55:33.353896	2014-01-07 17:55:33.353896
42	https://vimeo.com/66491961	http://b.vimeocdn.com/ts/460/104/460104954_640.jpg	StartParis, MyTypewriter et FreelanceBooking - Thibaut ASSUS	Thibaut nous présente trois de ses projets qui lui tiennent à coeur:\n* Startparis un meetup pour ce qui veulent retrouver l'esprit de création\n* MyTypewriter une machine à écrire en ligne pour libérer votre flux de pensées\n* Freelance booking permet de mettre en ligne vos disponibilité pour que vos clients puissent vous booker\n\nEpita	2013-05-06	startparis-mytypewriter-et-freelancebooking-thibaut-assus	2014-01-07 17:55:33.380449	2014-01-07 17:55:33.380449
43	https://vimeo.com/67712693	http://b.vimeocdn.com/ts/439/743/439743967_640.jpg	Recréer EventMachine à partir de zéro, en Ruby - Marc-Andre Cournoyer	Marc-André, créateur de serveur web Thin, explique le fonctionnement interne de la librairie EventMachine servant à créer des programmes réseaux de haute performance.\n\nEpita	2013-05-06	recreer-eventmachine-a-partir-de-zero-en-ruby-marc-andre-cournoyer	2014-01-07 17:55:33.401305	2014-01-07 17:55:33.401305
44	https://vimeo.com/67791339	http://b.vimeocdn.com/ts/439/855/439855950_640.jpg	Make Hypermedia APIs in Ruby - Nicolas Mérouze	Nicolas nous parle des différentes manières et outils dont nous disposons pour mettre en place une API Hypermedia.\n\nEpita	2013-05-06	make-hypermedia-apis-in-ruby-nicolas-merouze	2014-01-07 17:55:33.4251	2014-01-07 17:55:33.4251
45	https://vimeo.com/68203781	http://b.vimeocdn.com/ts/440/494/440494612_640.jpg	RuLu 2013 - Lightning Talk - Fabien Catteau et Ferdinand Boas	La conférence RUBY LUGDUNUM, alias RULU 2013, se tiendra les 20 et 21 juin prochains à Lyon.\nLe jeudi 20 juin, 9 présentations seront données à la Manufacture des Tabacs, en anglais. \nNous nous retrouverons ensuite pour dîner convivial sur la terrasse du Koodeta. \nLe lendemain matin, nous vous proposons 3 ateliers, au choix : Rails 4, Coding Dojo, et RubyMotion par Laurent Sansonetti lui-même. \nLe 21 juin est également la Fête de la Musique, alors nous allons profiter de l'ambiance !\n\nEpita	2013-05-06	rulu-2013-lightning-talk-fabien-catteau-et-ferdinand-boas	2014-01-07 17:55:33.445188	2014-01-07 17:55:33.445188
69	https://vimeo.com/85181640	http://b.vimeocdn.com/ts/462/862/462862265_640.jpg	Form Objects - Nicolas Mondollot	Nicolas nous explique comment éviter l'enfer des validations conditionnelles et autre Rails-acrobaties grâce aux Form Objects.\r\n\r\nGoogle	2014-01-07	form-objects-nicolas-mondollot	2014-01-31 12:48:21.508607	2014-01-31 12:48:21.508607
102	https://vimeo.com/99752765	http://i.vimeocdn.com/video/481241699_640.jpg	Linters - Thomas Darde	Quelques outils pour vérifier la qualité de votre code.\r\n\r\nÉcole 42	2014-06-03	linters-thomas-darde	2014-07-04 10:15:24.853097	2014-07-04 10:15:24.853097
46	https://vimeo.com/68253734	http://b.vimeocdn.com/ts/460/105/460105787_640.jpg	Les BrownBagLunch (BBL) - François Sarradin	Les BrownBagLunch (BBL) permettent de recevoir dans votre entreprise entre midi et deux des professionnels de l'IT passionnés, en échange d'un déjeuner. \n\nCette vidéo explique comment mettre en place des BBL dans votre entreprise, qui sont ces professionnels passionnés et aussi comment en devenir un.\n\nEpita	2013-05-06	les-brownbaglunch-bbl-francois-sarradin	2014-01-07 17:55:33.468847	2014-01-07 17:55:33.468847
47	https://vimeo.com/68399514	http://b.vimeocdn.com/ts/440/725/440725037_640.jpg	Must-Have Gems de debug visuel - Thomas Romera	Thomas nous donne une liste de gems bien utiles pour debugger une application Ruby on Rails.\nRailsPanel vos logs Rails dans les DevTools de Chrome.\nBetterErrors pour mieux appréhender les erreurs d'une application Rails.\n\nEpita	2013-05-06	must-have-gems-de-debug-visuel-thomas-romera	2014-01-07 17:55:33.490781	2014-01-07 17:55:33.490781
48	https://vimeo.com/68558102	http://b.vimeocdn.com/ts/440/939/440939169_640.jpg	Une API rapide et de qualité avec Weasel-Diesel - Lightning Talk - Julien Bordellier	Weasel-Diesel permet de créer facilement une API organisée, rapide et documentée.\n\nEpita	2013-05-06	une-api-rapide-et-de-qualite-avec-weasel-diesel-lightning-talk-julien-bordellier	2014-01-07 17:55:33.516337	2014-01-07 17:55:33.516337
49	https://vimeo.com/72134111	http://b.vimeocdn.com/ts/445/900/445900780_640.jpg	dotRB - Lightning Talk - Ferdinand Boas	dotRB  The largest  Ruby conference in France 18 oct, 2013 Paris\n\nEpita	2013-06-04	dotrb-lightning-talk-ferdinand-boas	2014-01-07 17:55:33.537176	2014-01-07 17:55:33.537176
50	https://vimeo.com/72338240	http://b.vimeocdn.com/ts/446/163/446163972_640.jpg	Sécuriser son application Ruby on Rails - Vlad Zloteanu	Quelles sont les astuces à connaitre pour sécuriser un application Ruby on Rails ?\n\nEpita	2013-07-02	securiser-son-application-ruby-on-rails-vlad-zloteanu	2014-01-07 17:55:33.563025	2014-01-07 17:55:33.563025
52	https://vimeo.com/72349017	http://b.vimeocdn.com/ts/446/177/446177446_640.jpg	ErrBit - Cyril Mougel (@shingara)	ErrBit est un outil open-source de centralisation des erreurs, compatible avec Airbrake\n\nEpita	2013-07-02	errbit-cyril-mougel-shingara	2014-01-07 17:55:33.608217	2014-01-07 17:55:33.608217
53	https://vimeo.com/72470160	http://b.vimeocdn.com/ts/446/335/446335753_640.jpg	State Machine - Nicolas Mondollot	Qu'est-ce qu'une state machine ? À quoi cela sert et dans quels cas l'utiliser ?\n\nEpita	2013-07-02	state-machine-nicolas-mondollot	2014-01-07 17:55:33.62939	2014-01-07 17:55:33.62939
55	https://vimeo.com/72492921	http://b.vimeocdn.com/ts/446/391/446391277_640.jpg	Discourse : la plateforme de discussion nouvelle génération - Nicolas Blanco	Discourse est une application Rails/EmberJS qui donne un nouveau souffle aux forums en ligne.\n\nEpita	2013-07-02	discourse-la-plateforme-de-discussion-nouvelle-generation-nicolas-blanco	2014-01-07 17:55:33.674164	2014-01-07 17:55:33.674164
56	https://vimeo.com/72520219	http://b.vimeocdn.com/ts/446/408/446408829_640.jpg	Job Teaser - Nicolas Lombard	Nicolas nous présente JobTeaser un système de recrutement en ligne\n\nEpita	2013-07-02	job-teaser-nicolas-lombard	2014-01-07 17:55:33.696621	2014-01-07 17:55:33.696621
57	https://vimeo.com/72674323	http://b.vimeocdn.com/ts/460/108/460108429_640.jpg	REST with Her - Simon Courtois	Her est une gem qui se base sur Faraday et permet d'interagir avec une API REST comme le permet ActiveRecord avec une base de données\n\nEpita	2013-07-02	rest-with-her-simon-courtois	2014-01-07 17:55:33.717087	2014-01-07 17:55:33.717087
58	https://vimeo.com/72825182	http://b.vimeocdn.com/ts/446/778/446778795_640.jpg	Meteor 101 : A better way to build web apps 100% in Javascript - Vianney Lecroart	Meteor est un framework JS qui permet de construire une application complexe très rapidement.\n\nEpita	2013-06-07	meteor-101-a-better-way-to-build-web-apps-100-in-javascript-vianney-lecroart	2014-01-07 17:55:33.74254	2014-01-07 17:55:33.74254
59	https://vimeo.com/72964003	http://b.vimeocdn.com/ts/446/973/446973769_640.jpg	Docker : The Linux Container Engine - Solomon Hykes (@solomonstre)	Docker est un projet open-source permettant de packager, deployer and lancer n'importe quelle application comme un conteneur léger\n\nEpita	2013-06-04	docker-the-linux-container-engine-solomon-hykes-solomonstre	2014-01-07 17:55:33.764217	2014-01-07 17:55:33.764217
60	https://vimeo.com/79509082	http://b.vimeocdn.com/ts/455/442/455442798_640.jpg	Parisrb Game Contest - Thibaut Assus	# ParisRB organise un concours de jeux-vidéo :\n\n## Principe\n\nDévelopper un jeu en Ruby, dont les commandes soient exclusivement du texte\n(ou qui ait un grand rapport avec les jeux en mode texte en général, des jeux\nqui reviennent à la mode aujourd'hui, mais qui étaient très très présents dans\nles années 1980). Un exemple : l'excellent RubyWarrior, ou encore le fameux jeu\n(en lisp) dunnet (dans emacs : M-x dunnet)... ou le sublime candybox.\n\n## Comment participer ?\n\nPour s'inscrire, c'est ici : http://bit.ly/1758mYw­\n\nIl faudra donc créer un repo open source sur Github (licence MIT, sauf si vous\npréférez *GPL), déployer votre app en faisant figurer un lien vers les sources,\npuis poster l'url de votre app en commentaire du meetup avant le 24 décembre à\n23h42 (comme au bon vieux temps ;)).\n\n## Quand ?\n\nVous avez un peu moins de deux mois pour réaliser votre chef d'œuvre, les\ngagnants seront annoncés lors du meetup de janvier, le spécial Paris.rb@Google !\n\n## Prix\n\n### 1e prix\n\nUne formation Human Coders sur angularjs (d'une valeur valeur de 1500€) et le\ncrowdfunding du projet de jeu sur la plateforme Mipise offert (seuls les frais\nliés au prestataire de paiement seront effectivement prélevés sur le\ncrowfunding (moins que paypal))\n\n### 2e-5e prix\n\nLe livre REMOTE de 37signals.\n\n### 10 meilleurs\n\n1 t-shirt ParisRB.\n\n## Critères de sélection :\n\n* Fun du jeu (est-ce qu'on s'amuse en jouant)\n* Simple à jouer (ça veut pas dire pas prise de tête ;))\n* Se suffit à lui-même\n* Tests (est-ce que le jeu est bien testé et n'a pas de bugs)\n* Code (est-ce que c'est bien codé, codeclimate content, etc.)\n* nombre de followers du projet sur github, simplib, twitter, facebook, etc. (bien que difficile, l'aspect social est décisif pour la réussite du projet en crowfunding, et fera donc partie de l'évaluation)\n* finition (est-ce qu'on peut déjà jouer facilement en ligne, est-ce que la page d'accueil est sexy)\n* BONUS : jouable en réseau avec des websockets (si vous choisissez le web comme plateforme).\n\nSi vous avez d'autres questions, vous avez les boards du meetup pour discuter !\nhttp://www.meetup.com/parisrb/messages/boards/\n(ou par mail : thibaut@milesrock.com)\n\nEpita	2013-11-05	parisrb-game-contest-thibaut-assus	2014-01-07 17:55:33.786609	2014-01-07 17:55:33.786609
61	https://vimeo.com/79670042	http://b.vimeocdn.com/ts/455/801/455801511_640.jpg	HTTP Cache en Rails 4 - Christopher Cocchi-Perrier	Slides: https://speakerdeck.com/ccocchi/http-cache-in-rails-4\n\nEpita	2013-11-05	http-cache-en-rails-4-christopher-cocchi-perrier	2014-01-07 17:55:33.810324	2014-01-07 17:55:33.810324
62	https://vimeo.com/79670120	http://b.vimeocdn.com/ts/455/449/455449424_640.jpg	Websockets Rails - Julien 'Lta' Ballet	Comment utiliser les websockets dans une application Rails ?\n\nEpita	2013-11-05	websockets-rails-julien-lta-ballet	2014-01-07 17:55:33.831067	2014-01-07 17:55:33.831067
64	https://vimeo.com/79696713	http://b.vimeocdn.com/ts/455/801/455801768_640.jpg	Heimanu - Laurent de Saignes	Heimanu est une plateforme de rencontre amicale par affinités. Laurent nous raconte comment ils ont intégré des partie de Discourse dans le fonctionnement de Heimanu.\n\nEpita	2013-11-05	heimanu-laurent-de-saignes	2014-01-07 17:55:33.879994	2014-01-07 17:55:33.879994
51	https://vimeo.com/72344243	http://b.vimeocdn.com/ts/446/179/446179072_640.jpg	Manuel de survie en entreprise - Simon Guimezanes	Comment promouvoir l'innovation dans l'entreprise en tenant compte de la politique interne ?	2013-07-02	manuel-de-survie-en-entreprise-simon-guimezanes	2014-01-07 17:55:33.583557	2016-04-10 11:19:29.6471
66	https://vimeo.com/84706497	http://b.vimeocdn.com/ts/461/685/461685308_640.jpg	RailsGirls à Lille - Martin Catty	Un RailsGirls aura lieu à Lille le dernier week-end de janvier 2014\r\n\r\nGoogle	2014-01-07	railsgirls-a-lille-martin-catty	2014-01-31 12:40:55.66299	2014-01-31 12:43:51.051284
67	https://vimeo.com/84706501	http://b.vimeocdn.com/ts/461/746/461746536_640.jpg	SIMPLON.CO - Partenaire ParisRB	Simplon.co est un tiers-lieu d'innovation technique et solidaire qui propose une formation intensive gratuite au développement web / mobile, et des formats d'accompagnement vers l'entrepreneuriat numérique.\r\n\r\nGoogle	2014-01-07	simplon-co-partenaire-parisrb	2014-01-31 12:46:18.06356	2014-01-31 12:46:18.06356
92	https://vimeo.com/88448166	http://b.vimeocdn.com/ts/466/928/466928111_640.jpg	Le Code est un jeu de Piste - Martin Van Aken	Codez pour des humains, pas pour des machines. Martin nous explique en quoi il est important que notre code soit clair pour nous-même et les autres développeurs.\r\n\r\nEpita	2013-03-04	le-code-est-un-jeu-de-piste-martin-van-aken	2014-03-11 12:53:32.756198	2014-03-11 12:53:32.756198
63	https://vimeo.com/79670121	http://b.vimeocdn.com/ts/461/181/461181616_640.jpg	La bibliothèque Gosu - Matthieu Segret	Gosu est une gem Ruby qui permet le développement rapide de jeux vidéos\r\n\r\nEpita	2013-11-05	la-bibliotheque-gosu-matthieu-segret	2014-01-07 17:55:33.852701	2014-02-24 17:19:45.29294
54	https://vimeo.com/72470161	http://b.vimeocdn.com/ts/446/335/446335834_640.jpg	Porteurs de projets, mettez vous au développement ! - Michel Ivanovsky et Thibaut Assus	"Porteur de projet, mettez vous au développement !" ou comment démarrer en 4 mois une web app complexe en pair-programming.\r\n\r\nEpita	2013-07-02	porteur-de-projet-mettez-vous-au-developpement-michel-ivanovsky-et-thibaut-assus	2014-01-07 17:55:33.651995	2014-02-24 17:39:02.662205
70	https://vimeo.com/85194448	http://b.vimeocdn.com/ts/462/412/462412927_640.jpg	ActiveRecord Serialization - Jean Boussier	Comment sérialiser des données pour les stocker en base de données avec ActiveRecord ? Les stores, du JSON ? Comment maintenir tout ça ?\r\n\r\nGoogle	2014-01-07	activerecord-serialization-jean-boussier	2014-01-31 12:49:36.222985	2014-01-31 12:49:36.222985
71	https://vimeo.com/85198150	http://b.vimeocdn.com/ts/462/862/462862712_640.jpg	Server-sent Events - Etienne Barrié	Etienne nous parle d'une nouveauté étudiée en ce moment par le W3C pour permettre de créer des applications "real-time" très facilement.\r\n\r\nGoogle	2014-01-07	server-sent-events-etienne-barrie	2014-01-31 12:51:31.692365	2014-01-31 12:51:31.692365
72	https://vimeo.com/85249154	http://b.vimeocdn.com/ts/462/480/462480622_640.jpg	gmaps4rails - Benjamin Roth	Benjamin nous parle de son projet gmaps4rails qui permet de s'interfacer avec Google Maps en quelques lignes de Javascript.\r\n\r\nGoogle	2014-01-07	gmaps4rails-benjamin-roth	2014-01-31 12:51:54.529484	2014-01-31 12:51:54.529484
73	https://vimeo.com/85391869	http://b.vimeocdn.com/ts/462/863/462863155_640.jpg	Happy Freelancing - Chloé Roger et Thibaut Assus	Comment être heureux lorsque l'on est freelance ? Comment ne pas être à la merci du client tout en gardant un rapport de proximité et de confiance ? Vendre à l'heure peut être une solution alternative au forfait.\r\n\r\nGoogle	2014-01-07	happy-freelancing-chloe-roger-et-thibaut-assus	2014-01-31 12:52:15.401207	2014-01-31 12:52:15.401207
74	https://vimeo.com/85490636	http://b.vimeocdn.com/ts/462/834/462834680_640.jpg	Bootstrapping d'un SaaS - Thibaut Barrere	Quels sont les pièges à éviter lorsque l'on se lance dans la création d'un SaaS ? Quels astuces peut-on utiliser pour améliorer le lancement, la conception, la vie du produit tout en gardant de la place pour sa vie personnelle ?\r\n\r\nGoogle	2014-01-07	bootstrapping-d-un-saas-thibaut-barrere	2014-01-31 12:52:55.414925	2014-01-31 12:52:55.414925
75	https://vimeo.com/84799018	http://b.vimeocdn.com/ts/462/879/462879001_640.jpg	Simplib	Présentation de notre sponsor Simplib\r\n\r\nGoogle	2014-01-07	simplib	2014-01-31 14:09:08.354286	2014-01-31 14:09:08.354286
9	https://vimeo.com/36438541	http://b.vimeocdn.com/ts/249/972/249972400_640.jpg	Présentation de MongoDB / Mongoid - Lan Sun Luk	Présentation de la base de données NoSQL MongoDB et de son ORM Ruby nommé Mongoid.\r\n\r\nLa Cantine	2012-02-06	presentation-de-mongodb-mongoid	2014-01-07 16:08:41.405289	2014-01-31 21:45:33.822279
68	https://vimeo.com/85596386	http://b.vimeocdn.com/ts/462/971/462971592_640.jpg	Applications Mobiles Natives - Marc Gauthier	Marc nous parle du développement d'applications mobiles avec Steroids.js.\r\n\r\nGoogle	2014-01-07	applications-mobiles-natives-marc-gauthier	2014-01-31 12:47:10.308877	2014-02-05 13:33:31.136494
76	https://vimeo.com/85557375	http://b.vimeocdn.com/ts/463/401/463401334_640.jpg	Palette de couleur Web - Igor Cheloudiakoff	Igor nous donne quelques conseils sur la création d'un thème couleur pour une application web.\r\n\r\nGoogle	2014-01-07	palette-de-couleur-web-igor-cheloudiakoff	2014-02-05 13:42:22.878966	2014-02-05 13:42:22.878966
77	https://vimeo.com/85562939	http://b.vimeocdn.com/ts/462/927/462927705_640.jpg	Discours d'ouverture - Alexis Moussine-Pouchkine	Alexis Moussine-Pouchkine partage avec nous le plaisir qu'il a à recevoir Paris.rb dans les locaux de Google France.\r\n\r\nGoogle	2014-01-07	discours-d-ouverture-alexis-moussine-pouchkine	2014-02-05 13:44:58.046058	2014-02-05 13:44:58.046058
78	https://vimeo.com/85594903	http://b.vimeocdn.com/ts/463/401/463401795_640.jpg	ActionController::Live - Guillaume Troppée	Présentation, implémentation et bilan de l'utilisation d'ActionController::Live\r\n\r\nGoogle	2014-01-07	actioncontroller-live-guillaume-troppee	2014-02-05 13:47:24.238392	2014-02-05 13:47:24.238392
79	https://vimeo.com/85603373	http://b.vimeocdn.com/ts/463/007/463007034_640.jpg	Tizen - Romuald Rozan	Romuald nous présente Tizen, système d'exploitation open-source et multi-constructeurs.\r\n\r\nEpita	2013-07-02	tizen-romuald-rozan	2014-02-05 13:53:33.227081	2014-02-05 13:53:33.227081
80	https://vimeo.com/85642483	http://b.vimeocdn.com/ts/463/105/463105099_640.jpg	Recent technical advances in Passenger - Hongli Lai	Quelles sont les évolutions de Passenger ces dernières années ? Que pouvons-nous faire aujourd'hui ? Comment s'organise le développement de Passenger et comment est-il financé ?\r\n\r\nEpita	2013-12-03	recent-technical-advances-in-passenger-hongli-lai	2014-02-05 14:01:51.962033	2014-02-05 14:01:51.962033
81	https://vimeo.com/85728484	http://b.vimeocdn.com/ts/463/403/463403600_640.jpg	Zeus & Zeus Parallel tests - Dimitri Jorge	Dimitri comment accélérer notre process de développement Rails grâce à Zeus et Zeus Parallel\r\n\r\nEpita	2013-12-03	zeus-zeus-parallel-tests-dimitri-jorge	2014-02-05 14:06:47.281667	2014-02-05 14:06:47.281667
38	https://vimeo.com/64902777	http://b.vimeocdn.com/ts/436/264/436264382_640.jpg	Comment appréhender RoR quand on vient du développement web traditionnel ? - Alexandre Centar	Comment se familiariser avec l'écosystème et le fonctionnement de Ruby on Rails quand on est issu d'autres milieux du développement web ?\r\n\r\nEpita	2013-04-02	comment-apprehender-ror-quand-on-vient-du-developpement-web-traditionnel-alexandre-centar	2014-01-07 17:55:33.28451	2014-02-24 17:07:43.296759
82	https://vimeo.com/86134344	http://b.vimeocdn.com/ts/463/731/463731497_640.jpg	Safety Nets for Ruby: Tests, Review, and Automation - Christophe Philemotte	Christophe nous donne quelques conseils sur le travail en équipe, l'importance des tests, de la revue de code et de l'automatisation du process.\r\n\r\nEpita	2014-02-04	safety-nets-for-ruby-tests-review-and-automation-christophe-philemotte	2014-03-01 17:36:34.496867	2014-03-01 17:36:34.496867
83	https://vimeo.com/87675631	http://b.vimeocdn.com/ts/465/838/465838916_640.jpg	Choose Your Boss - Benoit Guillou et Etienne Curati	ChooseYourBoss est une plateforme de recrutement d'un nouveau genre. Pas d'annonces inappropriés ou de recruteurs acharnés. L'employé est roi.\r\n\r\nEpita	2014-02-04	choose-your-boss-benoit-guillou-et-etienne-curati	2014-03-01 17:39:09.578132	2014-03-01 17:39:09.578132
84	https://vimeo.com/87682586	http://b.vimeocdn.com/ts/466/207/466207987_640.jpg	Fake your files - Simon Courtois	Comment tester son code quand il modifie des fichiers/dossiers ? Est-il possible d'avoir un système de fichiers en mémoire pour lancer nos tests ? Oui avec la gem MemFs !\r\n\r\nEpita	2014-02-04	fake-your-files-simon-courtois	2014-03-01 17:42:29.988286	2014-03-01 17:42:29.988286
85	https://vimeo.com/87710671	http://b.vimeocdn.com/ts/466/208/466208223_640.jpg	Pry as replacement for IRB - Kevin Soltysiak	Qu'est-ce que Pry ? En quoi est-il meilleur que IRB et comment vous pouvez l'utiliser pour faciliter votre développement ?\r\n\r\nEpita	2014-02-04	pry-as-replacement-for-irb-kevin-soltysiak	2014-03-01 17:45:33.73787	2014-03-01 17:45:33.73787
86	https://vimeo.com/87724136	http://b.vimeocdn.com/ts/466/208/466208399_640.jpg	Relecture de POODR:  Single Responsibility Principle - Thomas Petrachi	Dans POODR, Sandi Metz parle du S de SOLID, le Single Responsability Principle. Thomas met l'accent sur ce principe et nous explique en quoi il consiste et comment le respecter dans son code.\r\n\r\nEpita	2014-02-04	relecture-de-poodr-single-responsibility-principle-thomas-petrachi	2014-03-01 17:48:33.380084	2014-03-01 17:48:33.380084
87	https://vimeo.com/87869625	http://b.vimeocdn.com/ts/466/208/466208601_640.jpg	Pragmatic Web Components - Nicolas Mérouze	Que sont les Web Components ? À quoi servent-ils et comment les utiliser avec Rails ?\r\n\r\nEpita	2014-02-04	pragmatic-web-components-nicolas-merouze	2014-03-01 17:51:59.044371	2014-03-01 17:51:59.044371
88	https://vimeo.com/87902643	http://b.vimeocdn.com/ts/466/208/466208814_640.jpg	Faire de l’analyse prédictive en temps réel avec Ruby et R - Benjamin Lan Sun Luk	Comment faire communiquer Ruby et R pour utiliser chaque langage pour le travail qui lui convient le mieux.\r\n\r\nEpita	2014-02-04	faire-de-l-analyse-predictive-en-temps-reel-avec-ruby-et-r-benjamin-lan-sun-luk	2014-03-01 17:55:37.304866	2014-03-01 17:55:37.304866
94	https://vimeo.com/88585278	http://b.vimeocdn.com/ts/467/110/467110928_640.jpg	Multi tenant/lang application with Ruby on Rails - Simon Courtois	Comment créer une application multi-domaines sans surcharger son ApplicationController ? Un middleware est peut-être la solution.\r\n\r\nEpita	2014-03-04	multi-tenant-lang-application-with-ruby-on-rails-simon-courtois	2014-03-11 13:06:36.088959	2014-03-11 13:06:36.088959
89	https://vimeo.com/88364325	http://b.vimeocdn.com/ts/466/802/466802161_640.jpg	La Chabadabada Week avec SIMPLON.CO - Vendredi 7 mars de 18h à 23h - Samedi 8 mars de 10h à 17h	http://simplon.co/evenements/2014/2/25/la-chabadabada-week-notre-semaine-de-la-mixit\r\n\r\nVendredi 7 mars de 18h à 23h : Soirée pitch (des projets hackathonés et d’autres projets de l’écosystème Simplon) ; en présence des mentors et des partenaires.\r\n\r\n+ Cocktail dinatoire de clôture. Inscription par ici:http://simplon.co/evenements/2014/2/25/la-chabadabada-week-notre-semaine-de-la-mixit\r\n\r\nSamedi 8 mars de 10h à 17h : Journée BYOK (Bring Your Own Kid) ateliers de programmation pour les enfants \r\n\r\nAvec 40% de femmes dans sa première promotion, Simplon.co souhaite promouvoir les femmes dans le code et accompagner toujours plus haut les femmes de la French tech qui entreprennent et qui agissent dans le numérique.\r\n\r\nEpita	2014-03-04	la-chabadabada-week-avec-simplon-co-vendredi-7-mars-de-18h-a-23h-samedi-8-mars-de-10h-a-17h	2014-03-07 09:33:59.588991	2014-03-07 09:33:59.588991
103	https://vimeo.com/99744932	http://i.vimeocdn.com/video/481456734_640.jpg	Mon site perso en 20 minutes - Live Coding - Benjamin Crouzier	Benjamin crée son site perso en live avec Rails, ThemeForest et olala\r\n\r\nÉcole 42	2014-06-03	mon-site-perso-en-20-minutes-live-coding-benjamin-crouzier	2014-07-07 07:28:01.757437	2014-07-07 07:28:01.757437
104	https://vimeo.com/99747432	http://i.vimeocdn.com/video/481456917_640.jpg	Managing domains constraints in Rails - Guillaume Montard	Comment éviter une requête SQL à chaque vérification de domaine sans avoir à redémarrer son application quand un nouveau domaine est ajouté ?\r\n\r\nÉcole 42	2014-06-03	managing-domains-constraints-in-rails-guillaume-montard	2014-07-07 07:31:24.151819	2014-07-07 07:31:24.151819
105	https://vimeo.com/99750274	http://i.vimeocdn.com/video/481072075_640.jpg	Chef infrastructure as code - Nicolas Ledez	Comment gérer son infrastructure comme une base de code ?\r\n\r\nÉcole 42	2014-06-03	chef-infrastructure-as-code-nicolas-ledez	2014-07-07 07:33:10.796961	2014-07-07 07:33:10.796961
106	https://vimeo.com/99752707	http://i.vimeocdn.com/video/481053894_640.jpg	Table Driven Testing - Nicolas Mérouze	Simplifier et organiser ses tests fonctionnels grâce à des données tabulaires\r\n\r\nÉcole 42	2014-06-03	table-driven-testing-nicolas-merouze	2014-07-07 07:34:39.394951	2014-07-07 07:34:39.394951
107	https://vimeo.com/99783251	http://i.vimeocdn.com/video/481457309_640.jpg	Un sitemap generator - Alex Centar	Générer facilement le sitemap de son site avec sitemap_generator\r\n\r\nÉcole 42	2014-06-03	un-sitemap-generator-alex-centar	2014-07-07 07:37:43.022151	2014-07-07 07:37:43.022151
108	https://vimeo.com/99784775	http://i.vimeocdn.com/video/481100139_640.jpg	Reverse engineering du QLobe - Loïc Boutet	Analyse du fonctionnement des QLobe et petite démonstration\r\n\r\nÉcole 42	2014-06-03	reverse-engineering-du-qlobe-loic-boutet	2014-07-07 07:39:04.474185	2014-07-07 07:39:04.474185
109	https://vimeo.com/99981519	http://i.vimeocdn.com/video/481333692_640.jpg	FollowAnalytics - Nicolas Boron et Alexis Woo	Présentation de notre sponsor FollowAnalytics\r\n\r\nÉcole 42	2014-06-03	followanalytics-nicolas-boron-et-alexis-woo	2014-07-07 07:40:22.2085	2014-07-07 07:40:22.2085
110	https://vimeo.com/99983596	http://i.vimeocdn.com/video/481343149_640.jpg	From a development workflow to a flow that works - Martin Van Aken	Quels sont les meilleures pratiques du développement en équipe et comment optimiser son processus de développement ?\r\n\r\nÉcole 42	2014-06-03	from-a-development-workflow-to-a-flow-that-works-martin-van-aken	2014-07-07 07:42:00.382942	2014-07-07 07:42:00.382942
111	https://vimeo.com/99997031	http://i.vimeocdn.com/video/481385575_640.jpg	12 mois dans la peau d'une application d'entreprise en mode LEAN STARTUP - Christopher Parola	Retour d'expérience sur le développement d'un produit et mode Lean Startup\r\n\r\nÉcole 42	2014-06-03	12-mois-dans-la-peau-d-une-application-d-entreprise-en-mode-lean-startup-christopher-parola	2014-07-07 07:43:43.701587	2014-07-07 07:43:43.701587
112	https://vimeo.com/100064492	http://i.vimeocdn.com/video/481451316_640.jpg	FitNext CA et clients sans marketing - Céline Ruffet	Notre sponsor FitNext nous explique comment son équipe réussi à créer sa base client sans budget marketing\r\n\r\nEpita	2014-07-01	fitnext-ca-et-clients-sans-marketing-celine-ruffet	2014-07-07 07:46:05.10571	2014-07-07 07:49:23.265439
114	https://vimeo.com/100154331	http://i.vimeocdn.com/video/481640069_640.jpg	9 rules to perform better RUSSIAN DOLLS and FRIENDS - Thibaut Assus	9 règles simples pour obtenir de meilleures performances avec Ruby on Rails (sur Heroku et ailleurs)\r\n\r\nEpita	2014-07-01	9-rules-to-perform-better-russian-dolls-and-friends-thibaut-assus	2014-07-08 15:22:28.897354	2014-07-08 15:22:28.897354
113	https://vimeo.com/100991708	http://i.vimeocdn.com/video/482658589_640.jpg	Pub/Sub in Ruby - Adrien Siami	Comment mettre en place une architecture pub/sub (publish/subscribe) en Ruby ? Quelles sont les solutions à disposition ?\r\nEpita	2014-07-01	pub-sub-in-ruby-adrien-siami	2014-07-08 15:19:21.504788	2014-07-17 15:32:50.073786
116	https://vimeo.com/104846925	http://i.vimeocdn.com/video/487498350_640.jpg	Rails on Rio - Stephan Toth	Comment Rails s'intègre-t-il dans une infrastructure de remontée d'informations en temps réel ?\r\n\r\nEpita	2014-08-05	rails-on-rio-stephan-toth	2014-09-01 11:49:03.812492	2014-09-01 11:55:55.945565
118	https://vimeo.com/104857542	http://i.vimeocdn.com/video/487507709_640.jpg	IT Management - Pierre Urban	Comment gérer efficacement une équipe de développement ?\r\n\r\nEpita	2014-08-05	it-management-pierre-urban	2014-09-01 11:54:39.440065	2014-09-01 11:56:09.96384
119	https://vimeo.com/104899368	http://i.vimeocdn.com/video/487559223_640.jpg	J’ai une idée : WebApp ou Pas ? - Martin van Aken	Un site aujourd'hui, ce n'est plus seulement une application web, API, mobile, emails, ... Qu'est-ce que cela implique de mettre son idée en ligne ?\r\n\r\nEpita	2014-08-05	j-ai-une-idee-webapp-ou-pas-martin-van-aken	2014-09-01 11:58:20.33097	2014-09-01 11:58:20.33097
123	https://vimeo.com/107332133	http://i.vimeocdn.com/video/490710525_640.jpg	Build Realtime Search with Algolia - Sylvain Utard	Comment utiliser le service Algolia pour créer un système de recherche\r\n\r\nNuma	2014-05-06	build-realtime-search-with-algolia-sylvain-utard	2014-10-06 09:29:03.646409	2014-10-06 09:29:03.646409
125	https://vimeo.com/107399289	http://i.vimeocdn.com/video/490787390_640.jpg	Crawling the web with Import.io and sidekiq - Cassio Melo	Besoin d'extraire des données depuis un site web ? Voici comment avec le service Import.io et Sidekiq.\r\n\r\nNuma	2014-05-06	crawling-the-web-with-import-io-and-sidekiq-cassio-melo	2014-10-06 09:35:26.845852	2014-10-06 09:43:08.687468
127	https://vimeo.com/107405455	http://i.vimeocdn.com/video/490795552_640.jpg	Rails as a build tool or  why Rails is awesome  (or FU** Grunt) - Michael Bensoussan	Comment créer son propre générateur de site statique (style middleman ou jekyll) en utilisant Rails\r\n\r\nNuma	2014-05-06	rails-as-a-build-tool-or-why-rails-is-awesome-or-fu-grunt-michael-bensoussan	2014-10-06 09:52:13.083921	2014-10-06 09:52:13.083921
128	https://vimeo.com/107454680	http://i.vimeocdn.com/video/491151160_640.jpg	Dev Ruby au Japon - Julien Feltesse	Comment c'est d'être développeur Ruby au Japon ?\r\n\r\nAltavia, AgenceCosmic	2014-09-02	dev-ruby-au-japon-julien-feltesse	2014-10-06 09:57:09.557544	2014-10-06 09:57:09.557544
131	https://vimeo.com/107695541	http://i.vimeocdn.com/video/491567124_640.jpg	Rails et Emails - Sunny Ripert	Astuces et bonnes pratiques lorsque l'on envoie des emails depuis une application Rails\r\n\r\nAltavia, AgenceCosmic	2014-09-02	rails-et-emails-sunny-ripert	2014-10-06 10:08:43.747702	2014-10-06 10:08:43.747702
93	https://vimeo.com/88568962	http://b.vimeocdn.com/ts/467/111/467111059_640.jpg	Known unknowns - Sylvain Abélard	Quels sont les pièges à éviter lorsque l'on crée des applications ? À quoi faut-il penser lorsque l'on doit importer un fichier CSV ? Ou quand on ajoute une "simple" checkbox ?\r\n\r\nEpita	2014-03-04	known-unknowns-sylvain-abelard	2014-03-11 13:04:34.157947	2014-03-11 13:04:34.157947
95	https://vimeo.com/93593495	http://i.vimeocdn.com/video/473688727_640.jpg	Cherche coachs pour initier des collégiennes à la programmation - Salwa Toko	Wi-Filles est une initiative lancée pour créer un plan de formation à la programmation pour des collégiennes.\r\n\r\nEpita	2014-04-01	cherche-coachs-pour-initier-des-collegiennes-a-la-programmation-salwa-toko	2014-05-04 09:13:01.080199	2014-05-04 09:13:01.080199
100	https://vimeo.com/94982649	http://i.vimeocdn.com/video/474929074_640.jpg	lzheimer's Shell - Benjamin Crouzier	Benjamin crée un shell Ruby en Live !\r\n\r\nEpita	2014-04-01	alzheimer-s-shell-benjamin-crouzier	2014-05-04 09:31:12.203478	2014-06-03 20:24:35.634062
96	https://vimeo.com/93620288	http://i.vimeocdn.com/video/473733187_640.jpg	Et si quelqu'un venait de la part de Cassandre, Ouvre-lui tôt la porte et ne le fais pas attendre - Ori Pekelmam	Ori nous montre avec quelle facilité on peut installer Cassandra aujourd'hui, dans quel cas cela peut être utile et comment jouer avec.\r\n\r\nEpita	2014-04-01	cassandra-ori-pekelmam	2014-05-04 09:19:35.673033	2014-05-04 09:19:59.231742
97	https://vimeo.com/93622900	http://i.vimeocdn.com/video/473733508_640.jpg	Trouvez vous un partenaire de jeu - Martin Van Aken	Le pair programming est une très bonne façon d'évoluer et de s'améliorer, le tout est de trouver quelqu'un avec qui le faire\r\n\r\nEpita	2014-04-01	trouvez-vous-un-partenaire-de-jeu-martin-van-aken	2014-05-04 09:22:10.567854	2014-05-04 09:22:10.567854
98	https://vimeo.com/93662159	http://i.vimeocdn.com/video/473789547_640.jpg	Ruby par la pratique - Sylvain Abélard	Qu'est-ce que Ruby ? Comment ça marche ?\r\n\r\nEpita	2014-04-01	ruby-par-la-pratique-sylvain-abelard	2014-05-04 09:28:19.681428	2014-05-04 09:28:19.681428
99	https://vimeo.com/94982777	http://i.vimeocdn.com/video/475036374_640.jpg	Bye Google Maps, welcome Mapbox - Cassio Melo	10 raisons pour migrer tout de suite vers Mapbox\r\n\r\nEpita	2014-04-01	bye-google-maps-welcome-mapbox-cassio-melo	2014-05-04 09:29:59.301849	2014-06-03 20:29:22.267483
115	https://vimeo.com/100161522	http://i.vimeocdn.com/video/481640336_640.jpg	Text Tools - Sylvain Abélard	Outils textes bien pratiques et à connaitre pour s'éviter du développement inutile. UNIX est votre ami.\r\n\r\nEpita	2014-07-01	text-tools-sylvain-abelard	2014-07-08 15:24:36.709319	2014-07-08 15:24:36.709319
117	https://vimeo.com/104855887	http://i.vimeocdn.com/video/487507699_640.jpg	AirCall - Thibaud Elziere	Présentation de AirCall, un des sponsors du mois de septembre.\r\n\r\nEpita	2014-08-05	aircall-thibaud-elziere	2014-09-01 11:51:43.018105	2014-09-01 11:56:02.839331
120	https://vimeo.com/104900592	http://i.vimeocdn.com/video/487560024_640.jpg	Mon premier mois dans une start-up - Alexandre Tadrosh	Retour d'expérience d'un étudiant qui a passé un mois dans une start-up\r\n\r\nEpita	2014-08-05	mon-premier-mois-dans-une-start-up-alexandre-tadrosh	2014-09-01 12:00:32.823529	2014-09-01 12:00:32.823529
121	https://vimeo.com/104901603	http://i.vimeocdn.com/video/487561174_640.jpg	Ruby and Rails Pro Tips - Michel Pigassou	Quelques trucs et astuces pour se faciliter la vie avec Ruby et Rails\r\n\r\nEpita	2014-08-05	ruby-and-rails-pro-tips-michel-pigassou	2014-09-01 12:01:45.012616	2014-09-01 12:01:45.012616
124	https://vimeo.com/107396377	http://i.vimeocdn.com/video/490783954_640.jpg	The Treasures of Ruby, one for each day - Christophe Philemotte	Christophe nous parle de quelques fonctionnalités de Ruby peu connues des développeurs et qui peuvent pourtant s'avérer bien utiles.\r\n\r\nNuma	2014-05-06	the-treasures-of-ruby-one-for-each-day-christophe-philemotte	2014-10-06 09:32:32.259379	2014-10-06 09:32:32.259379
126	https://vimeo.com/107402887	http://i.vimeocdn.com/video/490792647_640.jpg	A/B Testing on Rails - Hassen Taidirt	Quels outils peut-on utiliser pour faire de l'A/B testing avec Rails et quels sont leurs capacités ?\r\n\r\nNuma	2014-05-06	a-b-testing-on-rails-hassen-taidirt	2014-10-06 09:45:21.047171	2014-10-06 09:45:21.047171
129	https://vimeo.com/107630266	http://i.vimeocdn.com/video/491151028_640.jpg	Side project: lessons learned - Philippe Bourgau	Quelques leçons tirées du développement d'un side project\r\n\r\nAltavia, AgenceCosmic	2014-09-02	side-project-lessons-learned-philippe-bourgau	2014-10-06 09:59:54.97286	2014-10-06 09:59:54.97286
130	https://vimeo.com/107637676	http://i.vimeocdn.com/video/491150978_640.jpg	Ruby: not only for servers - Loïc Boutet	Loïc nous présente OpalRB ou comment faire du Ruby côté client\r\n\r\nAltavia, AgenceCosmic	2014-09-02	ruby-not-only-for-servers-loic-boutet	2014-10-06 10:03:18.38239	2014-10-06 10:03:18.38239
\.


--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simonc
--

SELECT pg_catalog.setval('public.rails_admin_histories_id_seq', 1, false);


--
-- Name: rake_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simonc
--

SELECT pg_catalog.setval('public.rake_tasks_id_seq', 1, false);


--
-- Name: sponsors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simonc
--

SELECT pg_catalog.setval('public.sponsors_id_seq', 43, true);


--
-- Name: talks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simonc
--

SELECT pg_catalog.setval('public.talks_id_seq', 531, true);


--
-- Name: tweets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simonc
--

SELECT pg_catalog.setval('public.tweets_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simonc
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simonc
--

SELECT pg_catalog.setval('public.videos_id_seq', 131, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: rails_admin_histories rails_admin_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.rails_admin_histories
    ADD CONSTRAINT rails_admin_histories_pkey PRIMARY KEY (id);


--
-- Name: rake_tasks rake_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.rake_tasks
    ADD CONSTRAINT rake_tasks_pkey PRIMARY KEY (id);


--
-- Name: sponsors sponsors_pkey; Type: CONSTRAINT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.sponsors
    ADD CONSTRAINT sponsors_pkey PRIMARY KEY (id);


--
-- Name: talks talks_pkey; Type: CONSTRAINT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.talks
    ADD CONSTRAINT talks_pkey PRIMARY KEY (id);


--
-- Name: tweets tweets_pkey; Type: CONSTRAINT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.tweets
    ADD CONSTRAINT tweets_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: public; Owner: simonc
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- Name: index_rails_admin_histories; Type: INDEX; Schema: public; Owner: simonc
--

CREATE INDEX index_rails_admin_histories ON public.rails_admin_histories USING btree (item, "table", month, year);


--
-- Name: index_rake_tasks_on_version; Type: INDEX; Schema: public; Owner: simonc
--

CREATE UNIQUE INDEX index_rake_tasks_on_version ON public.rake_tasks USING btree (version);


--
-- Name: index_talks_on_happened_on; Type: INDEX; Schema: public; Owner: simonc
--

CREATE INDEX index_talks_on_happened_on ON public.talks USING btree (happened_on);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: simonc
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: simonc
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_videos_on_slug; Type: INDEX; Schema: public; Owner: simonc
--

CREATE UNIQUE INDEX index_videos_on_slug ON public.videos USING btree (slug);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: simonc
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--
