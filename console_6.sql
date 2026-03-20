-- 1. Tạo Database (Thực hiện lệnh này trước)
CREATE DATABASE "LibraryDB";

-- Sau đó kết nối vào LibraryDB rồi mới chạy tiếp:

-- 2. Tạo Schema
CREATE SCHEMA library;

-- 3. Tạo bảng Books trong schema library
CREATE TABLE library.books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    published_year INT,
    available BOOLEAN DEFAULT TRUE
);

CREATE TABLE library.members(
    member_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    join_date DATE DEFAULT CURRENT_DATE
);

-- 4. Tạo Schema
CREATE SCHEMA sales;

-- 5. Tạo bảng trong schema sales
CREATE TABLE sales.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    stock_quantity INT
);

CREATE TABLE sales.orders(
    order_id SERIAL PRIMARY KEY,
    order_date DATE DEFAULT CURRENT_DATE,
    member_id INT REFERENCES library.members(member_id)
);

CREATE TABLE sales.orderdetails(
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES sales.orders(order_id),
    product_id INT REFERENCES sales.products(product_id),
    quantity INT
);
