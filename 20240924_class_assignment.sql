/* SQL installation script:
   Name:Khanh Truong              Date Created: 9.17.2024
                                  Data Modified:
   Purpose:
*/
-- Opening print statement
SELECT ''  AS 'Installation Starting!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS  20240924_testdb;

/* Create the database after checking making sure it is
   not already there
*/

-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS 20240924_testdb
-- The following line is unique to MySQL it is optional
-- If left out the MySQL database will take the default setting
-- of the database.
-- EXPLAIN CHARACTER SET:
-- EXPLAIN COLLATE:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is Created
SHOW DATABASES;
SELECT ''  AS '#####################################$$$$$####';

-- Let's enter the DATABASE
USE 20240924_testdb;

-- Let's create some tables

-- Closing print statement


DROP TABLE IF EXISTS suppliers;

CREATE TABLE IF NOT EXISTS suppliers(
  supplier_id    INT  AUTO_INCREMENT,
  company_name       VARCHAR(255),
  contact_name        VARCHAR(30),
  City               VARCHAR(15),
  Country            VARCHAR(15),
  Phone              VARCHAR(24),
  Fax                VARCHAR(24),

  PRIMARY KEY   (supplier_id)
);

DROP TABLE IF EXISTS deliveries;

CREATE TABLE IF NOT EXISTS deliveries(
  delivery_id               INT    AUTO_INCREMENT,
  delivery_date            DATE,
  warehouse_id             INT,

  PRIMARY KEY (delivery_id),
  FOREIGN KEY(warehouse_id) REFERENCES warehouses (warehouse_id)

);




DROP TABLE IF EXISTS products;

CREATE TABLE IF NOT EXISTS  products(
  product_id        INT    AUTO_INCREMENT,
  product_name       VARCHAR(40),
  supplier_id         INT,
  unit_price       DECIMAL(10,3),
  package            VARCHAR(50),
  is_discontinued       ENUM('Y','N'),

  PRIMARY KEY (product_id)
);




DROP TABLE IF EXISTS Customers;

CREATE TABLE IF NOT EXISTS Customers(
  CustomerId    INT  AUTO_INCREMENT,
  FirstName       VARCHAR(255),
  LastName        VARCHAR(30),
  City               VARCHAR(15),
  Country            VARCHAR(15),
  Phone              VARCHAR(24),
  Fax                VARCHAR(24),

  PRIMARY KEY   (CustomerID)
);







DROP TABLE IF EXISTS order_info;

CREATE TABLE order_info (
    order_info_id       INT     AUTO_INCREMENT,
    order_id            INT,
    product_id          INT,
    product_quantity    INT,


    PRIMARY KEY (order_info_id),
    FOREIGN KEY (product_id)  REFERENCES  products(product_id)
);


DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id       INT    AUTO_INCREMENT,
    order_date     DATE,
    order_info_id  INT,
    order_value    INT,
    order_currency VARCHAR(10),

    PRIMARY KEY (order_id),
    FOREIGN KEY (order_info_id)  REFERENCES  order_info(order_info_id)
);




SELECT '' AS  'Installation Completed, check for errors!!!';
