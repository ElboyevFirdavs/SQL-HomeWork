1.

SELECT 
    p.firstName, 
    p.lastName, 
    a.city, 
    a.state
FROM 
    Person p
LEFT JOIN 
    Address a
ON 
    p.personId = a.personId;
2.
SELECT 
    e1.name AS Employee
FROM 
    Employee e1
JOIN 
    Employee e2 
ON 
    e1.managerId = e2.id
WHERE 
    e1.salary > e2.salary;
3.
SELECT 
    email AS Email
FROM 
    Person
GROUP BY 
    email
HAVING 
    COUNT(email) > 1;
4.
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);

5.
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);

6.
SELECT 
    CustomerID,                             -- Mijoz IDsi
    SUM(TotalAmount) AS TotalAmountOver50,  -- 50 dan ortiq og‘irlikdagi buyurtmalar umumiy summasi
    MIN(Weight) AS LeastWeight              -- 50 dan ortiq og‘irlikdagi eng kichik og‘irlik
FROM Sales.Orders
WHERE Weight > 50                           -- Faqat og‘irligi 50 dan katta bo‘lgan buyurtmalar
GROUP BY CustomerID;                        -- Har bir mijoz bo‘yicha
7.
SELECT 
    MatchID,
    Match,
    CASE 
        WHEN CAST(LEFT(Score, CHARINDEX(':', Score) - 1) AS INT) > 
             CAST(RIGHT(Score, LEN(Score) - CHARINDEX(':', Score)) AS INT)
            THEN LEFT(Match, CHARINDEX('-', Match) - 1)

        WHEN CAST(LEFT(Score, CHARINDEX(':', Score) - 1) AS INT) < 
             CAST(RIGHT(Score, LEN(Score) - CHARINDEX(':', Score)) AS INT)
            THEN RIGHT(Match, LEN(Match) - CHARINDEX('-', Match))

        ELSE 'Draw'
    END AS Result
FROM Matches;

9.
SELECT name AS Customers
FROM Customers
WHERE id NOT IN (
    SELECT customerId FROM Orders
);

10.
  SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

