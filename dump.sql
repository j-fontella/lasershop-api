PGDMP         %                z         	   lasershop    13.4    13.4 0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25147 	   lasershop    DATABASE     i   CREATE DATABASE lasershop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE lasershop;
                postgres    false                        2615    25149    endereco    SCHEMA        CREATE SCHEMA endereco;
    DROP SCHEMA endereco;
                postgres    false            	            2615    25150    login    SCHEMA        CREATE SCHEMA login;
    DROP SCHEMA login;
                postgres    false                        2615    25345    pedido    SCHEMA        CREATE SCHEMA pedido;
    DROP SCHEMA pedido;
                postgres    false                        2615    25151    produto    SCHEMA        CREATE SCHEMA produto;
    DROP SCHEMA produto;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    25154    endereco    TABLE     "  CREATE TABLE endereco.endereco (
    id bigint NOT NULL,
    bairro character varying(50),
    cep character(8),
    cidade character varying(50),
    complemento character varying(50),
    logradouro character varying(50),
    numero character varying(20),
    uf character varying(50)
);
    DROP TABLE endereco.endereco;
       endereco         heap    postgres    false    7            �            1259    25152    endereco_id_seq    SEQUENCE     z   CREATE SEQUENCE endereco.endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE endereco.endereco_id_seq;
       endereco          postgres    false    7    205            �           0    0    endereco_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE endereco.endereco_id_seq OWNED BY endereco.endereco.id;
          endereco          postgres    false    204            �            1259    25191    usuario    TABLE     �   CREATE TABLE login.usuario (
    id bigint NOT NULL,
    limite_credito numeric(19,2),
    limite_parcelas integer,
    nome character varying(50),
    senha character varying(255),
    id_endereco bigint
);
    DROP TABLE login.usuario;
       login         heap    postgres    false    9            �            1259    25189    usuario_id_seq    SEQUENCE     v   CREATE SEQUENCE login.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE login.usuario_id_seq;
       login          postgres    false    209    9            �           0    0    usuario_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE login.usuario_id_seq OWNED BY login.usuario.id;
          login          postgres    false    208            �            1259    25348    pedido    TABLE     �   CREATE TABLE pedido.pedido (
    id bigint NOT NULL,
    desconto numeric(19,2),
    parcelas integer,
    valor_total numeric(19,2),
    id_usuario bigint
);
    DROP TABLE pedido.pedido;
       pedido         heap    postgres    false    5            �            1259    25346    pedido_id_seq    SEQUENCE     v   CREATE SEQUENCE pedido.pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE pedido.pedido_id_seq;
       pedido          postgres    false    5    211            �           0    0    pedido_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE pedido.pedido_id_seq OWNED BY pedido.pedido.id;
          pedido          postgres    false    210            �            1259    25356    produto_pedido    TABLE     �   CREATE TABLE pedido.produto_pedido (
    id bigint NOT NULL,
    descricao character varying(255),
    nome character varying(100),
    valor numeric(19,2),
    id_pedido bigint
);
 "   DROP TABLE pedido.produto_pedido;
       pedido         heap    postgres    false    5            �            1259    25354    produto_pedido_id_seq    SEQUENCE     ~   CREATE SEQUENCE pedido.produto_pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE pedido.produto_pedido_id_seq;
       pedido          postgres    false    213    5            �           0    0    produto_pedido_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE pedido.produto_pedido_id_seq OWNED BY pedido.produto_pedido.id;
          pedido          postgres    false    212            �            1259    25178    produto    TABLE     �   CREATE TABLE produto.produto (
    id bigint NOT NULL,
    descricao character varying(255),
    nome character varying(100),
    valor numeric(19,2),
    id_produtopedido bigint
);
    DROP TABLE produto.produto;
       produto         heap    postgres    false    4            �            1259    25176    produto_id_seq    SEQUENCE     x   CREATE SEQUENCE produto.produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE produto.produto_id_seq;
       produto          postgres    false    4    207            �           0    0    produto_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE produto.produto_id_seq OWNED BY produto.produto.id;
          produto          postgres    false    206            >           2604    25157    endereco id    DEFAULT     n   ALTER TABLE ONLY endereco.endereco ALTER COLUMN id SET DEFAULT nextval('endereco.endereco_id_seq'::regclass);
 <   ALTER TABLE endereco.endereco ALTER COLUMN id DROP DEFAULT;
       endereco          postgres    false    205    204    205            @           2604    25194 
   usuario id    DEFAULT     f   ALTER TABLE ONLY login.usuario ALTER COLUMN id SET DEFAULT nextval('login.usuario_id_seq'::regclass);
 8   ALTER TABLE login.usuario ALTER COLUMN id DROP DEFAULT;
       login          postgres    false    208    209    209            A           2604    25351 	   pedido id    DEFAULT     f   ALTER TABLE ONLY pedido.pedido ALTER COLUMN id SET DEFAULT nextval('pedido.pedido_id_seq'::regclass);
 8   ALTER TABLE pedido.pedido ALTER COLUMN id DROP DEFAULT;
       pedido          postgres    false    211    210    211            B           2604    25359    produto_pedido id    DEFAULT     v   ALTER TABLE ONLY pedido.produto_pedido ALTER COLUMN id SET DEFAULT nextval('pedido.produto_pedido_id_seq'::regclass);
 @   ALTER TABLE pedido.produto_pedido ALTER COLUMN id DROP DEFAULT;
       pedido          postgres    false    213    212    213            ?           2604    25181 
   produto id    DEFAULT     j   ALTER TABLE ONLY produto.produto ALTER COLUMN id SET DEFAULT nextval('produto.produto_id_seq'::regclass);
 :   ALTER TABLE produto.produto ALTER COLUMN id DROP DEFAULT;
       produto          postgres    false    206    207    207            �          0    25154    endereco 
   TABLE DATA           b   COPY endereco.endereco (id, bairro, cep, cidade, complemento, logradouro, numero, uf) FROM stdin;
    endereco          postgres    false    205            �          0    25191    usuario 
   TABLE DATA           _   COPY login.usuario (id, limite_credito, limite_parcelas, nome, senha, id_endereco) FROM stdin;
    login          postgres    false    209            �          0    25348    pedido 
   TABLE DATA           Q   COPY pedido.pedido (id, desconto, parcelas, valor_total, id_usuario) FROM stdin;
    pedido          postgres    false    211            �          0    25356    produto_pedido 
   TABLE DATA           O   COPY pedido.produto_pedido (id, descricao, nome, valor, id_pedido) FROM stdin;
    pedido          postgres    false    213            �          0    25178    produto 
   TABLE DATA           P   COPY produto.produto (id, descricao, nome, valor, id_produtopedido) FROM stdin;
    produto          postgres    false    207            �           0    0    endereco_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('endereco.endereco_id_seq', 22, true);
          endereco          postgres    false    204            �           0    0    usuario_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('login.usuario_id_seq', 10, true);
          login          postgres    false    208            �           0    0    pedido_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('pedido.pedido_id_seq', 9, true);
          pedido          postgres    false    210            �           0    0    produto_pedido_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('pedido.produto_pedido_id_seq', 16, true);
          pedido          postgres    false    212            �           0    0    produto_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('produto.produto_id_seq', 4, true);
          produto          postgres    false    206            D           2606    25159    endereco endereco_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY endereco.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY endereco.endereco DROP CONSTRAINT endereco_pkey;
       endereco            postgres    false    205            H           2606    25196    usuario usuario_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY login.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY login.usuario DROP CONSTRAINT usuario_pkey;
       login            postgres    false    209            J           2606    25353    pedido pedido_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY pedido.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY pedido.pedido DROP CONSTRAINT pedido_pkey;
       pedido            postgres    false    211            L           2606    25361 "   produto_pedido produto_pedido_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY pedido.produto_pedido
    ADD CONSTRAINT produto_pedido_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY pedido.produto_pedido DROP CONSTRAINT produto_pedido_pkey;
       pedido            postgres    false    213            F           2606    25183    produto produto_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY produto.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY produto.produto DROP CONSTRAINT produto_pkey;
       produto            postgres    false    207            M           2606    25197 #   usuario fka3dyykmj6hn86irxki5d4kqn7    FK CONSTRAINT     �   ALTER TABLE ONLY login.usuario
    ADD CONSTRAINT fka3dyykmj6hn86irxki5d4kqn7 FOREIGN KEY (id_endereco) REFERENCES endereco.endereco(id);
 L   ALTER TABLE ONLY login.usuario DROP CONSTRAINT fka3dyykmj6hn86irxki5d4kqn7;
       login          postgres    false    209    2884    205            O           2606    25367 *   produto_pedido fk3moid9j0iyby8p094vaij1bo5    FK CONSTRAINT     �   ALTER TABLE ONLY pedido.produto_pedido
    ADD CONSTRAINT fk3moid9j0iyby8p094vaij1bo5 FOREIGN KEY (id_pedido) REFERENCES pedido.pedido(id);
 T   ALTER TABLE ONLY pedido.produto_pedido DROP CONSTRAINT fk3moid9j0iyby8p094vaij1bo5;
       pedido          postgres    false    211    2890    213            N           2606    25362 "   pedido fk9ggns8wgi350asplcie001cv4    FK CONSTRAINT     �   ALTER TABLE ONLY pedido.pedido
    ADD CONSTRAINT fk9ggns8wgi350asplcie001cv4 FOREIGN KEY (id_usuario) REFERENCES login.usuario(id);
 L   ALTER TABLE ONLY pedido.pedido DROP CONSTRAINT fk9ggns8wgi350asplcie001cv4;
       pedido          postgres    false    211    2888    209            �   j   x�32�;���*5Q!%�X�7����bN#ccCKN�̒ԢÛ39�]�C8]�K�S<K/��L�40���22$Ҍ��D'CL�fg�O~q	vb���� nzD�      �   �   x�%�M� @��p
