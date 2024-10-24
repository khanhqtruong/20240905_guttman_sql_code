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
  supplierId    INT  AUTO_INCREMENT,
  companyName       VARCHAR(255),
  contactName        VARCHAR(30),
  city               VARCHAR(15),
  country            VARCHAR(15),
  phone              VARCHAR(24),
  fax                VARCHAR(24),

  PRIMARY KEY   (supplierId)
);

DROP TABLE IF EXISTS products;

CREATE TABLE IF NOT EXISTS  products(
  productId        INT    AUTO_INCREMENT,
  productName       VARCHAR(40),
  supplierId         INT,
  unitPrice       DECIMAL(10,4),
  package            VARCHAR(50),
  isDiscontinued       ENUM('Y','N')  DEFAULT'N',

  PRIMARY KEY (productId)
);




DROP TABLE IF EXISTS customers;

CREATE TABLE IF NOT EXISTS customers(
  customerId    INT  AUTO_INCREMENT,
  firstName       VARCHAR(20),
  lastName        VARCHAR(30),
  city               VARCHAR(15),
  country            VARCHAR(15),
  phone              VARCHAR(24),
  fax                VARCHAR(24),

  PRIMARY KEY   (customerId)
);


DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS orders(
  orderId    INT  AUTO_INCREMENT,
  orderDate       DATE,
  customerId        INT,
  totalAmount       DECIMAL(10,4),

  PRIMARY KEY   (orderId)
);

DROP TABLE IF EXISTS orderItems;

CREATE TABLE IF NOT EXISTS orderItems(
  orderItemId    INT  AUTO_INCREMENT,
  orderId          INT,
  productId        INT,
  unitPrice        DECIMAL(10,4),
  quantity       INT,

  PRIMARY KEY   (orderItemId)
);





SELECT '' AS  'Installation Completed, check for errors!!!';
