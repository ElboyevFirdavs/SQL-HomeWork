1 Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
    CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

2. Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
   a) INSERT INTO Employees (EmpID, Name, Salary)
      VALUES (1, 'Ali Karimov', 50000.00);
    

   b) INSERT INTO Employees (EmpID, Name, Salary)
      VALUES 
      (2, 'Dilshod Nazarov', 60000.00),
      (3, 'Malika Raufova', 70000.00);

3. Update the Salary of an employee where EmpID = 1.
UPDATE Employees
SET Salary = 55000.00
WHERE EmpID = 1;

4.Delete a record from the Employees table where EmpID = 2.
DELETE FROM Employees
WHERE EmpID = 2;

5.Demonstrate the difference between DELETE, TRUNCATE, and DROP commands on a test table.
  -- Create test table:
CREATE TABLE TestTable (
    ID INT,
    Data VARCHAR(50)
);

-- Insert test data:
INSERT INTO TestTable VALUES (1, 'A'), (2, 'B');

-- DELETE: faqat ma'lumotlarni o‘chiradi (strukturani saqlaydi):
DELETE FROM TestTable;

-- TRUNCATE: barcha ma'lumotlarni tezda o‘chiradi (log yozmaydi):
TRUNCATE TABLE TestTable;

-- DROP: butun jadvalni o‘chiradi (strukturasi bilan birga):
DROP TABLE TestTable;


6.Modify the Name column in the Employees table to VARCHAR(100).

ALTER TABLE Employees
MODIFY Name VARCHAR(100);   -- MySQL

-- Agar siz SQL Serverda bo‘lsangiz:
-- ALTER TABLE Employees
-- ALTER COLUMN Name VARCHAR(100);

7. Add a new column Department (VARCHAR(50)) to the Employees table.
ALTER TABLE Employees
ADD Department VARCHAR(50);



8.Change the data type of the Salary column to FLOAT.
ALTER TABLE Employees
MODIFY Salary FLOAT;   

-- SQL Server uchun:
-- ALTER TABLE Employees
-- ALTER COLUMN Salary FLOAT;

9.Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

10.Remove all records from the Employees table without deleting its structure.
DELETE FROM Employees;
-- Yoki TRUNCATE TABLE Employees;
11.

INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT DISTINCT id, name
FROM OldDepartments
LIMIT 5;  -- faqat 5 ta yozuv
12.
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;



13.
DELETE FROM Employees;
-- yoki TRUNCATE TABLE Employees;

14.
ALTER TABLE Employees
DROP COLUMN Department;


15.
ALTER TABLE Employees
RENAME TO StaffMembers;

EXEC sp_rename 'Employees', 'StaffMembers';


16.
DROP TABLE Departments;
17.
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Description TEXT
);
18.
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

19.
ALTER TABLE Products
RENAME COLUMN Category TO ProductCategory;

-- SQL Server
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

20.
  INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES 
(1, 'Laptop', 'Electronics', 1200.00, 'High-end laptop'),
(2, 'Office Chair', 'Furniture', 150.00, 'Ergonomic chair'),
(3, 'Wireless Mouse', 'Electronics', 25.50, 'Bluetooth mouse'),
(4, 'Notebook', 'Stationery', 3.75, 'A5 lined notebook'),
(5, 'Desk Lamp', 'Electronics', 45.00, 'LED desk lamp');


21.SELECT * INTO Products_Backup
FROM Products;

22.
ALTER TABLE Products
RENAME TO Inventory;

-- SQL Server
EXEC sp_rename 'Products', 'Inventory';

23.
ALTER TABLE Inventory
MODIFY Price FLOAT;
-- SQL Server
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

24.
-- SQL Server
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;










































































