-- Stored_Procedures > A Stored Procedure is a saved SQL program stored inside the database.

SELECT * 
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries() -- > this will another table under a specific database "TEMPORARILY"
SELECT * 
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries(); -- shows what's in large_salaries()


DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT * 
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT * 
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries2();

-- Parameter
DELIMITER $$
CREATE PROCEDURE large_salaries3(p_employee_id INT)
BEGIN
	SELECT salary 
	FROM employee_salary
	WHERE employee_id = p_employee_id;
END $$
DELIMITER ;

CALL large_salaries3(4);
-- -- -- -- 

