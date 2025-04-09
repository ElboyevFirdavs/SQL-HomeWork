
--1. Task: Show all orders placed after 2022 along with the names of the customers who placed them.
    
    select Orders.OrderID, Customers.FirstName, Orders.OrderDate
    from Orders
    full join Customers on Customers.CustomerID = Orders.CustomerID
    where Orders.OrderDate > '2022'

--2  Display the names of employees who work in either the Sales or Marketing department.

    select Employees.Name, Departments.DepartmentName
    from Employees
    join Departments on Departments.DepartmentID = Employees.DepartmentID
    where Departments.DepartmentName in ('Sales' , 'Marketing')

--3.Task: For each department, show the name of the employee who earns the highest salary.

      SELECT d.DepartmentName, e.Name AS TopEmployeeName, e.Salary AS MaxSalary
      FROM Employees e
      JOIN Departments d ON e.DepartmentID = d.DepartmentID
      WHERE e.Salary = (
      	SELECT MAX(e2.Salary)
      	FROM Employees e2
      	WHERE e2.DepartmentID = e.DepartmentID
      );

--4.Task: List all customers from the USA who placed orders in the year 2023.
    
        select Customers.FirstName as CustomerName, Orders.OrderID, Orders.OrderDate, Customers.Country
        from Customers
        full join Orders on Customers.CustomerID = Orders.CustomerID
        where Customers.Country = 'USA' and Orders.OrderDate > '2022'


--5. Task: Show how many orders each customer has placed.


        SELECT Customers.FirstName, COUNT(Orders.OrderID) AS TotalOrders
        FROM Customers
        LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
        GROUP BY Customers.FirstName;


----6. Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.

        select Products.ProductName, Suppliers.SupplierName
        from Products
        inner join Suppliers on Products.SupplierID = Suppliers.SupplierID
        where Suppliers.SupplierName in ('Gadget Supplies', 'Clothing Mart' )

--7. For each customer, show their most recent order. Include customers who haven't placed any orders.

        select Customers.FirstName, Orders.OrderDate as MostRecentOrderDate, Orders.OrderID
        from Customers
        left join Orders on Orders.CustomerID = Customers.CustomerID 
        and Orders.OrderDate = (
        	select max(Orders.OrderDate)
        	from Orders
        	where Orders.CustomerID = Customers.CustomerID
        	)

--8. Show the customers who have placed an order where the total amount is greater than 500.

        select * from Orders
        select * from Customers
        
        select Customers.FirstName, Orders.OrderID, Orders.TotalAmount
        from Customers
        inner join Orders on Orders.CustomerID = Customers.CustomerID
        where Orders.TotalAmount > 500


--9. List product sales where the sale was made in 2022 or the sale amount exceeded 400.
          
        select Products.ProductName, Sales.SaleDate, Sales.SaleAmount
        from Products
        join Sales on Sales.ProductID = Products.ProductID
        where year (Sales.SaleDate) = 2022
        or Sales.SaleAmount > 400

          
--10.  Display each product along with the total amount it has been sold for.

        select Products.ProductName, SUM( Sales.SaleAmount)
        from Products
        join Sales on Sales.ProductID = Products.ProductID
        group by Products.ProductName

--11.how the employees who work in the HR department and earn a salary greater than 50000.

        select Employees.Name, Departments.DepartmentName , Employees.Salary
        from Employees
        join Departments on Departments.DepartmentID = Employees.DepartmentID
        where Departments.DepartmentName = 'Human Resources'
        and Employees.Salary > 50000


        
        
--12. : List the products that were sold in 2023 and had more than 50 units in stock at the time.


        select Products.ProductName, Sales.SaleDate, Products.StockQuantity as StockQuantity
        from Products
        join Sales on  Sales.ProductID = Products.ProductID
        where YEAR (Sales.SaleDate) = 2023 
        and Products.StockQuantity > 50

--13.. Show employees who either work in the Sales department or were hired after 2020.



        select Employees.Name, Departments.DepartmentName, Employees.HireDate
        from Employees
        join Departments on Departments.DepartmentID = Employees.DepartmentID
        where Departments.DepartmentName = 'Sales'
        or YEAR(Employees.HireDate) > 2020 


 --14. List all orders made by customers in the USA whose address starts with 4 digits.
        
        select Customers.FirstName as CustomerName, Orders.OrderID, Customers.Address, Orders.OrderDate
        from Customers
        join Orders on  Customers.CustomerID = Orders.CustomerID
        where Customers.Address like '4%'
        


--15. Display product sales for items in the Electronics category or where the sale amount exceeded 350.

  
        select Products.ProductName, Products.Category, Sales.SaleAmount
        from Products
        join Sales on Sales.ProductID = Products.ProductID
        where Products.Category = 'Electronics '
        or Sales.SaleAmount >350


--16. Show the number of products available in each category.

          select  Categories.CategoryName, COUNT( Products.ProductID) as ProductCount 
          from Products
          join Categories on  Categories.CategoryID = Products.Category
          group by Categories.CategoryName
          


 --19. List products that had a sales quantity above 100 and a price above 500.

 

select Products.ProductName, Products.StockQuantity, Products.Price
from Products
join sales on Sales.ProductID = Products.ProductID
where Products.StockQuantity > 100
and Products.Price > 500














