--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0 (Debian 17.0-1.pgdg120+1)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: myuser
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO myuser;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: myuser
--

COMMENT ON SCHEMA public IS '';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Account; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."Account" (
    id text NOT NULL,
    "userId" text NOT NULL,
    type text NOT NULL,
    provider text NOT NULL,
    "providerAccountId" text NOT NULL,
    refresh_token text,
    access_token text,
    expires_at integer,
    token_type text,
    scope text,
    id_token text,
    session_state text
);


ALTER TABLE public."Account" OWNER TO myuser;

--
-- Name: Board; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."Board" (
    id text NOT NULL,
    "projectId" text NOT NULL,
    "ownerId" text NOT NULL
);


ALTER TABLE public."Board" OWNER TO myuser;

--
-- Name: Column; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."Column" (
    id text NOT NULL,
    name text NOT NULL,
    "order" integer NOT NULL,
    "boardId" text NOT NULL
);


ALTER TABLE public."Column" OWNER TO myuser;

--
-- Name: Post; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."Post" (
    id integer NOT NULL,
    title text NOT NULL,
    content text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "authorId" text
);


ALTER TABLE public."Post" OWNER TO myuser;

--
-- Name: Post_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public."Post_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Post_id_seq" OWNER TO myuser;

--
-- Name: Post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public."Post_id_seq" OWNED BY public."Post".id;


--
-- Name: Project; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."Project" (
    id text NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "ownerId" text NOT NULL
);


ALTER TABLE public."Project" OWNER TO myuser;

