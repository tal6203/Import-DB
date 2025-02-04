PGDMP     8    +                {           postgres_test    15.1    15.1 U    g           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            h           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            i           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            j           1262    32867    postgres_test    DATABASE     �   CREATE DATABASE postgres_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Hebrew_Israel.1255';
    DROP DATABASE postgres_test;
                postgres    false            �            1255    35014    delete_test_data() 	   PROCEDURE     w   CREATE PROCEDURE public.delete_test_data()
    LANGUAGE plpgsql
    AS $$
BEGIN
TRUNCATE TABLE users CASCADE;
END;
$$;
 *   DROP PROCEDURE public.delete_test_data();
       public          postgres    false            �            1259    32907    administrators    TABLE     �   CREATE TABLE public.administrators (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    user_id integer NOT NULL
);
 "   DROP TABLE public.administrators;
       public         heap    postgres    false            �            1259    32906    administrators_id_seq    SEQUENCE     �   CREATE SEQUENCE public.administrators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.administrators_id_seq;
       public          postgres    false    221            k           0    0    administrators_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.administrators_id_seq OWNED BY public.administrators.id;
          public          postgres    false    220            �            1259    32943    airline_companies    TABLE     �   CREATE TABLE public.airline_companies (
    id integer NOT NULL,
    name text NOT NULL,
    country_id integer NOT NULL,
    user_id integer NOT NULL
);
 %   DROP TABLE public.airline_companies;
       public         heap    postgres    false            �            1259    32942    airline_companies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.airline_companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.airline_companies_id_seq;
       public          postgres    false    225            l           0    0    airline_companies_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.airline_companies_id_seq OWNED BY public.airline_companies.id;
          public          postgres    false    224            �            1259    32869 	   countries    TABLE     e   CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    32868    countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.countries_id_seq;
       public          postgres    false    215            m           0    0    countries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;
          public          postgres    false    214            �            1259    32923 	   customers    TABLE     �   CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    address text NOT NULL,
    phone_no text NOT NULL,
    credit_card_no text NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    32922    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    223            n           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    222            �            1259    32966    flights    TABLE     O  CREATE TABLE public.flights (
    id integer NOT NULL,
    airline_company_id integer NOT NULL,
    origin_country_id integer NOT NULL,
    destination_country_id integer NOT NULL,
    departure_time timestamp without time zone NOT NULL,
    landing_time timestamp without time zone NOT NULL,
    remaining_tickets integer NOT NULL
);
    DROP TABLE public.flights;
       public         heap    postgres    false            �            1259    32965    flights_id_seq    SEQUENCE     �   CREATE SEQUENCE public.flights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.flights_id_seq;
       public          postgres    false    227            o           0    0    flights_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.flights_id_seq OWNED BY public.flights.id;
          public          postgres    false    226            �            1259    32988    tickets    TABLE     {   CREATE TABLE public.tickets (
    id integer NOT NULL,
    flight_id integer NOT NULL,
    customer_id integer NOT NULL
);
    DROP TABLE public.tickets;
       public         heap    postgres    false            �            1259    32987    tickets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tickets_id_seq;
       public          postgres    false    229            p           0    0    tickets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;
          public          postgres    false    228            �            1259    32878 
   user_roles    TABLE     k   CREATE TABLE public.user_roles (
    id integer NOT NULL,
    role_name character varying(100) NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false            �            1259    32877    user_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.user_roles_id_seq;
       public          postgres    false    217            q           0    0    user_roles_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;
          public          postgres    false    216            �            1259    32887    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    user_role integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    32886    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    219            r           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    218            �           2604    32910    administrators id    DEFAULT     v   ALTER TABLE ONLY public.administrators ALTER COLUMN id SET DEFAULT nextval('public.administrators_id_seq'::regclass);
 @   ALTER TABLE public.administrators ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    32946    airline_companies id    DEFAULT     |   ALTER TABLE ONLY public.airline_companies ALTER COLUMN id SET DEFAULT nextval('public.airline_companies_id_seq'::regclass);
 C   ALTER TABLE public.airline_companies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    32872    countries id    DEFAULT     l   ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
 ;   ALTER TABLE public.countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    32926    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    32969 
   flights id    DEFAULT     h   ALTER TABLE ONLY public.flights ALTER COLUMN id SET DEFAULT nextval('public.flights_id_seq'::regclass);
 9   ALTER TABLE public.flights ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    32991 
   tickets id    DEFAULT     h   ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);
 9   ALTER TABLE public.tickets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    32881    user_roles id    DEFAULT     n   ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);
 <   ALTER TABLE public.user_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    32890    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            \          0    32907    administrators 
   TABLE DATA           L   COPY public.administrators (id, first_name, last_name, user_id) FROM stdin;
    public          postgres    false    221   �d       `          0    32943    airline_companies 
   TABLE DATA           J   COPY public.airline_companies (id, name, country_id, user_id) FROM stdin;
    public          postgres    false    225   �d       V          0    32869 	   countries 
   TABLE DATA           -   COPY public.countries (id, name) FROM stdin;
    public          postgres    false    215   �d       ^          0    32923 	   customers 
   TABLE DATA           j   COPY public.customers (id, first_name, last_name, address, phone_no, credit_card_no, user_id) FROM stdin;
    public          postgres    false    223   e       b          0    32966    flights 
   TABLE DATA           �   COPY public.flights (id, airline_company_id, origin_country_id, destination_country_id, departure_time, landing_time, remaining_tickets) FROM stdin;
    public          postgres    false    227   8e       d          0    32988    tickets 
   TABLE DATA           =   COPY public.tickets (id, flight_id, customer_id) FROM stdin;
    public          postgres    false    229   Ue       X          0    32878 
   user_roles 
   TABLE DATA           3   COPY public.user_roles (id, role_name) FROM stdin;
    public          postgres    false    217   re       Z          0    32887    users 
   TABLE DATA           I   COPY public.users (id, username, password, email, user_role) FROM stdin;
    public          postgres    false    219   �e       s           0    0    administrators_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.administrators_id_seq', 1, false);
          public          postgres    false    220            t           0    0    airline_companies_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.airline_companies_id_seq', 1, false);
          public          postgres    false    224            u           0    0    countries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.countries_id_seq', 11, true);
          public          postgres    false    214            v           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 1, false);
          public          postgres    false    222            w           0    0    flights_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.flights_id_seq', 1, false);
          public          postgres    false    226            x           0    0    tickets_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tickets_id_seq', 1, false);
          public          postgres    false    228            y           0    0    user_roles_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.user_roles_id_seq', 12, true);
          public          postgres    false    216            z           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    218            �           2606    32914 "   administrators administrators_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT administrators_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.administrators DROP CONSTRAINT administrators_pkey;
       public            postgres    false    221            �           2606    32916 )   administrators administrators_user_id_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT administrators_user_id_key UNIQUE (user_id);
 S   ALTER TABLE ONLY public.administrators DROP CONSTRAINT administrators_user_id_key;
       public            postgres    false    221            �           2606    32952 ,   airline_companies airline_companies_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.airline_companies
    ADD CONSTRAINT airline_companies_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.airline_companies DROP CONSTRAINT airline_companies_name_key;
       public            postgres    false    225            �           2606    32950 (   airline_companies airline_companies_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.airline_companies
    ADD CONSTRAINT airline_companies_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.airline_companies DROP CONSTRAINT airline_companies_pkey;
       public            postgres    false    225            �           2606    32954 /   airline_companies airline_companies_user_id_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.airline_companies
    ADD CONSTRAINT airline_companies_user_id_key UNIQUE (user_id);
 Y   ALTER TABLE ONLY public.airline_companies DROP CONSTRAINT airline_companies_user_id_key;
       public            postgres    false    225            �           2606    32876    countries countries_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_name_key;
       public            postgres    false    215            �           2606    32874    countries countries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    215            �           2606    32934 &   customers customers_credit_card_no_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_credit_card_no_key UNIQUE (credit_card_no);
 P   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_credit_card_no_key;
       public            postgres    false    223            �           2606    32932     customers customers_phone_no_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_no_key UNIQUE (phone_no);
 J   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_phone_no_key;
       public            postgres    false    223            �           2606    32930    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    223            �           2606    32936    customers customers_user_id_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_user_id_key UNIQUE (user_id);
 I   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_user_id_key;
       public            postgres    false    223            �           2606    32971    flights flights_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_pkey;
       public            postgres    false    227            �           2606    32997    tickets tickets_customer_id_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_customer_id_key UNIQUE (customer_id);
 I   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_customer_id_key;
       public            postgres    false    229            �           2606    33029    tickets tickets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            postgres    false    229            �           2606    33009    tickets tickets_unique_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_unique_key UNIQUE (flight_id, customer_id);
 D   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_unique_key;
       public            postgres    false    229    229            �           2606    33027 "   tickets uk_tickets_flight_customer 
   CONSTRAINT     o   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT uk_tickets_flight_customer UNIQUE (flight_id, customer_id);
 L   ALTER TABLE ONLY public.tickets DROP CONSTRAINT uk_tickets_flight_customer;
       public            postgres    false    229    229            �           2606    32883    user_roles user_roles_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    217            �           2606    32885 #   user_roles user_roles_role_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_name_key UNIQUE (role_name);
 M   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_role_name_key;
       public            postgres    false    217            �           2606    32900    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    219            �           2606    32898    users users_password_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_password_key UNIQUE (password);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_password_key;
       public            postgres    false    219            �           2606    32894    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    219            �           2606    32896    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    219            �           2606    32917 *   administrators administrators_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT administrators_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_roles(id);
 T   ALTER TABLE ONLY public.administrators DROP CONSTRAINT administrators_user_id_fkey;
       public          postgres    false    221    3222    217            �           2606    32955 3   airline_companies airline_companies_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.airline_companies
    ADD CONSTRAINT airline_companies_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);
 ]   ALTER TABLE ONLY public.airline_companies DROP CONSTRAINT airline_companies_country_id_fkey;
       public          postgres    false    3220    225    215            �           2606    32960 0   airline_companies airline_companies_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.airline_companies
    ADD CONSTRAINT airline_companies_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 Z   ALTER TABLE ONLY public.airline_companies DROP CONSTRAINT airline_companies_user_id_fkey;
       public          postgres    false    219    225    3230            �           2606    32937     customers customers_user_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_user_id_fkey;
       public          postgres    false    3230    219    223            �           2606    32972 '   flights flights_airline_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_airline_company_id_fkey FOREIGN KEY (airline_company_id) REFERENCES public.airline_companies(id);
 Q   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_airline_company_id_fkey;
       public          postgres    false    225    3248    227            �           2606    32982 +   flights flights_destination_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_destination_country_id_fkey FOREIGN KEY (destination_country_id) REFERENCES public.countries(id);
 U   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_destination_country_id_fkey;
       public          postgres    false    227    215    3220            �           2606    32977 &   flights flights_origin_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_origin_country_id_fkey FOREIGN KEY (origin_country_id) REFERENCES public.countries(id);
 P   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_origin_country_id_fkey;
       public          postgres    false    3220    227    215            �           2606    33003     tickets tickets_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);
 J   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_customer_id_fkey;
       public          postgres    false    223    3242    229            �           2606    32998    tickets tickets_flight_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_flight_id_fkey FOREIGN KEY (flight_id) REFERENCES public.flights(id);
 H   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_flight_id_fkey;
       public          postgres    false    3252    229    227            �           2606    32901    users users_user_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_role_fkey FOREIGN KEY (user_role) REFERENCES public.user_roles(id);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_user_role_fkey;
       public          postgres    false    219    3222    217            \      x������ � �      `      x������ � �      V      x�3��,.JL��2�v����� 6y{      ^      x������ � �      b      x������ � �      d      x������ � �      X   :   x�3�t.-.��M-�2�t�,���K�O��-H̫�2�tL����,.)J,�/����� �3E      Z      x������ � �     