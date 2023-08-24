-- Week 4:
-- JOINS

-- SELECT EVERYTHING FROM BOTH TABLES - FULL TABLES
SELECT * FROM 
`niyo-378413.hr.hr_dataset` table1 
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID;


-- SELECT EVERYTHING FROM BOTH TABLES - REMOVED VALUES
SELECT * FROM `niyo-378413.hr.hr_dataset` table1
INNER JOIN `niyo-378413.hr.hr_performance_short` table2
ON table1.EmpID = table2.EmpID;

-- SELECT EMP_ID, employee_name, performancescore
-- tablename.columnname
SELECT table1.EmpID, Employee_Name, PerformanceScore
FROM `niyo-378413.hr.hr_dataset` table1
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID;

-- SELECT emp_id, employee_name, dayslatelast30days, absences - using full performance table
SELECT table1.EmpID, table1.Employee_Name, table2.DaysLateLast30, table2.absences
FROM `niyo-378413.hr.hr_dataset` table1
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID;

-- LEFT JOIN hr_performance - short version
SELECT * FROM 
`niyo-378413.hr.hr_dataset` table1
LEFT JOIN `niyo-378413.hr.hr_performance_short` table2
ON table1.EmpID = table2.EmpID;

-- RIGHT JOIN hr performance - short version 
SELECT * FROM 
`niyo-378413.hr.hr_dataset` table1
RIGHT JOIN `niyo-378413.hr.hr_performance_short` table2
ON table1.EmpID = table2.EmpID;

-- Return employee name, id, department and manager name - performance short 
SELECT table1.EmpID, table1.employee_name, table1.department, table2.managername
FROM `niyo-378413.hr.hr_dataset` table1
LEFT JOIN `niyo-378413.hr.hr_performance_short` table2
ON table1.EmpID = table2.EmpID;

-- Find the employees who have had more than 10 absences - use full performance
-- select empid, emp name, absences
SELECT table1.EmpID, table1.Employee_Name, table2.Absences
FROM `niyo-378413.hr.hr_dataset` table1
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID
WHERE table2.absences >= 10;

-- CHECK empid 10238 - use left join & performance short 
-- select empid, empname 
SELECT table1.EmpID, table1.Employee_Name, table2.ManagerName
FROM `niyo-378413.hr.hr_dataset` table1
RIGHT JOIN `niyo-378413.hr.hr_performance_short` table2
ON table1.EmpID = table2.EmpID
WHERE table1.EmpID = 10238;

-- Find the avg salary per recruitment source platform
SELECT table2.RecruitmentSource, AVG(table1.salary) AS AvgSalary
FROM `niyo-378413.hr.hr_dataset` table1
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID
GROUP BY table2.RecruitmentSource
ORDER BY 1 DESC;

-- find the avg number of absences, total number of absence by department
SELECT table1.Department, AVG(table2.absences) AS AvgAbsence, SUM(table2.absences) AS TotalNumberAbsence
FROM `niyo-378413.hr.hr_dataset` table1
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID
GROUP BY table1.Department;

-- Find employees with satisfaction < 3
SELECT table1.EmpId, table1.Employee_Name, table2.EmpSatisfaction
FROM `niyo-378413.hr.hr_dataset` table1
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID
WHERE table2.EmpSatisfaction <= 3;

-- find the employees that have satisifaction less than 3 and absences greater than 10
SELECT table1.Employee_Name, table2.EmpSatisfaction,table2.Absences
FROM `niyo-378413.hr.hr_dataset` table1
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID
WHERE table2.EmpSatisfaction < 3 AND table2.Absences > 10;

-- find the total number of days late per sex and race
SELECT table1.Sex, table1.RaceDesc, COUNT(table2.DaysLateLast30) AS TotalNumberofDaysLate
FROM `niyo-378413.hr.hr_dataset` table1
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID
GROUP BY table1.sex, table1.RaceDesc
ORDER BY 3 DESC;

