1. Write a query that uses an alias to rename the ProductName column as Name in the Products table.
        select  ProductName as Name from Products

  
2.Write a query that uses an alias to rename the Customers table as Client for easier reference.
	  	  select * from Customers as Client
  
  
3.Use UNION to combine results from two queries that select ProductName 
  from Products and ProductName from Products_Discounted.

  		  select ProductName from Products
  		  union
  		  select ProductName from Products_Discounted 
    

4.Write a query to find the intersection of Products and Products_Discounted tables using INTERSECT.
    	select * from Products
    	intersect
    	select * from Products_Discounted
    
  
5.Write a query to select distinct customer names and their corresponding Country using SELECT DISTINCT.
    	select distinct FirstName, country from Customers


6. Write a query that uses CASE to create a conditional column that displays 
   'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.

  		select Price, 
  		case when Price > 1000 then 'high'
  		else 'low'
  		end
  		from Products

7.Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' 
    otherwise (Products_Discounted table, StockQuantity column).

		 select StockQuantity,
			iif(StockQuantity >100, 'yes', 'no') as StockName
		 from Products_Discounted

  
8. Use UNION to combine results from two queries that select ProductName
   from Products and ProductName from OutOfStock tables.

    	select ProductName from Products
    	union 
    	select ProductName from OutOfStock


9. Write a query that returns the difference between the Products and Products_Discounted tables using EXCEPT.
		
  		select ProductName from Products
  		except
  		select ProductName from Products_Discounted


10. Create a conditional column using IIF that shows 'Expensive'
 if the Price is greater than 1000, and 'Affordable' if less, from Products table.
    		select Price,
    			iif(Price >1000, 'Expensive', 'Affordable') as PriceCategory  
    		from Products


11. Write a query to find employees in the Employees table who have either Age < 25 or Salary > 60000.
    		select * from employees
    		where Salary >6000 or Age <25 


12.Use IF statement to update the salary of an employee based on their department,
	 increase by 10% if they work in 'HR' or EmployeeID = 5
      	update Employees
      	set Salary = salary * 1.10 
      	where DepartmentName = 'HR' or EmployeeID = 5


13. Use INTERSECT to show products that are common between Products and Products_Discounted tables.
      	select *from Products
      	intersect
      	select * from Products_Discounted

14. Write a query that uses CASE to assign 'Top Tier' if SaleAmount > 500, 'Mid Tier' if SaleAmount BETWEEN 200 AND 500, and 'Low Tier' otherwise. (From Sales table)

    		select SaleAmount,
    			case
    				when SaleAmount > 500 then 'Top Tier'
    				when SaleAmount between 200 and 500 then 'Mid Tier'
    				else 'Low Tier'
    			end as SaleCategory  
    		from Sales


15. Use EXCEPT to find customers' ID who have placed orders but do not have a corresponding record in the Invoices table.
		
  		select CustomerID from orders
  		except
  		select CustomerID from Invoices
  

16. Write a query that uses a CASE statement to determine the discount percentage based
 on the quantity purchased. Use orders table. Result set should show customerid,
 quantity and discount percentage. The discount should be applied as follows:
 More than 1 item: 3% Between 1 and 3 items : 5% Otherwise: 7%

      	select CustomerID, Quantity,
      		case 
      			when Quantity > 3 then 3
      			when Quantity between 1 and 3 then 5
      			else 7
      		end 
      	from orders
      






