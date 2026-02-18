-- indexing

SHOW INDEXES FROM users;
CREATE INDEX idx_gender_salary ON users(gender,salary);
SELECT * FROM users WHERE gender="Male" AND salary="70000";

-- subquery

SELECT name, salary,gender FROM  users WHERE salary > (SELECT AVG(salary) FROM users);


-- GROUP BY / HAVING

SELECT gender, AVG(salary) AS avg_salary
FROM users
GROUP BY gender
HAVING AVG(salary) > 60000;


-- procedure

USE startersql;
DELIMITER $$
CREATE PROCEDURE select_users()
BEGIN
SELECT * FROM users;
END $$
DELIMITER 

CALL select_users();