--1.Using the Employees and Departments tables, write a query to return the names and
--salaries of employees whose salary is greater than 50000, along with their department names.
      select Employees.Name, Employees.Salary, Departments.DepartmentName
      from Employees
      join Departments on Departments.DepartmentID = Employees.DepartmentID
      where Employees.Salary > 50000


--2. Using the Customers and Orders tables, write a query to display customer names and
-- order dates for orders placed in the year 2023.

      select Customers.FirstName, Customers.LastName, Orders.OrderDate
      from Customers
      join Orders on Orders.CustomerID = Customers.CustomerID
      where year (Orders.OrderDate) = 2023

--3 Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
      
      select Employees.Name, Departments.DepartmentName
      from Employees
      left join Departments on Departments.DepartmentID = Employees.DepartmentID

--4.Using the Products and Suppliers tables, write a query to list all suppliers and 
--the products they supply. Show suppliers even if they don’t supply any product. .

      
      select Suppliers.SupplierName, Products.ProductName
      from Products
      full join Suppliers on Suppliers.SupplierID = Products.SupplierID

        
--5. Using the Orders and Payments tables, write a query to return all orders and their corresponding payments.  Include orders without payments and payments not linked to any order.


      select Orders.OrderID, Orders.OrderDate, Payments.PaymentDate, Payments.Amount
      from Orders
      full join Payments on Orders.OrderID = Payments.OrderID


--6. Using the Employees table, write a query to show each employee's name along with the name of their manager.



-7.Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.

      select Students.Name, Courses.CourseName
      from Students
      join Enrollments on Students.StudentID = Enrollments.StudentID
      join Courses on Courses.CourseID = Enrollments.CourseID
      where Courses.CourseName = 'Math 101'

--8.Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.

  
      
      select Customers.FirstName, Customers.LastName, Orders.Quantity
      from Customers
      join Orders on Customers.CustomerID = Orders.CustomerID
      where Orders.Quantity > 3
            

 --9.Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
 
      
      select Employees.Name, Departments.DepartmentName
      from Employees
      join Departments on Departments.DepartmentID = Employees.DepartmentID
      where Departments.DepartmentName = 'Human Resources'



--10. Using the Employees and Departments tables, write a query to return department names that have more than 10 employees.

      SELECT Departments.DepartmentName, COUNT(*) AS EmployeesCount
      from Departments
      JOIN Employees ON Employees.DepartmentID = Departments.DepartmentID
      where Employees.EmployeeID > 10
      GROUP BY Departments.DepartmentName;


--11. Using the Products and Sales tables, write a query to find products that have never been sold.

      select Products.ProductID, Products.ProductName
      from Products
      left join Sales on Sales.ProductID = Products.ProductID
      where Sales.CustomerID is null
        

 --12. Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.

      SELECT  Customers.FirstName,  Customers.LastName, COUNT(Orders.OrderID) AS TotalOrders 
      FROM Customers
      JOIN Orders ON Orders.CustomerID = Customers.CustomerID
      GROUP BY Customers.FirstName, Customers.LastName;
      

--13 Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
      
      select Employees.Name, Departments.DepartmentName
      from Employees
      join Departments on Departments.DepartmentID = Employees.DepartmentID


        
 --14. Using the Employees table, write a query to find pairs of employees who report to the same manager
        
         SELECT 
          E1.Name AS Employee1,
          E2.Name AS Employee2
        FROM Employees E1
        JOIN Employees E2 
          ON E1.ManagerID = E2.ManagerID
          AND E1.EmployeeID < E2.EmployeeID;

--15 Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
      
      	select Orders.OrderID,  Orders.OrderDate, Customers.FirstName, Customers.LastName
      	from Orders
      	join Customers on Customers.CustomerID = Orders.CustomerID
      	where YEAR (Orders.OrderDate) = '2022'
              
--16. Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is
      
      	select Employees.Name as EmployeeName, Employees.Salary, Departments.DepartmentName
      	from Employees
      	join Departments on Departments.DepartmentID = Employees.DepartmentID
      	where Employees.Salary > 60000


	--17.Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.

    		SELEct Orders.OrderID, Orders.OrderDate, Payments.PaymentDate, Payments.Amount
    		from Orders
    		join Payments on Payments.OrderID = Orders.OrderID



  18. Using the Products and Orders tables, write a query to find products that were never ordered.

    		SELECT Products.ProductID, Products.ProductName
    		from Products
    		left join Orders on Orders.ProductID = Products.ProductID
    		where Orders.ProductID is null


--19.Using the Employees table, write a query to find employees whose salary is greater than the average salary of all employees.



        select Name, Salary
        from Employees
        where Salary > ( select AVG(Salary) from Employees )


--20. Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.
      
      SELECT Orders.OrderID, Orders.OrderDate
      FROM Orders
      LEFT JOIN Payments ON Orders.OrderID = Payments.OrderID
      WHERE Orders.OrderDate < '2020'
      AND Payments.OrderID IS NULL;


 --21 Using the Products and Categories tables, write a query to return products that do not have a matching category.

		select Products.ProductID, Products.ProductName
		from Products
		left join Categories on Categories.CategoryID = Products.ProductID
		where Categories.CategoryID is  null



		--22.Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
    
    		SELECT E1.Name AS Employee1, E2.Name AS Employee2, E1.Salary AS Salary1, E2.Salary AS Salary2
        FROM Employees E1
        JOIN Employees E2 ON E1.ManagerID = E2.ManagerID
        WHERE E1.Salary > 60000 AND E2.Salary > 60000;
    

--23. Using the Employees and Departments tables, write a query to return employees who work in departments whose name starts with the letter 'M'.
      	select Employees.Name, Departments.DepartmentName
      	from Employees
      	join Departments on Departments.DepartmentID = Employees.DepartmentID
      	where Departments.DepartmentName like 'M%'

--24. Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.

        select Sales.SaleID, Products.ProductName, Sales.SaleAmount
        from Products
        join Sales on Products.ProductID = Sales.ProductID
        where Sales.SaleAmount > 500

--25. Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.

        SELECT Students.StudentID, Students.Name
        from Students
        where Students.StudentID not in (
        	select Enrollments.StudentID
        	from Enrollments
        	join Courses on Enrollments.CourseID =  Courses.CourseID
        	where Courses.CourseName = 'Math 101')
        


--26. Using the Orders and Payments tables, write a query to return orders that are missing payment details.
          
      SELECT Orders.OrderID, Orders.OrderDate
      FROM Orders
      LEFT JOIN Payments ON Orders.OrderID = Payments.OrderID
      WHERE Payments.OrderID IS NULL;



--27. Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.

        SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
        FROM Products
        JOIN Categories ON Products.CategoryID = Categories.CategoryID
        WHERE Categories.CategoryName IN ('Electronics', 'Furniture');

























