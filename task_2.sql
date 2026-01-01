
CREATE DATABASE IF NOT EXISTS alx_book_store;


USE alx_book_store;


CREATE TABLE IF NOT EXISTS Authors (
    author_id INT NOT NULL AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL,
    bio TEXT,
    PRIMARY KEY (author_id)
);


CREATE TABLE IF NOT EXISTS Books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    publication_date DATE,
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) DEFAULT 0.00,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Order_Details (
    order_detail_id INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_detail_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
