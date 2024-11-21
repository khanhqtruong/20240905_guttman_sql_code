/* Name:                            Date Created: 11/19/2024
                                    Data Modified: 
    Purpose: This script creates a database, view, function and stored procedure. 
    The view and function are both used in the stored procedure as an
    example of DRY (Dont repeat) coding.
*/
SYSTEM CLS;
-- Opening print statement
SELECT 'LINE 09' AS 'Installation Starting!!!';
SELECT USER()   AS 'INSTALLATION USER';
--  Remove the database if it is already there.

DROP DATABASE IF  

/*  Create the database after making sure it is
    not already there
*/

--  The following line is pure standard SQL
CREATE DATABASE IF NOT EXISTS my_testdb
--  The following line is unique to MySQL it is optional
--  If left out the MySQL database will take the default settings
--  of the database.
--  EXPLAIN CHARACTER SET:
--  EXPLAIN COLLATE:
CHARACTER SET utf8mb4  COLLATE utf8mb4_0900_ai_ci
--  Let's see if the database is created

SHOW DATABASES;
--  Select the database Created
USE my_testdb;

SELECT 'LINE 33' AS 'DATABASE CREATION COMPLETED',
        DATABASE() AS 'DATABASE NAME';
-- Add or replace the view
CREATE OR REPLACE VIEW vw_get_employee_dept
AS
    SELECT 
        USER() AS 'Requested_By',
        e.emp_no  AS 'Employee',
        d.dept_no AS 'Department_Number',
        d.dept_name AS 'Department_Name',
        de.from_date AS 'dept_date',
        NOW() AS 'Day_Time'
    FROM 
        employees.employees e
    JOIN
        employees.dept_emp de ON e.emp_no = de.emp_no 
    JOIN
        employees.departments d ON de.dept_no = d.dept_no;

    --  Display VIEW
    SELECT *
    FROM vw_get_employee_dept
    LIMIT 10;

    -- Remove function if it already EXISTS 
    DROP FUNCTION IF EXISTS usf_get_max_date;
    DELIMITER $$
    CREATE FUNCTION IF NOT EXISTS usf_get_max_date(e_emp_no INT)
        RETURN DATE DETERMINISTIC
    BEGIN
        DECLARE v_get_max DATE;
        SELECT 
            MAX(from_date)
        INTO v_get_max 
        FROM 
            employees_dept_emp
        WHERE 
            emp_no = e_emp_no;

        RETURN v_get_max;
    END$$
    DELIMITER ;
    -- Using function from command line
    SELECT usf_get_max_date(10010);
    --  Remove procedure if it is already there.
    DROP PROCEDURE IF EXISTS usp_get_employee_dept;

    --  Create procedure.
    DELIMITER //

    CREATE PROCUDURE IF NOT EXISTS usp_get_employee_dept ( IN e_emp_no INT)

    BEGIN
        SELECT 
            Requested_By AS 'Requested By',
            Employee,
            Department_Number AS 'Department Number',
            Department_Name AS 'Department Name'
            Day_Time AS 'Timestammp'
        FROM vw_get_employee_dept
        WHERE 
            employee = e_emp_no
            AND 
            dept_data =  (SELECT usf_get_max_date(e_emp_no));
    END//



    CALL usp_get_employee_dept(10010);
    --  Completion message
    SELECT 
        'Installation' AS 'Completed',
        USER() AS 'BY',
        DATABASE() AS 'ON',
        NOW() AS 'AT';
        

