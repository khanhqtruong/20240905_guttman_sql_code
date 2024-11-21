/*  SQL installation script
    Name:                                              Date Created: 11/17/2024
                                                        Data Modified: 
    Purpose:  This script creates user, create roles and configure their
                permissions
*/

SELECT ''  AS 'Installation Starting!!!';

-- Remove the user if they are already there!!

SELECT USER() AS 'Droppoing users';
DROP USER IF EXISTS 'my_user01'@'localhost';

-- Add the user
CREATE USER IF NOT EXISTS 'my_user01'@'localhost'
        IDENTIFIED BY 'password123';
--  Drop Role if exists
DROP ROLE IF EXISTS 'execute_on_my_testdb';

-- Add ROLE
CREATE ROLE IF NOT EXISTS 'execute_on_my_testdb';


SELECT USER() AS 'Dropping user1';
-- GRANT permissions
GRANT EXECUTE 
    ON my_testdb.*
    TO 'execute_on_my_testdb';

--  Add user to role
GRANT 'execute_on_my_testdb'
    TO 'my_user01'@'localhost';

SET DEFAULT ROLE ALL
    TO 'my_user01'@'localhost';
-- Make sure all privileges are added to the database.
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'my_user01'@'localhost';
-- Confirm proper database and user for installation.
SELECT
    'Installation' AS 'Completed',
    USER() AS 'BY',
    DATABASE() AS 'ON',
    NOW() AS 'AT';
    