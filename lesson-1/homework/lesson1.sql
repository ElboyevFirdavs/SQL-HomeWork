1. Define the following terms: data, database, relational database, and table.
  Data: Raw, unorganized facts, figures, and information that can be processed. 
  Database: A structured, organized collection of data, typically stored electronically, designed for efficient storage, retrieval, and management
  Relational Database: A database that organizes data into tables with rows and columns, where relationships between data are established through shared values or keys. 
  Table: A structured format for organizing data in a relational database, consisting of rows and columns, where each row represents a record and each column represents an attribute. 
  
  2.List five key features of SQL Server.
    High Availability & Disaster Recovery (HADR) – Ensures database availability through features like Always On Availability Groups, Failover Clustering, and Log Shipping.
    
    Security & Compliance – Provides Authentication (Windows & SQL Server), Row-Level Security (RLS), Transparent Data Encryption (TDE), and Dynamic Data Masking (DDM) for data protection.
    
    Scalability & Performance Optimization – Supports In-Memory OLTP, Indexing, Query Optimizer, and Partitioning for faster and efficient data retrieval.

    Business Intelligence (BI) & Analytics – Includes SQL Server Reporting Services (SSRS), SQL Server Analysis Services (SSAS), and integration with Power BI for data visualization.

    Integration Services (SSIS) – Supports ETL (Extract, Transform, Load) operations to integrate data from multiple sources into a central database.

3. What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
    Windows Authentication Mode – Uses Windows user credentials (Active Directory) to authenticate users. It is more secure as it relies on Windows security policies.
    SQL Server Authentication Mode – Requires a separate SQL Server username and password stored within SQL Server. This mode is useful for non-Windows users or external applications.

4.
5.
create database SchoolDB
create table Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);


6.Describe the differences between SQL Server, SSMS, and SQL.
    SQL Server is the database system that stores and processes data.
    SSMS is a tool to manage SQL Server visually.
    SQL is the language used to communicate with SQL Server.

7.Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
    DQL (Data Query Language)-------------SELECT
    DML (Data Manipulation Language)---I--NSERT, UPDATE, DELETE
    DDL (Data Definition Language)-------CREATE, ALTER, DROP, TRUNCATE
    DCL (Data Control Language)----------GRANT, REVOKE
    TCL (Transaction Control Language)---COMMIT, ROLLBACK, SAVEPOINT

8.Write a query to insert three records into the Students table.

  create database SchoolDB
create table Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);


INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Ali', 20);
INSERT INTO Students (StudentID, Name, Age) VALUES (2, 'Olim', 22);
INSERT INTO Students (StudentID, Name, Age) VALUES (3, 'Nodira', 21);
SELECT * FROM Students;
