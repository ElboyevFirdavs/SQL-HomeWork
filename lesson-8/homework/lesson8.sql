1.
SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;
2.
SELECT AVG(Price) AS AvgElectronicsPrice
FROM Products
WHERE Category = 'Electronics';
3.
SELECT * FROM Customers
WHERE City LIKE 'L%';
4.
SELECT * FROM Customers
WHERE Country LIKE '%A';
5.
SELECT MAX(Price) AS HighestPrice
FROM Products;
6.
SELECT ProductName, Quantity,
       IIF(Quantity < 30, 'Low Stock', 'Sufficient') AS StockStatus
FROM Products;
7.
SELECT ProductName, Quantity,
       IIF(Quantity < 30, 'Low Stock', 'Sufficient') AS StockStatus
FROM Products;

8.
  SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;

9.
SELECT MIN(Quantity) AS MinQuantity, MAX(Quantity) AS MaxQuantity
FROM Orders;
10.
SELECT DISTINCT CustomerID
FROM Orders
WHERE YEAR(OrderDate) = 2023

EXCEPT

SELECT DISTINCT CustomerID
FROM Invoices
WHERE YEAR(InvoiceDate) = 2023;

11.
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;

12.
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

13.
SELECT YEAR(OrderDate) AS OrderYear, AVG(Amount) AS AvgOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate);

14.
SELECT ProductName, Price,
       CASE
           WHEN Price < 100 THEN 'Low'
           WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
           ELSE 'High'
       END AS PriceGroup
FROM Products;

15..
SELECT DISTINCT City
FROM Customers
ORDER BY City;

16.
SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;

17..
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';


18.

SELECT ProductID FROM Products
INTERSECT
SELECT ProductID FROM Products_Discounted;



19.
SELECT TOP 3 CustomerID, SUM(Amount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;
20.

SELECT ProductID, ProductName
FROM Products
WHERE ProductID NOT IN (
    SELECT ProductID FROM Products_Discounted
);
21.


SELECT p.ProductName, COUNT(s.SaleID) AS TimesSold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName;



22.
SELECT TOP 5 ProductID, SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY ProductID
ORDER BY TotalQuantity DESC;


























