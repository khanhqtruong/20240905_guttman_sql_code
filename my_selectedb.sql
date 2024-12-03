/*    Project 3
      Name: Khanh Truong                          Date: 11/26/2024
                                                Date Modified:
        Purpose: 
*/

SELECT ''  AS 'Installation Starting!!!';
--  Remove the database if it is alreay there
DROP DATABASE IF EXISTS my_selectedb;

/* Create the database after checking make sure it is
not already there
*/

-- The following line is pure standared SQL
CREATE DATABASE IF NOT EXISTS my_selectedb
-- The following line is unique to MYSQL it is optional
-- If left out the MySQL database will take the default setting
-- of the database
-- EXPLAIN CHARACTER SET
-- EXPLAIN COLLATE:
-- This is the whole statement; means end of the SQL Statement
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is created.
SHOW DATABASES;
SELECT ''  AS '###############################################';

-- Let's enter the database
USE my_selectedb;

-- Let's create some tables

-- Closing print statement.

-- This is TABLE # 1- VENDOR
DROP TABLE IF EXISTS vendor;

CREATE TABLE IF NOT EXISTS vendor (
      vendor_id CHAR(2),
      vendor_name VARCHAR(25),

      PRIMARY KEY (vendor_id)
);

-- This is TABLE # 2- CATEGORY
DROP TABLE IF EXISTS category;

CREATE TABLE IF NOT EXISTS category (
      category_id CHAR(2),
      category_name VARCHAR(25),

      PRIMARY KEY (category_id)
);

-- This is TABLE # 3- REGION
DROP TABLE IF EXISTS region;

CREATE TABLE IF NOT EXISTS region(
    region_id CHAR(1),
    region_name VARCHAR(25),

    PRIMARY KEY (region_id)
);

-- This is TABLE # 4- STORE
DROP TABLE IF EXISTS store;

CREATE TABLE IF NOT EXISTS store(
    store_id    VARCHAR(3),
    store_zip   CHAR(5),
    region_id   CHAR(1),

    PRIMARY KEY (store_id),
    FOREIGN KEY (region_id) REFERENCES region (region_id)
);

-- This is TABLE # 5- PRODUCT
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

-- This is TABLE # 6- CUSTOMER
DROP TABLE IF EXISTS customer;

CREATE TABLE IF NOT EXISTS customer(
    customer_id         CHAR(7),
    customer_name       VARCHAR(15),
    customer_zip        CHAR(5),

    PRIMARY KEY (customer_id)  

);

-- This is TABLE # 7- SALESTRANSACTION
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

-- This is TABLE # 8- SOLDVIA
DROP TABLE IF EXISTS soldvia;
 
CREATE TABLE IF NOT EXISTS soldvia(
    product_id      CHAR(3),
    t_id            VARCHAR(8),
    noof_items      INT,

    
    PRIMARY KEY (product_id, t_id)
);


-- Insert values into category
INSERT INTO category VALUES ('CP', 'Camping');
INSERT INTO  category VALUES ('FW', 'Footwear');

-- Insert values into region

INSERT INTO region VALUES ('C', 'Chicagoland');
INSERT INTO region VALUES ('T', 'Tristate');

-- Insert values into vendor
INSERT INTO vendor VALUES ('PG', 'Pacifica Gear');
INSERT INTO vendor VALUES ('MK', 'Mountain King');

-- insert values into customer
INSERT INTO customer VALUES('1-2-333','Tina', '60137');
INSERT INTO customer VALUES('2-3-444', 'TONY', '60611');
INSERT INTO customer VALUES('3-4-555', 'PAM', '35401');

-- insert values into store
INSERT INTO store VALUES ('S1', '60600', 'C');
INSERT INTO store VALUES ('S2', '60605', 'C');
INSERT INTO store VALUES ('S3','35400', 'T');

-- insert values into product
INSERT INTO product VALUES ('1X1', 'Zzz Bag', 100, 'PG', 'CP');
INSERT INTO product VALUES ('2X2', 'Easy Boot', 70, 'MK', 'FW');
INSERT INTO product VALUES ('3X3', 'Cosy Sock',15,'MK','FW');
INSERT INTO product VALUES ('4X4', 'Dura Boot', 90, 'PG', 'FW');
INSERT INTO product VALUES ('5X5', 'Tiny Tent', 150, 'MK','CP');
INSERT INTO product VALUES ('6X6', 'Biggy Tent', 250, 'MK', 'CP');


-- Insert values into soldvia
INSERT INTO soldvia VALUES ('1X1', 'T111', 1);
INSERT INTO soldvia VALUES ('2X2', 'T222', 1);
INSERT INTO soldvia VALUES ('3X3', 'T333', 5);
INSERT INTO soldvia VALUES ('1X1', 'T333', 1);
INSERT INTO soldvia VALUES ('4X4', 'T444', 1);
INSERT INTO soldvia VALUES ('2X2', 'T444', 2);
INSERT INTO soldvia VALUES ('4X4', 'T555', 4);
INSERT INTO soldvia VALUES ('5X5', 'T555', 2);
INSERT INTO soldvia VALUES ('6X6', 'T555', 1);




SHOW DATABASES;


select product_id, product_name, product_price, category_id from product;

select product_name, product_id, vendor_id, category_id, product_price from product;

-- select product_name, product_id, vendor_id, category_id, product_price 
-- from product
-- WHERE 
--         ;

SELECT product_id, product_name, vendor_id, product_price
FROM product
WHERE product_price > 149;


SELECT product_id, product_name, vendor_id, product_price
FROM product
WHERE product_price < 100;

SELECT vendor_id
FROM product
ORDER BY vendor_id ASC;

-- select # 6

SELECT DISTINCT vendor_id
FROM product
ORDER BY vendor_id ASC;


-- select # 7
SELECT product_id, product_name, category_id, product_price
FROM product
WHERE product_price < 100
ORDER BY product_price ASC;

-- SELECT # 8
SELECT product_id, product_name, category_id, product_price
FROM product
WHERE product_price < 100
ORDER BY product_price DESC;

-- SELECT # 9
SELECT product_id, product_name, category_id, product_price
FROM product
ORDER BY category_id ASC, product_price ASC;

-- SELECT # 10
SELECT product_id, product_name,  product_price, vendor_id, category_id
FROM product
WHERE product_price  BETWEEN 70 AND 90;