-- Find employees where performance is fully meets or exceeds and engagement is greater than 4.5
SELECT table1.Employee_Name, table2.PerformanceScore, table2.EngagementSurvey
FROM `niyo-378413.hr.hr_dataset` table1
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID
WHERE table2.PerformanceScore IN ('Fully Meets', 'Exceeds') AND table2.EngagementSurvey > 4.5
ORDER BY 2 ASC;

-- Find the average satisfaction based on department and position 
SELECT table1.Department, table1.Position, AVG(table2.EmpSatisfaction) AS AvgEmployeeSatisfaction, COUNT(table1.EmpID) AS NumberofEmployees
FROM `niyo-378413.hr.hr_dataset` table1
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID
GROUP BY table1.Department, table1.Position
ORDER BY 3 DESC;

-- Find the total number of days late per department where gender = f
SELECT table1.Department, SUM(table2.DaysLateLast30) AS TotalNumberofDaysLate
FROM `niyo-378413.hr.hr_dataset` table1
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID
--WHERE table1.Sex = 'F'
GROUP BY table1.Department;

-- DATES
-- Provides the date today 
SELECT CURRENT_DATE() AS TodaysDate;

-- Dateadd which adds a particular interval to our date 
SELECT DATE_ADD(DATE '2023-08-23', INTERVAL 5 DAY);

-- Datesub subracts a particular interval from date
SELECT DATE_SUB(DATE '2023-08-23', INTERVAL 5 Day);

-- Datediff gives the difference between two dates based on a specified interval 
SELECT DATE_DIFF(DATE '2023-08-25', DATE '2023-08-07', DAY) AS days_diff;

SELECT DATE_DIFF(DATE '2021-08-23', DATE '2023-08-23', YEAR) AS days_diff;

-- Extract part from date 
SELECT EXTRACT(YEAR FROM DATE '2013-12-25') AS the_day;

-- Find the age of each employee
SELECT Employee_Name, DOB, DATE_DIFF(CURRENT_DATE(), DOB, YEAR) AS Age
FROM `niyo-378413.hr.hr_dataset`
ORDER BY Age;

-- Find the age of the employee combining the two datasets
SELECT *, DATE_DIFF(CURRENT_DATE(), table1.DOB, YEAR) AS Age 
FROM 
`niyo-378413.hr.hr_dataset` table1 
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID;

-- Find the difference between date of hire and date of termination 
SELECT Employee_Name, DateofHire, DateofTermination, 
DATE_DIFF(DateofTermination, DateofHire, Year) AS NoofYearsAtCompany,
DATE_DIFF(DateofTermination, DateofHire, Month) AS NoofMonthsAtCompany,
DATE_DIFF(DateofTermination, DateofHire, Day) AS NoofDaysAtCompany,
FROM `niyo-378413.hr.hr_dataset` 
WHERE EmploymentStatus != 'Active';

-- Find the avg salary per age bucket (using case when to create the buckets)
SELECT 
CASE 
WHEN DATE_DIFF(CURRENT_DATE(), DOB, YEAR) BETWEEN 41 AND 50 THEN 'Age40-50'
WHEN DATE_DIFF(CURRENT_DATE(), DOB, YEAR) <=40 THEN 'Age 40 or below'
WHEN DATE_DIFF(CURRENT_DATE(), DOB, YEAR) >=51 THEN 'Age51orabove'
ELSE 'OTHER'
END AS AgeBucket, AVG(Salary) as AvgSalaryPerAgeGroup
FROM `niyo-378413.hr.hr_dataset`
GROUP BY AgeBucket;

-- Flag any employees who have not been reviewed since 2017
SELECT table1.Employee_Name, table2.LastPerformanceReview_Date FROM 
`niyo-378413.hr.hr_dataset` table1 
INNER JOIN `niyo-378413.hr.hr_performance` table2
ON table1.EmpID = table2.EmpID
WHERE EXTRACT(YEAR FROM table2.LastPerformanceReview_Date) <= 2017;
