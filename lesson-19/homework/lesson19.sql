1.
      select id, name, salary 
      from employees
      where salary = (select min(salary)
      	from employees)

2.
        select id, product_name, price as avg_price
				  from products
			  	where price > (select AVG(price) from products)

3.
        select es.id, es.name, d.department_name
        from departments d
        join employeess es on d.id = es.department_id 
        where d.department_name = 'sales'

4.
        select c.customer_id, c.name
        from customers c
        left join orders o on o.customer_id = c.customer_id
        where o.customer_id is null

5.

        SELECT p.id, p.product_name, p.price, p.category_id
        FROM products p
        JOIN (
            SELECT category_id, MAX(price) AS max_price
            FROM products
            GROUP BY category_id
        ) max_prices
        ON p.category_id = max_prices.category_id AND p.price = max_prices.max_price;

6.

      select em.id, em.name, em.salary, ds.department_name 
      from departments ds
      join employees em on em.department_id = ds.id
      where salary > (select AVG(salary) from employees)




  7.
      select *
      from employees
      where salary > (select avg(salary) from employeese)


8.

    select * 
    from students s
    join grades g on g.student_id = s.student_id 
    where g.grade in (select max(g2.grade) from grades g2 group by (g2.course_id))








9.
  WITH RankedProducts AS (
    SELECT
        id,
        product_name,
        price,
        category_id,
        DENSE_RANK() OVER (PARTITION BY category_id ORDER BY price DESC) AS rank
    FROM products
)
SELECT id, product_name, price, category_id
FROM RankedProducts
WHERE rank = 3;

10.

WITH CompanyAvg AS (
    SELECT AVG(salary) AS avg_salary FROM employees
),

-- 2. Har bir bo‘lim uchun maksimal maoshni olish
DepartmentMax AS (
    SELECT department_id, MAX(salary) AS max_salary
    FROM employees
    GROUP BY department_id
)

-- 3. Tanlangan xodimlarni chiqarish
SELECT e.id, e.name, e.salary, e.department_id
FROM employees e
JOIN CompanyAvg c ON 1 = 1
JOIN DepartmentMax d ON e.department_id = d.department_id
WHERE e.salary > c.avg_salary
  AND e.salary < d.max_salary;









