-- JOINS
-- (INNER) JOIN
-- LEFT (OUTER) JOIN
-- RIGHT (OUTER) JOIN
-- FROM (table) = Left table = 1st table


SELECT * FROM employee_demographics;

SELECT * FROM employee_salary;

SELECT * FROM employee_demographics JOIN employee_salary ON employee_demographics.employee_id = employee_salary.employee_id; -- Basic (INNER) JOIN

SELECT dem.employee_id, 
		dem.age, 
		sal.occupation,
        sal.salary
        FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
    
-- OUTER JOIN
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

    
-- To be continued
 SELECT dem.employee_id,
		dem.first_name,
        dem.last_name,
		age,
        gender,
        birth_date,
        occupation,
        salary,
        dept_id
FROM employee_demographics AS dem
JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id;   

-- Self Join
SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2 
	ON emp1.employee_id = emp2.employee_id;
--
SELECT * FROM employee_salary emp1
JOIN employee_salary emp2 
	ON emp1.employee_id + 1 = emp2.employee_id; -- emp2.employee_id which is the '2nd table' increases to 1
                                                -- for this 'emp1.employee_id' - it has already a value which '1'
-- 
SELECT emp1.employee_id AS emp_santa,
		emp1.first_name	 AS first_name_santa,
 		emp1.last_name AS last_name_santa,       
        emp2.employee_id AS emp_name,
        emp2.first_name AS first_name_emp,
 		emp2.last_name AS last_name_emp       
FROM employee_salary emp1
JOIN employee_salary emp2 
	ON emp1.employee_id + 1 = emp2.employee_id;

-- Joining Multiple Tables together
SELECT * FROM employee_demographics; -- Join column: employee_id -> employee_salary.employee_id
SELECT * FROM employee_salary; -- Join columns: employee_id -> employee_demographics.employee_id, dept_id -> parks_departments.department_id
SELECT * FROM parks_departments; -- Join column: department_id -> employee_salary.dept_id

SELECT * 
FROM employee_demographics
JOIN employee_salary ON employee_demographics.employee_id = employee_salary.employee_id
JOIN parks_departments ON employee_salary.dept_id = parks_departments.department_id;

--  With Alias and selected Columns to avoid redundant columns
SELECT dem.employee_id,
		dem.first_name,
        dem.last_name,
        age, -- ('dem' is optional since only 'employee_demographics' has this column)
        birth_date, -- same as 'age' column ↑↑
        occupation, -- ('sal' is optional since only employee_salary' has this column)
        salary, -- same as 'occupation' column ↑↑
        department_id,  -- same rule as alias dem. and sal.
        department_name  -- same rule as alias dem. and sal.
FROM employee_demographics AS dem
	JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id
    JOIN parks_departments pd ON sal.dept_id = pd.department_id;



    
    