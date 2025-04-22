
--Easy Tasks
--1.Write a SQL query to split the Name column by a comma into two separate columns: Name and Surname.(TestMultipleColumns)
	select * from TestMultipleColumns

	SELECT
    LTRIM(RTRIM(LEFT(Name, CHARINDEX(',', Name) - 1))) AS Name,
    LTRIM(RTRIM(SUBSTRING(Name, CHARINDEX(',', Name) + 1, LEN(Name)))) AS Surname
FROM TestMultipleColumns
WHERE CHARINDEX(',', Name) > 0;






--2.Write a SQL query to find strings from a table where the string itself contains the % character.(TestPercent)
	SELECT * FROM TestPercent

	SELECT *
FROM TestPercent
WHERE TestPercent LIKE '%[%]%';


--3.In this puzzle you will have to split a string based on dot(.).(Splitter)

select * from Splitter

SELECT
    LEFT(Vals, CHARINDEX('.', Vals) - 1) AS Part1,
    SUBSTRING(Vals, CHARINDEX('.', Vals) + 1, LEN(Vals)) AS Part2
FROM Splitter
WHERE CHARINDEX('.', Vals) > 0;


--4.Write a SQL query to replace all integers (digits) in the string with 'X'.(1234ABC123456XYZ1234567890ADS)

	SELECT ('1234ABC123456XYZ1234567890ADS', '[0-9]', 'X') AS ReplacedText


--5.Write a SQL query to return all rows where the value in the Vals column contains more than two dots (.).(testDots)

	select *
	from testDots
	where LEN(Vals) - LEN(REPLACE(vals, '.', '')) > 2

--6.Write a SQL query to count the occurrences of a substring within a string in a given column.(Not table)

	

--7.Write a SQL query to count the spaces present in the string.(CountSpaces)



	select * ,LEN(texts) - LEN(REPLACE(texts, ' ',''))
	from CountSpaces



--8.write a SQL query that finds out employees who earn more than their managers.(Employee)
	


SELECT *, e.Id, e.Name as EmployeeName, e.Salary as employeesSalary, e.ManagerId
FROM Employee e
JOIN Employee m ON e.Id = m.ManagerId
WHERE e.Salary > m.Salary;



--Medium Tasks
--1.Write a SQL query to separate the integer values and the character values into two different columns.(SeperateNumbersAndCharcters)

	select * from SeperateNumbersAndCharcters

SELECT 
    Value,

    -- Faqat raqamlar (0-9)
    REPLACE(
        TRANSLATE(Value, 
            'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
            REPLICATE(' ', 52)
        ), ' ', ''
    ) AS Numbers,

    -- Faqat harflar (A-Z, a-z)
    REPLACE(
        TRANSLATE(Value, 
            '0123456789',
            REPLICATE(' ', 10)
        ), ' ', ''
    ) AS Characters

FROM SeperateNumbersAndCharcters;


--2.write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.(weather)
	SELECT w1.Id
FROM weather w1
JOIN weather w2 ON DATEDIFF(DAY, w2.RecordDate, w1.RecordDate) = 1
WHERE w1.Temperature > w2.Temperature;


--3.Write a SQL query that reports the device that is first logged in for each player.(Activity)
	select * from Activity

	SELECT Player_Id, device_id
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY Player_Id ORDER BY event_date) AS rn
    FROM Activity
) AS sub
WHERE rn = 1;


--4.Write an SQL query that reports the first login date for each player.(Activity)
	SELECT Player_Id, MIN(event_date) AS FirstLogin
FROM Activity
GROUP BY player_id;

--5.Your task is to split the string into a list using a specific separator (such as a space, comma, etc.), and then return the third item from that list.(fruits)
	select * from fruits

	SELECT 
    fruit_list
    STRING_SPLIT(fruit_list, ',') AS Item -- bu faqat 1-qatorli SELECT uchun ishlaydi
FROM fruits;

--6.Write a SQL query to create a table where each character from the string will be converted into a row, with each row having a single column.(sdgfhsdgfhs@121313131)
	WITH nums AS (
    SELECT TOP (LEN('sdgfhsdgfhs@121313131'))
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects
)
SELECT 
    SUBSTRING('sdgfhsdgfhs@121313131', n, 1) AS Character
FROM nums;

--7.You are given two tables: p1 and p2. Join these tables on the id column. The catch is: when the value of p1.code is 0, replace it with the value of p2.code.(p1,p2)
	SELECT 
    p1.id,
    CASE 
        WHEN p1.code = 0 THEN p2.code
        ELSE p1.code
    END AS code
FROM p1
JOIN p2 ON p1.id = p2.id;

--8.You are given a sales table. Calculate the week-on-week percentage of sales per area for each financial week. For each week, the total sales will be considered 100%, and the percentage sales for each day of the week should be calculated based on the area sales for that week.(WeekPercentagePuzzle)
	select * from WeekPercentagePuzzle

	WITH WeekSales AS (
    SELECT 
        Area,
        DATEPART(WEEK, SaleDate) AS WeekNum,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY Area, DATEPART(WEEK, SaleDate)
),
AllSales AS (
    SELECT 
        s.Area,
        s.SaleDate,
        DATEPART(WEEK, s.SaleDate) AS WeekNum,
        s.SalesAmount,
        ws.TotalSales
    FROM Sales s
    JOIN WeekSales ws 
        ON DATEPART(WEEK, s.SaleDate) = ws.WeekNum AND s.Area = ws.Area
)
SELECT 
    Area,
    SaleDate,
    WeekNum,
    ROUND((SalesAmount * 100.0) / TotalSales, 2) AS SalePercent
FROM AllSales;

--Difficult Tasks
--1.In this puzzle you have to swap the first two letters of the comma separated string.(MultipleVals)
	select * from MultipleVals

	SELECT 
    Vals,
    STUFF(Vals, 1, 3, SUBSTRING(Vals, 3, 1) + SUBSTRING(Vals, 2, 1) + ',') AS Swapped
FROM MultipleVals;
--2.Find a string where all characters are the same and the length is greater than 1.(FindSameCharacters)
	SELECT Vals
FROM FindSameCharacters
WHERE LEN(Vals) > 1 AND LEN(REPLACE(Vals, LEFT(Vals, 1), '')) = 0;

--3.Write a T-SQL query to remove the duplicate integer values present in the string column. Additionally, remove the single integer character that appears in the string.(RemoveDuplicateIntsFromNames)
	

--4.Find a string where all characters are the same and the length is greater than 1.(FindSameCharacters)



--5.Write a SQL query to extract the integer value that appears at the start of the string in a column named Vals.(GetIntegers)

	select * from GetIntegers

	SELECT 
    Vals,
    LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'a') - 1) AS StartingInteger
FROM GetIntegers
WHERE ISNUMERIC(LEFT(Vals, 1)) = 1;
