/* SQL installation script: Creating Users and Roles on MySQL
   Name:Prof. Raul Nedd              Date Created: 11.12.2024
                                    Data Modified: 11.12.2024
   Purpose:This Script creates user, create roles and configures ther
   permissions
*/

SELECT ''  AS 'Installation Starting!!!';

/* Removes the user if they are already there!!!
*/

SELECT '' AS 'Dropping users';

DROP USER IF EXISTS  'prj_root'@'localhost';
DROP USER IF EXISTS 'prj_user_01'@'localhost';
DROP USER IF EXISTS 'prj_user_02'@'localhost';
DROP USER IF EXISTS 'prj_user_03'@'localhost';
DROP USER IF EXISTS 'prj_user_04'@'localhost';

SELECT ''  AS 'Creating user';
-- Create a root user.
CREATE USER IF NOT EXISTS 'prj_root'@'localhost'
          IDENTIFIED BY 'grizzlies_2024'
          PASSWORD REQUIRE CURRENT;

-- Create test users.
CREATE USER IF NOT EXISTS 'prj_user_01'@'localhost'
          IDENTIFIED BY 'test_user_20241001'


-- Add some password settings
     FAILED_LOGIN_ATTEMPTS 0
     PASSWORD_LOCK_TIME 0
     PASSWORD EXPIRE INTERVAL 90 DAY
     PASSWORD HISTORY 5
     PASSWORD REUSE INTERVAL 365 DAY;


CREATE USER IF NOT EXISTS 'prj_user_02'@'localhost'
          IDENTIFIED BY 'test_user_20241001'

-- Account Resource Limits
     WITH MAX_QUERIES_PER_HOUR 40
     MAX_UPDATES_PER_HOUR 10
     MAX_CONNECTIONS_PER_HOUR 75
     MAX_USER_CONNECTIONS 2

-- More restrictive password settings.
     FAILED_LOGIN_ATTEMPTS 0
     PASSWORD_LOCK_TIME 1
     PASSWORD EXPIRE INTERVAL 90 DAY
     PASSWORD HISTORY 5
     PASSWORD REUSE INTERVAL 365 DAY;

CREATE USER IF NOT EXISTS 'prj_user_03'@'localhost'
          IDENTIFIED BY 'test_user_20241001'

-- Account Resource Limits
     WITH MAX_QUERIES_PER_HOUR 40
     MAX_UPDATES_PER_HOUR 10
     MAX_CONNECTIONS_PER_HOUR 75
     MAX_USER_CONNECTIONS 2

-- More restrictive password settings.
     FAILED_LOGIN_ATTEMPTS 4
     PASSWORD_LOCK_TIME UNBOUNDED
     PASSWORD EXPIRE INTERVAL 90 DAY
     PASSWORD HISTORY 5
     PASSWORD REUSE INTERVAL 365 DAY;


-- DROP and Create Roles
SELECT ''  AS 'CREATING ROLES';
DROP ROLE IF EXISTS 'read_only_classicmodels_db',
                  'read_all_employees';
CREATE ROLE IF NOT EXISTS 'read_only_classicmodels_db',
                          'read_all_employees';

SELECT ''  AS 'Granting privileges';

-- Give the user root privileges

GRANT ALL PRIVILEGES ON *.* TO 'prj_root'@'localhost';

--  Give test user 01 full privileges to testdb_20240919
--  Give test user 01 SELECT privileges to only departments table in
--  employees database

GRANT INSERT, UPDATE
    ON employees.* TO 'prj_user_01'@'localhost';



-- Give test user 02 full privileges to all tables in employees database



/* Give SELECT to all tables in employees database for role read_only_employees_db

*/

GRANT INSERT, UPDATE
     ON employees.*
     TO 'prj_user_01'@'localhost';


GRANT SELECT
     ON  classicmodels.*
     TO 'read_only_classicmodels_db';
GRANT 'read_only_classicmodels_db'
    TO 'prj_user_02'@'localhost';



GRANT SELECT
     ON classicmodels.employees
     TO 'read_all_employees';
GRANT SELECT 
     ON employees.employees
     TO 'read_all_employees';
GRANT 'read_all_employees'
    TO 'prj_user_03'@'localhost';

/* To Specify which roles should become active each time a user connects
to the server and authenticates, use SET DEFAULT ROLE.  To set the
default to all assigned roles for each account created earlier, use this statement
*/

SET DEFAULT ROLE ALL TO
'prj_user_01'@'localhost',
'prj_user_02'@'localhost',
'prj_user_03'@'localhost';

/* Verify that the user with the correct priileges has been properly created.
*/

SHOW GRANTS FOR 'prj_root'@'localhost';
SHOW GRANTS FOR 'prj_user_01'@'localhost';
SHOW GRANTS FOR 'prj_user_02'@'localhost' USING 'read_only_classicmodels_db';
SHOW GRANTS FOR 'prj_user_03'@'localhost'  USING 'read_all_employees';

/* See all users Created
*/

SELECT user, show_db_priv, account_locked
FROM mysql.user;

/* Force MySQL to update the changes to the user privileges
*/

FLUSH PRIVILEGES;

/* See all users Created
*/

SELECT user, show_db_priv, account_locked
FROM mysql.user;
SELECT '' AS 'Installation Completed';


