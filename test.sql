-- Lesson One & two

-- Retrieve all data from table
SELECT * FROM `niyo-378413.hr.hr_dataset`;

-- Retrieve employee id, employee name, position, department and salary
SELECT EmpID, Employee_Name, Position, Department, Salary
FROM `niyo-378413.hr.hr_dataset`;

-- Retrieve employee id, employee name, DOB, sex
SELECT EmpID, Employee_Name, DOB, Sex 
FROM `niyo-378413.hr.hr_dataset`;

-- Retrieve employee id position and rename maritaldesc
-- ALIAS IS NOT A PERMANENT CHANGE 
SELECT EmpId, Position, MaritalDesc AS MaritalStatus
FROM `niyo-378413.hr.hr_dataset`;

-- Retrieve distinct states
-- THIS RETURNS ALL THE STATES - SO WE DON'T ACTUALLY KNOW HOW MANY STATES WE HAVE IN TOTAL
SELECT State FROM `niyo-378413.hr.hr_dataset`;

-- But we can use distinct to find out
SELECT DISTINCT State FROM `niyo-378413.hr.hr_dataset`;

-- Retrieve distinct positions
SELECT DISTINCT Position FROM `niyo-378413.hr.hr_dataset`;

-- Retrieve employees who have a salary greater than $100,000
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE Salary > 100000;

-- Retrieve employees who have a salary less than $50,000
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE Salary < 50000;

-- Retrieve employees who work as a software engineer
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE Position = 'Software Engineer';

-- Retrieve all female employees
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE Sex = 'F';

-- Retrieve all black or african employees
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE RaceDesc = 'Black or African American';

-- Retrieve all that are NOT us citizens 
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE CitizenDesc != 'US Citizen';

-- Retrieve employees from diversity hire and are black or african employees
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE RaceDesc = 'Black or African American' AND FromDiversityJobFairID = 1;

-- Retrieve employees that earn greater than 100,000 and are NOT white
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE Salary > 100000 AND RaceDesc != 'White';

-- Retrieve employees that are married and earning above 60000 and female
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE Salary > 60000 AND MaritalDesc = 'Married' AND Sex = 'F';

-- Retrieve employees that are currently active and work in production
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE EmploymentStatus = 'Active' AND Department = 'Production';

-- Retrieve employees who work as a data analyst and are female
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE Position = 'Data Analyst' AND Sex = 'F';

-- Retrieve employees from diversity hire OR are black or african employees
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE RaceDesc = 'Black or African American' OR FromDiversityJobFairID = 1;

-- Retrieve employees that are (married OR female) and earning above 60000 
SELECT * FROM `niyo-378413.hr.hr_dataset`
WHERE (MaritalDesc = 'Married' OR Sex = 'F') AND Salary > 60000;
