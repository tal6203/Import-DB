PGDMP     6    '                {           postgres    15.1    15.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     {   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Hebrew_Israel.1255';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3530                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1255    32715    get_airline_by_username(text)    FUNCTION     �  CREATE FUNCTION public.get_airline_by_username(_username text) RETURNS TABLE(id integer, name text, country text, username text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT airline.id, airline.name, airline.country, users.username
        FROM airline_companies AS airline
        INNER JOIN users ON airline.id = users.airline_company_id
        WHERE users.username = _username;
END;
$$;
 >   DROP FUNCTION public.get_airline_by_username(_username text);
       public          postgres    false            �            1259    32517 	   customers    TABLE     �   CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    address text NOT NULL,
    phone_no text NOT NULL,
    credit_card_no text NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1255    35692    get_customer_by_username(text)    FUNCTION     ]  CREATE FUNCTION public.get_customer_by_username(in_username text) RETURNS SETOF public.customers
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT c.id, c.first_name, c.last_name, c.address, c.phone_no, c.credit_card_no, c.user_id
    FROM customers c
    JOIN users u ON c.user_id = u.id
    WHERE u.username = in_username;
END;
$$;
 A   DROP FUNCTION public.get_customer_by_username(in_username text);
       public          postgres    false    231                       1255    32720    get_departure_flights(integer)    FUNCTION     �  CREATE FUNCTION public.get_departure_flights(_country_id integer) RETURNS TABLE(id integer, flight_number character varying, departure_time timestamp without time zone, arrival_time timestamp without time zone, origin_country_id integer, destination_country_id integer, airline_company_id integer, remaining_tickets integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY
  SELECT f.id, f.flight_number, f.departure_time, f.arrival_time, f.origin_country_id,
         f.destination_country_id, f.airline_company_id, f.remaining_tickets
  FROM flights f
  WHERE f.origin_country_id = _country_id
    AND f.departure_time >= now()
    AND f.departure_time <= now() + interval '12 hours';
END;
$$;
 A   DROP FUNCTION public.get_departure_flights(_country_id integer);
       public          postgres    false            �            1259    32560    flights    TABLE     O  CREATE TABLE public.flights (
    id integer NOT NULL,
    airline_company_id integer NOT NULL,
    origin_country_id integer NOT NULL,
    destination_country_id integer NOT NULL,
    departure_time timestamp without time zone NOT NULL,
    landing_time timestamp without time zone NOT NULL,
    remaining_tickets integer NOT NULL
);
    DROP TABLE public.flights;
       public         heap    postgres    false            �            1255    32717 1   get_flights_by_parameters(integer, integer, date)    FUNCTION     �  CREATE FUNCTION public.get_flights_by_parameters(_origin_country_id integer, _destination_country_id integer, _date date) RETURNS SETOF public.flights
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM flights 
    WHERE origin_country_id = _origin_country_id 
    AND destination_country_id = _destination_country_id 
    AND date_trunc('day', departure_time) = date_trunc('day', _date);
END;
$$;
 y   DROP FUNCTION public.get_flights_by_parameters(_origin_country_id integer, _destination_country_id integer, _date date);
       public          postgres    false    235                       1255    32723    get_user_by_email(text)    FUNCTION       CREATE FUNCTION public.get_user_by_email(_email text) RETURNS TABLE(id bigint, username text, password text, email text)
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY
  SELECT id, username, password, email
  FROM users
  WHERE email = _email;
END;
$$;
 5   DROP FUNCTION public.get_user_by_email(_email text);
       public          postgres    false            �            1259    36156    administrators    TABLE     �   CREATE TABLE public.administrators (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    user_id integer NOT NULL
);
 "   DROP TABLE public.administrators;
       public         heap    postgres    false            �            1259    36155    administrators_id_seq    SEQUENCE     �   CREATE SEQUENCE public.administrators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.administrators_id_seq;
       public          postgres    false    241            �           0    0    administrators_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.administrators_id_seq OWNED BY public.administrators.id;
          public          postgres    false    240            �            1259    32537    airline_companies    TABLE     �   CREATE TABLE public.airline_companies (
    id integer NOT NULL,
    name text NOT NULL,
    country_id integer NOT NULL,
    user_id integer NOT NULL
);
 %   DROP TABLE public.airline_companies;
       public         heap    postgres    false            �            1259    32536    airline_companies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.airline_companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.airline_companies_id_seq;
       public          postgres    false    233            �           0    0    airline_companies_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.airline_companies_id_seq OWNED BY public.airline_companies.id;
          public          postgres    false    232            �            1259    36197 	   classroom    TABLE     �   CREATE TABLE public.classroom (
    id integer NOT NULL,
    number_of_students integer NOT NULL,
    class_avg double precision NOT NULL,
    type_class character varying(255) DEFAULT ''::character varying NOT NULL
);
    DROP TABLE public.classroom;
       public         heap    postgres    false            �            1259    36196    classroom_id_seq    SEQUENCE     �   CREATE SEQUENCE public.classroom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.classroom_id_seq;
       public          postgres    false    243            �           0    0    classroom_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.classroom_id_seq OWNED BY public.classroom.id;
          public          postgres    false    242            �            1259    32463 	   countries    TABLE     e   CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    32462    countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.countries_id_seq;
       public          postgres    false    225            �           0    0    countries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;
          public          postgres    false    224            �            1259    20031    customer    TABLE     o  CREATE TABLE public.customer (
    id integer NOT NULL,
    first_name character varying(255) DEFAULT ''::character varying NOT NULL,
    last_name character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    status character varying(255) DEFAULT 'REGULAR'::character varying NOT NULL
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    20030    customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.customer_id_seq;
       public          postgres    false    221            �           0    0    customer_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;
          public          postgres    false    220            �            1259    20044    customer_order    TABLE     �   CREATE TABLE public.customer_order (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    item_name character varying(255) DEFAULT ''::character varying NOT NULL,
    price numeric(100,2) DEFAULT 0 NOT NULL
);
 "   DROP TABLE public.customer_order;
       public         heap    postgres    false            �            1259    20043    customer_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.customer_order_id_seq;
       public          postgres    false    223            �           0    0    customer_order_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.customer_order_id_seq OWNED BY public.customer_order.id;
          public          postgres    false    222            �            1259    32516    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    231            �           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    230            �            1259    16399    employee    TABLE     |   CREATE TABLE public.employee (
    id bigint NOT NULL,
    name text,
    age real,
    address text,
    salary integer
);
    DROP TABLE public.employee;
       public         heap    postgres    false            �            1259    16398    employee_id_seq    SEQUENCE     �   ALTER TABLE public.employee ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    32559    flights_id_seq    SEQUENCE     �   CREATE SEQUENCE public.flights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.flights_id_seq;
       public          postgres    false    235            �           0    0    flights_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.flights_id_seq OWNED BY public.flights.id;
          public          postgres    false    234            �            1259    32700 
   friendlist    TABLE       CREATE TABLE public.friendlist (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    age integer NOT NULL,
    id_user_log character varying(255) NOT NULL,
    image_src character varying(255) NOT NULL
);
    DROP TABLE public.friendlist;
       public         heap    postgres    false            �            1259    32699    friendlist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.friendlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.friendlist_id_seq;
       public          postgres    false    237            �           0    0    friendlist_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.friendlist_id_seq OWNED BY public.friendlist.id;
          public          postgres    false    236            �            1259    16448    number    TABLE     3   CREATE TABLE public.number (
    number integer
);
    DROP TABLE public.number;
       public         heap    postgres    false            �            1259    36205    students    TABLE     g  CREATE TABLE public.students (
    id integer NOT NULL,
    first_name character varying(255) DEFAULT ''::character varying NOT NULL,
    last_name character varying(255) DEFAULT ''::character varying NOT NULL,
    avg_grade double precision NOT NULL,
    gender character varying(255) DEFAULT ''::character varying NOT NULL,
    class_id integer NOT NULL
);
    DROP TABLE public.students;
       public         heap    postgres    false            �            1259    36204    students_id_seq    SEQUENCE     �   CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.students_id_seq;
       public          postgres    false    245            �           0    0    students_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;
          public          postgres    false    244            �            1259    16437    test    TABLE     �   CREATE TABLE public.test (
    id bigint NOT NULL,
    updateat text NOT NULL,
    name text,
    date text NOT NULL,
    courseid integer
);
    DROP TABLE public.test;
       public         heap    postgres    false            �            1259    16436    test_id_seq    SEQUENCE     �   ALTER TABLE public.test ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    35730    tickets    TABLE     {   CREATE TABLE public.tickets (
    id integer NOT NULL,
    flight_id integer NOT NULL,
    customer_id integer NOT NULL
);
    DROP TABLE public.tickets;
       public         heap    postgres    false            �            1259    35729    tickets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tickets_id_seq;
       public          postgres    false    239            �           0    0    tickets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;
          public          postgres    false    238            �            1259    32472 
   user_roles    TABLE     k   CREATE TABLE public.user_roles (
    id integer NOT NULL,
    role_name character varying(100) NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false            �            1259    32471    user_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.user_roles_id_seq;
       public          postgres    false    227            �           0    0    user_roles_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;
          public          postgres    false    226            �            1259    32481    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    user_role integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    32480    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    229            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    228            �           2604    36159    administrators id    DEFAULT     v   ALTER TABLE ONLY public.administrators ALTER COLUMN id SET DEFAULT nextval('public.administrators_id_seq'::regclass);
 @   ALTER TABLE public.administrators ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    32540    airline_companies id    DEFAULT     |   ALTER TABLE ONLY public.airline_companies ALTER COLUMN id SET DEFAULT nextval('public.airline_companies_id_seq'::regclass);
 C   ALTER TABLE public.airline_companies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    36200    classroom id    DEFAULT     l   ALTER TABLE ONLY public.classroom ALTER COLUMN id SET DEFAULT nextval('public.classroom_id_seq'::regclass);
 ;   ALTER TABLE public.classroom ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242    243            �           2604    32466    countries id    DEFAULT     l   ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
 ;   ALTER TABLE public.countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    20034    customer id    DEFAULT     j   ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);
 :   ALTER TABLE public.customer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    20047    customer_order id    DEFAULT     v   ALTER TABLE ONLY public.customer_order ALTER COLUMN id SET DEFAULT nextval('public.customer_order_id_seq'::regclass);
 @   ALTER TABLE public.customer_order ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    32520    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    32563 
   flights id    DEFAULT     h   ALTER TABLE ONLY public.flights ALTER COLUMN id SET DEFAULT nextval('public.flights_id_seq'::regclass);
 9   ALTER TABLE public.flights ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    32703    friendlist id    DEFAULT     n   ALTER TABLE ONLY public.friendlist ALTER COLUMN id SET DEFAULT nextval('public.friendlist_id_seq'::regclass);
 <   ALTER TABLE public.friendlist ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    36208    students id    DEFAULT     j   ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);
 :   ALTER TABLE public.students ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            �           2604    35733 
   tickets id    DEFAULT     h   ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);
 9   ALTER TABLE public.tickets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239            �           2604    32475    user_roles id    DEFAULT     n   ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);
 <   ALTER TABLE public.user_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    32484    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            �          0    36156    administrators 
   TABLE DATA           L   COPY public.administrators (id, first_name, last_name, user_id) FROM stdin;
    public          postgres    false    241   ��       �          0    32537    airline_companies 
   TABLE DATA           J   COPY public.airline_companies (id, name, country_id, user_id) FROM stdin;
    public          postgres    false    233   ۭ       �          0    36197 	   classroom 
   TABLE DATA           R   COPY public.classroom (id, number_of_students, class_avg, type_class) FROM stdin;
    public          postgres    false    243   +�       �          0    32463 	   countries 
   TABLE DATA           -   COPY public.countries (id, name) FROM stdin;
    public          postgres    false    225   w�       �          0    20031    customer 
   TABLE DATA           L   COPY public.customer (id, first_name, last_name, email, status) FROM stdin;
    public          postgres    false    221   Ǯ       �          0    20044    customer_order 
   TABLE DATA           K   COPY public.customer_order (id, customer_id, item_name, price) FROM stdin;
    public          postgres    false    223   �       �          0    32517 	   customers 
   TABLE DATA           j   COPY public.customers (id, first_name, last_name, address, phone_no, credit_card_no, user_id) FROM stdin;
    public          postgres    false    231   $�       �          0    16399    employee 
   TABLE DATA           B   COPY public.employee (id, name, age, address, salary) FROM stdin;
    public          postgres    false    216   ��       �          0    32560    flights 
   TABLE DATA           �   COPY public.flights (id, airline_company_id, origin_country_id, destination_country_id, departure_time, landing_time, remaining_tickets) FROM stdin;
    public          postgres    false    235   T�       �          0    32700 
   friendlist 
   TABLE DATA           V   COPY public.friendlist (id, username, email, age, id_user_log, image_src) FROM stdin;
    public          postgres    false    237   �       �          0    16448    number 
   TABLE DATA           (   COPY public.number (number) FROM stdin;
    public          postgres    false    219   �       �          0    36205    students 
   TABLE DATA           Z   COPY public.students (id, first_name, last_name, avg_grade, gender, class_id) FROM stdin;
    public          postgres    false    245   �       �          0    16437    test 
   TABLE DATA           B   COPY public.test (id, updateat, name, date, courseid) FROM stdin;
    public          postgres    false    218   ��       �          0    35730    tickets 
   TABLE DATA           =   COPY public.tickets (id, flight_id, customer_id) FROM stdin;
    public          postgres    false    239   Y�       �          0    32472 
   user_roles 
   TABLE DATA           3   COPY public.user_roles (id, role_name) FROM stdin;
    public          postgres    false    227   ��       �          0    32481    users 
   TABLE DATA           I   COPY public.users (id, username, password, email, user_role) FROM stdin;
    public          postgres    false    229   ܴ       �           0    0    administrators_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.administrators_id_seq', 1, true);
          public          postgres    false    240            �           0    0    airline_companies_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.airline_companies_id_seq', 3, true);
          public          postgres    false    232            �           0    0    classroom_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.classroom_id_seq', 3, true);
          public          postgres    false    242            �           0    0    countries_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.countries_id_seq', 7, true);
          public          postgres    false    224            �           0    0    customer_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.customer_id_seq', 1, true);
          public          postgres    false    220            �           0    0    customer_order_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.customer_order_id_seq', 1, false);
          public          postgres    false    222            �           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 11, true);
          public          postgres    false    230            �           0    0    employee_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.employee_id_seq', 8, true);
          public          postgres    false    215            �           0    0    flights_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.flights_id_seq', 11, true);
          public          postgres    false    234            �           0    0    friendlist_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.friendlist_id_seq', 6, true);
          public          postgres    false    236            �           0    0    students_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.students_id_seq', 5, true);
          public          postgres    false    244            �           0    0    test_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.test_id_seq', 17, true);
          public          postgres    false    217            �           0    0    tickets_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.tickets_id_seq', 7, true);
          public          postgres    false    238            �           0    0    user_roles_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_roles_id_seq', 3, true);
          public          postgres    false    226            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 15, true);
          public          postgres    false    228                       2606    36163 "   administrators administrators_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT administrators_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.administrators DROP CONSTRAINT administrators_pkey;
       public            postgres    false    241                       2606    36165 )   administrators administrators_user_id_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT administrators_user_id_key UNIQUE (user_id);
 S   ALTER TABLE ONLY public.administrators DROP CONSTRAINT administrators_user_id_key;
       public            postgres    false    241            �           2606    32546 ,   airline_companies airline_companies_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.airline_companies
    ADD CONSTRAINT airline_companies_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.airline_companies DROP CONSTRAINT airline_companies_name_key;
       public            postgres    false    233            �           2606    32544 (   airline_companies airline_companies_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.airline_companies
    ADD CONSTRAINT airline_companies_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.airline_companies DROP CONSTRAINT airline_companies_pkey;
       public            postgres    false    233            �           2606    32548 /   airline_companies airline_companies_user_id_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.airline_companies
    ADD CONSTRAINT airline_companies_user_id_key UNIQUE (user_id);
 Y   ALTER TABLE ONLY public.airline_companies DROP CONSTRAINT airline_companies_user_id_key;
       public            postgres    false    233            	           2606    36203    classroom classroom_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.classroom DROP CONSTRAINT classroom_pkey;
       public            postgres    false    243            �           2606    32470    countries countries_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_name_key;
       public            postgres    false    225            �           2606    32468    countries countries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    225            �           2606    16447    test courseid 
   CONSTRAINT     _   ALTER TABLE ONLY public.test
    ADD CONSTRAINT courseid UNIQUE (courseid) INCLUDE (courseid);
 7   ALTER TABLE ONLY public.test DROP CONSTRAINT courseid;
       public            postgres    false    218            �           2606    20051 "   customer_order customer_order_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT customer_order_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.customer_order DROP CONSTRAINT customer_order_pkey;
       public            postgres    false    223            �           2606    20042    customer customer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    221            �           2606    32528 &   customers customers_credit_card_no_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_credit_card_no_key UNIQUE (credit_card_no);
 P   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_credit_card_no_key;
       public            postgres    false    231            �           2606    32526     customers customers_phone_no_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_no_key UNIQUE (phone_no);
 J   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_phone_no_key;
       public            postgres    false    231            �           2606    32524    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    231            �           2606    32530    customers customers_user_id_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_user_id_key UNIQUE (user_id);
 I   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_user_id_key;
       public            postgres    false    231            �           2606    16405    employee employee_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    216            �           2606    32565    flights flights_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_pkey;
       public            postgres    false    235            �           2606    32711    friendlist friendlist_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.friendlist
    ADD CONSTRAINT friendlist_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.friendlist DROP CONSTRAINT friendlist_email_key;
       public            postgres    false    237            �           2606    32707    friendlist friendlist_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.friendlist
    ADD CONSTRAINT friendlist_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.friendlist DROP CONSTRAINT friendlist_pkey;
       public            postgres    false    237            �           2606    32709 "   friendlist friendlist_username_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.friendlist
    ADD CONSTRAINT friendlist_username_key UNIQUE (username);
 L   ALTER TABLE ONLY public.friendlist DROP CONSTRAINT friendlist_username_key;
       public            postgres    false    237            �           2606    16445 	   test name 
   CONSTRAINT     S   ALTER TABLE ONLY public.test
    ADD CONSTRAINT name UNIQUE (name) INCLUDE (name);
 3   ALTER TABLE ONLY public.test DROP CONSTRAINT name;
       public            postgres    false    218                       2606    36215    students students_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public            postgres    false    245            �           2606    16443    test test_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.test DROP CONSTRAINT test_pkey;
       public            postgres    false    218                       2606    35735    tickets tickets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            postgres    false    239                       2606    35747    tickets unique_customer_flight 
   CONSTRAINT     k   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT unique_customer_flight UNIQUE (customer_id, flight_id);
 H   ALTER TABLE ONLY public.tickets DROP CONSTRAINT unique_customer_flight;
       public            postgres    false    239    239            �           2606    16407    employee unique_name 
   CONSTRAINT     ^   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT unique_name UNIQUE (name) INCLUDE (name);
 >   ALTER TABLE ONLY public.employee DROP CONSTRAINT unique_name;
       public            postgres    false    216            �           2606    32477    user_roles user_roles_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    227            �           2606    32479 #   user_roles user_roles_role_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_name_key UNIQUE (role_name);
 M   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_role_name_key;
       public            postgres    false    227            �           2606    32494    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    229            �           2606    32492    users users_password_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_password_key UNIQUE (password);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_password_key;
       public            postgres    false    229            �           2606    32488    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    229            �           2606    32490    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    229                       2606    36166 *   administrators administrators_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT administrators_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 T   ALTER TABLE ONLY public.administrators DROP CONSTRAINT administrators_user_id_fkey;
       public          postgres    false    229    3303    241                       2606    32549 3   airline_companies airline_companies_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.airline_companies
    ADD CONSTRAINT airline_companies_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);
 ]   ALTER TABLE ONLY public.airline_companies DROP CONSTRAINT airline_companies_country_id_fkey;
       public          postgres    false    233    3293    225                       2606    32554 0   airline_companies airline_companies_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.airline_companies
    ADD CONSTRAINT airline_companies_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 Z   ALTER TABLE ONLY public.airline_companies DROP CONSTRAINT airline_companies_user_id_fkey;
       public          postgres    false    229    233    3303                       2606    20052 .   customer_order customer_order_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT customer_order_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);
 X   ALTER TABLE ONLY public.customer_order DROP CONSTRAINT customer_order_customer_id_fkey;
       public          postgres    false    221    223    3287                       2606    32531     customers customers_user_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_user_id_fkey;
       public          postgres    false    231    229    3303                       2606    35736    tickets fk_customer    FK CONSTRAINT     z   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(id);
 =   ALTER TABLE ONLY public.tickets DROP CONSTRAINT fk_customer;
       public          postgres    false    239    231    3311                       2606    35741    tickets fk_flight    FK CONSTRAINT     t   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT fk_flight FOREIGN KEY (flight_id) REFERENCES public.flights(id);
 ;   ALTER TABLE ONLY public.tickets DROP CONSTRAINT fk_flight;
       public          postgres    false    239    235    3321                       2606    32566 '   flights flights_airline_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_airline_company_id_fkey FOREIGN KEY (airline_company_id) REFERENCES public.airline_companies(id);
 Q   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_airline_company_id_fkey;
       public          postgres    false    235    233    3317                       2606    32576 +   flights flights_destination_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_destination_country_id_fkey FOREIGN KEY (destination_country_id) REFERENCES public.countries(id);
 U   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_destination_country_id_fkey;
       public          postgres    false    225    235    3293                       2606    32571 &   flights flights_origin_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_origin_country_id_fkey FOREIGN KEY (origin_country_id) REFERENCES public.countries(id);
 P   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_origin_country_id_fkey;
       public          postgres    false    225    3293    235                       2606    36216    students students_class_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.classroom(id);
 I   ALTER TABLE ONLY public.students DROP CONSTRAINT students_class_id_fkey;
       public          postgres    false    3337    245    243                       2606    32495    users users_user_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_role_fkey FOREIGN KEY (user_role) REFERENCES public.user_roles(id);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_user_role_fkey;
       public          postgres    false    227    229    3295            �      x�3�I��tL*-I*��4����� ?v%      �   @   x�3��)M+�H�+N�4�4�2�.�,.�4�4�2�t��,J,I-Vp�,���K�4�4����� ���      �   <   x�3�4�47ֳ�t�q�s��2�4�4�3�ru�q�2*�0׳0@�p�=... ���      �   @   x�3��,.JL��2�v�2�tO-�M̫�2�t+J�KN�2��J,H��2�t*J�������� �Z
      �   0   x�3�,��M-�L,�,˄��L��������\� W�P� �=... �P]      �      x������ � �      �   y  x�URA�� <�W�����9悇���
