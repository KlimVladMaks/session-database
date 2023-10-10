-- Создание базы данных
CREATE DATABASE session_database;

-- ТАБЛИЦЫ БЕЗ ВНЕШНИХ КЛЮЧЕЙ ------------------------

-- ADDED
-- Таблица со стипендиями
CREATE TABLE scholarships (
    s_id INTEGER PRIMARY KEY,
    s_type VARCHAR(100) NOT NULL,
    s_name VARCHAR(100) NOT NULL
);

-- ADDED
-- Таблица со студентами
CREATE TABLE students (
    s_record_book INTEGER PRIMARY KEY,
    s_first_name VARCHAR(50) NOT NULL,
    s_last_name VARCHAR(50) NOT NULL,
    s_patronymic VARCHAR(50),
    s_course INTEGER
);

-- ADDED
-- Таблица с площадками института
CREATE TABLE sites (
    s_name VARCHAR(100) PRIMARY KEY,
    s_address VARCHAR(100) NOT NULL
);

-- ADDED
-- Таблица с преподавателями
CREATE TABLE teachers (
    t_id INTEGER PRIMARY KEY,
    t_first_name VARCHAR(50) NOT NULL,
    t_last_name VARCHAR(50) NOT NULL,
    t_patronymic VARCHAR(50),
    t_position VARCHAR(100) NOT NULL
);

-- ADDED
-- Таблица с дисциплинами
CREATE TABLE disciplines (
    d_code INTEGER PRIMARY KEY,
    d_name VARCHAR(50) NOT NULL,
    d_hours INTEGER NOT NULL,
    d_lecture_hours INTEGER NOT NULL,
    d_practical_hours INTEGER NOT NULL,
    d_laboratory_hours INTEGER NOT NULL
);

-- ADDED
-- Таблица с направлениями
CREATE TABLE directions (
    d_code INTEGER PRIMARY KEY,
    d_name VARCHAR(50) NOT NULL,
    d_qualification VARCHAR(100) NOT NULL
);

-- ADDED
-- Таблица с подразделениями
CREATE TABLE divisions (
    d_code INTEGER PRIMARY KEY,
    d_name VARCHAR(50) NOT NULL
);

-- ТАБЛИЦЫ С ВНЕШНИМИ КЛЮЧАМИ ------------------------

-- ADDED
-- Таблица с аудиториями
CREATE TABLE auditoriums (
    a_id INTEGER PRIMARY KEY,
    a_site_name VARCHAR(50) NOT NULL,
    a_type VARCHAR(50) NOT NULL,
    a_number INTEGER NOT NULL,
    FOREIGN KEY (a_site_name) REFERENCES sites (s_name)
);

-- ADDED
-- Таблица с образовательными программами
CREATE TABLE educational_programmes (
    ep_code INTEGER PRIMARY KEY,
    ep_name VARCHAR(100) NOT NULL,
    ep_division_code INTEGER NOT NULL,
    ep_direction_code INTEGER NOT NULL,
    ep_format VARCHAR(50) NOT NULL,
    FOREIGN KEY (ep_division_code) REFERENCES divisions (d_code),
    FOREIGN KEY (ep_direction_code) REFERENCES directions (d_code)
);

-- ADDED
-- Таблица с учебными планами
CREATE TABLE curricula (
    c_code INTEGER PRIMARY KEY,
    c_educational_program_code INTEGER NOT NULL,
    c_admission_year DATE NOT NULL,
    FOREIGN KEY (c_educational_program_code) REFERENCES educational_programmes (ep_code)
);

-- ADDED
-- Таблица с учебными группами
CREATE TABLE study_groups (
    sg_code INTEGER PRIMARY KEY,
    sg_number VARCHAR(50) NOT NULL,
    sg_curriculum_code INTEGER NOT NULL,
    sg_from DATE NOT NULL,
    sg_to DATE,
    FOREIGN KEY (sg_curriculum_code) REFERENCES curricula (c_code)
);

-- ADDED
-- Таблица с данными о получении стипендий
CREATE TABLE scholarship_receipts (
    sr_scholarship_id INTEGER,
    sr_student_record_book INTEGER,
    sr_date DATE,
    sr_sum INTEGER NOT NULL,
    PRIMARY KEY (sr_scholarship_id, sr_student_record_book, sr_date),
    FOREIGN KEY (sr_scholarship_id) REFERENCES scholarships (s_id),
    FOREIGN KEY (sr_student_record_book) REFERENCES students (s_record_book)
);

-- ADDED
-- Таблица со студентами в учебных группах
CREATE TABLE students_in_study_groups (
    sisg_student_record_book INTEGER,
    sisg_study_group_code INTEGER,
    sisg_from DATE NOT NULL,
    sisg_to DATE,
    PRIMARY KEY (sisg_student_record_book, sisg_study_group_code),
    FOREIGN KEY (sisg_student_record_book) REFERENCES students (s_record_book),
    FOREIGN KEY (sisg_study_group_code) REFERENCES study_groups (sg_code)
);

-- ADDED
-- Таблица с дисциплинами в учебных планах
CREATE TABLE disciplines_in_curricula (
    dic_code INTEGER PRIMARY KEY,
    dic_discipline_code INTEGER NOT NULL,
    dic_curriculum_code INTEGER NOT NULL,
    dic_semester INTEGER NOT NULL,
    FOREIGN KEY (dic_discipline_code) REFERENCES disciplines (d_code),
    FOREIGN KEY (dic_curriculum_code) REFERENCES curricula (c_code)
);

-- ADDED
-- Таблица с подразделениями на площадках
CREATE TABLE divisions_on_sites (
    dos_site_name VARCHAR(100),
    dos_division_code INTEGER,
    PRIMARY KEY (dos_site_name, dos_division_code),
    FOREIGN KEY (dos_site_name) REFERENCES sites (s_name),
    FOREIGN KEY (dos_division_code) REFERENCES divisions (d_code)
);

-- ADDED
-- Таблица с аттестациями
CREATE TABLE attestations (
    a_discipline_in_curricula_code INTEGER,
    a_date DATE,
    a_student_record_book INTEGER NOT NULL,
    a_attempt INTEGER NOT NULL,
    a_semester INTEGER NOT NULL,
    a_grade VARCHAR(10) NOT NULL,
    a_teacher_id INTEGER NOT NULL,
    PRIMARY KEY (a_discipline_in_curricula_code, a_date),
    FOREIGN KEY (a_discipline_in_curricula_code) REFERENCES disciplines_in_curricula (dic_code),
    FOREIGN KEY (a_student_record_book) REFERENCES students (s_record_book),
    FOREIGN KEY (a_teacher_id) REFERENCES teachers (t_id)
);

-- ADDED
-- Таблица с расписанием сессии
CREATE TABLE session_schedule (
    ss_study_group_code INTEGER,
    ss_discipline_in_curriculum_code INTEGER,
    ss_date DATE,
    ss_auditorium_id INTEGER,
    ss_teacher_id INTEGER NOT NULL,
    PRIMARY KEY (ss_study_group_code, ss_discipline_in_curriculum_code, ss_date),
    FOREIGN KEY (ss_study_group_code) REFERENCES study_groups (sg_code),
    FOREIGN KEY (ss_discipline_in_curriculum_code) REFERENCES disciplines_in_curricula (dic_code),
    FOREIGN KEY (ss_auditorium_id) REFERENCES auditoriums (a_id),
    FOREIGN KEY (ss_teacher_id) REFERENCES teachers (t_id)
);
