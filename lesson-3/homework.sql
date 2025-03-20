2. List four file formats that can be imported into SQL Server.
    CSV (Comma-Separated Values)
    TXT (Text File with Delimiters)
    XML (Extensible Markup Language)
    Excel (XLSX or XLS using OPENROWSET or SSIS)

3.Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
      CREATE TABLE Products (
        ProductID INT PRIMARY KEY,
        ProductName VARCHAR(50),
        Price DECIMAL(10,2)
       );


4.Insert three records into the Products table using INSERT INTO.
        INSERT INTO Products (ProductID, ProductName, Price)
          VALUES 
            (1, 'Laptop', 899.99),
            (2, 'Smartphone', 499.99),
            (3, 'Headphones', 79.99);
5.Explain the difference between NULL and NOT NULL with examples.
      NULL: Ustundagi qiymat yo'qligini bildiradi.
      NOT NULL: Ustun NULL qiymatiga ega bo'lmasligini ta'minlaydi.
        CREATE TABLE Employees (
          EmployeeID INT PRIMARY KEY,
          Name VARCHAR(50) NOT NULL,  --  (NOT NULL)
          Email VARCHAR(100) NULL      --  (NULL allowed)
      );


6. Add a UNIQUE constraint to the ProductName column in the Products table.
        ALTER TABLE Products  
        ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);


7.Write a comment in a SQL query explaining its purpose.

      -- Selecting all records from the Products table

8.Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.

        CREATE TABLE Categories (
            CategoryID INT PRIMARY KEY,
            CategoryName VARCHAR(50) UNIQUE
        );


9.Explain the purpose of the IDENTITY column in SQL Server.
        Right-click on the database in SSMS → Select Tasks → Click Export Data.
        Choose SQL Server Native Client as the data source.
        Select Flat File Destination as the destination.
        Specify the file path, choose CSV format, and define delimiters.
        Complete the wizard to export data.

10.



11.Create a FOREIGN KEY in the Products table that references the Categories table.
        ALTER TABLE Products
        ADD CONSTRAINT FK_Category
        FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

13.Add a CHECK constraint to the Products table ensuring Price > 0.
  
        ALTER TABLE Products
        ADD CONSTRAINT CHK_Price CHECK (Price > 0);


