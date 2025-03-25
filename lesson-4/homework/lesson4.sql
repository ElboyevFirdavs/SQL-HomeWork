
1 .Write a query to select the top 5 employees from the Employees table.
    select top 5 * from Employees

2.Use SELECT DISTINCT to select unique ProductName values from the Products table.
    Select distinct EmployeeID from [Employees]

3.Write a query that filters the Products table to show products with Price > 100.
  select * from [Products_Discounted] where Price >100
  
4.Write a query to select all CustomerName values that start with 'A' using the LIKE operator.
  select * from [Products_Discounted] where  CustomerName like 'A%'

5.Order the results of a Products query by Price in ascending order
  Select * from [Products_Discounted] order by Price asc
  
6.Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and Department = 'HR'.
    select * from [Employees] where Salary >=60000 and  DepartmentName = 'HR'
  
7.Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table
  select  isnull (Email, 'noemail@example.com') from [Employees] 
  
8.Write a query that shows all products with Price BETWEEN 50 AND 100.
  select * from Products_Discounted where Price between 50 and 100
  
9.Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.
  Select distinct Category, ProductName from [Products_Discounted]
  
10.After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.
    Select distinct Category, ProductName from [Products_Discounted] order by ProductName desc
  
11.Write a query to select the top 10 products from the Products table, ordered by Price DESC.
  select top 10 * from [Products_Discounted] order by Price desc
  
12.Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.
  select coalesce ( FirstName, LastName) from Employees
  
13.Write a query that selects distinct Category and Price from the Products table.
  Select distinct Category, Price from [Products_Discounted]

14.Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.
     select * from [Employees] where Age between 30 and 40 and DepartmentName = 'Marketing'

15.Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.
   Select * from [Employees] order by Salary desc offset 11 rows fetch next 20 rows only
16.

17.Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
  select * from [Products_Discounted] where ProductName like '%C%' 

18.Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.
  SELECT * FROM Employees WHERE DepartmentName IN ('HR', 'IT', 'Finance');

    
