/*   Project 01 
    Name: Khanh Truong                          Date: 10/27/2024
                                                Date Modifed: 
    Purpose: 
*/
--  Opening statement
SELECT ''  AS 'Installation Starting!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS my_project_db;

/* Create the database after checking making sure it is
not already there
*/

-- The following line is pure standard SQL
CREATE DATABASE IF NOT EXISTS my_project_db
-- The following line is unique to MYSQL it is optional
-- If left out the MySQL database will take the default setting
-- of the database.
-- EXPLAIN CHARACTER SET:
-- EXPLAIN COLLATE:
-- This is the whole statement ; means end of the SQL statement
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is created.
SHOW DATABASES;
SELECT ''  AS '###############################################';

-- Let's enter the database
USE my_project_db;

-- Let's create some tables

-- Closing print statement


-- This is TABLE # 1

DROP TABLE IF EXISTS category;

CREATE TABLE IF NOT EXISTS category (
    category_id CHAR(2),
    category_name VARCHAR(25),

    PRIMARY KEY (category_id)
);

-- This is TABLE #2

DROP TABLE IF EXISTS vendor;

CREATE TABLE IF NOT EXISTS vendor(
    vendor_id       CHAR(2),
    vendor_name     VARCHAR(25),

    PRIMARY KEY (vendor_id)
);


--  This is TABLE # 3
DROP TABLE IF EXISTS product;

CREATE TABLE IF NOT EXISTS product(
    product_id      CHAR(3),
    product_name    VARCHAR(25),    
    product_price   DECIMAL(7,2),
    vendor_id       CHAR(2),
    category_id     CHAR(2),

    PRIMARY KEY (product_id),
    FOREIGN KEY (vendor_id)  REFERENCES vendor (vendor_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id)


);

--  This is TABLE # 4
DROP TABLE IF EXISTS region;

CREATE TABLE IF NOT EXISTS region(
    region_id CHAR(1),
    region_name VARCHAR(25),

    PRIMARY KEY (region_id)

);

--  This is TABLE # 5
DROP TABLE IF EXISTS store;

CREATE TABLE IF NOT EXISTS store(
    store_id    VARCHAR(3),
    store_zip   CHAR(5),
    region_id   CHAR(1),

    PRIMARY KEY (store_id),
    FOREIGN KEY (region_id) REFERENCES region (region_id)
);

-- This is TABLE #6 (customer)

DROP TABLE IF EXISTS customer;

CREATE TABLE IF NOT EXISTS customer(
    customer_id         CHAR(7),
    customer_name       VARCHAR(15),
    customer_zip        CHAR(5),

    PRIMARY KEY (customer_id)  

);

-- This is TABLE #7 (sold_via)

DROP TABLE IF EXISTS sales_transaction;

CREATE TABLE IF NOT EXISTS sales_transaction(
    t_id            VARCHAR(8),
    customer_id     CHAR(7),
    store_id        VARCHAR(3),
    t_date          DATE,

    PRIMARY KEY (t_id),
    FOREIGN KEY (customer_id)  REFERENCES customer (customer_id),
    FOREIGN KEY (store_id)     REFERENCES store (store_id)

);

-- This is TABLE #8 (sale_transaction)

DROP TABLE IF EXISTS sold_via;

CREATE TABLE IF NOT EXISTS sold_via(
    product_id      CHAR(3),
    t_id            VARCHAR(8),
    noof_items      INT,

    FOREIGN KEY (product_id) REFERENCES  product (product_id),
    FOREIGN KEY (t_id)   REFERENCES  sales_transaction (t_id)
);



                                    