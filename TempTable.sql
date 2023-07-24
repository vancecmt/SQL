/*
	Temp Tables: can be referenced multiples times, unlike CTE or subqueries
*/

CREATE TABLE #temp_Employee (
EmployeeID int,
JobTitle varchar(50),
Salary int
)

Select *
FROM #temp_Employee

INSERT INTO #temp_Employee VALUES
('1001', 'HR', '45000')

INSERT INTO #temp_Employee
SELECT *
FROM dbo.EmployeeSalary


DROP TABLE IF EXISTS #temp_Employee2

CREATE TABLE #temp_Employee2(
JobTitle varchar(50),
EmployeesPerJob int,
AverageAge int,
AverageSalary int)

INSERT INTO #temp_Employee2 
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_Employee2

