--1. Using Products, Suppliers table List all combinations of product names and supplier names.


      SELECT Products.ProductName, Suppliers.SupplierName
      FROM Products
      CROSS JOIN Suppliers;

--2.Using Departments, Employees table Get all combinations of departments and employees.
      select Departments.DepartmentName, Employees.Name
      from Departments
      cross join Employees 

--3. Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. 
--Return supplier name and product name
  
       SELECT Suppliers.SupplierName, Products.ProductName
      FROM Products
      INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

--4.Using Orders, Customers table List customer names and their orders ID

      SELECT Customers.FirstName, Orders.OrderID
      FROM Orders
      INNER JOIN Customers ON Orders.CustomerID = Customers.Customer

--5. Using Courses, Students table Get all combinations of students and courses.
      select Students.Name, Courses.CourseName
      from Courses
      inner join Students on Students.StudentID = Courses.CourseID

--6. Using Products, Orders table Get product names and orders where product IDs match.
  
      select Products.ProductName, Orders.OrderID
      from Products
      cross join Orders where Products.ProductID = Orders.ProductID

--7. Using Departments, Employees table List employees whose DepartmentID matches the department.

      select Departments.DepartmentName, Employees.Name
      from Departments
      inner join Employees on Departments.DepartmentID = Employees.DepartmentID
    

--8. Using Students, Enrollments table List student names and their enrolled course IDs.
  
       select Students.Name, Enrollments.CourseID
       from Students
       join Enrollments on Students.StudentID = Enrollments.StudentID
        

 --9. Using Payments, Orders table List all orders that have matching payments.
        
       select Orders.OrderID as Orders_OrderID, Payments.OrderID as Payments_OrderID
       from Payments
       join Orders on Orders.OrderID = Payments.OrderID

 --10. Using Orders, Products table Show orders where product price is more than 100.

       select Orders.OrderID as Orders_OrderID, Products.Price as Products_Price
       from Orders
       join Products on Products.Price > 100


--11. Using Employees, Departments table List employee names and department names where department IDs are not equal
      It means: Show all mismatched employee-department combinations.


      select Employees.Name, Departments.DepartmentName
      from Employees
      join Departments on Departments.DepartmentID <> Employees.DepartmentID


--12 Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.

      SELECT Orders.OrderID, Products.ProductName, Orders.Quantity, Products.StockQuantity
      FROM Orders
      INNER JOIN Products ON Orders.ProductID = Products.ProductID
      WHERE Orders.Quantity< Products.StockQuantity

--13 Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.

      select Customers.FirstName, Sales.ProductID, Sales.SaleAmount
      from Customers
      cross join Sales where Sales.SaleAmount > 500
--14.Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.

      select Students.Name, Courses.CourseName
    	from Enrollments
    	inner join Students on Students.StudentID = Enrollments.StudentID
    	inner join Courses on Courses.CourseID = Enrollments.CourseID

--15.Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.
    
      select Products.ProductName, Suppliers.SupplierName
    	from Products
    	inner join Suppliers on Products.SupplierID = Suppliers.SupplierID
    	where Suppliers.SupplierName like '%Tech%'

--16. Using Orders, Payments table Show orders where payment amount is less than total amount.

    	select Orders.OrderID, Payments.Amount
    	from Orders
    	inner join Payments on Orders.TotalAmount < Payments.Amount
--17. Using Employees table List employee names with salaries greater than their manager’s salary.

    	select * from Employees
    	SELECT E.EmployeeName, E.Salary, M.EmployeeName AS ManagerName, M.Salary AS ManagerSalary
    	FROM Employees E
    	INNER JOIN Employees M ON E.ManagerID = M.EmployeeID
    	WHERE E.Salary > M.Salary;

--18. 	select Products.ProductName, Categories.CategoryID
    	 from Products
    	 inner join Categories on Products.Category = Categories.CategoryID
    	 where Categories.CategoryName in ('Electronics','Furniture')


--19. Using Sales, Customers table Show all sales from customers who are from 'USA'.

        select Sales.SaleID, Customers.FirstName, Customers.Country
    		from Sales
    		inner join Customers on Customers.CustomerID = Sales.CustomerID
    		where Customers.Country in ('USA')


--20 Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.

        SELECT Orders.CustomerID, Customers.FirstName, Customers.Country, Orders.TotalAmount
    		from Orders
    		join Customers on Orders.CustomerID = Customers.CustomerID
    		where Customers.Country = 'Germany' and Orders.TotalAmount > 100

--21. Using Employees table List all pairs of employees from different departments.
    
        select Employees.Name, Employees.DepartmentID, employees.employeeID
    		from Employees
    		join Enrollments on Employees.DepartmentID % 2 = 0


--22  Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).

  
        SELECT Payments.PaymentID, Orders.OrderID, Products.ProductName, Payments.Amount, Orders.Quantity, Products.Price
        FROM Payments
        join Orders on Payments.PaymentID = Orders.OrderID
        join Products on Products.ProductID = Orders.ProductID
        where Payments.Amount <> Orders.Quantity * Products.Price

--23  Using Students, Enrollments, Courses table Find students who are not enrolled in any course.

        select Students.StudentID, Students.Name, Students.Major
        from Students
        join Enrollments on Students.StudentID = Enrollments.StudentID
        join Courses on Enrollments.CourseID = Courses.CourseID

--24  Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage

            SELECT M.EmployeeName AS ManagerName,
                   E.EmployeeName AS EmployeeName,
                   M.Salary AS ManagerSalary,
                   E.Salary AS EmployeeSalary
            FROM Employees E
            INNER JOIN Employees M ON E.ManagerID = M.EmployeeID
            WHERE M.Salary <= E.Salary;


--25  Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.


          SELECT Customers.FirstName, Orders.OrderID
          FROM Orders
          INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
          LEFT JOIN Payments ON Orders.OrderID = Payments.OrderID
          WHERE Payments.PaymentID IS NULL;





