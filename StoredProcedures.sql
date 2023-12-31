USE [SQL]
GO
/****** Object:  StoredProcedure [dbo].[Temp_Employee]    Script Date: 5/6/2023 1:13:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Temp_Employee] 
@JobTitle nvarchar(50)
AS
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
WHERE JobTitle = @JobTitle
GROUP BY JobTitle

SELECT *
FROM #temp_employee