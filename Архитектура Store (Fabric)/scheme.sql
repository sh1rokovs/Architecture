PGDMP                      |            itf    16.2    16.2 �    .           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            /           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            0           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            1           1262    16398    itf    DATABASE     w   CREATE DATABASE itf WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE itf;
                postgres    false            �            1259    30682    balance_history_customer    TABLE     9  CREATE TABLE public.balance_history_customer (
    id uuid NOT NULL,
    prev_sum double precision DEFAULT '0'::double precision NOT NULL,
    sum double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid,
    payment_method uuid
);
 ,   DROP TABLE public.balance_history_customer;
       public         heap    postgres    false            �            1259    30674    balance_history_provider    TABLE     =  CREATE TABLE public.balance_history_provider (
    id uuid NOT NULL,
    prev_sum double precision DEFAULT '0'::double precision NOT NULL,
    sum double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    provider_id uuid,
    payment_method uuid
);
 ,   DROP TABLE public.balance_history_provider;
       public         heap    postgres    false            �            1259    30244    brands    TABLE     �   CREATE TABLE public.brands (
    id uuid NOT NULL,
    name_ru character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.brands;
       public         heap    postgres    false            �            1259    30430    cart_products    TABLE     �   CREATE TABLE public.cart_products (
    id uuid NOT NULL,
    amount double precision DEFAULT '0'::double precision NOT NULL,
    cart_id uuid NOT NULL,
    product_id uuid NOT NULL
);
 !   DROP TABLE public.cart_products;
       public         heap    postgres    false            �            1259    30422    carts    TABLE       CREATE TABLE public.carts (
    id uuid NOT NULL,
    "totalPrice" double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid
);
    DROP TABLE public.carts;
       public         heap    postgres    false            �            1259    30622    client_payments    TABLE     \  CREATE TABLE public.client_payments (
    id uuid NOT NULL,
    sum double precision DEFAULT '0'::double precision NOT NULL,
    comment character varying NOT NULL,
    "actualPaymentDate" timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid,
    payment_method_id uuid,
    created_by uuid
);
 #   DROP TABLE public.client_payments;
       public         heap    postgres    false            �            1259    30251 	   countries    TABLE     �   CREATE TABLE public.countries (
    id uuid NOT NULL,
    name_ru character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    30464    customer_order_products    TABLE     -  CREATE TABLE public.customer_order_products (
    id uuid NOT NULL,
    "isDistributed" boolean DEFAULT false NOT NULL,
    "totalPrice" double precision DEFAULT '0'::double precision NOT NULL,
    count double precision DEFAULT '0'::double precision NOT NULL,
    order_id uuid NOT NULL,
    product_id uuid NOT NULL,
    provider_order_id uuid,
    total_cut double precision DEFAULT '0'::double precision NOT NULL,
    ordered_by_buyers double precision DEFAULT '0'::double precision NOT NULL,
    "cuttingsId" uuid,
    cut_supplier double precision DEFAULT '0'::double precision NOT NULL,
    cutting_comment character varying,
    price_cut_supplier double precision DEFAULT '0'::double precision NOT NULL,
    actual_cut double precision DEFAULT '0'::double precision NOT NULL,
    actual_cut_cost double precision DEFAULT '0'::double precision NOT NULL,
    order_is_paid boolean DEFAULT false NOT NULL,
    price_product double precision DEFAULT '0'::double precision NOT NULL,
    price_product_base double precision DEFAULT '0'::double precision NOT NULL
);
 +   DROP TABLE public.customer_order_products;
       public         heap    postgres    false            �            1259    30473    customer_orders    TABLE     �  CREATE TABLE public.customer_orders (
    id uuid NOT NULL,
    number integer NOT NULL,
    settlement_deadline timestamp with time zone,
    address character varying,
    paid double precision DEFAULT '0'::double precision NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    payment_id uuid NOT NULL,
    country_id uuid NOT NULL,
    status_id uuid NOT NULL,
    distribution_id uuid,
    created_by uuid,
    updated_by uuid,
    type_user character varying DEFAULT ''::character varying NOT NULL,
    assembly_comment character varying,
    delivery_comment character varying,
    customer_comment character varying
);
 #   DROP TABLE public.customer_orders;
       public         heap    postgres    false            �            1259    30472    customer_orders_number_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_orders_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.customer_orders_number_seq;
       public          postgres    false    237            2           0    0    customer_orders_number_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.customer_orders_number_seq OWNED BY public.customer_orders.number;
          public          postgres    false    236            �            1259    30714    cutting    TABLE     �  CREATE TABLE public.cutting (
    id uuid NOT NULL,
    number integer NOT NULL,
    actual_cut_amount double precision DEFAULT '0'::double precision NOT NULL,
    total_cut_cutting double precision DEFAULT '0'::double precision NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    provider_order_id uuid,
    is_disabled_actual_cut boolean DEFAULT false NOT NULL
);
    DROP TABLE public.cutting;
       public         heap    postgres    false            �            1259    30713    cutting_number_seq    SEQUENCE     �   CREATE SEQUENCE public.cutting_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cutting_number_seq;
       public          postgres    false    246            3           0    0    cutting_number_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cutting_number_seq OWNED BY public.cutting.number;
          public          postgres    false    245            �            1259    30396    distributions    TABLE     �   CREATE TABLE public.distributions (
    id uuid NOT NULL,
    name_ru character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    stock_id uuid NOT NULL
);
 !   DROP TABLE public.distributions;
       public         heap    postgres    false            �            1259    30272    files    TABLE     0  CREATE TABLE public.files (
    id uuid NOT NULL,
    "fileUrl" character varying NOT NULL,
    "fileKey" character varying NOT NULL,
    "fileName" character varying NOT NULL,
    type character varying NOT NULL,
    dir character varying NOT NULL,
    size integer NOT NULL,
    extension character varying NOT NULL,
    mime character varying DEFAULT 'unknown'::character varying NOT NULL,
    s3id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.files;
       public         heap    postgres    false            �            1259    30347    manufacturers    TABLE     �   CREATE TABLE public.manufacturers (
    id uuid NOT NULL,
    name_ru character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
 !   DROP TABLE public.manufacturers;
       public         heap    postgres    false            �            1259    30225 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    30224    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    216            4           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    215            �            1259    30536 
   order_logs    TABLE     1  CREATE TABLE public.order_logs (
    id uuid NOT NULL,
    payload character varying,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    order_id uuid NOT NULL,
    updated_by uuid,
    comment character varying NOT NULL
);
    DROP TABLE public.order_logs;
       public         heap    postgres    false            �            1259    30265    order_statuses    TABLE     �   CREATE TABLE public.order_statuses (
    id uuid NOT NULL,
    name_ru character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
 "   DROP TABLE public.order_statuses;
       public         heap    postgres    false            �            1259    30456    payment_methods    TABLE     �   CREATE TABLE public.payment_methods (
    id uuid NOT NULL,
    name_ru character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
 #   DROP TABLE public.payment_methods;
       public         heap    postgres    false            �            1259    30753    pickup_point    TABLE     �   CREATE TABLE public.pickup_point (
    id uuid NOT NULL,
    name_ru character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
     DROP TABLE public.pickup_point;
       public         heap    postgres    false            �            1259    30291    products    TABLE     �  CREATE TABLE public.products (
    id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying,
    composition character varying,
    "vendorCode" character varying NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    "purchasePrice" double precision DEFAULT '0'::double precision NOT NULL,
    "isEnabled" boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    date_opt timestamp with time zone,
    date_pre_order timestamp with time zone DEFAULT now() NOT NULL,
    date_retail timestamp with time zone,
    brand_id uuid NOT NULL,
    provider_id uuid NOT NULL,
    manufacturer_id uuid NOT NULL,
    stock_id uuid,
    course double precision DEFAULT '1'::double precision
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    30310    products_files    TABLE     `   CREATE TABLE public.products_files (
    product_id uuid NOT NULL,
    file_id uuid NOT NULL
);
 "   DROP TABLE public.products_files;
       public         heap    postgres    false            �            1259    30303    products_tags    TABLE     ^   CREATE TABLE public.products_tags (
    product_id uuid NOT NULL,
    tag_id uuid NOT NULL
);
 !   DROP TABLE public.products_tags;
       public         heap    postgres    false            �            1259    30556    provider_orders    TABLE     �  CREATE TABLE public.provider_orders (
    id uuid NOT NULL,
    number integer NOT NULL,
    sum double precision DEFAULT '0'::double precision NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    provider_id uuid NOT NULL,
    status_id uuid NOT NULL,
    is_cutting_created boolean DEFAULT false NOT NULL,
    "assemblyComment" character varying,
    "deliveryComment" character varying
);
 #   DROP TABLE public.provider_orders;
       public         heap    postgres    false            �            1259    30555    provider_orders_number_seq    SEQUENCE     �   CREATE SEQUENCE public.provider_orders_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.provider_orders_number_seq;
       public          postgres    false    240            5           0    0    provider_orders_number_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.provider_orders_number_seq OWNED BY public.provider_orders.number;
          public          postgres    false    239            �            1259    30631    provider_payments    TABLE     b  CREATE TABLE public.provider_payments (
    id uuid NOT NULL,
    sum double precision DEFAULT '0'::double precision NOT NULL,
    comment character varying NOT NULL,
    "actualPaymentDate" timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    provider_id uuid,
    payment_method_id uuid,
    created_by uuid
);
 %   DROP TABLE public.provider_payments;
       public         heap    postgres    false            �            1259    30282 	   providers    TABLE     V  CREATE TABLE public.providers (
    id uuid NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    balance double precision DEFAULT '0'::double precision NOT NULL
);
    DROP TABLE public.providers;
       public         heap    postgres    false            �            1259    30365    roles    TABLE     �   CREATE TABLE public.roles (
    id uuid NOT NULL,
    name character varying NOT NULL,
    name_en character varying NOT NULL,
    slug character varying NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    30404    stocks    TABLE     �   CREATE TABLE public.stocks (
    id uuid NOT NULL,
    name_ru character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.stocks;
       public         heap    postgres    false            �            1259    30258    tags    TABLE     �   CREATE TABLE public.tags (
    id uuid NOT NULL,
    name_ru character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.tags;
       public         heap    postgres    false            �            1259    30381    user_password_resets    TABLE     �   CREATE TABLE public.user_password_resets (
    id uuid NOT NULL,
    hash character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL
);
 (   DROP TABLE public.user_password_resets;
       public         heap    postgres    false            �            1259    30233    users    TABLE     )  CREATE TABLE public.users (
    id uuid NOT NULL,
    name character varying NOT NULL,
    "legalPerson" boolean DEFAULT true NOT NULL,
    email character varying NOT NULL,
    password character varying,
    phone character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    role_id uuid NOT NULL,
    country_id uuid NOT NULL,
    address character varying,
    distribution_id uuid,
    "limit" double precision DEFAULT '0'::double precision NOT NULL,
    balance double precision DEFAULT '0'::double precision NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �           2604    30476    customer_orders number    DEFAULT     �   ALTER TABLE ONLY public.customer_orders ALTER COLUMN number SET DEFAULT nextval('public.customer_orders_number_seq'::regclass);
 E   ALTER TABLE public.customer_orders ALTER COLUMN number DROP DEFAULT;
       public          postgres    false    237    236    237                       2604    30717    cutting number    DEFAULT     p   ALTER TABLE ONLY public.cutting ALTER COLUMN number SET DEFAULT nextval('public.cutting_number_seq'::regclass);
 =   ALTER TABLE public.cutting ALTER COLUMN number DROP DEFAULT;
       public          postgres    false    246    245    246            �           2604    30228    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    30559    provider_orders number    DEFAULT     �   ALTER TABLE ONLY public.provider_orders ALTER COLUMN number SET DEFAULT nextval('public.provider_orders_number_seq'::regclass);
 E   ALTER TABLE public.provider_orders ALTER COLUMN number DROP DEFAULT;
       public          postgres    false    240    239    240            (          0    30682    balance_history_customer 
   TABLE DATA           j   COPY public.balance_history_customer (id, prev_sum, sum, created_at, user_id, payment_method) FROM stdin;
    public          postgres    false    244   r�       '          0    30674    balance_history_provider 
   TABLE DATA           n   COPY public.balance_history_provider (id, prev_sum, sum, created_at, provider_id, payment_method) FROM stdin;
    public          postgres    false    243   ��                 0    30244    brands 
   TABLE DATA           B   COPY public.brands (id, name_ru, name_en, created_at) FROM stdin;
    public          postgres    false    218   ��                 0    30430    cart_products 
   TABLE DATA           H   COPY public.cart_products (id, amount, cart_id, product_id) FROM stdin;
    public          postgres    false    233   d�                 0    30422    carts 
   TABLE DATA           R   COPY public.carts (id, "totalPrice", created_at, updated_at, user_id) FROM stdin;
    public          postgres    false    232   ��       %          0    30622    client_payments 
   TABLE DATA           �   COPY public.client_payments (id, sum, comment, "actualPaymentDate", created_at, user_id, payment_method_id, created_by) FROM stdin;
    public          postgres    false    241   E�                 0    30251 	   countries 
   TABLE DATA           E   COPY public.countries (id, name_ru, name_en, created_at) FROM stdin;
    public          postgres    false    219   b�                 0    30464    customer_order_products 
   TABLE DATA           2  COPY public.customer_order_products (id, "isDistributed", "totalPrice", count, order_id, product_id, provider_order_id, total_cut, ordered_by_buyers, "cuttingsId", cut_supplier, cutting_comment, price_cut_supplier, actual_cut, actual_cut_cost, order_is_paid, price_product, price_product_base) FROM stdin;
    public          postgres    false    235   �       !          0    30473    customer_orders 
   TABLE DATA           �   COPY public.customer_orders (id, number, settlement_deadline, address, paid, updated_at, created_at, payment_id, country_id, status_id, distribution_id, created_by, updated_by, type_user, assembly_comment, delivery_comment, customer_comment) FROM stdin;
    public          postgres    false    237   6�       *          0    30714    cutting 
   TABLE DATA           �   COPY public.cutting (id, number, actual_cut_amount, total_cut_cutting, updated_at, created_at, provider_order_id, is_disabled_actual_cut) FROM stdin;
    public          postgres    false    246   \�                 0    30396    distributions 
   TABLE DATA           S   COPY public.distributions (id, name_ru, name_en, created_at, stock_id) FROM stdin;
    public          postgres    false    230   y�                 0    30272    files 
   TABLE DATA           �   COPY public.files (id, "fileUrl", "fileKey", "fileName", type, dir, size, extension, mime, s3id, created_at, updated_at) FROM stdin;
    public          postgres    false    222   ��                 0    30347    manufacturers 
   TABLE DATA           I   COPY public.manufacturers (id, name_ru, name_en, created_at) FROM stdin;
    public          postgres    false    227   ��                 0    30225 
   migrations 
   TABLE DATA           ;   COPY public.migrations (id, "timestamp", name) FROM stdin;
    public          postgres    false    216   U�       "          0    30536 
   order_logs 
   TABLE DATA           h   COPY public.order_logs (id, payload, updated_at, created_at, order_id, updated_by, comment) FROM stdin;
    public          postgres    false    238   Q�                 0    30265    order_statuses 
   TABLE DATA           J   COPY public.order_statuses (id, name_ru, name_en, created_at) FROM stdin;
    public          postgres    false    221   J�                 0    30456    payment_methods 
   TABLE DATA           K   COPY public.payment_methods (id, name_ru, name_en, created_at) FROM stdin;
    public          postgres    false    234   ��       +          0    30753    pickup_point 
   TABLE DATA           H   COPY public.pickup_point (id, name_ru, name_en, created_at) FROM stdin;
    public          postgres    false    247   4�                 0    30291    products 
   TABLE DATA           �   COPY public.products (id, name, description, composition, "vendorCode", amount, "purchasePrice", "isEnabled", created_at, date_opt, date_pre_order, date_retail, brand_id, provider_id, manufacturer_id, stock_id, course) FROM stdin;
    public          postgres    false    224   ��                 0    30310    products_files 
   TABLE DATA           =   COPY public.products_files (product_id, file_id) FROM stdin;
    public          postgres    false    226   ��                 0    30303    products_tags 
   TABLE DATA           ;   COPY public.products_tags (product_id, tag_id) FROM stdin;
    public          postgres    false    225   ��       $          0    30556    provider_orders 
   TABLE DATA           �   COPY public.provider_orders (id, number, sum, updated_at, created_at, provider_id, status_id, is_cutting_created, "assemblyComment", "deliveryComment") FROM stdin;
    public          postgres    false    240   �      &          0    30631    provider_payments 
   TABLE DATA           �   COPY public.provider_payments (id, sum, comment, "actualPaymentDate", created_at, provider_id, payment_method_id, created_by) FROM stdin;
    public          postgres    false    242   Q                0    30282 	   providers 
   TABLE DATA           Y   COPY public.providers (id, name, address, phone, email, created_at, balance) FROM stdin;
    public          postgres    false    223   n                0    30365    roles 
   TABLE DATA           8   COPY public.roles (id, name, name_en, slug) FROM stdin;
    public          postgres    false    228   ;                0    30404    stocks 
   TABLE DATA           B   COPY public.stocks (id, name_ru, name_en, created_at) FROM stdin;
    public          postgres    false    231   p                0    30258    tags 
   TABLE DATA           @   COPY public.tags (id, name_ru, name_en, created_at) FROM stdin;
    public          postgres    false    220                   0    30381    user_password_resets 
   TABLE DATA           M   COPY public.user_password_resets (id, hash, created_at, user_id) FROM stdin;
    public          postgres    false    229   	                0    30233    users 
   TABLE DATA           �   COPY public.users (id, name, "legalPerson", email, password, phone, created_at, role_id, country_id, address, distribution_id, "limit", balance) FROM stdin;
    public          postgres    false    217   .	      6           0    0    customer_orders_number_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.customer_orders_number_seq', 2, true);
          public          postgres    false    236            7           0    0    cutting_number_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cutting_number_seq', 1, false);
          public          postgres    false    245            8           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 39, true);
          public          postgres    false    215            9           0    0    provider_orders_number_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.provider_orders_number_seq', 1, true);
          public          postgres    false    239                       2606    30302 '   products PK_0806c755e0aca124e67c0cf6d7d 
   CONSTRAINT     g   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "PK_0806c755e0aca124e67c0cf6d7d" PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.products DROP CONSTRAINT "PK_0806c755e0aca124e67c0cf6d7d";
       public            postgres    false    224            &           2606    30314 -   products_files PK_0af1db78d5c9d67dec0cd9d9ccc 
   CONSTRAINT     ~   ALTER TABLE ONLY public.products_files
    ADD CONSTRAINT "PK_0af1db78d5c9d67dec0cd9d9ccc" PRIMARY KEY (product_id, file_id);
 Y   ALTER TABLE ONLY public.products_files DROP CONSTRAINT "PK_0af1db78d5c9d67dec0cd9d9ccc";
       public            postgres    false    226    226            J           2606    30639 0   provider_payments PK_0fb7fd76d6f9dfe78d7c4fc5636 
   CONSTRAINT     p   ALTER TABLE ONLY public.provider_payments
    ADD CONSTRAINT "PK_0fb7fd76d6f9dfe78d7c4fc5636" PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.provider_payments DROP CONSTRAINT "PK_0fb7fd76d6f9dfe78d7c4fc5636";
       public            postgres    false    242            0           2606    30388 3   user_password_resets PK_1195936bd55065c8dfbfed4e4cb 
   CONSTRAINT     s   ALTER TABLE ONLY public.user_password_resets
    ADD CONSTRAINT "PK_1195936bd55065c8dfbfed4e4cb" PRIMARY KEY (id);
 _   ALTER TABLE ONLY public.user_password_resets DROP CONSTRAINT "PK_1195936bd55065c8dfbfed4e4cb";
       public            postgres    false    229            (           2606    30354 ,   manufacturers PK_138520de32c379a48e703441975 
   CONSTRAINT     l   ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT "PK_138520de32c379a48e703441975" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.manufacturers DROP CONSTRAINT "PK_138520de32c379a48e703441975";
       public            postgres    false    227            F           2606    30566 .   provider_orders PK_15be1e7379e4d195909d8989398 
   CONSTRAINT     n   ALTER TABLE ONLY public.provider_orders
    ADD CONSTRAINT "PK_15be1e7379e4d195909d8989398" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.provider_orders DROP CONSTRAINT "PK_15be1e7379e4d195909d8989398";
       public            postgres    false    240            >           2606    30463 .   payment_methods PK_34f9b8c6dfb4ac3559f7e2820d1 
   CONSTRAINT     n   ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT "PK_34f9b8c6dfb4ac3559f7e2820d1" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.payment_methods DROP CONSTRAINT "PK_34f9b8c6dfb4ac3559f7e2820d1";
       public            postgres    false    234            L           2606    30681 7   balance_history_provider PK_39b06880fa5b0b328faa441137a 
   CONSTRAINT     w   ALTER TABLE ONLY public.balance_history_provider
    ADD CONSTRAINT "PK_39b06880fa5b0b328faa441137a" PRIMARY KEY (id);
 c   ALTER TABLE ONLY public.balance_history_provider DROP CONSTRAINT "PK_39b06880fa5b0b328faa441137a";
       public            postgres    false    243            <           2606    30435 ,   cart_products PK_3b12299e401712e78753a7b4fec 
   CONSTRAINT     l   ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT "PK_3b12299e401712e78753a7b4fec" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.cart_products DROP CONSTRAINT "PK_3b12299e401712e78753a7b4fec";
       public            postgres    false    233            @           2606    30471 6   customer_order_products PK_3e59f094c2dc3310d585216a813 
   CONSTRAINT     v   ALTER TABLE ONLY public.customer_order_products
    ADD CONSTRAINT "PK_3e59f094c2dc3310d585216a813" PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.customer_order_products DROP CONSTRAINT "PK_3e59f094c2dc3310d585216a813";
       public            postgres    false    235                       2606    30281 $   files PK_6c16b9093a142e0e7613b04a3d9 
   CONSTRAINT     d   ALTER TABLE ONLY public.files
    ADD CONSTRAINT "PK_6c16b9093a142e0e7613b04a3d9" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.files DROP CONSTRAINT "PK_6c16b9093a142e0e7613b04a3d9";
       public            postgres    false    222            B           2606    30483 .   customer_orders PK_710e2d4957aa5878dfe94e4ac2f 
   CONSTRAINT     n   ALTER TABLE ONLY public.customer_orders
    ADD CONSTRAINT "PK_710e2d4957aa5878dfe94e4ac2f" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.customer_orders DROP CONSTRAINT "PK_710e2d4957aa5878dfe94e4ac2f";
       public            postgres    false    237                       2606    30271 -   order_statuses PK_76c6dc5bccb3ef1a4a8510cab3a 
   CONSTRAINT     m   ALTER TABLE ONLY public.order_statuses
    ADD CONSTRAINT "PK_76c6dc5bccb3ef1a4a8510cab3a" PRIMARY KEY (id);
 Y   ALTER TABLE ONLY public.order_statuses DROP CONSTRAINT "PK_76c6dc5bccb3ef1a4a8510cab3a";
       public            postgres    false    221            
           2606    30232 )   migrations PK_8c82d7f526340ab734260ea46be 
   CONSTRAINT     i   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.migrations DROP CONSTRAINT "PK_8c82d7f526340ab734260ea46be";
       public            postgres    false    216            P           2606    30725 &   cutting PK_931c47b1e6e312ca235aa3a939d 
   CONSTRAINT     f   ALTER TABLE ONLY public.cutting
    ADD CONSTRAINT "PK_931c47b1e6e312ca235aa3a939d" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.cutting DROP CONSTRAINT "PK_931c47b1e6e312ca235aa3a939d";
       public            postgres    false    246            R           2606    30760 +   pickup_point PK_9433b0417c214a3cd2fd39d402c 
   CONSTRAINT     k   ALTER TABLE ONLY public.pickup_point
    ADD CONSTRAINT "PK_9433b0417c214a3cd2fd39d402c" PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.pickup_point DROP CONSTRAINT "PK_9433b0417c214a3cd2fd39d402c";
       public            postgres    false    247            N           2606    30689 7   balance_history_customer PK_9abad2b689db686348fb618bd57 
   CONSTRAINT     w   ALTER TABLE ONLY public.balance_history_customer
    ADD CONSTRAINT "PK_9abad2b689db686348fb618bd57" PRIMARY KEY (id);
 c   ALTER TABLE ONLY public.balance_history_customer DROP CONSTRAINT "PK_9abad2b689db686348fb618bd57";
       public            postgres    false    244                       2606    30241 $   users PK_a3ffb1c0c8416b9fc6f907b7433 
   CONSTRAINT     d   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433";
       public            postgres    false    217                       2606    30288 (   providers PK_af13fc2ebf382fe0dad2e4793aa 
   CONSTRAINT     h   ALTER TABLE ONLY public.providers
    ADD CONSTRAINT "PK_af13fc2ebf382fe0dad2e4793aa" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.providers DROP CONSTRAINT "PK_af13fc2ebf382fe0dad2e4793aa";
       public            postgres    false    223                       2606    30250 %   brands PK_b0c437120b624da1034a81fc561 
   CONSTRAINT     e   ALTER TABLE ONLY public.brands
    ADD CONSTRAINT "PK_b0c437120b624da1034a81fc561" PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.brands DROP CONSTRAINT "PK_b0c437120b624da1034a81fc561";
       public            postgres    false    218                       2606    30257 (   countries PK_b2d7006793e8697ab3ae2deff18 
   CONSTRAINT     h   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT "PK_b2d7006793e8697ab3ae2deff18" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.countries DROP CONSTRAINT "PK_b2d7006793e8697ab3ae2deff18";
       public            postgres    false    219            6           2606    30411 %   stocks PK_b5b1ee4ac914767229337974575 
   CONSTRAINT     e   ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT "PK_b5b1ee4ac914767229337974575" PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.stocks DROP CONSTRAINT "PK_b5b1ee4ac914767229337974575";
       public            postgres    false    231            8           2606    30429 $   carts PK_b5f695a59f5ebb50af3c8160816 
   CONSTRAINT     d   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT "PK_b5f695a59f5ebb50af3c8160816" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.carts DROP CONSTRAINT "PK_b5f695a59f5ebb50af3c8160816";
       public            postgres    false    232            4           2606    30403 ,   distributions PK_b73beffd2ed658ba71d8bd7d820 
   CONSTRAINT     l   ALTER TABLE ONLY public.distributions
    ADD CONSTRAINT "PK_b73beffd2ed658ba71d8bd7d820" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.distributions DROP CONSTRAINT "PK_b73beffd2ed658ba71d8bd7d820";
       public            postgres    false    230            *           2606    30371 $   roles PK_c1433d71a4838793a49dcad46ab 
   CONSTRAINT     d   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "PK_c1433d71a4838793a49dcad46ab" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.roles DROP CONSTRAINT "PK_c1433d71a4838793a49dcad46ab";
       public            postgres    false    228            "           2606    30307 ,   products_tags PK_cbd06afc39cd795196e15bcc72d 
   CONSTRAINT     |   ALTER TABLE ONLY public.products_tags
    ADD CONSTRAINT "PK_cbd06afc39cd795196e15bcc72d" PRIMARY KEY (product_id, tag_id);
 X   ALTER TABLE ONLY public.products_tags DROP CONSTRAINT "PK_cbd06afc39cd795196e15bcc72d";
       public            postgres    false    225    225            H           2606    30630 .   client_payments PK_e7a0d65da19e18571b00b8a862c 
   CONSTRAINT     n   ALTER TABLE ONLY public.client_payments
    ADD CONSTRAINT "PK_e7a0d65da19e18571b00b8a862c" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.client_payments DROP CONSTRAINT "PK_e7a0d65da19e18571b00b8a862c";
       public            postgres    false    241                       2606    30264 #   tags PK_e7dc17249a1148a1970748eda99 
   CONSTRAINT     c   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT "PK_e7dc17249a1148a1970748eda99" PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.tags DROP CONSTRAINT "PK_e7dc17249a1148a1970748eda99";
       public            postgres    false    220            D           2606    30544 )   order_logs PK_fb7850e731ffae56f7b7d4fad0d 
   CONSTRAINT     i   ALTER TABLE ONLY public.order_logs
    ADD CONSTRAINT "PK_fb7850e731ffae56f7b7d4fad0d" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.order_logs DROP CONSTRAINT "PK_fb7850e731ffae56f7b7d4fad0d";
       public            postgres    false    238            2           2606    30390 3   user_password_resets REL_cb88dbefeb68ad2e2a96145d22 
   CONSTRAINT     s   ALTER TABLE ONLY public.user_password_resets
    ADD CONSTRAINT "REL_cb88dbefeb68ad2e2a96145d22" UNIQUE (user_id);
 _   ALTER TABLE ONLY public.user_password_resets DROP CONSTRAINT "REL_cb88dbefeb68ad2e2a96145d22";
       public            postgres    false    229            :           2606    30530 $   carts UQ_2ec1c94a977b940d85a4f498aea 
   CONSTRAINT     d   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT "UQ_2ec1c94a977b940d85a4f498aea" UNIQUE (user_id);
 P   ALTER TABLE ONLY public.carts DROP CONSTRAINT "UQ_2ec1c94a977b940d85a4f498aea";
       public            postgres    false    232                       2606    30290 (   providers UQ_32fe6bfe82d8e4959ba9d9fad42 
   CONSTRAINT     f   ALTER TABLE ONLY public.providers
    ADD CONSTRAINT "UQ_32fe6bfe82d8e4959ba9d9fad42" UNIQUE (email);
 T   ALTER TABLE ONLY public.providers DROP CONSTRAINT "UQ_32fe6bfe82d8e4959ba9d9fad42";
       public            postgres    false    223            ,           2606    30373 $   roles UQ_648e3f5447f725579d7d4ffdfb7 
   CONSTRAINT     a   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "UQ_648e3f5447f725579d7d4ffdfb7" UNIQUE (name);
 P   ALTER TABLE ONLY public.roles DROP CONSTRAINT "UQ_648e3f5447f725579d7d4ffdfb7";
       public            postgres    false    228            .           2606    30375 $   roles UQ_881f72bac969d9a00a1a29e1079 
   CONSTRAINT     a   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "UQ_881f72bac969d9a00a1a29e1079" UNIQUE (slug);
 P   ALTER TABLE ONLY public.roles DROP CONSTRAINT "UQ_881f72bac969d9a00a1a29e1079";
       public            postgres    false    228                       2606    30243 $   users UQ_97672ac88f789774dd47f7c8be3 
   CONSTRAINT     b   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UQ_97672ac88f789774dd47f7c8be3" UNIQUE (email);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "UQ_97672ac88f789774dd47f7c8be3";
       public            postgres    false    217                       1259    30309    IDX_050fd68b81f130e2eafca1d672    INDEX     \   CREATE INDEX "IDX_050fd68b81f130e2eafca1d672" ON public.products_tags USING btree (tag_id);
 4   DROP INDEX public."IDX_050fd68b81f130e2eafca1d672";
       public            postgres    false    225            #           1259    30315    IDX_1a3fa5ac08c408fb7888d6f623    INDEX     a   CREATE INDEX "IDX_1a3fa5ac08c408fb7888d6f623" ON public.products_files USING btree (product_id);
 4   DROP INDEX public."IDX_1a3fa5ac08c408fb7888d6f623";
       public            postgres    false    226                        1259    30308    IDX_5bea8057797206c034871344d9    INDEX     `   CREATE INDEX "IDX_5bea8057797206c034871344d9" ON public.products_tags USING btree (product_id);
 4   DROP INDEX public."IDX_5bea8057797206c034871344d9";
       public            postgres    false    225            $           1259    30316    IDX_a547c9f154932f00874a5b211c    INDEX     ^   CREATE INDEX "IDX_a547c9f154932f00874a5b211c" ON public.products_files USING btree (file_id);
 4   DROP INDEX public."IDX_a547c9f154932f00874a5b211c";
       public            postgres    false    226            w           2606    30695 7   balance_history_provider FK_0104b4c792343038388d748dfac    FK CONSTRAINT     �   ALTER TABLE ONLY public.balance_history_provider
    ADD CONSTRAINT "FK_0104b4c792343038388d748dfac" FOREIGN KEY (payment_method) REFERENCES public.payment_methods(id);
 c   ALTER TABLE ONLY public.balance_history_provider DROP CONSTRAINT "FK_0104b4c792343038388d748dfac";
       public          postgres    false    4926    234    243            m           2606    30545 )   order_logs FK_03afb74d68d64c9d3271bcd7012    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_logs
    ADD CONSTRAINT "FK_03afb74d68d64c9d3271bcd7012" FOREIGN KEY (order_id) REFERENCES public.customer_orders(id);
 U   ALTER TABLE ONLY public.order_logs DROP CONSTRAINT "FK_03afb74d68d64c9d3271bcd7012";
       public          postgres    false    4930    238    237            Z           2606    30332 ,   products_tags FK_050fd68b81f130e2eafca1d672d    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_tags
    ADD CONSTRAINT "FK_050fd68b81f130e2eafca1d672d" FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.products_tags DROP CONSTRAINT "FK_050fd68b81f130e2eafca1d672d";
       public          postgres    false    4884    220    225            q           2606    30640 .   client_payments FK_059fcef09d18e19f4a86923b020    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_payments
    ADD CONSTRAINT "FK_059fcef09d18e19f4a86923b020" FOREIGN KEY (user_id) REFERENCES public.users(id);
 Z   ALTER TABLE ONLY public.client_payments DROP CONSTRAINT "FK_059fcef09d18e19f4a86923b020";
       public          postgres    false    217    4876    241            c           2606    30572 6   customer_order_products FK_0d440aa348183e50b6b26deb458    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_order_products
    ADD CONSTRAINT "FK_0d440aa348183e50b6b26deb458" FOREIGN KEY (product_id) REFERENCES public.products(id);
 b   ALTER TABLE ONLY public.customer_order_products DROP CONSTRAINT "FK_0d440aa348183e50b6b26deb458";
       public          postgres    false    224    4894    235            V           2606    30317 '   products FK_1530a6f15d3c79d1b70be98f2be    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK_1530a6f15d3c79d1b70be98f2be" FOREIGN KEY (brand_id) REFERENCES public.brands(id);
 S   ALTER TABLE ONLY public.products DROP CONSTRAINT "FK_1530a6f15d3c79d1b70be98f2be";
       public          postgres    false    224    218    4880            o           2606    30612 .   provider_orders FK_166887a12ed98aa5774201e1e49    FK CONSTRAINT     �   ALTER TABLE ONLY public.provider_orders
    ADD CONSTRAINT "FK_166887a12ed98aa5774201e1e49" FOREIGN KEY (status_id) REFERENCES public.order_statuses(id);
 Z   ALTER TABLE ONLY public.provider_orders DROP CONSTRAINT "FK_166887a12ed98aa5774201e1e49";
       public          postgres    false    240    4886    221            \           2606    30337 -   products_files FK_1a3fa5ac08c408fb7888d6f6231    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_files
    ADD CONSTRAINT "FK_1a3fa5ac08c408fb7888d6f6231" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.products_files DROP CONSTRAINT "FK_1a3fa5ac08c408fb7888d6f6231";
       public          postgres    false    224    226    4894            y           2606    30705 7   balance_history_customer FK_1b5ebde7e19afea20e42cf70e71    FK CONSTRAINT     �   ALTER TABLE ONLY public.balance_history_customer
    ADD CONSTRAINT "FK_1b5ebde7e19afea20e42cf70e71" FOREIGN KEY (payment_method) REFERENCES public.payment_methods(id);
 c   ALTER TABLE ONLY public.balance_history_customer DROP CONSTRAINT "FK_1b5ebde7e19afea20e42cf70e71";
       public          postgres    false    244    4926    234            W           2606    30417 '   products FK_1ddff4f92dbd69f5cded6859328    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK_1ddff4f92dbd69f5cded6859328" FOREIGN KEY (stock_id) REFERENCES public.stocks(id);
 S   ALTER TABLE ONLY public.products DROP CONSTRAINT "FK_1ddff4f92dbd69f5cded6859328";
       public          postgres    false    4918    231    224            `           2606    30531 $   carts FK_2ec1c94a977b940d85a4f498aea    FK CONSTRAINT     �   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT "FK_2ec1c94a977b940d85a4f498aea" FOREIGN KEY (user_id) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.carts DROP CONSTRAINT "FK_2ec1c94a977b940d85a4f498aea";
       public          postgres    false    4876    217    232            n           2606    30550 )   order_logs FK_42d907979796f84d6645dd650dc    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_logs
    ADD CONSTRAINT "FK_42d907979796f84d6645dd650dc" FOREIGN KEY (updated_by) REFERENCES public.users(id);
 U   ALTER TABLE ONLY public.order_logs DROP CONSTRAINT "FK_42d907979796f84d6645dd650dc";
       public          postgres    false    217    238    4876            X           2606    30322 '   products FK_487f08da85a58f1fa47863a9474    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK_487f08da85a58f1fa47863a9474" FOREIGN KEY (provider_id) REFERENCES public.providers(id);
 S   ALTER TABLE ONLY public.products DROP CONSTRAINT "FK_487f08da85a58f1fa47863a9474";
       public          postgres    false    223    4890    224            x           2606    30690 7   balance_history_provider FK_52fe99e2670d0dcfb24eaa0a8f4    FK CONSTRAINT     �   ALTER TABLE ONLY public.balance_history_provider
    ADD CONSTRAINT "FK_52fe99e2670d0dcfb24eaa0a8f4" FOREIGN KEY (provider_id) REFERENCES public.providers(id);
 c   ALTER TABLE ONLY public.balance_history_provider DROP CONSTRAINT "FK_52fe99e2670d0dcfb24eaa0a8f4";
       public          postgres    false    243    4890    223            Y           2606    30360 '   products FK_5bc36ce05cc397317480efb18f6    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK_5bc36ce05cc397317480efb18f6" FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(id);
 S   ALTER TABLE ONLY public.products DROP CONSTRAINT "FK_5bc36ce05cc397317480efb18f6";
       public          postgres    false    227    4904    224            [           2606    30327 ,   products_tags FK_5bea8057797206c034871344d9d    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_tags
    ADD CONSTRAINT "FK_5bea8057797206c034871344d9d" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.products_tags DROP CONSTRAINT "FK_5bea8057797206c034871344d9d";
       public          postgres    false    4894    224    225            S           2606    30524 $   users FK_6595267f4d19a3bf683f7048f9d    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_6595267f4d19a3bf683f7048f9d" FOREIGN KEY (distribution_id) REFERENCES public.distributions(id);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "FK_6595267f4d19a3bf683f7048f9d";
       public          postgres    false    217    230    4916            d           2606    30734 6   customer_order_products FK_68cf4aa1ee8e8e4810e125667e8    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_order_products
    ADD CONSTRAINT "FK_68cf4aa1ee8e8e4810e125667e8" FOREIGN KEY ("cuttingsId") REFERENCES public.cutting(id);
 b   ALTER TABLE ONLY public.customer_order_products DROP CONSTRAINT "FK_68cf4aa1ee8e8e4810e125667e8";
       public          postgres    false    246    4944    235            t           2606    30660 0   provider_payments FK_68e9b682485f3c4089c3fd9edb0    FK CONSTRAINT     �   ALTER TABLE ONLY public.provider_payments
    ADD CONSTRAINT "FK_68e9b682485f3c4089c3fd9edb0" FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(id);
 \   ALTER TABLE ONLY public.provider_payments DROP CONSTRAINT "FK_68e9b682485f3c4089c3fd9edb0";
       public          postgres    false    242    4926    234            g           2606    30582 .   customer_orders FK_7b017e64d99db2e780b968675d2    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_orders
    ADD CONSTRAINT "FK_7b017e64d99db2e780b968675d2" FOREIGN KEY (country_id) REFERENCES public.countries(id);
 Z   ALTER TABLE ONLY public.customer_orders DROP CONSTRAINT "FK_7b017e64d99db2e780b968675d2";
       public          postgres    false    4882    219    237            h           2606    30577 .   customer_orders FK_82e73e95ba04026aab6dc50af7c    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_orders
    ADD CONSTRAINT "FK_82e73e95ba04026aab6dc50af7c" FOREIGN KEY (payment_id) REFERENCES public.payment_methods(id);
 Z   ALTER TABLE ONLY public.customer_orders DROP CONSTRAINT "FK_82e73e95ba04026aab6dc50af7c";
       public          postgres    false    4926    234    237            z           2606    30700 7   balance_history_customer FK_8451359712ba605ca645823b02f    FK CONSTRAINT     �   ALTER TABLE ONLY public.balance_history_customer
    ADD CONSTRAINT "FK_8451359712ba605ca645823b02f" FOREIGN KEY (user_id) REFERENCES public.users(id);
 c   ALTER TABLE ONLY public.balance_history_customer DROP CONSTRAINT "FK_8451359712ba605ca645823b02f";
       public          postgres    false    4876    217    244            i           2606    30597 .   customer_orders FK_9fe5b62f43fb23204f51145c44c    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_orders
    ADD CONSTRAINT "FK_9fe5b62f43fb23204f51145c44c" FOREIGN KEY (created_by) REFERENCES public.users(id);
 Z   ALTER TABLE ONLY public.customer_orders DROP CONSTRAINT "FK_9fe5b62f43fb23204f51145c44c";
       public          postgres    false    237    217    4876            T           2606    30376 $   users FK_a2cecd1a3531c0b041e29ba46e1    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_a2cecd1a3531c0b041e29ba46e1" FOREIGN KEY (role_id) REFERENCES public.roles(id);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "FK_a2cecd1a3531c0b041e29ba46e1";
       public          postgres    false    4906    228    217            ]           2606    30342 -   products_files FK_a547c9f154932f00874a5b211ca    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_files
    ADD CONSTRAINT "FK_a547c9f154932f00874a5b211ca" FOREIGN KEY (file_id) REFERENCES public.files(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.products_files DROP CONSTRAINT "FK_a547c9f154932f00874a5b211ca";
       public          postgres    false    222    226    4888            {           2606    30729 &   cutting FK_a5f9ad18e7f1981513ef29f956f    FK CONSTRAINT     �   ALTER TABLE ONLY public.cutting
    ADD CONSTRAINT "FK_a5f9ad18e7f1981513ef29f956f" FOREIGN KEY (provider_order_id) REFERENCES public.provider_orders(id);
 R   ALTER TABLE ONLY public.cutting DROP CONSTRAINT "FK_a5f9ad18e7f1981513ef29f956f";
       public          postgres    false    4934    240    246            r           2606    30645 .   client_payments FK_a7700305552e1952ed257c29dff    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_payments
    ADD CONSTRAINT "FK_a7700305552e1952ed257c29dff" FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(id);
 Z   ALTER TABLE ONLY public.client_payments DROP CONSTRAINT "FK_a7700305552e1952ed257c29dff";
       public          postgres    false    234    4926    241            U           2606    30451 $   users FK_ae78dc6cb10aa14cfef96b2dd90    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_ae78dc6cb10aa14cfef96b2dd90" FOREIGN KEY (country_id) REFERENCES public.countries(id);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "FK_ae78dc6cb10aa14cfef96b2dd90";
       public          postgres    false    219    4882    217            u           2606    30665 0   provider_payments FK_ba475f87966377eecbb8c13dea3    FK CONSTRAINT     �   ALTER TABLE ONLY public.provider_payments
    ADD CONSTRAINT "FK_ba475f87966377eecbb8c13dea3" FOREIGN KEY (created_by) REFERENCES public.users(id);
 \   ALTER TABLE ONLY public.provider_payments DROP CONSTRAINT "FK_ba475f87966377eecbb8c13dea3";
       public          postgres    false    4876    242    217            a           2606    30446 ,   cart_products FK_bb7910594db3f08cadeb6f484c1    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT "FK_bb7910594db3f08cadeb6f484c1" FOREIGN KEY (product_id) REFERENCES public.products(id);
 X   ALTER TABLE ONLY public.cart_products DROP CONSTRAINT "FK_bb7910594db3f08cadeb6f484c1";
       public          postgres    false    4894    233    224            v           2606    30655 0   provider_payments FK_c637a6be78f86d214438c4cae15    FK CONSTRAINT     �   ALTER TABLE ONLY public.provider_payments
    ADD CONSTRAINT "FK_c637a6be78f86d214438c4cae15" FOREIGN KEY (provider_id) REFERENCES public.providers(id);
 \   ALTER TABLE ONLY public.provider_payments DROP CONSTRAINT "FK_c637a6be78f86d214438c4cae15";
       public          postgres    false    4890    223    242            p           2606    30607 .   provider_orders FK_c67bcff6847e39f5c92249e7698    FK CONSTRAINT     �   ALTER TABLE ONLY public.provider_orders
    ADD CONSTRAINT "FK_c67bcff6847e39f5c92249e7698" FOREIGN KEY (provider_id) REFERENCES public.providers(id);
 Z   ALTER TABLE ONLY public.provider_orders DROP CONSTRAINT "FK_c67bcff6847e39f5c92249e7698";
       public          postgres    false    223    240    4890            _           2606    30412 ,   distributions FK_c7e3bcd5fbeac56dfcf57991bc6    FK CONSTRAINT     �   ALTER TABLE ONLY public.distributions
    ADD CONSTRAINT "FK_c7e3bcd5fbeac56dfcf57991bc6" FOREIGN KEY (stock_id) REFERENCES public.stocks(id);
 X   ALTER TABLE ONLY public.distributions DROP CONSTRAINT "FK_c7e3bcd5fbeac56dfcf57991bc6";
       public          postgres    false    4918    230    231            ^           2606    30391 3   user_password_resets FK_cb88dbefeb68ad2e2a96145d228    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_password_resets
    ADD CONSTRAINT "FK_cb88dbefeb68ad2e2a96145d228" FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.user_password_resets DROP CONSTRAINT "FK_cb88dbefeb68ad2e2a96145d228";
       public          postgres    false    217    229    4876            j           2606    30592 .   customer_orders FK_d5386f636abd0e8b122a011d8f9    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_orders
    ADD CONSTRAINT "FK_d5386f636abd0e8b122a011d8f9" FOREIGN KEY (distribution_id) REFERENCES public.distributions(id);
 Z   ALTER TABLE ONLY public.customer_orders DROP CONSTRAINT "FK_d5386f636abd0e8b122a011d8f9";
       public          postgres    false    230    4916    237            k           2606    30587 .   customer_orders FK_ddbf626e35e2bd64db4a8aa69a8    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_orders
    ADD CONSTRAINT "FK_ddbf626e35e2bd64db4a8aa69a8" FOREIGN KEY (status_id) REFERENCES public.order_statuses(id);
 Z   ALTER TABLE ONLY public.customer_orders DROP CONSTRAINT "FK_ddbf626e35e2bd64db4a8aa69a8";
       public          postgres    false    237    4886    221            e           2606    30567 6   customer_order_products FK_dfab3f22ea2c2ba2217d130da17    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_order_products
    ADD CONSTRAINT "FK_dfab3f22ea2c2ba2217d130da17" FOREIGN KEY (order_id) REFERENCES public.customer_orders(id) ON UPDATE CASCADE ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.customer_order_products DROP CONSTRAINT "FK_dfab3f22ea2c2ba2217d130da17";
       public          postgres    false    235    4930    237            s           2606    30650 .   client_payments FK_dfbf494a5ee668a5478646db5e4    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_payments
    ADD CONSTRAINT "FK_dfbf494a5ee668a5478646db5e4" FOREIGN KEY (created_by) REFERENCES public.users(id);
 Z   ALTER TABLE ONLY public.client_payments DROP CONSTRAINT "FK_dfbf494a5ee668a5478646db5e4";
       public          postgres    false    241    217    4876            b           2606    30441 ,   cart_products FK_ebc4fe8eabf38786bb86cda0b9f    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT "FK_ebc4fe8eabf38786bb86cda0b9f" FOREIGN KEY (cart_id) REFERENCES public.carts(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.cart_products DROP CONSTRAINT "FK_ebc4fe8eabf38786bb86cda0b9f";
       public          postgres    false    232    233    4920            f           2606    30617 6   customer_order_products FK_ebe2f127cf015d299af8da002f9    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_order_products
    ADD CONSTRAINT "FK_ebe2f127cf015d299af8da002f9" FOREIGN KEY (provider_order_id) REFERENCES public.provider_orders(id);
 b   ALTER TABLE ONLY public.customer_order_products DROP CONSTRAINT "FK_ebe2f127cf015d299af8da002f9";
       public          postgres    false    235    240    4934            l           2606    30602 .   customer_orders FK_f62dd1f182b7de69679dc785b8e    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_orders
    ADD CONSTRAINT "FK_f62dd1f182b7de69679dc785b8e" FOREIGN KEY (updated_by) REFERENCES public.users(id);
 Z   ALTER TABLE ONLY public.customer_orders DROP CONSTRAINT "FK_f62dd1f182b7de69679dc785b8e";
       public          postgres    false    217    4876    237            (      x������ � �      '      x������ � �         �  x���=o�0�g�Who.�(fk��)�E�K�#y�KdA���/�v�x7�����jo���"l�h-��P�`˼�%��ٗ|���r��^L�9`���'&���%H���揝�U���H�z�A+'*�s�1h�pM���*4/8��eɉ�Q���9-[/��'!AGۂ3$ �^�6H�w��(y��C��h�T����p�\��T_�/�L[�>�3=�ho=��w`T�ϠU�8;`9���|�r8g��J���C��z�t��e�B*��H���s
��й�\�ֲ�B��_��K��|�ݷ�GJ���R�+#�M!���B�^�jD�e�u�H3���Kd��
Nu<�e	�3mpZ�k2�o|�VJoA(���6�4�I�z�2���;��z<�2�0��)l@~=�v����t         ^   x����0����e@�����P�%$��g�O�ѓ�"r�	j�.r��k^;W9+�z;��o��4zI�>W,�p�1����@�ۚ���~�?��&         c   x�}ɱ�0�ښ"}|�0��M���#$�{wo�L���2R��*�
uKΐ� �`(1�܌[�!x���lT���~`��W��q�tQ�ٞ�Z�~/�      %      x������ � �         �   x��̱�0 �ڞ�}��~;����GBt	t	H��C����X��JH� �C�A�
�^TL4j'Z��e��j�������|�# ˎ�n�J�c�CU"�T��)A֡�sȽ������a�=��:����=6��/��5G         %  x���In! ��_�2ް?�̅���	��%�"$� U�`I#��a�@�t�����֘��R�o*b%�j��dS@�v��'ξ2
[o�A�(E�aá�c(5J��h��mk ��s�ZU7�J�Z�a����ޞ�����M0e&�g?.�4'�-Qb����T*�n�����
��i�e��T9\�A�	�Z�2;�Q&�O���M��5���( =<CxDpP���Dv{Q�,���_�y��� �>��Z��@�1����c�����w�J�k��}]�7��3      !     x�Ő1n1Ek�)�G�0��C���W��j�����I)Z��D����fǬX@F`�JM��5W�c���^��=` $$ }��"x�������ˆz�=�f��&#(�e������RCI::�An8��14s����*{�!&C������������Re�~B�z��:�����17�$�-2��{�c�<>��p��q�~?�ߵ��ڊ(��<�@q�PF�ah�{	��#�5c��:J�n����9��MC�����MjC����q{��s]�e�l�d      *      x������ � �            x������ � �            x������ � �         �  x����n�0Eך��>a Q�,��63���l��e*6�G`{
L�����q./y��9F��=Z0�bb��2���E4�rh���<�_�M�6�/Wnx����XA�L�r�?X�DM�ԣ�G#����nPc�!q�p��f@e$*��qV���g{+���^�A\�e��U?ǴC����� ��bG��d�^f�l��≻���]j7�7�u�:��M���鳆H�@�]M1�q��ԎKu:}百��s���0��݅d,YN,�(������嘲��w�q_�������Rn7oj;p�9s]��M �p��u�&����/�����:��<-ۧ_�a�E��o*n�v��
ֺ�m�"�ɍ� #�䂲�QA���<^ג�Q<ѸpI٥�I�x�Mӟ����S�G         �  x�]TM��0<{�����Jn\BbmS�	���Y;}mMU;3ovƋ
����c�j�i�T%�#�`Щa�S�L�rC !�h�Y�Ur��T	c�wΨ�<k��קa?O�a;�� {�ޡ����i����:��a�m��-y��y���W��h���ԜrZ�]��y���'^iU��������a�6[�w�� ��JdL��W(3�M�i��7e�������N�����������r�J�`��Md�j��ʼ�+X]!���?�������
�v1���O�cn`�j[)��$S狳_��� �#�3^��V����( �+�kǁ�ːr�c�#bK�BP��8.�/��7Ωݡ;���pSqt:ʽ����N�BQU3j�oĀK{�ǧ�*t&��%�C:�%=,2��'_y �H�B�1�t�a�\�(�q@�,	�q:��A���χ1���trC�B�ˌ�NU��xzl@�bW��x��뿧>5P�� fGI8�rk��n](V]�������c�~���q�Ų�h��k�՘w�|7�nIC��b��YU�n�����84�2�l����j�ϣqπD@ 6(�g�^u� �yΩ��M�YY̒���X� �FV޵�Y!�O�Q*E���ex�Պ� ؕ
/�Z6�,N�z�>�S�g�H��l�%!ֹ�v�D�X�Q��!�CU[)�����WwzL�N�4�d�s����\l.�V����z�t{���+ ����      "   �   x�ŏ�m1E�)�(�%Q���t�I��)�gyO�)�L����O�6D
�$G��ZHJ��V���<�# �����N�bf}B�GZK�9:�Xi!V� �ȭ`Ik��R.��Be� �
��
�2:hou�o��/��?7����u�1���?�Λ��7F���l�l���jfVR��]K �A1��(9/6"��1�3A�z��;�'�;��0ޙf��/�ϡ�         D  x���IN1E��S��Pvws6vUEB�A(;�\�"�p��0�@/j�����#-6;H�@dI�  �.ڈ��ʩ��az)_j�Ge�E�,��ܠ�A}�uhCw�]�|�� L�m�w=�t�|�YkUmE�MO嵼��/��c��Z��׋�n&�(#S"0UP�*n��d1w��.1��s����>��5P?x@�	0z�3A��!y�E���������q^k�c��tXI�]�Y����-�Q�g來�������:�Bu������)�#ɽ�\2j�t�����.��9���uj������i_�7��8��n���b��         �  x����n�0�י�����Nw�_�@��Lf�];B�B�7)C�N/Ӿ��F �&Nl�����J�Q�`i9�Bz�k��T�B�j<G�._�g�r�Dy��~~_T��}@C�[+F���a&�������Q�>#|&�Ij���K=v<,H��N*������=0���`��c[N�m�V'��8�r��t�Q��)D)W��9#�vBX����zVkJ�S �y������2�������_���b�ڡ�Z{4��Io$#`�d�*��p ��eɑ���t|�� i�o�ׇ�)����þ[�<n���>@�D��3�[���:�P��j|�V�-��gr��"7��w�	�����䨉=������`�`�11a�	��Q���>pn��ʟ ��#��aݔ ��۲*iUζ����v�b?�)���$p�EЀOLa�NV:M��-(A�%�2-?|�Z��w�v�@�����<z@�@ �NrE�JаU�)�]�y��xY�?�?�˪i!���M)��	�ID�����a^k��u�v�݀���%��_��p�7��b��.�UeQӢ��/h.y-)Öp�)Uklh���J6�T%J��r�\��MܪtФ�R=z^.�CI`B͋��l����      +   �   x��ͽ�0��:��=\d�]~�(�hi�p)�	Ұ+� !;8!���k��{JO�\@#9`�*o�$�X�m|2��x�����q��2�,�ݵj�D�o@�<�2�f�Yg��s�iJ9X)�k�4��M �)�Phk���D]�~8��!%Hjy:n�?���4� �FFU         �  x���K�����OQ{�Q�zW�x	$Xċl��'�a�3�
΃D&�X���)ˋ�y��|��oĿ�I��"i���:��9����#eϺ�&��$L�Fd���:��Zu`�?�����O�{�g|��O?L��?-k���>=�?�̟N��g�vhw·;�c�o������{��銿�6=�m��]v�J;f�ȨcԖ�4�;1%�R	e8�`�`�&��~E�%���BZNf�Gɍ��_��u#!J\Ҁ��k�r&[U��nHC�Udg�H��J����Uݫ�&����E]�h�2!Q�����I��(�h^YaR3"��D_Q��J��]RJ9ƅ*b'-lt!���q��-lo.]4�M���nNX]��|J�M�#�O����|�������S���'|�bz��x��(},w˶�wAb��t=V��1��ݦ^m���F�ydgcWR	 �	!;h���]��*Rm��K�f�\I]�l�z'�m$j�Z��d�yU|dD�9���&�EҲ��'X.Rj�P��
�$x	����g��k����Vx��%c�A-T�l��cӗ�w���t3}Áb9}�_d�/*b�C����i��Җ���7��xNz�N���mpd<��t� �������t�P�+5(?ȸ���Pײ�RI���F�Q' !�޳�|�	��dX�"��!rU�\�7��s�^8
��9Թ+ťKǓ��I���4}jAlK��_^�U���N0�/��g��T3=�n�`1�������e6/��o��p�t<��~Vo��VN���x���w�v�|��~�M0d4<t�Jc��K��m�Vk��V3H�l��X���Z�R�F�V�.�	�RS	k��{�۫�hEZ���RR���,�Y��H�.���F銈���Z�T��!�q��D���#$�u��R����l��K
A������@I�.-�� �)Z��`�$o��r�˲z�O_�q�}!�*��s�'��>�}5N��C��u�-������vܵ��6���g�:t�P������ ��
�^kF(�����Fks�Zm��B���>��zD'@�������4n�E�l=��wP��졫�bIƭ՚v��HA�l�*�f"�9�W'ş����_!�G/����D�_�Z���Cp��\�^�g�a�O���ߞ���|����۵�N�ia	���P��5�s��a�ʒ�^�e�PL�֤Jr�\ �ƭ�H$�p%a���M4���j�>z�F�Z�ȵ�p�bL6�h�:��*���VQ�b��R��H;�V�3ԕ"ݢ�i�O8pp���tP֩�db��_r{6���z�e���׶۶�`���'}�1�`�s������b���^��.X։�]ʒ�6M놿K�4�r��r��.w�,l+��18%�B�ISR-Km%�`��$[�Nc$��h�����i�R��\~��u��Or���            x������ � �         �  x������ F�oz�T䧗���K���l�̈�=A��N�K�H�gE��8g��gam �~�P����}���*�[�J�[�dA�x���=�]^0�x�M
nW#�U��	�Ikt��[ån���F�ɕ�H�:Q��i�������ʛj���>���JڊC���ңv&�|3MEp�Yv ��7�[��Ӆwp}�|
p_ۥ(������n���f(��5,�凸zb70�4�'X��1��7���A"�{�Ua�����j���9u�0�� �k�b.��zHu��i^m�9v�b\x��q�LZ|�7�.2A�$�fv�Q�8uϚI������F�*(�kO=�e��Ċf�}��&Q��V�F��!�H;��5���'	�{�W=��zl�9VwR��K��,�,��g����c��du��F� Ǒ����~#y��~�Nr0����)-*9Ͽ��y�ar	(      $   �   x�Uͻ�0 �Z�"}@�ٞ%%�x q�W\���!�;��A� ����qY�������E�"��vv��o�?���c?M�L�ġ�c��Nu�(EX����%0OPM����)=8tj�j��J-�|�;�Ͼm��/�      &      x������ � �         �  x���Kk1��)t�	c���#'�������K!�ʒw��
�hp>}�~��8�`~�y�Ɂ2��
HH�`��M�vK������h~�i8�cO���o�5k�X0
�f�}>��]����M(g��B
r)oQݢ�X�07B3��*�R"D��*i-��	H�d�MV�oe�#����k�SL�6w�?u�t�h'�V;��������T����i�Q��hсo�C��DI�I�M%��+�x��r��8_�U���S�}Y��*�J��5a��~��汼��>���c��)t�)0�kIh)������9�����K��0�,oLɟ�os��B��4��&%�=���i�.ql��B])�9��D!��=JhIIQE4Z+2���x����Usݒ�~���+���� X�����R���P�S���٬V��&�t         %  x�}нN�0 �9~
^��;�y��XXl��BS9C�ҁ��'�<B��R�S^��F�-C�w���>�	�ӹ �� �GFE\S��/E�e�/��߸����b��jX�v�g�}5��.Wm�l�$b�(,cJ��R`�u`\�מkc2\���g����߷��g�6�=������*t���iSϚۅR3�T]k�T�G��9��`�� ��e�\;O`��;,��]S�����i�Q��<�8!9Fp�d�(�R��i'�������W�9F�.ShRұ6����sB�����         �   x��̱1 �:��Ŏ�I~��� 
����!���`n�먂$:�D�T	�"��d�����}����n7w�O:�b�+đi�Ie�!�C�	S�Z��%7(#Er��&�斋=��+��]�n7��/U1�         �  x����n�6���Sh�È�(�dי�v�I$��撼	�j�`���HVo���{��B��Z�E��X�ۮ��A��
��R�05M���`�m�,�	�R�P�L	��P\�FʷZ���S���w��`F��:r���NۖG��H�=*����!.�;�}�m�	·�Os���BNq�L�V����w.�Ō�Af����o��3ۖi�m˘���Tq��(�ۖ[����ȡ�G�m�F��	�	�����֦̱��T*V�b	CsW��t�#�b�7VE�	�C�
c;������#��(���r|"�~�\�#}#�k(FjLB.:4�w�Ul��X������.4Z=T<���@���{c3��e���R��c��ղm-�0_�U������f��^���]Zs�S\S-9$����:�;�f_cOr.a۔Ӝ��ڝpH4�_#�����O\��:#�% �Q�&wlS�����R��*�|^4}�y^�^��[�����Q9#��;CȄ9�*jV-�pZKy�^�����	�|Ƒ=.����zԊD�m���TYL�S%��=��V��_���lc��S�5l�At���Se ��l��0~N�T�{�ߴ��L���a>Ѹ6K<�!���h(�K�޶�&�� ��B&����J}�Ϸ�'��0���sٳ{��W�)�, �<�@�����\�-�$�����43\gt9��߾������i��k~������K���            x������ � �         g  x���IoI��s�Ẃ� R��%��6��Š���,����O��DQ2���B7O���Hd,���1T{
�T HS�PNdT_o�(���,��,Ou�� =d�R����z�� �&]��6�D�Γ-^������3F����|���B���(4�nm<_���R�R�괳�ϛO�d�?�v㼄������s��Y��P6*�?�dE� Pa�)�`�B_(�B�g�%H"
B2\@���X%b��I�(�<R�ǎz���[(0�s` G�0�z%��;�����Dr/(@Κ�
I�2�-�U�ۀ�����C��_�a���Ά��f��ͬ���+>'ss�LW]{z�,���2�k5����zY'��2[>.�7;���p���9���X��H�4`Li�b�����s�e%T�hEB�0����6���wK��]��&G��5H��v�g���MIg7����k%q��a_{x���k:Lw�*���T�<1��;_��r�cVq�IST�����8-*!�G�^Pq�4B1pB"@�`@Im�2�"+-���X�14�9��#�T�����%Ŗh���_ƿ�{w�*��䇦�-�p���y�Ȏ���k���tQOf�O�찛_�m2:�ڥKmUs��Ur�SL%��0� �7���(�!=����&�qô�!ꨥ7��#_�����Y�u��a$�Ի�O�Cu*4�����섞,��Eqo��c�9v��9�]�^��,or��"H~/'=�*��0aCA�������Z70~kw��a�.�*����0�A�b�������{wr��~�U�AX���>�Lq�����)��ϣ�7}ba�Is�B�ee�?��	���q�9���8E���q����19ƽqƆ��>$�x��qX|V 
��*�"�l�ۥ>I�����U��;I���m�S�/���x�����Gv\m������� ���tw0�V�G�`���Xx�#�}��۟ra�x���Hs�cc���w6��A�?� �X�c�Ņ��8��w��@�+��'_���2d��ʩ��[o���w�Ev��eUz�`��>4�6���E�{�э�P^D�� �������|ww�]���     