--6.Return how many fruits does each person have in individual fruit level

 select
    Name,
    SUM(case When Fruit = 'Apple' then 1 else 0 end) as Apple,
    SUM(case when Fruit = 'Orange' then 1 else 0 end) as Orange,
    SUM(case when Fruit = 'Banana' then 1 else 0 end) as Banana
from Fruits
group by Name
order by Name;

--7. Return older people in the family with younger ones

select distinct ParentId as OldestPerson 
from Family
where ParentId not in (select ChildID from Family)

--8. Write an SQL statement given the following requirements. For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas

SELECT *
FROM #Orders
WHERE DeliveryState = 'Texas'
  AND CustomerID IN (
      SELECT DISTINCT CustomerID
      FROM #Orders
      WHERE DeliveryState = 'California'
  );

--9.Insert the names of residents if they are missing

update #residents
set address = address + ' name=' + fullname
where address NOT LIKE '%name=%';




--15.

-- Barcha oylar ro'yxati
WITH AllMonths AS (
    SELECT DISTINCT MONTH(SaleDate) AS SaleMonth
    FROM Sales
)

SELECT DISTINCT s.EmployeeID
FROM Sales s
WHERE NOT EXISTS (
    SELECT 1
    FROM AllMonths m
    WHERE NOT EXISTS (
        SELECT 1
        FROM Sales s2
        WHERE s2.EmployeeID = s.EmployeeID
          AND MONTH(s2.SaleDate) = m.SaleMonth
    )
);


--13. 
SELECT 
    e.EmployeeName,
    e.Department,
    e.SalesAmount,
    e.SalesMonth,
    e.SalesYear
FROM 
    #EmployeeSales e
WHERE 
    e.SalesAmount > (
        SELECT AVG(e2.SalesAmount)
        FROM #EmployeeSales e2
        WHERE e2.Department = e.Department
    );




























