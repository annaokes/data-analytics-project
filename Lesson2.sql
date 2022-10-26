-- Lesson 2:


-- Retrieve the employees who work as a sales rep or have office code = 1
SELECT * FROM classicmodels.employees
WHERE jobTitle = 'Sales Rep' -- use quotation marks = string
OR officeCode = 1; -- integers, floats - no need to use quotation marks 

-- Compare this 
SELECT * FROM classicmodels.employees
WHERE jobTitle = 'Sales Rep'
AND officeCode = 1;

-- Where employee is NOT a sales rep
SELECT * FROM classicmodels.employees
WHERE NOT jobTitle = 'Sales Rep';

-- An alternative method is to use != 
SELECT * FROM classicmodels.employees
WHERE jobTitle != 'Sales Rep';

-- Explore offices table
SELECT * FROM classicmodels.offices;

-- Write a query to display the employees whose office code is between 1 and 3
SELECT * FROM classicmodels.employees;

SELECT * FROM classicmodels.employees 
WHERE officeCode BETWEEN 1 AND 3;

-- Write a query to display office information in USA & France
SELECT * FROM classicmodels.offices
WHERE country IN ('USA', 'France', 'UK'); 

-- Write a query to display the employees first_name that starts with the letter A
SELECT * FROM classicmodels.employees;

SELECT firstName FROM classicmodels.employees
WHERE firstName LIKE 'a%';


SELECT firstName FROM classicmodels.employees
WHERE firstName LIKE 'T%M';