/*
Common Table Expressions (CTEs): 
	- named temporary result set
	- used to manipulate the complex subqueries data
	- only exist within the scope of the statement
	- once cancel out of the query, it'll be like it never existed
	- only created in memory, not in a temp DB file like a temp table
	- in general, act very much like a subquery
*/

WITH CTE_Employee AS 
(SELECT FirstName, LastName, Gender, Salary, 
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender, 
AVG(Salary) OVER (PARTITION BY Gender) AS AverageSalary
FROM SQL..EmployeeDemographics emp
JOIN SQL..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > '45000'
)
SELECT *
FROM CTE_Employee