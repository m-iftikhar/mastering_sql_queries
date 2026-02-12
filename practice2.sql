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