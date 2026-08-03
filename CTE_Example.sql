-- CTE > A temporary query result used inside one SQL statement	
-- Like In Real Life: A sticky note


WITH CTE_Example AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal 
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal) -- ↓    |-- > ' * ' can also be used or any aggregated columns
FROM CTE_Example; -- this CTE gets the overall AVG salary of both Male and Female

-- Multiple CTE
WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
SELECT employee_id, salary 
FROM employee_salary
WHERE salary > 50000
)
SELECT * 
FROM CTE_Example
JOIN CTE_Example2 
	ON CTE_Example.employee_id = CTE_Example2.employee_id;
--  --  --  --

--  ALIASING after 'WITH' keyword
WITH CTE_Example (Gender, AVG_sal, MAX_sal, MIN_Sal, COUNT_sal) AS -- (Gender, AVG_sal, MAX_sal, MIN_Sal, COUNT_sal) Overrides the aggregtated columns inside 
																   -- These colums will SHOW as OUTPUT instead of the columns inside of this CTE expression(SELECT)
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal -- SELECT+(columns(aggreated))- these WON't SHOW output due to alias in the beginning(Overriden)
FROM employee_demographics dem
JOIN employee_salary sal 
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT * 
FROM CTE_Example;
 




