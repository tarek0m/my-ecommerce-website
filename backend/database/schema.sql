-- Create the database
CREATE DATABASE IF NOT EXISTS ecommerce2;
USE ecommerce2;

-- Create categories table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Create attribute_sets table
CREATE TABLE attribute_sets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(20) NOT NULL
);

-- Create attribute_items table
CREATE TABLE attribute_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    attribute_set_id INT NOT NULL,
    display_value VARCHAR(50) NOT NULL,
    value VARCHAR(50) NOT NULL,
    attribute_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (attribute_set_id) REFERENCES attribute_sets(id)
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
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Create product_attributes table (junction table)
CREATE TABLE product_attributes (
    product_id VARCHAR(50),
    attribute_item_id INT,
    PRIMARY KEY (product_id, attribute_item_id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (attribute_item_id) REFERENCES attribute_items(id)
);

-- Create orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    items JSON NOT NULL
);