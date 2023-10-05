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
