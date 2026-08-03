-- Windows Functions = Calculates values across rows without grouping them
-- Like In Real Life: Looking at neighboring rows in a spreadsheet

-- this is a simple join and group by
SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;


-- Windows Function way
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender) -- OVER() calculates the AVG or [ANY Aggregated Columns] without grouping the rows.
								   -- Window function (AVG() OVER()) → "Calculate the summary, but keep all the original rows."
                                   -- PARTITION BY gender: calculate the average separately for each gender.
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
-- 'GROUP BY is not needed'
-- -- -- -- -- --
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total -- 'ORDER BY' Can be added after 'PARTITION BY' + column
																				-- Noted: Why isn't it just adding the current row?
                                                                                -- Because the default window frame when you specify "ORDER BY"
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
-- -- -- -- -- --
-- -- -- -- -- --
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num, -- ROW_NUMBER() → Every row gets a unique number.
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) rank_num, -- RANK() → Same values share rank, gaps appear.
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) dense_rank_num -- DENSE_RANK() → Same values share rank, no gaps.

FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
-- -- -- -- -- --
    

