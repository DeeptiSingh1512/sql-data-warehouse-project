-- Create Database
CREATE DATABASE IF NOT EXISTS DataWarehouse;
USE DataWarehouse;

-- Bronze Layer Tables
CREATE TABLE IF NOT EXISTS bronze_customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    raw_data JSON
);

CREATE TABLE IF NOT EXISTS bronze_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_data JSON
);

-- Silver Layer Tables
CREATE TABLE IF NOT EXISTS silver_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(150),
    validated BOOLEAN
);

CREATE TABLE IF NOT EXISTS silver_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    amount DECIMAL(10,2),
    validated BOOLEAN
);

-- Gold Layer Tables
CREATE TABLE IF NOT EXISTS gold_customer_summary (
    customer_id INT PRIMARY KEY,
    total_orders INT,
    total_spent DECIMAL(15,2),
    last_order_date DATE
);
