-- Format Date

SELECT birth_date, 
		DATE_FORMAT(birth_date, '%m/%d/%Y') AS DateFormat1,
        DATE_FORMAT(birth_date, '%d/%m/%Y') AS DateFormat2,
        DATE_FORMAT(birth_date, '%M %d %Y') AS DateFormat3
FROM employee_demographics;
-- Check more details below


/* In MySQL, FORMAT() is for formatting numbers, not dates. That's why your date is being treated like a numeric value and displayed with commas.
 Use DATE_FORMAT() instead:
------------------------------------------------------------
SELECT
    birth_date,
    DATE_FORMAT(birth_date, '%m-%d-%Y') AS formatted_date
FROM employee_demographics;

Output:

1962-08-28    08-28-1962
1977-07-30    07-30-1977
1979-09-25    09-25-1979
------------------------------------------------------------
Common MySQL date format specifiers:

Specifier	Meaning	Example
%Y	4-digit year	1962
%y	2-digit year	62
%m	Month (01-12)	08
%c	Month (1-12)	8
%d	Day (01-31)	28
%e	Day (1-31)	28
%M	Full month name	August
%b	Abbreviated month	Aug

Examples:
-- 08-28-1962
DATE_FORMAT(birth_date, '%m-%d-%Y')

-- 28/08/1962
DATE_FORMAT(birth_date, '%d/%m/%Y')

-- August 28, 1962
DATE_FORMAT(birth_date, '%M %d, %Y')
------------------------------------------------------------
The format string syntax you used ('MM-dd-yyyy') is from SQL Server/.NET-style formatting, not MySQL. MySQL uses % format specifiers.  */