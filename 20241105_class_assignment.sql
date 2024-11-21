/*  Name:                                     Date Created: 10/31/2024
                                              Date Modified:
    Purpose: This script creates a database, customers and orders table, and
    performs a number of select statements.
*/
--  SYSTEM CLS;
--  Opening print statement

SELECT 'INFO' AS 'Installation Starting!!!';
SELECT USER() AS 'INSTALLATION USER';
--  Remove the database if it is already there
DROP DATABASE IF EXISTS my_testdb;

/* Create the database after checking making sure it is
    not already there
*/

--  The following line is pure standard SQL
CREATE DATABASE IF NOT EXISTS my_testdb
--  The following line is unique to MySQL it is optional
--  If left out the MySQL database will take the default settings.
--  of the database.
--  EXPLAIN CHARACTER SET
--  EXPLAIN COLLATE:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

--  Let's see if the database is created.

SHOW DATABASES;
SELECT 'LINE 33' AS 'DATABASE CREATION COMPLETED';
-- Let's enter the database
USE my_testdb;

--  Let's create some tables

DROP TABLE IF EXISTS vendor;
CREATE TABLE IF NOT EXISTS vendor (
    vendorid VARCHAR(2) NOT NULL,
    vendorname VARCHAR(25) NOT NULL,
    PRIMARY KEY (vendorid)
);

SELECT 'LINE 46' AS 'Table Created: vendor';

DROP TABLE IF EXISTS category;
CREATE TABLE IF NOT EXISTS category (
    categoryid VARCHAR(2) NOT NULL,
    categoryname VARCHAR(25)  NOT NULL,
    PRIMARY KEY    (categoryid)
);

SELECT 'LINE 55' AS 'Table Created: category';

DROP TABLE IF EXISTS product;
CREATE TABLE IF NOT EXISTS product (
    productid         VARCHAR(3)  NOT NULL,
    productname         VARCHAR(25)   NOT NULL,
    productprice        DECIMAL (7,2) NOT NULL,
    vendorid            VARCHAR(2)  NOT NULL,
    categoryid          VARCHAR(2)  NOT NULL,
    PRIMARY KEY (productid)

);

SELECT 'LINE 68' AS 'Table Created: product';

DROP TABLE IF EXISTS region;
CREATE TABLE IF NOT EXISTS region (
    regionid        VARCHAR(2) NOT NULL,
    regionname      VARCHAR(25) NOT NULL,
    PRIMARY KEY (regionid)
);

SELECT 'LINE 77' AS 'Table Created: region';

DROP TABLE IF EXISTS store;
CREATE TABLE IF NOT EXISTS store (
    storeid VARCHAR(3)  NOT NULL,
    storezip    VARCHAR(5)  NOT NULL,
    regionid    VARCHAR(2)  NOT NULL,
    PRIMARY KEY (storeid)

 );

SELECT 'LINE 88' AS 'Table Created: store';

DROP TABLE IF EXISTS customer;
CREATE TABL IF NOT EXISTS customer (
    customerid  CHAR(7) NOT NULL,
    customername VARCHAR(15) NOT NULL,
    customerzip     CHAR(5) NOT NULL,
    PRIMARY KEY (customerid)
);

SELECT 'LINE 98' AS 'Table Created: customer';

DROP TABLE IF EXISTS salestransaction;
CREATE TABLE IF NOT EXISTS saletransaction (
    tid   VARCHAR(8) NOT NULL,
    customerid CHAR(7)  NOT NULL,
    storeid     VARCHAR(3)  NOT NULL,
    tdate DATE NOT NULL,
    PRIMARY KEY (tid)

);

SELECT 'LINE 110' AS 'Table Created: salestransaction';

DROP TABLE IF EXISTS soldvia;
CREATE TABLE IF NOT EXISTS soldvia (
    productid   CHAR(3) NOT NULL,
    tid VARCHAR(8) NOT NULL,
    noofitems   INT NOT NULL,
    PRIMARY KEY (productid, tid)

);

SELECT 'LINE 121'  AS 'Table Created: soldvia';
--  Add FOREIGN KEYS
ALTER TABLE soldvia
    ADD FOREIGN KEY (productid)  REFERENCES product (productid),
    ADD FOREIGN KEY (tid)  REFERENCES salestransaction(tid);

