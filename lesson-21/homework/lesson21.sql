--1. Write a query to assign a row number to each sale based on the SaleDate.
	select *,
	ROW_NUMBER() over (order by SaleDate) as Rownum
	from ProductSales

--2. Write a query to rank products based on the total quantity sold. 
-- give the same rank for the same amounts without skipping numbers.


	select ProductName, SUM(Quantity) as jami ,
	DENSE_RANK() over (order by sum(quantity) desc) as maxsulot_raqami
	from ProductSales 
	group by ProductName

--3. Write a query to identify the top sale for each customer based on the SaleAmount

		SELECT *
	FROM (
		SELECT *,
			   ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY SaleAmount DESC) AS rn
		FROM ProductSales
	) AS ranked_sales
	WHERE rn = 1;


--4. Write a query to display each sale's amount along with the next sale amount in the order of SaleDate.
SELECT 
    SaleID,
    SaleDate,
    SaleAmount,
    LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextSaleAmount
FROM ProductSales;

--5. Write a query to display each sale's amount along with the previous sale amount in the order of SaleDate.
SELECT 
    SaleID,
    SaleDate,
    SaleAmount,
    LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PreviousSaleAmount
FROM ProductSales;


--6. Write a query to identify sales amounts that are greater than the previous sale's amount
SELECT *
FROM (
    SELECT *,
           LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PreviousSaleAmount
    FROM ProductSales
) AS t
WHERE SaleAmount > PreviousSaleAmount;

--7. Write a query to calculate the difference in sale amount from the previous sale for every product

SELECT 
    ProductName,
    SaleDate,
    SaleAmount,
    SaleAmount - LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS DifferenceFromPrevious
FROM ProductSales;


--8 Write a query to compare the current sale amount with the next sale amount in terms of percentage change.
SELECT 
    SaleDate,
    SaleAmount,
    LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextSale,
    ROUND(
        (LEAD(SaleAmount) OVER (ORDER BY SaleDate) - SaleAmount) * 100.0 / SaleAmount, 2
    ) AS PercentageChange
FROM ProductSales;


--9 Write a query to calculate the ratio of the current sale amount to the previous sale amount within the same product.
SELECT 
    ProductName,
    SaleDate,
    SaleAmount,
    LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PrevAmount,
    CASE 
        WHEN LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) IS NOT NULL AND LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) != 0
        THEN ROUND(SaleAmount * 1.0 / LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate), 2)
        ELSE NULL
    END AS Ratio
FROM ProductSales;


--10. Write a query to calculate the difference in sale amount from the very first sale of that product.
SELECT 
    ProductName,
    SaleDate,
    SaleAmount,
    SaleAmount - FIRST_VALUE(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS DifferenceFromFirstSale
FROM ProductSales;


--11 Write a query to find sales that have been increasing continuously for a product (i.e., each sale amount is greater than the previous sale amount for that product).
SELECT *
FROM (
    SELECT *,
           LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PrevAmount
    FROM ProductSales
) AS t
WHERE SaleAmount > PrevAmount;


--12 Write a query to calculate a "closing balance"(running total) for sales amounts which adds the current sale amount to a running total of previous sales.
SELECT 
    ProductName,
    SaleDate,
    SaleAmount,
    SUM(SaleAmount) OVER (ORDER BY SaleDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM ProductSales;


--13 Write a query to calculate the moving average of sales amounts over the last 3 sales.
SELECT 
    ProductName,
    SaleDate,
    SaleAmount,
    ROUND(AVG(SaleAmount) OVER (ORDER BY SaleDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS MovingAvgLast3Sales
FROM ProductSales;

--14.Write a query to show the difference between each sale amount and the average sale amount.
SELECT 
    SaleID,
    SaleAmount,
    ROUND(AVG(SaleAmount) OVER (), 2) AS AverageSale,
    SaleAmount - AVG(SaleAmount) OVER () AS DifferenceFromAvg
FROM ProductSales;


--15. Find Employees Who Have the Same Salary Rank
SELECT *,
       DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees1;

--16 Identify the Top 2 Highest Salaries in Each Departme
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS RankInDept
    FROM Employees1
) AS ranked
WHERE RankInDept <= 2;

--17. Find the Lowest-Paid Employee in Each Department
SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY Department ORDER BY Salary ASC) AS SalaryRank
    FROM Employees1
) AS ranked
WHERE SalaryRank = 1;

--18 Calculate the Running Total of Salaries in Each Department
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    SUM(Salary) OVER (PARTITION BY Department ORDER BY HireDate) AS RunningTotal
FROM Employees1;
 
 --19.Find the Total Salary of Each Department Without GROUP BY
 SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    SUM(Salary) OVER (PARTITION BY Department) AS TotalDeptSalary
FROM Employees1;


--20. Calculate the Average Salary in Each Department Without GROUP BY
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    AVG(Salary) OVER (PARTITION BY Department) AS AvgDeptSalary
FROM Employees1;


--21. Find the Difference Between an Employee’s Salary and Their Department’s Average
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    Salary - AVG(Salary) OVER (PARTITION BY Department) AS DiffFromDeptAvg
FROM Employees1;


--22 Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)
SELECT 
    EmployeeID,
    Name,
    Salary,
    ROUND(AVG(Salary) OVER (ORDER BY HireDate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING), 2) AS MovingAvgSalary
FROM Employees1;


--23. Find the Sum of Salaries for the Last 3 Hired Employees
SELECT 
    SUM(Salary) AS SumLast3Hired
FROM (
    SELECT Salary
    FROM Employees1
    ORDER BY HireDate DESC
    LIMIT 3
) AS last3;
