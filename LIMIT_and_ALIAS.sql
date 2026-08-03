-- LIMIT & ALIASING

SELECT *
FROM employee_demographics ORDER BY age DESC LIMIT 3, 2; -- LIMIT 3, 2 | 3 - limits the number of rows to 3 
														 -- then '2' gets the data of 2 specific rows after the number of limits

-- ALIASING
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;
