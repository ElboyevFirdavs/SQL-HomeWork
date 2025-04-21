--1.You need to write a query that outputs "100-Steven King", meaning emp_id + first_name + last_name in that format using employees table.
	select CONCAT_WS(' ', Employee_ID, '-', first_name, last_name )
	from Employees
	
--2.Update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'
select * from Employees

select REPLACE(Employees.PHONE_NUMBER, '124', '999')
FROM Employees

--3.That displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'.
-- Give each column an appropriate label. Sort the results by the employees' first names.(Employees)
		select first_name, LEN(first_name) NameLength
		from Employees
		where LEFT(first_name, 1) in ('a', 'J', 'M')
		order by FIRST_NAME

--4. Write an SQL query to find the total salary for each manager ID.(Employees table)
	
	SELECT 
    M.first_name AS ManagerName, SUM(E.salary) AS TotalEmployeeSalary
FROM 
    Employees E
INNER JOIN 
    Employees M ON E.manager_id = M.employee_id
GROUP BY 
    M.first_name, M.salary
ORDER BY 
    ManagerName;


--5.Write a query to retrieve the year and the highest value from the columns Max1, Max2, and Max3 for each row in the TestMax table
SELECT 
    year1, 
    (SELECT MAX(val)
     FROM (VALUES (Max1), (Max2), (Max3)) AS ValueList(val)
    ) AS HighestValue
FROM 
    TestMax;


	select year1, 
		(select MAX(val) from (values (max1), (max2), (max3)) as valuelist(val)) as highestValue
		from TestMax;


		--.6.Find me odd numbered movies description is not boring.(cinema)

		select * from cinema

		select  *
		from cinema
		where id % 2=1 and description !='boring'


		--7..You have to sort data based on the Id but Id with 0 should always be the last row.
		--Now the question is can you do that with a single order by column.(SingleOrder)
		select * from SingleOrder
		
		select * from SingleOrder
		order by (case when id = 0 then 9 else id end)

		--8.Write an SQL query to select the first non-null value from a set of columns.
		-- If the first column is null, move to the next, and so on. If all columns are null, return null.(person)
		select * from person


		SELECT id,
		COALESCE(ssn, passportid, itin) AS FirstNonNullValue
		FROM person;


-- 9.Find the employees who have been with the company for more than 10 years, but less than 15 years. Display their Employee ID,
	-- First Name, Last Name, Hire Date, and the Years of Service (calculated as the number of years between the current date and the hire date,
	-- rounded to two decimal places).(Employees)

	SELECT 
    Employee_ID,
    First_Name,
    Last_Name,
    Hire_Date,
    ROUND(DATEDIFF(DAY, Hire_Date, GETDATE()) / 365.0, 2) AS Years_of_Service
FROM 
    Employees
WHERE 
    DATEDIFF(DAY, Hire_Date, GETDATE()) / 365.0 > 10
    AND DATEDIFF(DAY, Hire_Date, GETDATE()) / 365.0 < 15;


	--10.Find the employees who have a salary greater than the average salary of their respective department.(Employees)
	select * from Employees

	SELECT 
    E.Employee_ID,
    E.First_Name,
    E.Salary
FROM 
    Employees E
WHERE 
    E.Salary > (
        SELECT AVG(Salary)
        FROM Employees
        WHERE Department_ID = E.Department_ID
    );