SELECT 'LINE 127' AS 'Foreign Key Created: soldvia';

ALTER TABLE salestransaction
    ADD FOREIGN KEY (customerid) REFERENCES customer(customerid),
    ADD FOREIGN KEY (storeid) REFERENCES store(storeid);

SELECT 'LINE 133' AS 'Foreign Key Created: salestransaction';
ALTER TABLE store
    ADD FOREIGN KEY (regionid) REFERENCES region(regionid);

    SELECT 'LINE 137' AS 'Foreign Key Created: store';

    ALTER TABLE product
        ADD FOREIGN KEY (vendorid) REFERENCES vendor(vendorid),
        ADD FOREIGN KEY (categoryid) REFERENCES category(categoryid);

SELECT 'LINE 143' AS 'Foreign Key Created: product';
-- Insert same values into the tables
INSERT INTO vendor VALUES ('PG', 'Pacifica Gear');
INSERT INTO vendor VALUES ('MK', 'Mountain King');

SELECT 'LINE 145' AS 'INSERTED: vendor';
INSERT INTO category VALUES ('CP', 'Camping');
INSERT INTO  category VALUES ('FW', 'Footwear');

SELECT 'LINE 149' AS 'INSERTED: category';

INSERT INTO product VALUES ('1X1', 'Zzz Bag', 100, 'PG', 'CP');
INSERT INTO product VALUES ('2X2', 'Easy Boot', 70, 'MK', 'FW');
INSERT INTO product VALUES ('3X3'. 'Cosy Sock',15,'MK','FW');
INSERT INTO product VALUES ('4X4', 'Dura Boot', 90, 'PG', 'FW');
INSERT INTO product VALUES ('5X5', 'Tiny Tent', 150, 'MK','CP');
INSERT INTO product VALUES ('6X6', 'Biggy Tent', 250, 'MK', 'CP');

SELECT 'LINE 158' AS 'INSERTED: product';

INSERT INTO region VALUES ('C', 'Chicagoland');
INSERT INTO region VALUES ('T', 'Tristate');

SELECT 'LINE 163' AS 'INSERTED: region';

INSERT INTO store VALUES ('S1', '60600', 'C');
INSERT INTO store VALUES ('S2', '60605', 'C');
INSERT INTO store VALUES ('S3','35400', 'T');

SELECT 'LINE 169' AS 'INSERTED: store';

INSERT INTO customer VALUES('1-2-333','Tina', '60137');
INSERT INTO customer VALUES('2-3-444', 'TONY', '60611')
INSERT INTO customer VALUES('3-4-555', 'PAM', '35401')

SELECT 'LINE 175' AS 'INSERTED: customer';

INSERT INTO salestransaction VALUES ('T111', '1-2-333', 'S1', '2013-01-01');
INSERT INTO salestransaction VALUES ('T222', '2-3-444', 'S2', '2013-01-01');
INSERT INTO salestransaction VALUES ('T333', '1-2-333', 'S3', '2013-01-02');
INSERT INTO salestransaction VALUES ('T444', '3-4-555', 'S3', '2013-01-02');
INSERT INTO salestransaction VALUES ('T555', '2-3-444', 'S3', '2013-01-02');



INSERT INTO soldvia VALUES ('1X1', 'T111', 1);
INSERT INTO soldvia VALUES ('2X2', 'T222', 1);
INSERT INTO soldvia VALUES ('3X3', 'T333', 5);
INSERT INTO soldvia VALUES ('1X1', 'T333', 1);
INSERT INTO soldvia VALUES ('4X4', 'T444', 1);
INSERT INTO soldvia VALUES ('2X2', 'T444', 2);
INSERT INTO soldvia VALUES ('4X4', 'T555', 4);
INSERT INTO soldvia VALUES ('5X5', 'T555', 2);
INSERT INTO soldvia VALUES ('6X6', 'T555', 1);

SELECT 'LINE 195' AS 'INSERTED: soldvia';
SHOW TABLES;
-- Closing print statement
SELECT 'INFO' AS 'Installation Completed, check for errors!!!!';




        


