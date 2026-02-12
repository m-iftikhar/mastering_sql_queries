CREATE DATABASE startersql;
USE startersql;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM users;

-- where clause examples

SELECT * FROM users WHERE gender = "Male";
SELECT *  FROM users WHERE gender = "Male" and salary = "70000";
SELECT * FROM users WHERE salary BETWEEN "65000" AND "80000";
SELECT * FROM users WHERE date_of_birth IS NOT NULL;
SELECT * FROM users WHERE gender IN ("Male","Female");
SELECT * FROM users WHERE gender = 'Male' OR gender = 'Other';
SELECT * FROM users WHERE date_of_birth IS NOT NULL ORDER BY gender DESC LIMIT 10 OFFSET 5;

SELECT *  FROM users WHERE name LIKE '%a';
SELECT *  FROM users WHERE name LIKE 'A%';
SELECT *  FROM users WHERE name LIKE '%ar%';

-- UPDATE AND DELETE

UPDATE users SET salary = "70000" where id="3";
DELETE FROM users WHERE id = 3;
DROP TABLE users;
DELETE FROM users;

-- sql funtions

SELECT COUNT(*) FROM users;
SELECT MAX(salary) AS max_salaary , MIN(salary) AS min_salary FROM users;
SELECT SUM(salary) FROM users;
SELECT gender ,AVG(salary) AS avrg_salary FROM users GROUP BY gender;

SELECT COUNT(*) FROM users;
SELECT MAX(salary) AS max_salaary , MIN(salary) AS min_salary FROM users;
SELECT SUM(salary) FROM users;
SELECT gender ,AVG(salary) AS avrg_salary FROM users GROUP BY gender;

SELECT name, LENGTH(name) AS name_len FROM users;
SELECT name, LOWER(name) AS name_lower FROM users;
SELECT name, 	UPPER(name) AS name_upper FROM users;
SELECT CONCAT(name, ' <', email, '>') AS user_contact FROM users;
SELECT NOW();
SELECT name, DATEDIFF(CURDATE(), date_of_birth) AS days_lived FROM users;
SELECT id, MOD(id, 2) AS remainder FROM users;
SELECT salary,
 ROUND(salary) AS rounded,
 FLOOR(salary) AS floored,
 CEIL(salary) AS ceiled
FROM users;

SELECT gender ,IF(gender="Female","yes","no") AS is_female FROM users;

-- Transactions and AutoCommit

SET autocommit = 0;
UPDATE users SET salary = 80000 WHERE id = 5;
COMMIT;
ROLLBACK;
--  Enabling AutoCommit Again
SET autocommit = 1;
