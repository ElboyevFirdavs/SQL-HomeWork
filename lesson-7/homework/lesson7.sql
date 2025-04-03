--1.Write a query to find the minimum (MIN) price of a product in the Products table.
select min(price) from Products

--2.Write a query to find the maximum (MAX) Salary from the Employees table.
select MAX(salary) from Employees


--3.Write a query to count the number of rows in the Customers table using COUNT(*).
select COUNT(*) from Customers 

--4.Write a query to count the number of unique product categories (COUNT(DISTINCT Category)) from the Products table.
select count(distinct Category) as UniqueCategoryCount
from Products

--5.Write a query to find the total (SUM) sales amount for the product with id 7 in the Sales table.
select SUM(SaleAmount) 
from Sales
where ProductID  = 7

--6.Write a query to calculate the average (AVG) age of employees in the Employees table.
select AVG(Age) from Employees

----7.Write a query that uses GROUP BY to count the number of employees in each department.
select DepartmentName, count(EmployeeID) 
from Employees
group by DepartmentName

--8.Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.
select min(price) as MinPrice, max(price) as MaxPrice
from Products
group by Category

--9.Write a query to calculate the total (SUM) sales per Customer in the Sales table.

select CustomerID, sum (SaleAmount) as TotalSales
from Sales
group by CustomerID

--10.Write a query to use HAVING to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you don't have DeptName).

select DepartmentName, count(EmployeeID) AS EmployeeCount 
from Employees
group by DepartmentName 
having count(employeeID) > 5

--11.Write a query to calculate the total sales and average sales for each product category from the Sales table.

select ProductID,
	SUM(SaleAmount) as TotalSales,
	AVG(SaleAmount) as AverageSales
from sales
group by  ProductID

--12. Write a query that uses COUNT(columnname) to count the number of employees from the Department HR.

select count(EmployeeID) as employeeCount
from Employees
where  DepartmentName='HR'

--13. Write a query that finds the highest (MAX) and lowest (MIN)  Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName).

select DepartmentName, max(Salary) as HighestSalary , min(Salary) as LowestSalary
from Employees
group by DepartmentName
  
--14.Write a query that uses GROUP BY to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName).
select DepartmentName, avg(salary) as avarageSalary
from Employees
group by DepartmentName
  
--15.Write a query to show the AVG salary and COUNT(*) of 
--employees working in each department.(DeptID is enough, if you don't have DeptName).

select DepartmentName, AVG(Salary), count(*)
from Employees
group by DepartmentName

--16.Write a query that uses HAVING to filter product categories with an average price greater than 400.
select ProductName, AVG(Price)
from Products 
group by ProductName
Having AVG(price) > 400

--17. Write a query that calculates the total sales for each year in the Sales table, and use GROUP BY to group them.
select year(SaleDate), 
		sum(SaleAmount)
from Sales
Group by Year(SaleDate)

--18.
SELECT COUNT(ProductID) AS CustomerCount
FROM (
    SELECT ProductID
    FROM Orders
    GROUP BY ProductID
    HAVING COUNT(Quantity) >= 3
) AS CustomerOrders;

--19.Write a query that applies the HAVING clause to filter out Departments with total salary expenses greater than 500,000.(DeptID is enough, if you don't have DeptName).
select DepartmentName, sum(Salary) as TotalSalary
from Employees
group by DepartmentName
having sum(Salary) > 500000

--20.Write a query that shows the average (AVG) sales for each product category,
--and then uses HAVING to filter categories with an average sales amount greater than 200.
select CustomerID, avg(SaleAmount) as AverageSales
from Sales
group by CustomerID
having avg(SaleAmount) > 200


--21. Write a query to calculate the total (SUM) sales for each Customer, then filter the results using HAVING to include only Customers with total sales over 1500.

select CustomerID, sum(SaleAmount) as TotalSales
from Sales
group by CustomerID
having sum(SaleAmount) > 1500

--22. Write a query to find the total (SUM) and average (AVG) salary of employees grouped by department, and use HAVING to include only departments with an average salary greater than 65000.
select DepartmentName, 
	sum(Salary) as TotalSalary,
	avg(Salary) as avaregSalary
from Employees
group by DepartmentName
having avg(Salary) > 65000