--
-- Name: Session; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."Session" (
    id text NOT NULL,
    "sessionToken" text NOT NULL,
    "userId" text NOT NULL,
    expires timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Session" OWNER TO myuser;

--
-- Name: Task; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."Task" (
    id text NOT NULL,
    "columnId" text NOT NULL,
    "assigneeId" text,
    name text
);


ALTER TABLE public."Task" OWNER TO myuser;

--
-- Name: User; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."User" (
    id text NOT NULL,
    name text,
    email text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "emailVerified" timestamp(3) without time zone,
    image text
);


ALTER TABLE public."User" OWNER TO myuser;

--
-- Name: VerificationToken; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."VerificationToken" (
    identifier text NOT NULL,
    token text NOT NULL,
    expires timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."VerificationToken" OWNER TO myuser;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO myuser;

--
-- Name: Post id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Post" ALTER COLUMN id SET DEFAULT nextval('public."Post_id_seq"'::regclass);


--
-- Data for Name: Account; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."Account" (id, "userId", type, provider, "providerAccountId", refresh_token, access_token, expires_at, token_type, scope, id_token, session_state) FROM stdin;
cm375leuq0002anytglpjmp0i	cm375leu00000anyt8bs7a2ny	oauth	discord	932874614214885416	fGWqiRYreQ7x9zMCMiZzhjk7tbJi6c	X3fPkdCimCRgTtS60blyx7oIksxbUX	1731579416	Bearer	identify email	\N	\N
\.


--
-- Data for Name: Board; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."Board" (id, "projectId", "ownerId") FROM stdin;
12313	2234124	cm375leu00000anyt8bs7a2ny
\.


--
-- Data for Name: Column; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."Column" (id, name, "order", "boardId") FROM stdin;
cm385ndcw000bdftmch1sk1fl	Todo	1	12313
cm385rw7z000pdftmo9rvdp1k	Doing	2	12313
cm385t8rs000tdftmsocg2kwv	Done	3	12313
cm385wg3d0001hqlp1jjzo7xw	Inprogress	4	12313
cm389sd3k000110efteh8iiji	In gay	5	12313
cm389somq000310efu4xpmktx	In gay gay	6	12313
cm389ttyt000510efx8577l59	Bom gay	7	12313
0d5b0a1d-bed6-485f-a477-f6813dc5fe81	bom gayเน	4	12313
\.


--
-- Data for Name: Post; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."Post" (id, title, content, "createdAt", "authorId") FROM stdin;
\.


--
-- Data for Name: Project; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."Project" (id, name, "createdAt", "ownerId") FROM stdin;
2234124	smart office	2024-11-07 10:17:57.7	cm375leu00000anyt8bs7a2ny
\.


--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."Session" (id, "sessionToken", "userId", expires) FROM stdin;
cm375lev70004anyth6plxgc5	5dbeccf1-c703-40d4-971a-dfc46457f446	cm375leu00000anyt8bs7a2ny	2024-12-08 18:04:54.502
\.


--
-- Data for Name: Task; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."Task" (id, "columnId", "assigneeId", name) FROM stdin;
cm38iluwi000710efxbsgqnud	cm385ndcw000bdftmch1sk1fl	\N	ohm
cm38im9j7000910eff99w06kr	cm385ndcw000bdftmch1sk1fl	\N	ohm
cm38imhar000b10efk6h4vo5y	cm385rw7z000pdftmo9rvdp1k	\N	Bom gay
cm38impxx000d10efab7ifuus	cm385rw7z000pdftmo9rvdp1k	\N	Bom gay gay
cm38jbsjn000f10efcdgzefxn	cm385rw7z000pdftmo9rvdp1k	\N	Bom gay mak mak
cm38jcfcj000h10efp8yn4twn	cm385rw7z000pdftmo9rvdp1k	\N	Bom
cm38jcmx6000j10efplsfpnwx	cm385ndcw000bdftmch1sk1fl	\N	P' gay
cm391s0w70001p25z2r0xlw1q	cm385t8rs000tdftmsocg2kwv	\N	Bom
cm39mfoj40001wqoafeax5tu9	0d5b0a1d-bed6-485f-a477-f6813dc5fe81	\N	เธเธฃเธตเนเธเธญเธกเนเธเธฃเธ•เน€เธเธขเน
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."User" (id, name, email, "createdAt", "emailVerified", image) FROM stdin;
cm375leu00000anyt8bs7a2ny	jezzier_090	jessadanaka12@gmail.com	2024-11-07 10:16:57.431	\N	https://cdn.discordapp.com/avatars/932874614214885416/f23f8e49d24d9075b4393e260c894380.png
\.


--
-- Data for Name: VerificationToken; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."VerificationToken" (identifier, token, expires) FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
a2bd2d4f-aac4-481d-bc04-8327f832670f	47578852afad6794802630708ec89809cfc0c90bb1cd4f56633e103a6535120e	2024-11-07 10:13:49.476194+00	20241103043859_first_migration	\N	\N	2024-11-07 10:13:49.46408+00	1
e333d1ec-e97b-4ff0-94b9-72fa1c1eb8eb	0771abb5a02da9fa35ab8e92ab085c076ccbb7e243b05aef7eddd6ec1e355726	2024-11-07 10:13:49.494045+00	20241103054644_first_migration	\N	\N	2024-11-07 10:13:49.480712+00	1
254ed6da-b3c2-4e0a-ada4-a2cab93e917c	cf734b1141e7fbaa33f13c07433922b0068fe01fb9b5b078c6893b7d81f78505	2024-11-07 10:13:49.521146+00	20241103060258_test_migration	\N	\N	2024-11-07 10:13:49.498103+00	1
041b99fd-304b-4662-ac81-7e06d3077c47	2d84bed865604624f8d5774da081728d95fb06bd8d762526aaddf7cade14fbb3	2024-11-07 10:13:49.544318+00	20241106035325_migretion_file	\N	\N	2024-11-07 10:13:49.525562+00	1
cfc425c3-1fa3-44eb-bb6b-db67c048d3f0	523e894216ce1023741d18a6ff5fed72c7524188cc9db59eaa7280f44ab7b080	2024-11-07 10:13:49.561079+00	20241107101055_migrate_file_2	\N	\N	2024-11-07 10:13:49.548966+00	1
be3c92ec-fd83-46e0-b136-d8557cc375ff	9fa1b07a4853de41f6e0691339e09b483670580352b6a03c6b9ca7bb31607da0	2024-11-07 10:14:07.156156+00	20241107101407_migrate_file_2	\N	\N	2024-11-07 10:14:07.146848+00	1
\.


--
-- Name: Post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public."Post_id_seq"', 1, false);


--
-- Name: Account Account_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY (id);


--
-- Name: Board Board_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Board"
    ADD CONSTRAINT "Board_pkey" PRIMARY KEY (id);


--
-- Name: Column Column_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Column"
    ADD CONSTRAINT "Column_pkey" PRIMARY KEY (id);


--
-- Name: Post Post_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Post"
    ADD CONSTRAINT "Post_pkey" PRIMARY KEY (id);


--
-- Name: Project Project_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY (id);


--
-- Name: Session Session_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);


--
-- Name: Task Task_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT "Task_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Account_provider_providerAccountId_key; Type: INDEX; Schema: public; Owner: myuser
--

CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON public."Account" USING btree (provider, "providerAccountId");


--
-- Name: Session_sessionToken_key; Type: INDEX; Schema: public; Owner: myuser
--

CREATE UNIQUE INDEX "Session_sessionToken_key" ON public."Session" USING btree ("sessionToken");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: myuser
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: VerificationToken_identifier_token_key; Type: INDEX; Schema: public; Owner: myuser
--

CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON public."VerificationToken" USING btree (identifier, token);


--
-- Name: VerificationToken_token_key; Type: INDEX; Schema: public; Owner: myuser
--

CREATE UNIQUE INDEX "VerificationToken_token_key" ON public."VerificationToken" USING btree (token);


--
-- Name: Account Account_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Board Board_ownerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Board"
    ADD CONSTRAINT "Board_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Board Board_projectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Board"
    ADD CONSTRAINT "Board_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES public."Project"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Column Column_boardId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Column"
    ADD CONSTRAINT "Column_boardId_fkey" FOREIGN KEY ("boardId") REFERENCES public."Board"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Post Post_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Post"
    ADD CONSTRAINT "Post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Project Project_ownerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Session Session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Task Task_assigneeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT "Task_assigneeId_fkey" FOREIGN KEY ("assigneeId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Task Task_columnId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT "Task_columnId_fkey" FOREIGN KEY ("columnId") REFERENCES public."Column"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: myuser
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

