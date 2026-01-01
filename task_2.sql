-- task_2.sql
-- Script to create all tables for alx_book_store

-- 1. Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- 2. Use the database
USE alx_book_store;

-- 3. Create authors table
CREATE TABLE IF NOT EXISTS authors (
    author_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    bio TEXT,
    PRIMARY KEY (author_id)
);

-- 4. Create books table
CREATE TABLE IF NOT EXISTS books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    publication_date DATE,
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 5. Create customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    PRIMARY KEY (customer_id)
);

-- 6. Create orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) DEFAULT 0.00,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 7. Create order_details table
CREATE TABLE IF NOT EXISTS order_details (
    order_detail_id INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_detail_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
