-- GROUP BY

SELECT * 
FROM employee_demographics;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender ORDER BY AVG(age) DESC; 
-- 'GROUP BY' is like doing filter in a spreadsheet, you have to aggregrate columns before you do 'GROUP BY' or use same column.
-- just to see the group or filter a particular column
--  'ORDER BY' is like sorting, you have to add 'ORDER BY + a column then the column or COLUMNS you want to sort(DESC or ASC - ASC is used by default)

-- -------------
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;
-- --------------
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;
-- --------------
-- ORDER BY
SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;



