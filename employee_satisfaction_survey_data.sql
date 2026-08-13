SELECT * FROM employee_satisfaction_survey_data;

# -- 1. Which three departments had the highest satisfaction scores, and which three had the lowest satisfaction scores?
SELECT
	dept,
ROUND(AVG(satisfaction_level),2) AS avg_satisfaction
FROM employee_satisfaction_survey_data
GROUP BY 1
ORDER BY 2 DESC;
--  ↓========= Output ============↓
-- |dept        | avg_satisfaction|
-- |support	    | 0.62            | ←
-- |management  | 0.62            | ←
-- |IT	        | 0.62            | ←
-- |product_mng	| 0.62            |
-- |marketing	| 0.62            |
-- |RandD	    | 0.62            |
-- |sales	    | 0.61            |
-- |technical	| 0.61            | ←
-- |hr	        | 0.6             | ←
-- |accounting	| 0.58            | ←


#-- 2. What is the relationship between salary and satisfaction score?
SELECT
	DISTINCT salary
FROM employee_satisfaction_survey_data;
-- ↓Output↓
-- |salary|
-- |low   |
-- |medium|
-- |high  |
	
SELECT salary, ROUND(AVG(satisfaction_level),2) AS avg_satisfaction
FROM employee_satisfaction_survey_data
GROUP BY 1
ORDER BY 2;
--   ↓== Output ===↓
-- salary | avg_satisfaction
-- low	  | 0.6
-- medium | 0.62
-- high   | 0.64

# -- 3. How did the top two and bottom two depts perform in the following areas

# -- 'support', 'management' -> top_dept
# -- 'hr', 'accounting'  -> lower_dept

	# -- a. last_evaluation
	# -- b. number_project
	# -- c. average_montly_hours
	# -- d. time_spend_company
SELECT
    CASE
     WHEN dept IN ('support', 'management') THEN 'top_dept'
     WHEN dept IN ('hr', 'accounting') THEN 'lower_dept'
	END AS top_bot,
    round(AVG(last_evaluation),2) AS avg_last_evaluation,
    round(AVG(number_project),1) AS avg_projects,
    AVG(average_montly_hours) AS hours_worked,
    AVG(time_spend_company) AS time_at_company
FROM employee_satisfaction_survey_data
WHERE dept IN ('support', 'management','hr', 'accounting')
GROUP BY 1;
--  ️↓================================= Output ================================↓
-- top_bot    |avg_last_evaluation |avg_projects |hours_worked |time_at_company|
-- lower_dept |	0.71	           |3.7	         |199.9469     |3.4409         |
-- top_dept	  | 0.72	           |3.8	         |200.8664     |3.5936         |



	# -- e. Work_accident
	# -- f. promotion_last_5years

SELECT
    CASE
     WHEN dept IN ('support', 'management') THEN 'top_dept'
     WHEN dept IN ('hr', 'accounting') THEN'lower_dept'
	END AS top_bot,
    count(`Emp ID`) AS number_of_emp,
    round(AVG(last_evaluation),2) AS avg_last_evaluation,
    round(AVG(number_project),1) AS avg_projects,
    round(AVG(average_montly_hours),2) AS hours_worked,
    round(AVG(time_spend_company),2) AS time_at_company,
    round(AVG(Work_accident),2) AS avg_num_accidents,
    round(AVG(promotion_last_5years),2) AS avg_num_proms
FROM employee_satisfaction_survey_data
WHERE dept IN ('support', 'management','hr', 'accounting')
GROUP BY 1;
--  ️↓====================================================== Output =======================================================↓
-- top_bot    |number_of_emp |avg_last_evaluation |avg_projects |hours_worked |time_at_company |avg_num_accidents |avg_num_proms
-- lower_dept |1506          |0.71                |3.7	        |199.95       |3.44	           |0.12	          |0.02
-- top_dept	  |2859          |0.72                |3.8	        |200.87       | 3.59           |0.16              | 0.03