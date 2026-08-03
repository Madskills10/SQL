-- CASE Statement

SELECT first_name,
		last_name,
CASE -- insert 'CASE' after the 'SELECT + (colum/s),' -- DO NOT forget ',' before the 'CASE' Keyword,
	 -- so 'CASE WHEN [BETWEEN][AND] THEN END' add insert tab to make it easier to read
	WHEN age <= 30 THEN 'Young' -- WHEN (column + condition) THEN (result)
    WHEN age BETWEEN 31 AND 50 THEN 'Old' -- WHEN (column) BETWEEN (Value) AND (Value) THEN (result)
    WHEN age > 50 THEN 'Senior Citizen' -- WHEN (column + condition) THEN (result)
END AS Age_Bracket -- END AS + alias
FROM employee_demographics;

-- -- -- -- --
-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% Bonus
SELECT first_name, last_name, salary,
	CASE
		WHEN salary < 50000 THEN salary * 1.05
        WHEN salary > 50000 THEN salary * 1.07
	END AS New_Salary,
	CASE -- Can add multiple CASE STATEMENT
		WHEN dept_id = 6 THEN salary * .10
	END AS Bonus
FROM employee_salary;

-- -- --
SELECT *
FROM employee_salary;
SELECT *
FROM parks_departments;

