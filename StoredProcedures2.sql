/*

Stored Procedures: a group of SQL statements created and stored in the DB
				 : can accept input parameters
				 : can be used by several different users using different inputs
				 : reduce network traffic and increase performance
				 : any modification will be received by all users

*/

CREATE PROCEDURE TEST AS
SELECT *
FROM EmployeeDemographics

EXEC TEST --return SELECT statement in the SP


-- more complicated example

-- exec this first
CREATE PROCEDURE Temp_Employee AS
CREATE TABLE #temp_employee(
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #temp_employee
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_employee

--exec this second
EXEC Temp_Employee @JobTitle = 'Salesman'