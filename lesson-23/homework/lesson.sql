1.
select 
    Id,
    FORMAT(Dt, 'MM') as Oy
 Dates;
from

2.

SELECT 
    COUNT(DISTINCT Id) AS Unique_Id_Count,
    SUM(MaxVal) AS Sum_Of_Max_Values
FROM (
    SELECT 
        Id, 
        rID, 
        MAX(Vals) AS MaxVal
    FROM MyTabel
    GROUP BY Id, rID
) AS Sub;

3.
SELECT *
FROM TestFixLengths
WHERE LEN(Vals) BETWEEN 6 AND 10;

4.
SELECT t.ID, t.Item, t.Vals
FROM TestMaximum t
JOIN (
    SELECT ID, MAX(Vals) AS MaxVal
    FROM TestMaximum
    GROUP BY ID
) AS maxT
    ON t.ID = maxT.ID AND t.Vals = maxT.MaxVal;





5.
SELECT Id, SUM(MaxVal) AS SumOfMaxVals
FROM (
    SELECT Id, DetailedNumber, MAX(Vals) AS MaxVal
    FROM SumOfMax
    GROUP BY Id, DetailedNumber
) AS Sub
GROUP BY Id;


6.
SELECT 
    Id,
    a,
    b,
    CASE 
        WHEN a - b = 0 THEN '' 
        ELSE CAST(a - b AS VARCHAR)
    END AS Difference
FROM TheZeroPuzzle;
7.
SELECT SUM(QuantitySold * UnitPrice) AS TotalRevenue
FROM Sales;
8.
SELECT AVG(UnitPrice) AS AverageUnitPrice
FROM Sales;
9.
SELECT COUNT(*) AS TotalTransactions
FROM Sales;
10.
SELECT MAX(QuantitySold) AS MaxUnitsSold
FROM Sales;
11.


12.
SELECT Region, SUM(QuantitySold * UnitPrice) AS TotalRevenue
FROM Sales
GROUP BY Region;
13.
SELECT TOP 1 Product, SUM(QuantitySold * UnitPrice) AS Revenue
FROM Sales
GROUP BY Product
ORDER BY Revenue DESC;

14.
  SELECT 
    SaleDate,
    SUM(QuantitySold * UnitPrice) AS DailyRevenue,
    SUM(SUM(QuantitySold * UnitPrice)) OVER (ORDER BY SaleDate) AS RunningTotalRevenue
FROM Sales
GROUP BY SaleDate
ORDER BY SaleDate;


15.
  SELECT 
    Category,
    SUM(QuantitySold * UnitPrice) AS CategoryRevenue,
    (SUM(QuantitySold * UnitPrice) * 100.0 / (SELECT SUM(QuantitySold * UnitPrice) FROM Sales)) AS ContributionPercentage
FROM Sales
GROUP BY Category;


17.
  SELECT s.SaleID, s.Product, s.QuantitySold, s.UnitPrice, s.SaleDate, s.Region, c.CustomerName
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID;
18.
SELECT c.CustomerID, c.CustomerName
FROM Customers c
LEFT JOIN Sales s ON c.CustomerID = s.CustomerID
WHERE s.SaleID IS NULL;

19.
SELECT c.CustomerID, c.CustomerName, SUM(s.QuantitySold * s.UnitPrice) AS TotalRevenue
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID, c.CustomerName;
20.
SELECT TOP 1 c.CustomerID, c.CustomerName, SUM(s.QuantitySold * s.UnitPrice) AS TotalRevenue
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalRevenue DESC;

21.
SELECT c.CustomerID, c.CustomerName, SUM(s.QuantitySold * s.UnitPrice) AS TotalSales
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID, c.CustomerName;

22.
SELECT DISTINCT p.ProductID, p.ProductName, p.Category
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID;


23.
SELECT TOP 1 ProductID, ProductName, SellingPrice
FROM Products
ORDER BY SellingPrice DESC;

24.













