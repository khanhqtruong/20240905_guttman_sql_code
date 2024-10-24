/*         this is note comments -not running
   Name: Khanh Truong                           Date Created: 10.10.2024
   Purpose: This script creates a temporary database and 
   performs inserts, updates and deletes

*/
--  Opening print statement

SELECT '####################' AS  'Installation Starting!!!!';
SELECT USER() AS 'INSTALL USER';


SELECT '' AS 'INSTALLATION SCRIPT STARTING!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS testdb_20241010;

/*  Create the database after checking making sure it is not already there
*/

-- The following line is pure standard SQL
CREATE DATABASE IF NOT EXISTS testdb_20241010
-- The following line is unique to MySQL it is optional
-- If left out the MySQL database will take the default settings
-- of the database
-- EXPLAIN CHARACTER SET:
-- EXPLAIN COLLATE:

CHARACTER SET utf8mb4 COLLATE  utf8mb4_0900_ai_ci;
-- Let's see if the database is created

SHOW DATABASES;
SELECT '' AS 'DATABASE CREATION COMPLETED';

--  Let's enter the database
USE testdb_20241010;

--  Let's create some tables
DROP TABLE IF EXISTS student;
CREATE TABLE IF NOT EXISTS student(
    student_id   INT AUTO_INCREMENT,
    first_name   VARCHAR(50) NOT NULL,
    last_name    VARCHAR(50) NOT NULL,
    phone        VARCHAR(50) NOT NULL,

    PRIMARY KEY(student_id)
);


SHOW TABLES;
SELECT ''  AS 'TABLE CREATION COMPLETED';

-- Let's create some tables
DROP TABLE IF EXISTS company;
CREATE TABLE IF NOT EXISTS company (
    company_id INT AUTO_INCREMENT,
    name       VARCHAR(50) NOT NULL,
    address    VARCHAR(100),
    email      VARCHAR(50),
    phone      VARCHAR(20),

    PRIMARY KEY (company_id)
);

SHOW TABLES;

SELECT '' AS 'TABLE CREATION COMPLETED';

-- Let's create some tables...
DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer(
    customer_id      INT  AUTO_INCREMENT,
    first_name       VARCHAR(20) NOT NULL,
    last_name        VARCHAR(20) NOT NULL,
    age              INT,
    country          VARCHAR(50),


    PRIMARY KEY (customer_id)

);

SHOW TABLES;
SELECT '' AS 'INSTALLATION SCRIPT COMPLETED';

INSERT INTO company(name, address, email, phone)
VALUES 
    ('Balboa Software', '475 E. Baker street','customers@balboa.com', '834-4349'),
    ('Dynix Publishing', '7 North Plymouth','customer_service@dynix.com', '(733)508-1603'),
    ('EOS International', '56 Vine Road','customers@eos.com', '(438)496-9721'),
    ('Taylor & Francis', '73 E. High Point Road','customer_service@taylorfrancis.com', '222831-5041'),
    ('Faulkner Information Services', '132 W. 31 st','customer_service@falkner.com', '352-5467'),
    ('Montgomery Fleet Equipmnet', '7 South Wild Horse Dr.','service@fleetequip.com', '919-960-5818');
    
-- this is to add records into the student table
SELECT '' AS 'STUDENT INSTALLATION INTO TABLE';

INSERT INTO student(first_name, last_name, phone)
VALUES
    ('Adam', 'White', '834-4349'),
    ('Darren', 'Addams', '(733)508-1603'),
    ('Debie', 'Allen', '(438)496-9721'),
    ('Monica', 'Kline', '222831-5041'),
    ('Raymond', 'Diaz', '352-5467'),
    ('Jacoby', 'Bradhaw', '919-960-5818'),
    ('Ahtony', 'Perl', '814-279-5654'),
    ('Thomas', 'Owen', '(222) 831-4349'),
    ('Gayle', 'King', '732-963-7253'),
    ('devon', 'davis', '(814)717-5818');

UPDATE student SET    first_name = 'Adam', last_name = 'White'  WHERE student_id =1;
UPDATE student SET    first_name = 'Darren', last_name = 'Adams'  WHERE student_id =2;
UPDATE student SET    first_name = 'Debbie', last_name = 'Allen'  WHERE student_id =3;
UPDATE student SET    first_name = 'Monica', last_name = 'Kline'  WHERE student_id =4;
UPDATE student SET    first_name = 'Raymond', last_name = 'Diaz'  WHERE student_id =5;
UPDATE student SET    first_name = 'Jacob', last_name = 'Bradshaw'  WHERE student_id =6;
UPDATE student SET    first_name = 'Anthony', last_name = 'Perl'  WHERE student_id =7;
UPDATE student SET    first_name = 'Thomas', last_name = 'Owen'  WHERE student_id =8;
UPDATE student SET    first_name = 'Gayle', last_name = 'King'  WHERE student_id =9;
UPDATE student SET    first_name = 'Devon', last_name = 'Davis'  WHERE student_id =10;






