-- indexing

SHOW INDEXES FROM users;
CREATE INDEX idx_gender_salary ON users(gender,salary);
SELECT * FROM users WHERE gender="Male" AND salary="70000";