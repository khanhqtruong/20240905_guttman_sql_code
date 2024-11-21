/*  Name:                                           Date Created: 11/17/2024
                                                    Date Modified:
    Purpose:  This script creates a database and then
    a stored procedure.  The stored procedure is then called
    to confirm that it was created successfully.
*/
-- SYSTEM  CLS;

-- Opening print statement
SELECT 'LINE 09' AS 'Installation Starting!!!',
        USER()  AS 'INSTALLATION USER';
-- Remove the database if it is already there

DROP DATABASE IF EXISTS my_testdb;

/*  Create the database after making sure it is
    not already there
*/

-- The following line is pure standard SQL
CREATE DATABASE IF NOT EXISTS my_testdb
-- The following line is unique to MySQL it is optional
-- If left out the MySQL database will take the default settings
-- of the database
--  EXPLAIN CHARACTER SET:
--  EXPLAIN COLLATE
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is created

SHOW DATABASES;

-- Select the database
USE my_testdb;

SELECT 'LINE 35'  AS 'DATABASE CREATION COMPLETED';

-- Remove procedure if it is already there
DROP PROCEDURE IF EXISTS usp_get_employee_dept;

--  Create procedure
DELIMITER //

CREATE PROCEDURE IF NOT EXISTS usp_get_employee_dept (IN e_emp_no INT)


BEGIN
    SELECT 

        e.emp_no,
        d.dept_no,
        d.dept_name
    FROM
        employees.employees e 
    JOIN   
        employees.dept_emp de ON e.emp_no = de.emp_no
    JOIN
        employees.departments d ON de.dept_no = d.dept_no
    WHERE
        e.emp_no = e_emp_no
        AND
        de.from_date =(
                        SELECT
                            MAX(from_date)
                        FROM
                            employees.dept_emp
                        WHERE
                            emp_no = e_emp_no
        );
END//
-- Fix: DELIMITER^;
DELIMITER ;

CALL usp_get_employee_dept(10010);
-- Completion Statement
SELECT 
    'Installation' AS 'Completed',
    USER() AS 'BY',
    DATABASE() AS 'ON',
    NOW() AS 'AT';
