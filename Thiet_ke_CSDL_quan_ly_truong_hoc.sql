-- 1. Tạo Database
CREATE DATABASE "SchoolDB";

-- Kết nối vào SchoolDB trước khi chạy các lệnh sau:

-- 2. Tạo các bảng
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dob DATE
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id),
    grade VARCHAR(2) CHECK (grade IN ('A', 'B', 'C', 'D', 'F'))
);