^��x����.I��0�<�ĕ�g,�.=V����:���;am�y�ޱv@ei��������^�\~��%�D��3u֠΋�N���B�������x��g�n���|�q���0�%�i��{��i��\j��뺗��z�����l,[��W>�r��s�S-ayO%�S�KιՇ0�1�q,t @��ZGAy������xmQ�@�=j���k	Ch�;�Ә�|�w���<�_,r��
Ĭ��9֋;G���ZK�ĝ#DcC�M�Ds�G���{��!��@;ˇx�;J�@-�79�Ӟ�D��B��T�T<�C����K��?4�����'F멵      �   �   x�M��
�0E�7�R�Ӈ݊.
Ru�f0���T���Mb��>�rRx����&�3Z�S��5�8�~ -��y��ʰ����\���Ї��\���QƏ[~Z�CU�K��D8��쒚�E�c�j��<\0+�#���]J�/��2�      �   �   x�m��� E���4���h-�Kԉ��_����g`d�X"��b��wFef��u�ԙ2��K�LqF�9�����w�Iw][=oL���Rc�s7ۘ2���Nls�����W������6�2e�A��U�����%PwM���Z��dd��y���:mh��=ڼ�Oo�k���Z�����c�      �   �   x�u�=�0����aJ���M�����ri.5��`��W:t����·�ɇi��|[z`7ʚ�QB��[�%B2�9S�<�6���H-�Pc�)�nýW���b�J�ղ���k��$Kⷌ�֥4OU�� .d]��^V��j\���'s�h��+����)��n|��9g���[u�      �   "   x�31�2�2��4�23�22�25
��qqq 9X�      �   v   x�5���0뽏��yJ!�.eP\�8�dc��$�jV���vIǒ�C<����}�+���Pzw7%�_8���V����80���Y�y�'�aÑ�f/��P��ꭈ�T�!�      �   �   x�mб�@�}�{̵���Itrqt!���0��o�i$��~M���{����%o���h�K�h>�z¸�Pe8��-�~�Mʄ��a���*�M3\�����3�w%M,������<;�c)��h�~Xm�1 }OLUt�y+<�*+�w��?(%���vXU�z@�9�G�      �   *   x�3�4�4�2�4�Ɯf@ҔӜӈ����@�=... g��      �   9   x�3�t.-.��M-�2�tL����,.)J,�/�2�t�,���Ku��-H̫����� ���      �   v  x�]�ɒ�J�5>G���]��RL� h�M2�$`2��]�]T�7r��剟CR���_c� �E���3��Δj�o2,k���h|nUL��vr�v����Y�#��?��i���
�V +������Xt��ZB6���WO���5�%&��H�ƔwRH9m��i����7�~����%V4֏y�/rw1�>pZwz�:0a�(�ΧX�䴁�|����	�ߔ����~+���[s���|���8�3h��o�=���;�g�ե�ioD_J	f|Uˤz�
�%�#�)f��.[~s�E'���m������>�y��&
2�f��������p^�s߂$�赡^J�
(�=$X+�U�����7Z�t
�s@f)/=�����A�+~٥v�z��Q�;:��A1��!z�{R��o'
Qo���	
o��G�{��f�^��שr1B�ճ�R�<F�7s��ݭ<�&�z�-�1`�XGX��=�Vן�\u�M��w��tx�T���,d���e���67��ʴJ¿Ã�ciJQk��5M?a���i�+4�B��%��U��ߘ��ۚN�����^�1Y�Nc�w�7�<h�%8E-���D�w�N�ʔ�(�K="��n0
ֿ���"�[��8�h]��a�*�7=���?mV��7ULԉ�o��I�ی��兹��!"���%X�}�
��"���e��?��"�d�c�7*.��MR�*�˧j��*^���5y�`�e׏�*3��T����~M\E�ǳ��w]s����WT�ݚ9xyq�'�&L��{�0���b���~�&���KN2��^6��AcAߓ���v���*{-��K�#$x�n��cq�/��j��c�X     