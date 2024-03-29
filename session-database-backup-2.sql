PGDMP  2            
    	    {            session_database    16.0    16.0 K    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    16421    session_database    DATABASE     �   CREATE DATABASE session_database WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
     DROP DATABASE session_database;
                postgres    false            �            1259    16578    attestations    TABLE     0  CREATE TABLE public.attestations (
    a_discipline_in_curricula_code integer NOT NULL,
    a_date date NOT NULL,
    a_student_record_book integer NOT NULL,
    a_attempt integer NOT NULL,
    a_semester integer NOT NULL,
    a_grade character varying(10) NOT NULL,
    a_teacher_id integer NOT NULL
);
     DROP TABLE public.attestations;
       public         heap    postgres    false            �            1259    16463    auditoriums    TABLE     �   CREATE TABLE public.auditoriums (
    a_id integer NOT NULL,
    a_site_name character varying(50) NOT NULL,
    a_type character varying(50) NOT NULL,
    a_number integer NOT NULL
);
    DROP TABLE public.auditoriums;
       public         heap    postgres    false            �            1259    16488 	   curricula    TABLE     �   CREATE TABLE public.curricula (
    c_code integer NOT NULL,
    c_educational_program_code integer NOT NULL,
    c_admission_year date NOT NULL
);
    DROP TABLE public.curricula;
       public         heap    postgres    false            �            1259    16453 
   directions    TABLE     �   CREATE TABLE public.directions (
    d_code integer NOT NULL,
    d_name character varying(50) NOT NULL,
    d_qualification character varying(100) NOT NULL
);
    DROP TABLE public.directions;
       public         heap    postgres    false            �            1259    16448    disciplines    TABLE       CREATE TABLE public.disciplines (
    d_code integer NOT NULL,
    d_name character varying(50) NOT NULL,
    d_hours integer NOT NULL,
    d_lecture_hours integer NOT NULL,
    d_practical_hours integer NOT NULL,
    d_laboratory_hours integer NOT NULL
);
    DROP TABLE public.disciplines;
       public         heap    postgres    false            �            1259    16548    disciplines_in_curricula    TABLE     �   CREATE TABLE public.disciplines_in_curricula (
    dic_code integer NOT NULL,
    dic_discipline_code integer NOT NULL,
    dic_curriculum_code integer NOT NULL,
    dic_semester integer NOT NULL
);
 ,   DROP TABLE public.disciplines_in_curricula;
       public         heap    postgres    false            �            1259    16458 	   divisions    TABLE     j   CREATE TABLE public.divisions (
    d_code integer NOT NULL,
    d_name character varying(50) NOT NULL
);
    DROP TABLE public.divisions;
       public         heap    postgres    false            �            1259    16563    divisions_on_sites    TABLE     �   CREATE TABLE public.divisions_on_sites (
    dos_site_name character varying(100) NOT NULL,
    dos_division_code integer NOT NULL
);
 &   DROP TABLE public.divisions_on_sites;
       public         heap    postgres    false            �            1259    16473    educational_programmes    TABLE     �   CREATE TABLE public.educational_programmes (
    ep_code integer NOT NULL,
    ep_name character varying(100) NOT NULL,
    ep_division_code integer NOT NULL,
    ep_direction_code integer NOT NULL,
    ep_format character varying(50) NOT NULL
);
 *   DROP TABLE public.educational_programmes;
       public         heap    postgres    false            �            1259    16508    scholarship_receipts    TABLE     �   CREATE TABLE public.scholarship_receipts (
    sr_scholarship_id integer NOT NULL,
    sr_student_record_book integer NOT NULL,
    sr_date date NOT NULL,
    sr_sum integer NOT NULL
);
 (   DROP TABLE public.scholarship_receipts;
       public         heap    postgres    false            �            1259    16422    scholarships    TABLE     �   CREATE TABLE public.scholarships (
    s_id integer NOT NULL,
    s_type character varying(100) NOT NULL,
    s_name character varying(100) NOT NULL
);
     DROP TABLE public.scholarships;
       public         heap    postgres    false            �            1259    16598    session_schedule    TABLE     �   CREATE TABLE public.session_schedule (
    ss_study_group_code integer NOT NULL,
    ss_discipline_in_curriculum_code integer NOT NULL,
    ss_date date NOT NULL,
    ss_auditorium_id integer,
    ss_teacher_id integer NOT NULL
);
 $   DROP TABLE public.session_schedule;
       public         heap    postgres    false            �            1259    16438    sites    TABLE     y   CREATE TABLE public.sites (
    s_name character varying(100) NOT NULL,
    s_address character varying(100) NOT NULL
);
    DROP TABLE public.sites;
       public         heap    postgres    false            �            1259    16433    students    TABLE     �   CREATE TABLE public.students (
    s_record_book integer NOT NULL,
    s_first_name character varying(50) NOT NULL,
    s_last_name character varying(50) NOT NULL,
    s_patronymic character varying(50),
    s_course integer
);
    DROP TABLE public.students;
       public         heap    postgres    false            �            1259    16533    students_in_study_groups    TABLE     �   CREATE TABLE public.students_in_study_groups (
    sisg_student_record_book integer NOT NULL,
    sisg_study_group_code integer NOT NULL,
    sisg_from date NOT NULL,
    sisg_to date
);
 ,   DROP TABLE public.students_in_study_groups;
       public         heap    postgres    false            �            1259    16498    study_groups    TABLE     �   CREATE TABLE public.study_groups (
    sg_code integer NOT NULL,
    sg_number character varying(50) NOT NULL,
    sg_curriculum_code integer NOT NULL,
    sg_from date NOT NULL,
    sg_to date
);
     DROP TABLE public.study_groups;
       public         heap    postgres    false            �            1259    16443    teachers    TABLE     �   CREATE TABLE public.teachers (
    t_id integer NOT NULL,
    t_first_name character varying(50) NOT NULL,
    t_last_name character varying(50) NOT NULL,
    t_patronymic character varying(50),
    t_position character varying(100) NOT NULL
);
    DROP TABLE public.teachers;
       public         heap    postgres    false            -          0    16578    attestations 
   TABLE DATA           �   COPY public.attestations (a_discipline_in_curricula_code, a_date, a_student_record_book, a_attempt, a_semester, a_grade, a_teacher_id) FROM stdin;
    public          postgres    false    230   ^j       %          0    16463    auditoriums 
   TABLE DATA           J   COPY public.auditoriums (a_id, a_site_name, a_type, a_number) FROM stdin;
    public          postgres    false    222   {j       '          0    16488 	   curricula 
   TABLE DATA           Y   COPY public.curricula (c_code, c_educational_program_code, c_admission_year) FROM stdin;
    public          postgres    false    224   �j       #          0    16453 
   directions 
   TABLE DATA           E   COPY public.directions (d_code, d_name, d_qualification) FROM stdin;
    public          postgres    false    220   �j       "          0    16448    disciplines 
   TABLE DATA           v   COPY public.disciplines (d_code, d_name, d_hours, d_lecture_hours, d_practical_hours, d_laboratory_hours) FROM stdin;
    public          postgres    false    219   �j       +          0    16548    disciplines_in_curricula 
   TABLE DATA           t   COPY public.disciplines_in_curricula (dic_code, dic_discipline_code, dic_curriculum_code, dic_semester) FROM stdin;
    public          postgres    false    228   �j       $          0    16458 	   divisions 
   TABLE DATA           3   COPY public.divisions (d_code, d_name) FROM stdin;
    public          postgres    false    221   k       ,          0    16563    divisions_on_sites 
   TABLE DATA           N   COPY public.divisions_on_sites (dos_site_name, dos_division_code) FROM stdin;
    public          postgres    false    229   )k       &          0    16473    educational_programmes 
   TABLE DATA           r   COPY public.educational_programmes (ep_code, ep_name, ep_division_code, ep_direction_code, ep_format) FROM stdin;
    public          postgres    false    223   Fk       )          0    16508    scholarship_receipts 
   TABLE DATA           j   COPY public.scholarship_receipts (sr_scholarship_id, sr_student_record_book, sr_date, sr_sum) FROM stdin;
    public          postgres    false    226   ck                 0    16422    scholarships 
   TABLE DATA           <   COPY public.scholarships (s_id, s_type, s_name) FROM stdin;
    public          postgres    false    215   �k       .          0    16598    session_schedule 
   TABLE DATA           �   COPY public.session_schedule (ss_study_group_code, ss_discipline_in_curriculum_code, ss_date, ss_auditorium_id, ss_teacher_id) FROM stdin;
    public          postgres    false    231   �k                  0    16438    sites 
   TABLE DATA           2   COPY public.sites (s_name, s_address) FROM stdin;
    public          postgres    false    217   �k                 0    16433    students 
   TABLE DATA           d   COPY public.students (s_record_book, s_first_name, s_last_name, s_patronymic, s_course) FROM stdin;
    public          postgres    false    216   �k       *          0    16533    students_in_study_groups 
   TABLE DATA           w   COPY public.students_in_study_groups (sisg_student_record_book, sisg_study_group_code, sisg_from, sisg_to) FROM stdin;
    public          postgres    false    227   �k       (          0    16498    study_groups 
   TABLE DATA           ^   COPY public.study_groups (sg_code, sg_number, sg_curriculum_code, sg_from, sg_to) FROM stdin;
    public          postgres    false    225   l       !          0    16443    teachers 
   TABLE DATA           ]   COPY public.teachers (t_id, t_first_name, t_last_name, t_patronymic, t_position) FROM stdin;
    public          postgres    false    218   .l       x           2606    16582    attestations attestations_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.attestations
    ADD CONSTRAINT attestations_pkey PRIMARY KEY (a_discipline_in_curricula_code, a_date);
 H   ALTER TABLE ONLY public.attestations DROP CONSTRAINT attestations_pkey;
       public            postgres    false    230    230            h           2606    16467    auditoriums auditoriums_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.auditoriums
    ADD CONSTRAINT auditoriums_pkey PRIMARY KEY (a_id);
 F   ALTER TABLE ONLY public.auditoriums DROP CONSTRAINT auditoriums_pkey;
       public            postgres    false    222            l           2606    16492    curricula curricula_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.curricula
    ADD CONSTRAINT curricula_pkey PRIMARY KEY (c_code);
 B   ALTER TABLE ONLY public.curricula DROP CONSTRAINT curricula_pkey;
       public            postgres    false    224            d           2606    16457    directions directions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.directions
    ADD CONSTRAINT directions_pkey PRIMARY KEY (d_code);
 D   ALTER TABLE ONLY public.directions DROP CONSTRAINT directions_pkey;
       public            postgres    false    220            t           2606    16552 6   disciplines_in_curricula disciplines_in_curricula_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.disciplines_in_curricula
    ADD CONSTRAINT disciplines_in_curricula_pkey PRIMARY KEY (dic_code);
 `   ALTER TABLE ONLY public.disciplines_in_curricula DROP CONSTRAINT disciplines_in_curricula_pkey;
       public            postgres    false    228            b           2606    16452    disciplines disciplines_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (d_code);
 F   ALTER TABLE ONLY public.disciplines DROP CONSTRAINT disciplines_pkey;
       public            postgres    false    219            v           2606    16567 *   divisions_on_sites divisions_on_sites_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.divisions_on_sites
    ADD CONSTRAINT divisions_on_sites_pkey PRIMARY KEY (dos_site_name, dos_division_code);
 T   ALTER TABLE ONLY public.divisions_on_sites DROP CONSTRAINT divisions_on_sites_pkey;
       public            postgres    false    229    229            f           2606    16462    divisions divisions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT divisions_pkey PRIMARY KEY (d_code);
 B   ALTER TABLE ONLY public.divisions DROP CONSTRAINT divisions_pkey;
       public            postgres    false    221            j           2606    16477 2   educational_programmes educational_programmes_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.educational_programmes
    ADD CONSTRAINT educational_programmes_pkey PRIMARY KEY (ep_code);
 \   ALTER TABLE ONLY public.educational_programmes DROP CONSTRAINT educational_programmes_pkey;
       public            postgres    false    223            p           2606    16512 .   scholarship_receipts scholarship_receipts_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.scholarship_receipts
    ADD CONSTRAINT scholarship_receipts_pkey PRIMARY KEY (sr_scholarship_id, sr_student_record_book, sr_date);
 X   ALTER TABLE ONLY public.scholarship_receipts DROP CONSTRAINT scholarship_receipts_pkey;
       public            postgres    false    226    226    226            Z           2606    16426    scholarships scholarships_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.scholarships
    ADD CONSTRAINT scholarships_pkey PRIMARY KEY (s_id);
 H   ALTER TABLE ONLY public.scholarships DROP CONSTRAINT scholarships_pkey;
       public            postgres    false    215            z           2606    16602 &   session_schedule session_schedule_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT session_schedule_pkey PRIMARY KEY (ss_study_group_code, ss_discipline_in_curriculum_code, ss_date);
 P   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT session_schedule_pkey;
       public            postgres    false    231    231    231            ^           2606    16442    sites sites_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (s_name);
 :   ALTER TABLE ONLY public.sites DROP CONSTRAINT sites_pkey;
       public            postgres    false    217            r           2606    16537 6   students_in_study_groups students_in_study_groups_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.students_in_study_groups
    ADD CONSTRAINT students_in_study_groups_pkey PRIMARY KEY (sisg_student_record_book, sisg_study_group_code);
 `   ALTER TABLE ONLY public.students_in_study_groups DROP CONSTRAINT students_in_study_groups_pkey;
       public            postgres    false    227    227            \           2606    16437    students students_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (s_record_book);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public            postgres    false    216            n           2606    16502    study_groups study_groups_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.study_groups
    ADD CONSTRAINT study_groups_pkey PRIMARY KEY (sg_code);
 H   ALTER TABLE ONLY public.study_groups DROP CONSTRAINT study_groups_pkey;
       public            postgres    false    225            `           2606    16447    teachers teachers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (t_id);
 @   ALTER TABLE ONLY public.teachers DROP CONSTRAINT teachers_pkey;
       public            postgres    false    218            �           2606    16583 =   attestations attestations_a_discipline_in_curricula_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.attestations
    ADD CONSTRAINT attestations_a_discipline_in_curricula_code_fkey FOREIGN KEY (a_discipline_in_curricula_code) REFERENCES public.disciplines_in_curricula(dic_code);
 g   ALTER TABLE ONLY public.attestations DROP CONSTRAINT attestations_a_discipline_in_curricula_code_fkey;
       public          postgres    false    228    230    4724            �           2606    16588 4   attestations attestations_a_student_record_book_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.attestations
    ADD CONSTRAINT attestations_a_student_record_book_fkey FOREIGN KEY (a_student_record_book) REFERENCES public.students(s_record_book);
 ^   ALTER TABLE ONLY public.attestations DROP CONSTRAINT attestations_a_student_record_book_fkey;
       public          postgres    false    4700    230    216            �           2606    16593 +   attestations attestations_a_teacher_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.attestations
    ADD CONSTRAINT attestations_a_teacher_id_fkey FOREIGN KEY (a_teacher_id) REFERENCES public.teachers(t_id);
 U   ALTER TABLE ONLY public.attestations DROP CONSTRAINT attestations_a_teacher_id_fkey;
       public          postgres    false    4704    230    218            {           2606    16468 (   auditoriums auditoriums_a_site_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auditoriums
    ADD CONSTRAINT auditoriums_a_site_name_fkey FOREIGN KEY (a_site_name) REFERENCES public.sites(s_name);
 R   ALTER TABLE ONLY public.auditoriums DROP CONSTRAINT auditoriums_a_site_name_fkey;
       public          postgres    false    222    217    4702            ~           2606    16493 3   curricula curricula_c_educational_program_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.curricula
    ADD CONSTRAINT curricula_c_educational_program_code_fkey FOREIGN KEY (c_educational_program_code) REFERENCES public.educational_programmes(ep_code);
 ]   ALTER TABLE ONLY public.curricula DROP CONSTRAINT curricula_c_educational_program_code_fkey;
       public          postgres    false    4714    224    223            �           2606    16558 J   disciplines_in_curricula disciplines_in_curricula_dic_curriculum_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.disciplines_in_curricula
    ADD CONSTRAINT disciplines_in_curricula_dic_curriculum_code_fkey FOREIGN KEY (dic_curriculum_code) REFERENCES public.curricula(c_code);
 t   ALTER TABLE ONLY public.disciplines_in_curricula DROP CONSTRAINT disciplines_in_curricula_dic_curriculum_code_fkey;
       public          postgres    false    228    4716    224            �           2606    16553 J   disciplines_in_curricula disciplines_in_curricula_dic_discipline_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.disciplines_in_curricula
    ADD CONSTRAINT disciplines_in_curricula_dic_discipline_code_fkey FOREIGN KEY (dic_discipline_code) REFERENCES public.disciplines(d_code);
 t   ALTER TABLE ONLY public.disciplines_in_curricula DROP CONSTRAINT disciplines_in_curricula_dic_discipline_code_fkey;
       public          postgres    false    4706    219    228            �           2606    16573 <   divisions_on_sites divisions_on_sites_dos_division_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.divisions_on_sites
    ADD CONSTRAINT divisions_on_sites_dos_division_code_fkey FOREIGN KEY (dos_division_code) REFERENCES public.divisions(d_code);
 f   ALTER TABLE ONLY public.divisions_on_sites DROP CONSTRAINT divisions_on_sites_dos_division_code_fkey;
       public          postgres    false    4710    229    221            �           2606    16568 8   divisions_on_sites divisions_on_sites_dos_site_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.divisions_on_sites
    ADD CONSTRAINT divisions_on_sites_dos_site_name_fkey FOREIGN KEY (dos_site_name) REFERENCES public.sites(s_name);
 b   ALTER TABLE ONLY public.divisions_on_sites DROP CONSTRAINT divisions_on_sites_dos_site_name_fkey;
       public          postgres    false    229    217    4702            |           2606    16483 D   educational_programmes educational_programmes_ep_direction_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.educational_programmes
    ADD CONSTRAINT educational_programmes_ep_direction_code_fkey FOREIGN KEY (ep_direction_code) REFERENCES public.directions(d_code);
 n   ALTER TABLE ONLY public.educational_programmes DROP CONSTRAINT educational_programmes_ep_direction_code_fkey;
       public          postgres    false    4708    223    220            }           2606    16478 C   educational_programmes educational_programmes_ep_division_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.educational_programmes
    ADD CONSTRAINT educational_programmes_ep_division_code_fkey FOREIGN KEY (ep_division_code) REFERENCES public.divisions(d_code);
 m   ALTER TABLE ONLY public.educational_programmes DROP CONSTRAINT educational_programmes_ep_division_code_fkey;
       public          postgres    false    223    221    4710            �           2606    16513 @   scholarship_receipts scholarship_receipts_sr_scholarship_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.scholarship_receipts
    ADD CONSTRAINT scholarship_receipts_sr_scholarship_id_fkey FOREIGN KEY (sr_scholarship_id) REFERENCES public.scholarships(s_id);
 j   ALTER TABLE ONLY public.scholarship_receipts DROP CONSTRAINT scholarship_receipts_sr_scholarship_id_fkey;
       public          postgres    false    4698    226    215            �           2606    16518 E   scholarship_receipts scholarship_receipts_sr_student_record_book_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.scholarship_receipts
    ADD CONSTRAINT scholarship_receipts_sr_student_record_book_fkey FOREIGN KEY (sr_student_record_book) REFERENCES public.students(s_record_book);
 o   ALTER TABLE ONLY public.scholarship_receipts DROP CONSTRAINT scholarship_receipts_sr_student_record_book_fkey;
       public          postgres    false    216    226    4700            �           2606    16613 7   session_schedule session_schedule_ss_auditorium_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT session_schedule_ss_auditorium_id_fkey FOREIGN KEY (ss_auditorium_id) REFERENCES public.auditoriums(a_id);
 a   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT session_schedule_ss_auditorium_id_fkey;
       public          postgres    false    222    231    4712            �           2606    16608 G   session_schedule session_schedule_ss_discipline_in_curriculum_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT session_schedule_ss_discipline_in_curriculum_code_fkey FOREIGN KEY (ss_discipline_in_curriculum_code) REFERENCES public.disciplines_in_curricula(dic_code);
 q   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT session_schedule_ss_discipline_in_curriculum_code_fkey;
       public          postgres    false    4724    231    228            �           2606    16603 :   session_schedule session_schedule_ss_study_group_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT session_schedule_ss_study_group_code_fkey FOREIGN KEY (ss_study_group_code) REFERENCES public.study_groups(sg_code);
 d   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT session_schedule_ss_study_group_code_fkey;
       public          postgres    false    4718    231    225            �           2606    16618 4   session_schedule session_schedule_ss_teacher_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT session_schedule_ss_teacher_id_fkey FOREIGN KEY (ss_teacher_id) REFERENCES public.teachers(t_id);
 ^   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT session_schedule_ss_teacher_id_fkey;
       public          postgres    false    4704    231    218            �           2606    16538 O   students_in_study_groups students_in_study_groups_sisg_student_record_book_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.students_in_study_groups
    ADD CONSTRAINT students_in_study_groups_sisg_student_record_book_fkey FOREIGN KEY (sisg_student_record_book) REFERENCES public.students(s_record_book);
 y   ALTER TABLE ONLY public.students_in_study_groups DROP CONSTRAINT students_in_study_groups_sisg_student_record_book_fkey;
       public          postgres    false    227    4700    216            �           2606    16543 L   students_in_study_groups students_in_study_groups_sisg_study_group_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.students_in_study_groups
    ADD CONSTRAINT students_in_study_groups_sisg_study_group_code_fkey FOREIGN KEY (sisg_study_group_code) REFERENCES public.study_groups(sg_code);
 v   ALTER TABLE ONLY public.students_in_study_groups DROP CONSTRAINT students_in_study_groups_sisg_study_group_code_fkey;
       public          postgres    false    225    227    4718                       2606    16503 1   study_groups study_groups_sg_curriculum_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_groups
    ADD CONSTRAINT study_groups_sg_curriculum_code_fkey FOREIGN KEY (sg_curriculum_code) REFERENCES public.curricula(c_code);
 [   ALTER TABLE ONLY public.study_groups DROP CONSTRAINT study_groups_sg_curriculum_code_fkey;
       public          postgres    false    225    4716    224            -      x������ � �      %      x������ � �      '      x������ � �      #      x������ � �      "      x������ � �      +      x������ � �      $      x������ � �      ,      x������ � �      &      x������ � �      )      x������ � �            x������ � �      .      x������ � �             x������ � �            x������ � �      *      x������ � �      (      x������ � �      !      x������ � �     