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

CREATE PROCEDURE AddUser(
 IN p_name VARCHAR(100),
 IN p_email VARCHAR(100),
 IN p_gender ENUM('Male', 'Female', 'Other'),
 IN p_dob DATE,
 IN p_salary INT
)
BEGIN
 INSERT INTO users (name, email, gender, date_of_birth, salary)
 VALUES (p_name, p_email, p_gender, p_dob, p_salary);
END$$
DELIMITER ;
CALL AddUser('Kiran Sharma', 'kiran@example.com', 'Female', '1994-06-15', 72000);

-- triggers 

DELIMITER $$
CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
 INSERT INTO user_log (user_id, name)
 VALUES (NEW.id, NEW.name);
END$$
DELIMITER ;

CALL AddUser('Ritiika Jain', 'ritiika@example.com', 'Female', '1996-03-12', 74000);
SELECT * FROM user_log;