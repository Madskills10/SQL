-- HAVING vs WHERE

SELECT * FROM employee_salary

-- My Sample
SELECT dept_id, AVG(salary) 
FROM employee_salary
-- WHERE AVG(salary) >= 70000 -- this is not applicable when using 'GROUP BY' since it's looking for 'AGGREGATED'Column | Error: Invalid use of group function
GROUP BY dept_id
HAVING AVG(salary) >= 70000; -- use 'HAVING' instead but should be used after 'GROUP BY' | Only working on AGGREGATED FUNCTIONS after the 'GROUP BY'
--  -- --

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40; -- √
--  -- --

-- This is incorrect ↓
SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40 -- X
GROUP BY gender;
-- This is incorrect ↑

-- -- --
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%' -- WHERE is used since it is looking for a 'CHARACTER' column which is Occupation, use 'WHERE' after (FROM + table)
GROUP BY occupation
HAVING AVG(salary) > 75000; -- Only working on aggregated function after the 'GROUP BY'

-- -- -- -- 

SELECT * FROM employee_salary

-- get the  the salary and try to get multi condition using 'HAVING' clause

SELECT dept_id, AVG(salary)
FROM employee_salary
GROUP BY dept_id
HAVING AVG(salary) >= 70000 OR AVG(salary) = 55000; -- √ OR can be used with 'HAVING' clause as well, 'Multiple conditions'




