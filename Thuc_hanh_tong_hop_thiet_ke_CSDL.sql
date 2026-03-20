-- 1. Tạo Database
CREATE DATABASE "CompanyDB";

-- 2. Tạo bảng
CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    department_id INT REFERENCES Departments(department_id) 
);

CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(150) NOT NULL,
    start_date DATE,
    end_date DATE
);

CREATE TABLE EmployeeProjects (
    emp_id INT REFERENCES Employees(emp_id),
    project_id INT REFERENCES Projects(project_id)
);
