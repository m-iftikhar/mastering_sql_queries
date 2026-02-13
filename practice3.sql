

-- foreign key 

CREATE TABLE addresses(
id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
street VARCHAR(255),
city VARCHAR(100),
state VARCHAR(100),
pincode VARCHAR(10),
CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

--   ON DELETE SET NULL
-- -- > Agar user delete hoga,
-- to address delete nahi hoga —
-- bas user_id NULL ho jayega.


-- ON DELETE RESTRICT
-- Agar child table mein record exist karta hai,
-- to parent delete karne hi nahi dega.

-- SQL JOINs in MySQL

SELECT users.name, addresses.city FROM users INNER JOIN addresses ON users.id = addresses.user_id;
SELECT users.name, addresses.city FROM users LEFT JOIN addresses ON users.id = addresses.user_id;
SELECT users.name, addresses.city FROM users RIGHT JOIN addresses ON users.id = addresses.user_id;


-- union & union all


SELECT name,email FROM users 
UNION 
SELECT name , email FROM admin_users;

SELECT name, 'User' AS role FROM users
UNION ALL
SELECT name, 'Admin' AS role FROM admin_users;


CREATE TABLE admin_users (
id INT PRIMARY KEY,
 name VARCHAR(100),
 email VARCHAR(100),
 gender ENUM('Male', 'Female', 'Other'),
 date_of_birth DATE,
 salary INT
);

-- self join

CREATE TABLE customers(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100)
);



SELECT * FROM customers AS a INNER JOIN customers AS b ON a.referral_id = b.id;