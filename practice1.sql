CREATE DATABASE startersql;

CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(100) UNIQUE NOT NULL,
 gender ENUM('Male', 'Female', 'Other'),
 date_of_birth DATE,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM users;
SELECT name ,email FROM users;

RENAME TABLE users TO programers;
RENAME TABLE programers TO users;

SELECT * FROM users;

ALTER TABLE users ADD COLUMN isactive BOOLEAN DEFAULT TRUE;
ALTER TABLE users MODIFY COLUMN email VARCHAR(150) ;
ALTER TABLE users DROP COLUMN isactive;

ALTER TABLE users MODIFY COLUMN email VARCHAR(100) FIRST;
ALTER TABLE users MODIFY COLUMN gender ENUM('Male', 'Female', 'Other') AFTER name;

INSERT INTO users (name, email, gender, date_of_birth) VALUES
('Charlie', 'charlie@example.com', 'Other', '1988-02-17'),
('David', 'david@example.com', 'Male', '2000-08-09'),
('Eva', 'eva@example.com', 'Female', '1993-12-30');