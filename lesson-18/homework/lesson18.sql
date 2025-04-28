part 2. 
 📄 Task 1:
Create a stored procedure that:

Creates a temp table #EmployeeBonus
Inserts EmployeeID, FullName (FirstName + LastName), Department, Salary, and BonusAmount into it
(BonusAmount = Salary * BonusPercentage / 100)
Then, selects all data from the temp table.

              CREATE TABLE #EmployeeBonus (
            EmployeeID INT,
            FullName NVARCHAR(100),
            Department NVARCHAR(50),
            Salary DECIMAL(10,2),
            BonusAmount DECIMAL(10,2)
        )
        	insert into #EmployeeBonus  (EmployeeID, FullName, Department,  BonusAmount)
        		select e.EmployeeID,
        				e.FirstName + ' ' + e.LastName as FullName,
        				e.Department,
        				e.Salary,
        				e.Salary * db.BonusPercentage / 100 as BonusAmount
        		from Employees e
        		join DepartmentBonus db
        		on db.Department = e.Department
        		
        
        		Select * from #EmployeeBonus

3.
  
	merge into Products_Current as target						
	using 	Products_New as source								
	on target.productID = source.productID						

	when matched then 
	update set															
				target.productName = source.productName,
				target.price = source.price         
	when not matched by target then 						
	insert (ProductID, productName, Price  )	         
	values (source.productID, source.productName, source.price)						

	when not matched by source then							
	delete;
			
			SELECT * FROM Products_Current;


5.
 
SELECT 
    s.user_id,
    ROUND(
        COALESCE(
            1.0 * SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) 
            / NULLIF(COUNT(c.user_id), 0), 
            0
        ), 
        2
    ) AS confirmation_rate
FROM 
    Signups s
LEFT JOIN 
    Confirmations c ON s.user_id = c.user_id
GROUP BY 
    s.user_id
ORDER BY 
    s.user_id;


6.
  
select * 
from employeess
where salary = (
		select min(salary)
		from employeess)



7.

CREATE OR ALTER PROCEDURE GetProductSalesSummary
@productID int
as
begin 
	select
		p.productName,
		SUM(s.Quantity) AS TotalQuantitySold,
        SUM(s.Quantity * p.Price) AS TotalSalesAmount,
        MIN(s.SaleDate) AS FirstSaleDate,
        MAX(s.SaleDate) AS LastSaleDate
	from Products p
	left join Sales s on p.ProductID = s.ProductID
	where p.ProductID = @productID
	group by p.ProductName
end

EXEC GetProductSalesSummary @ProductID = 5;
		
