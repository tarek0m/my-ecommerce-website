-- Create the database
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Create categories table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Create products table
CREATE TABLE products (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category_id INT,
    inStock BOOLEAN NOT NULL DEFAULT TRUE,
    brand VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    currency JSON,
    gallery JSON,
    attributes JSON,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Create orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    items JSON NOT NULL
);
