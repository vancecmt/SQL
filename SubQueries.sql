/*

Subqueries: nested queries
		  : used to return data that'll be used in the main query, 
		    as a condition to specify the data to retrieve
		  : can be use in SELECT, FROM, WHERE, INSERT, UPDATE, DELETE

*/

SELECT *
FROM EmployeeSalary

--Subquery in SELECT statement
SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary

--Doing it in Partition By
SELECT EmployeeID, Salary, AVG(Salary) OVER() AS AllAvgSalary
FROM EmployeeSalary

--WHY GROUP BY DOESNT WORK
SELECT EmployeeID, Salary, AVG(Salary) AS AllAvgSalary
FROM EmployeeSalary
GROUP BY EmployeeID, Salary
ORDER BY 1, 2

--Subquery in From
SELECT a.EmployeeID, AllAvgSalary
FROM (SELECT EmployeeID, Salary, AVG(Salary) OVER() AS AllAvgSalary 
	  FROM EmployeeSalary) a

--Subquery in WHERE
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
WHERE EmployeeID IN (
	SELECT EmployeeID
	FROM EmployeeDemographics
	WHERE Age > 30)