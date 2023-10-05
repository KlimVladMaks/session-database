-- Создание базы данных
CREATE DATABASE session_database;

-- Таблица с преподавателями
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    patronymic TEXT,
    position TEXT NOT NULL
);

-- Таблица со студентами
CREATE TABLE students (
    record_book INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    patronymic TEXT,
    course INTEGER
);

-- Таблица с аудиториями
CREATE TABLE auditoriums (
    id INTEGER PRIMARY KEY,
    site_name TEXT NOT NULL,
    type TEXT NOT NULL,
    number INTEGER NOT NULL
);

-- Таблица с учебными группами
CREATE TABLE study_group (
    code INTEGER PRIMARY KEY,
    number TEXT NOT NULL,
    from DATE NOT NULL,
    to DATA
);
