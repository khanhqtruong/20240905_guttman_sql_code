/* SQL installation script:
   Name:Khanh Truong              Date Created: 9.17.2024
                                  Data Modified:
   Purpose:
*/
-- Opening print statement
SELECT ''  AS 'Installation Starting!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS testdb_20240917;

/* Create the database after checking making sure it is
   not already there
*/

-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS testdb_20240917
-- The following line is unique to MySQL it is optional
-- If left out the MySQL database will take the default setting
-- of the database.
-- EXPLAIN CHARACTER SET:
-- EXPLAIN COLLATE:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is Created
SHOW DATABASES;
SELECT ''  AS '#########################################';

-- Let's enter the DATABASE
USE testdb_20240917;

-- Let's create some tables

-- Closing print statement
SELECT '' AS  'Installation Completed, check for errors!!!';
