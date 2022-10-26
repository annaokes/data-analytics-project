-- Question 1: Retrieve everything from employees table
SELECT * FROM classicmodels.employees;

-- Question 2: Retrieve first name, last name and email
SELECT firstName, lastname, email FROM classicmodels.employees;

-- Question 3: Retrieve first name, employee number and job title
SELECT firstName, lastname, email FROM classicmodels.employees;

-- Question 4: Retrieve distinct last names
SELECT DISTINCT lastname FROM classicmodels.employees;

-- Question 5: Retrieve distinct reports to
SELECT DISTINCT reportsto FROM classicmodels.employees;

-- Question 6: Retrieve employees who work as sales reps
SELECT * FROM classicmodels.employees
WHERE jobTitle = 'Sales Rep';

-- Question 7: Retrieve employees whose office code is 1
SELECT * FROM classicmodels.employees
WHERE officecode = 1;

-- Question 8: Retrieve employees whose office code > 3
SELECT * FROM classicmodels.employees
WHERE officecode > 3;

-- Question 9: Retrieve employees sales rep and office code 1
SELECT * FROM classicmodels.employees
WHERE jobtitle = 'SALES REP' AND officecode = 1;

-- Question 10: Retrieve employees sales rep and feports to 1143
SELECT * FROM classicmodels.employees
WHERE jobtitle = 'SALES REP' AND reportsTo = 1143;

-- Question 11: Retrieve employees sales rep or office code 1
SELECT * FROM classicmodels.employees
WHERE jobtitle = 'SALES REP' OR officecode = 1;

-- Question 12: Retrieve employees sales rep or reports to 1143
SELECT * FROM classicmodels.employees
WHERE jobtitle = 'SALES REP' OR reportsTo = 1143;

-- Question 13: Retrieve employees whose jobtitle is NOT sales rep
SELECT * FROM classicmodels.employees
WHERE NOT jobTitle = 'Sales Rep';

-- Question 14: Retrieve employees whose jobtitle is NOT sales rep and office code is 1
SELECT * FROM classicmodels.employees
WHERE NOT jobTitle = 'Sales Rep' AND officeCode = 1;

-- Question 15: Retrieve employees whose office code is between 1 and 3
SELECT * FROM classicmodels.employees
WHERE officecode BETWEEN 1 AND 3;

-- Question 16: Retrieve employees whose office code is between 1 and 3 and whose job title is not sales rep
SELECT * FROM classicmodels.employees
WHERE (officecode BETWEEN 1 AND 3) AND (NOT jobTitle = 'sales rep');