N``�PX����v��iL��H�ω<�kZ�/߳��Q	�V������OeZ�q̼���؇��<��Z�o%�?A'�$���g{O��� �S�\�=Zp�.h�E�t�u��R��J��UD�����ȧ��Q�Qu0��`}����,S      �   L   x�M���0Cѳ3LdM�]�� n_Oq.� ���*�������͉`�\:#_��6��"�İ����v��=��      �   �   x����
�0�继���M����&E]�� Z��||��������.���Z[ړ���4idS�"�h-]׈3�"�1�i���y��5�[�&��~�C{�El1���W�^�N�������v���X&���|�����
j�_!^�R�£B�'�rr<      �   d   x�3�tO�M-���/IM���VNL�4300�30����2�ʯ�W(-*(-J�t��-(-IL�/R �s���虁U�p�gr��&� �9M͡&��qqq 0
�      0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25147 	   lasershop    DATABASE     i   CREATE DATABASE lasershop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE lasershop;
                postgres    false                        2615    25149    endereco    SCHEMA        CREATE SCHEMA endereco;
    DROP SCHEMA endereco;
                postgres    false            	            2615    25150    login    SCHEMA        CREATE SCHEMA login;
    DROP SCHEMA login;
                postgres    false                        2615    25345    pedido    SCHEMA        CREATE SCHEMA pedido;
    DROP SCHEMA pedido;
                postgres    false                        2615    25151    produto    SCHEMA        CREATE SCHEMA produto;
    DROP SCHEMA produto;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    25154    endereco    TABLE     "  CREATE TABLE endereco.endereco (
    id bigint NOT NULL,
    bairro character varying(50),
    cep character(8),
    cidade character varying(50),
    complemento character varying(50),
    logradouro character varying(50),
    numero character varying(20),
    uf character varying(50)
);
    DROP TABLE endereco.endereco;
       endereco         heap    postgres    false    7            �            1259    25152    endereco_id_seq    SEQUENCE     z   CREATE SEQUENCE endereco.endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE endereco.endereco_id_seq;
       endereco          postgres    false    7    205            �           0    0    endereco_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE endereco.endereco_id_seq OWNED BY endereco.endereco.id;
          endereco          postgres    false    204            �            1259    25191    usuario    TABLE     �   CREATE TABLE login.usuario (
    id bigint NOT NULL,
    limite_credito numeric(19,2),
    limite_parcelas integer,
    nome character varying(50),
    senha character varying(255),
    id_endereco bigint
);
    DROP TABLE login.usuario;
       login         heap    postgres    false    9            �            1259    25189    usuario_id_seq    SEQUENCE     v   CREATE SEQUENCE login.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE login.usuario_id_seq;
       login          postgres    false    209    9            �           0    0    usuario_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE login.usuario_id_seq OWNED BY login.usuario.id;
          login          postgres    false    208            �            1259    25348    pedido    TABLE     �   CREATE TABLE pedido.pedido (
    id bigint NOT NULL,
    desconto numeric(19,2),
    parcelas integer,
    valor_total numeric(19,2),
    id_usuario bigint
);
    DROP TABLE pedido.pedido;
       pedido         heap    postgres    false    5            �            1259    25346    pedido_id_seq    SEQUENCE     v   CREATE SEQUENCE pedido.pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE pedido.pedido_id_seq;
       pedido          postgres    false    5    211            �           0    0    pedido_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE pedido.pedido_id_seq OWNED BY pedido.pedido.id;
          pedido          postgres    false    210            �            1259    25356    produto_pedido    TABLE     �   CREATE TABLE pedido.produto_pedido (
    id bigint NOT NULL,
    descricao character varying(255),
    nome character varying(100),
    valor numeric(19,2),
    id_pedido bigint
);
 "   DROP TABLE pedido.produto_pedido;
       pedido         heap    postgres    false    5            �            1259    25354    produto_pedido_id_seq    SEQUENCE     ~   CREATE SEQUENCE pedido.produto_pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE pedido.produto_pedido_id_seq;
       pedido          postgres    false    213    5            �           0    0    produto_pedido_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE pedido.produto_pedido_id_seq OWNED BY pedido.produto_pedido.id;
          pedido          postgres    false    212            �            1259    25178    produto    TABLE     �   CREATE TABLE produto.produto (
    id bigint NOT NULL,
    descricao character varying(255),
    nome character varying(100),
    valor numeric(19,2),
    id_produtopedido bigint
);
    DROP TABLE produto.produto;
       produto         heap    postgres    false    4            �            1259    25176    produto_id_seq    SEQUENCE     x   CREATE SEQUENCE produto.produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE produto.produto_id_seq;
       produto          postgres    false    4    207            �           0    0    produto_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE produto.produto_id_seq OWNED BY produto.produto.id;
          produto          postgres    false    206            >           2604    25157    endereco id    DEFAULT     n   ALTER TABLE ONLY endereco.endereco ALTER COLUMN id SET DEFAULT nextval('endereco.endereco_id_seq'::regclass);
 <   ALTER TABLE endereco.endereco ALTER COLUMN id DROP DEFAULT;
       endereco          postgres    false    205    204    205            @           2604    25194 
   usuario id    DEFAULT     f   ALTER TABLE ONLY login.usuario ALTER COLUMN id SET DEFAULT nextval('login.usuario_id_seq'::regclass);
 8   ALTER TABLE login.usuario ALTER COLUMN id DROP DEFAULT;
       login          postgres    false    208    209    209            A           2604    25351 	   pedido id    DEFAULT     f   ALTER TABLE ONLY pedido.pedido ALTER COLUMN id SET DEFAULT nextval('pedido.pedido_id_seq'::regclass);
 8   ALTER TABLE pedido.pedido ALTER COLUMN id DROP DEFAULT;
       pedido          postgres    false    211    210    211            B           2604    25359    produto_pedido id    DEFAULT     v   ALTER TABLE ONLY pedido.produto_pedido ALTER COLUMN id SET DEFAULT nextval('pedido.produto_pedido_id_seq'::regclass);
 @   ALTER TABLE pedido.produto_pedido ALTER COLUMN id DROP DEFAULT;
       pedido          postgres    false    213    212    213            ?           2604    25181 
   produto id    DEFAULT     j   ALTER TABLE ONLY produto.produto ALTER COLUMN id SET DEFAULT nextval('produto.produto_id_seq'::regclass);
 :   ALTER TABLE produto.produto ALTER COLUMN id DROP DEFAULT;
       produto          postgres    false    206    207    207            �          0    25154    endereco 
   TABLE DATA           b   COPY endereco.endereco (id, bairro, cep, cidade, complemento, logradouro, numero, uf) FROM stdin;
    endereco          postgres    false    205   �       �          0    25191    usuario 
   TABLE DATA           _   COPY login.usuario (id, limite_credito, limite_parcelas, nome, senha, id_endereco) FROM stdin;
    login          postgres    false    209   t        �          0    25348    pedido 
   TABLE DATA           Q   COPY pedido.pedido (id, desconto, parcelas, valor_total, id_usuario) FROM stdin;
    pedido          postgres    false    211   �        �          0    25356    produto_pedido 
   TABLE DATA           O   COPY pedido.produto_pedido (id, descricao, nome, valor, id_pedido) FROM stdin;
    pedido          postgres    false    213   V        �          0    25178    produto 
   TABLE DATA           P   COPY produto.produto (id, descricao, nome, valor, id_produtopedido) FROM stdin;
    produto          postgres    false    207   �        �           0    0    endereco_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('endereco.endereco_id_seq', 22, true);
          endereco          postgres    false    204            �           0    0    usuario_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('login.usuario_id_seq', 10, true);
          login          postgres    false    208            �           0    0    pedido_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('pedido.pedido_id_seq', 9, true);
          pedido          postgres    false    210            �           0    0    produto_pedido_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('pedido.produto_pedido_id_seq', 16, true);
          pedido          postgres    false    212            �           0    0    produto_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('produto.produto_id_seq', 4, true);
          produto          postgres    false    206            D           2606    25159    endereco endereco_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY endereco.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY endereco.endereco DROP CONSTRAINT endereco_pkey;
       endereco            postgres    false    205            H           2606    25196    usuario usuario_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY login.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY login.usuario DROP CONSTRAINT usuario_pkey;
       login            postgres    false    209            J           2606    25353    pedido pedido_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY pedido.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY pedido.pedido DROP CONSTRAINT pedido_pkey;
       pedido            postgres    false    211            L           2606    25361 "   produto_pedido produto_pedido_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY pedido.produto_pedido
    ADD CONSTRAINT produto_pedido_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY pedido.produto_pedido DROP CONSTRAINT produto_pedido_pkey;
       pedido            postgres    false    213            F           2606    25183    produto produto_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY produto.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY produto.produto DROP CONSTRAINT produto_pkey;
       produto            postgres    false    207            M           2606    25197 #   usuario fka3dyykmj6hn86irxki5d4kqn7    FK CONSTRAINT     �   ALTER TABLE ONLY login.usuario
    ADD CONSTRAINT fka3dyykmj6hn86irxki5d4kqn7 FOREIGN KEY (id_endereco) REFERENCES endereco.endereco(id);
 L   ALTER TABLE ONLY login.usuario DROP CONSTRAINT fka3dyykmj6hn86irxki5d4kqn7;
       login          postgres    false    209    2884    205            O           2606    25367 *   produto_pedido fk3moid9j0iyby8p094vaij1bo5    FK CONSTRAINT     �   ALTER TABLE ONLY pedido.produto_pedido
    ADD CONSTRAINT fk3moid9j0iyby8p094vaij1bo5 FOREIGN KEY (id_pedido) REFERENCES pedido.pedido(id);
 T   ALTER TABLE ONLY pedido.produto_pedido DROP CONSTRAINT fk3moid9j0iyby8p094vaij1bo5;
       pedido          postgres    false    211    2890    213            N           2606    25362 "   pedido fk9ggns8wgi350asplcie001cv4    FK CONSTRAINT     �   ALTER TABLE ONLY pedido.pedido
    ADD CONSTRAINT fk9ggns8wgi350asplcie001cv4 FOREIGN KEY (id_usuario) REFERENCES login.usuario(id);
 L   ALTER TABLE ONLY pedido.pedido DROP CONSTRAINT fk9ggns8wgi350asplcie001cv4;
       pedido          postgres    false    211    2888    209           