-- DONE
-- Создание базы данных
CREATE DATABASE session_database;

-- ТАБЛИЦЫ БЕЗ ВНЕШНИХ КЛЮЧЕЙ ------------------------

-- DONE
-- Таблица со стипендиями
CREATE TABLE scholarships (
    s_id INTEGER PRIMARY KEY,
    s_type TEXT NOT NULL,
    s_name TEXT NOT NULL UNIQUE,
);

-- Таблица со студентами
CREATE TABLE students (
    s_record_book INTEGER PRIMARY KEY,
    s_first_name TEXT NOT NULL,
    s_last_name TEXT NOT NULL,
    s_patronymic TEXT,
    s_course INTEGER
);

-- Таблица с площадками института
CREATE TABLE sites (
    s_name TEXT PRIMARY KEY,
    s_address TEXT NOT NULL
);

-- Таблица с преподавателями
CREATE TABLE teachers (
    t_id INTEGER PRIMARY KEY,
    t_first_name TEXT NOT NULL,
    t_last_name TEXT NOT NULL,
    t_patronymic TEXT,
    t_position TEXT NOT NULL
);

-- Таблица с дисциплинами
CREATE TABLE disciplines (
    d_code INTEGER PRIMARY KEY,
    d_name TEXT NOT NULL,
    d_hours INTEGER NOT NULL,
    d_lecture_hours INTEGER NOT NULL,
    d_practical_hours INTEGER NOT NULL,
    d_practical_hours INTEGER NOT NULL
);

-- Таблица с направлениями
CREATE TABLE directions (
    d_code INTEGER PRIMARY KEY,
    d_name TEXT NOT NULL,
    d_qualification TEXT NOT NULL
);

-- Таблица с подразделениями
CREATE TABLE divisions (
    d_code INTEGER PRIMARY KEY,
    d_name TEXT NOT NULL
);

-- ТАБЛИЦЫ С ВНЕШНИМИ КЛЮЧАМИ ------------------------

-- Таблица с аудиториями
CREATE TABLE auditoriums (
    a_id INTEGER PRIMARY KEY,
    a_site_name TEXT NOT NULL,
    a_type TEXT NOT NULL,
    a_number INTEGER NOT NULL,
    FOREIGN KEY (a_site_name) REFERENCES sites (s_name)
);

-- Таблица с образовательными программами
CREATE TABLE educational_programmes (
    ep_code INTEGER PRIMARY KEY,
    ep_name TEXT NOT NULL,
    ep_division_code INTEGER NOT NULL,
    ep_direction_code INTEGER NOT NULL,
    ep_format TEXT NOT NULL
    FOREIGN KEY (ep_division_code) REFERENCES divisions (d_code),
    FOREIGN KEY (ep_direction_code) REFERENCES directions (d_code)
);

-- Таблица с учебными планами
CREATE TABLE curricula (
    c_code INTEGER PRIMARY KEY,
    c_educational_program_code INTEGER NOT NULL,
    c_admission_year DATA NOT NULL,
    FOREIGN KEY (c_educational_program_code) REFERENCES educational_programmes (ep_code)
);

-- Таблица с учебными группами
CREATE TABLE study_groups (
    sg_code INTEGER PRIMARY KEY,
    sg_number TEXT NOT NULL,
    sg_curriculum_code INTEGER NOT NULL,
    sg_from DATE NOT NULL,
    sg_to DATA,
    FOREIGN KEY (sg_curriculum_code) REFERENCES curricula (c_code)
);

-- Таблица с данными о получении стипендий
CREATE TABLE scholarship_receipts (
    sr_scholarship_id INTEGER PRIMARY KEY,
    sr_student_record_book INTEGER PRIMARY KEY,
    sr_date DATA PRIMARY KEY,
    sr_sum INTEGER NOT NULL,
    FOREIGN KEY (sr_scholarship_id) REFERENCES scholarships (s_id),
    FOREIGN KEY (sr_student_record_book) REFERENCES students (s_record_book)
);

-- Таблица со студентами в учебных группах
CREATE TABLE students_in_study_groups (
    sisg_student_record_book INTEGER PRIMARY KEY,
    sisg_study_group_code INTEGER PRIMARY KEY,
    sisg_from DATE NOT NULL,
    sisg_to DATA,
    FOREIGN KEY (sisg_student_record_book) REFERENCES students (s_record_book),
    FOREIGN KEY (sisg_study_group_code) REFERENCES study_group (sg_code)
)

-- Таблица с дисциплинами в учебных планах
CREATE TABLE disciplines_in_curricula (
    dic_code INTEGER PRIMARY KEY,
    dic_discipline_code INTEGER NOT NULL,
    dic_curriculum_code INTEGER NOT NULL,
    dic_semester INTEGER NOT NULL,
    FOREIGN KEY (dic_discipline_code) REFERENCES disciplines (d_code),
    FOREIGN KEY (dic_curriculum_code) REFERENCES curricula (c_code)
)

-- Таблица с подразделениями на площадках
CREATE TABLE divisions_on_sites (
    dos_site_name TEXT PRIMARY KEY,
    dos_division_code INTEGER PRIMARY KEY,
    FOREIGN KEY (dos_site_name) REFERENCES sites (s_name),
    FOREIGN KEY (dos_division_code) REFERENCES divisions (d_code)
)

-- Таблица с аттестациями
CREATE TABLE attestations (
    a_discipline_in_curricula_code INTEGER PRIMARY KEY,
    a_date DATA PRIMARY KEY,
    a_student_record_book INTEGER NOT NULL,
    a_attempt INTEGER NOT NULL,
    a_semester INTEGER NOT NULL,
    a_grade TEXT NOT NULL,
    a_teacher_id INTEGER NOT NULL,
    FOREIGN KEY (a_discipline_in_curricula_code) REFERENCES disciplines_in_curricula (dic_code),
    FOREIGN KEY (a_student_record_book) REFERENCES students (s_record_book),
    FOREIGN KEY (a_teacher_id) REFERENCES teachers (t_id)
)

CREATE TABLE session_schedule (
    ss_study_group_code INTEGER PRIMARY KEY,
    ss_discipline_in_curriculum_code INTEGER PRIMARY KEY,
    ss_date DATA PRIMARY KEY,
    ss_auditorium_id INTEGER,
    ss_teacher_id INTEGER NOT NULL,
    FOREIGN KEY (ss_study_group_code) REFERENCES study_groups (sg_code),
    FOREIGN KEY (ss_discipline_in_curriculum_code) REFERENCES disciplines_in_curricula (dic_code),
    FOREIGN KEY (ss_auditorium_id) REFERENCES auditoriums (a_id),
    FOREIGN KEY (ss_teacher_id) REFERENCES teachers (t_id)
)
