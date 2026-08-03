-- Triggers and Events

-- Trigger
SELECT * 
FROM employee_demographics;
SELECT * 
FROM employee_salary;

DELIMITER $$ -- Changes the statement ending symbol to $$ so MySQL can read the whole trigger.
CREATE TRIGGER employee_insert -- Creates a trigger named employee_insert.
	AFTER INSERT ON employee_salary -- Runs after a new row is added to employee_salary.
    FOR EACH ROW -- Executes once for every inserted row.
BEGIN -- Starts the trigger's SQL statements.
	INSERT INTO employee_demographics (employee_id, first_name, last_name) -- Inserts data into employee_demographics.
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name); -- Uses the values from the newly inserted row.
END $$ -- Ends the trigger definition.
DELIMITER ; -- Changes the statement ending symbol back to the default (;).


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id) 
-- Adds a new employee record to employee_salary.

VALUES(13, 'Mads', 'Pogi', 'CEO of Tech Dept', 10000000, NULL); 
-- Specifies the values to insert into each column.

--
-- EVENTS --
SELECT * 
FROM employee_demographics;

DELIMITER $$  -- Changes the statement ending symbol to $$.
CREATE EVENT delete_retirees -- Creates an event named delete_retirees.
ON SCHEDULE EVERY 30 SECOND -- Runs the event every 30 seconds.
DO -- Specifies the action to perform.
BEGIN -- Starts the event's SQL statements.
	DELETE -- Deletes records.
	FROM employee_demographics -- Deletes data from employee_demographics.
	WHERE age >= 60; -- Deletes employees whose age is 60 or older.
END $$ -- Ends the event definition.
DELIMITER ; -- Changes the statement ending symbol back to the default (;).


SHOW VARIABLES LIKE 'event%'; -- Displays the current event scheduler settings.
-- -- 



