-- Temporay Table: A temporary table that stores data for multiple queries during your session
-- A scratch notebook

CREATE TEMPORARY TABLE temp_table
(
first_name VARCHAR(50),
last_name VARCHAR(50),
favorite_movie VARCHAR(100)
);
-- -- -- --
SELECT * FROM temp_table;

INSERT INTO temp_table
VALUES('Mads', 'Sombreno', 'War Machine');

SELECT * FROM temp_table; -- run this to see -> 'Mads', 'Sombreno', 'War Machine'
-- -- -- -- 

SELECT * 
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50K
SELECT * FROM employee_salary
WHERE salary >= 50000;

SELECT * FROM salary_over_50K; -- Temporay Table lasts as long as you are within the specific Session.
								-- but if you close the 'MySQL Workbench' then open it again, then the temporary will NO LONGER 'WORK'


