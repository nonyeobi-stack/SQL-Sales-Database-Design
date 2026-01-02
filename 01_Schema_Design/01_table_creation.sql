/*
PROJECT: Sales Database Schema Design
GOAL: To demonstrate advanced Database Definition Language (DDL) skills including 
      normalization, data integrity constraints, and relational architecture.

SKILLS HIGHLIGHTED:
- Schema Creation (CREATE DATABASE/TABLE)
- Primary & Foreign Key Relationships
- Data Type Optimization (INT, VARCHAR, DECIMAL, etc.)
- Constraints (NOT NULL, UNIQUE, DEFAULT)
*/

-- Start of script --

CREATE DATABASE IF NOT EXISTS Sales;

-- Creating Tables in Sales Database --

USE Sales;

CREATE TABLE customers
(
  customer_id INT,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  email_address VARCHAR(100),
  number_of_complaints int,
PRIMARY KEY (customer_id),
UNIQUE KEY (email_address)
);

CREATE TABLE sales
(
  purchase_number INT PRIMARY KEY AUTO_INCREMENT,
  date_of_purchase DATE NOT NULL,
  customer_id INT,
  item_code VARCHAR(10) NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE
);

CREATE TABLE warehouse
(
  warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
  warehouse_location VARCHAR(20)
);

CREATE TABLE orders
(
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  orer_date DATE,
  order_info INT,
  order_value INT,
  order_currency VARCHAR(10)
);

CREATE TABLE products
(
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(20),
  product_price INT,
  warehouse_id INT
);

-- Adding and Dropping foreign key to an already created sales table --

DROP TABLE sales;

CREATE TABLE sales 
(
  purchase_number INT AUTO_INCREMENT,
  date_of_purchase DATE,
  customer_id INT,
  item_code VARCHAR(10),
PRIMARY KEY (purchase_number)
);

ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
ON DELETE CASCADE;

ALTER TABLE sales
DROP FOREIGN KEY sales_Ibfk_1;

-- Dropping the Unique Key on customers table --

ALTER TABLE customers
DROP INDEX email_address;

-- Adding a default value to a column in customers table and dropping it --

ALTER TABLE customers
CHANGE COLUMN number_of_complaints 
number_of_complaints INT DEFAULT 0;

ALTER TABLE customers
ALTER COLUMN nunber_of_complaints DROP DEFAULT;

-- Adding a Not Null constraints while creating companies table and Dropping it --

CREATE TABLE companies 
(
  company_id INT AUTO_INCREMENT,
  headquarter_phone_number VARCHAR(15),
  company_name VARCHAR(100) NOT NULL,
PRIMARY KEY (company_id)
);

ALTER TABLE companies 
MODIFY company_name VARCHAR(100) NULL;

-- Changing the Null to Not Null constraints using the Alter Statement --

ALTER TABLE companies
CHANGE COLUMN company_name 
company_name VARCHAR(100) NOT NULL;

    


