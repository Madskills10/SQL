-- Subqueries
-- Note: In order to use Subqueries and get the output you want, the tables should be under 1 database.
SELECT * 
FROM employee_demographics
WHERE employee_id IN  -- IN() is used to get a list of value, this is way better if you have a long list instead of using multiple 'OR'
					(SELECT employee_id  -- in this Subquery, only 1 column should be used to get all the results of a table, using more than 1 causes an error.
                    FROM employee_salary 
                    WHERE dept_id = 1);
                    
  SELECT * FROM employee_salary               
                    
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- In this example, Subquery is used after declaring the columns from 'employee_salary' table.
SELECT first_name, salary,
(SELECT AVG(salary) FROM employee_salary) -- this Subquery is used to get overall average of salary of all employees
FROM employee_salary;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age) 
FROM employee_demographics
GROUP BY gender;


-- -- --
-- this a sample of getting the overall  AVG, MAX, MIN, etc 'age' of both genders, MALE & FEMALE ARE SEPARATED.
SELECT gender, AVG(max_age)
FROM
(SELECT gender, AVG(age) AS avg_age, 
				MAX(age) AS max_age, 
                MIN(age) AS min_age, 
                COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender) AS Agg_Table
GROUP BY gender;

--
-- this a sample of getting the overall AVG, MAX, MIN, etc 'age' of BOTH genders, not just for only Male or Female.
SELECT AVG(max_age), AVG(min_age)
FROM
(SELECT gender, 
	AVG(age) AS avg_age, 
	MAX(age) AS max_age, 
    MIN(age) AS min_age, 
    COUNT(age) AS count_age 
FROM employee_demographics
GROUP BY gender) AS Agg_table
--









