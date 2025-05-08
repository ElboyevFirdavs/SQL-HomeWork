--1. Compute Running Total Sales per Customer

		select *, sum(total_amount) 
		over(partition by customer_ID order by product_category ) as TotalSales
		from sales_data

--2. Count the Number of Orders per Product Category

		SELECT 
			product_category,
			COUNT(sale_id) AS total_orders
		FROM sales_data
		GROUP BY product_category
		ORDER BY total_orders DESC;

--3. Find the Maximum Total Amount per Product Category

		select *,
		max(total_amount)
		over(partition by product_category ) as TM 
		from sales_data

--4. Find the Minimum Price of Products per Product Category
		select *,
		min(total_amount)
		over(partition by product_category ) as TM 
		from sales_data
--5. Compute the Moving Average of Sales of 3 days (prev day, curr day, next day)

		select *,
			AVG(total_amount) 
			over ( order by  order_date rows between  1 preceding and 1 following) as moving_avg_3_days
		from sales_data;

--6. Find the Total Sales per Region
			select * ,
			SUM(total_amount)
			over(partition by region order by order_date)
			from sales_data

--7. Compute the Rank of Customers Based on Their Total Purchase Amount
		select *, RANK() over( order by total_amount desc) as Purchase_amount
		from sales_data

--8. Calculate the Difference Between Current and Previous Sale Amount per Customer


--9. Find the Top 3 Most Expensive Products in Each Category
select * 
from (
	select *,
		rank() over( partition by product_category order by unit_price
		) as price_rank
	from sales_data
) as rp
where price_rank<=3


--10. Compute the Cumulative Sum of Sales Per Region by Order Date
		select *, 
		sum(total_amount)
		over(partition by region order by order_date) as SalesRegion
		from sales_data

--11. Compute Cumulative Revenue per Product Category

select *,
sum(total_amount)
over(partition by product_category order by order_date) as Revenu
from sales_data

--15.
SELECT customer_id, customer_name
FROM sales_data
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT product_category) > 1;

--16.
WITH customer_spending AS (
    SELECT 
        customer_id,
        customer_name,
        region,
        SUM(total_amount) AS total_spent
    FROM sales_data
    GROUP BY customer_id, customer_name, region
),
region_avg AS (
    SELECT 
        region,
        AVG(total_spent) AS avg_spent
    FROM customer_spending
    GROUP BY region
)
SELECT 
    cs.customer_id,
    cs.customer_name,
    cs.region,
    cs.total_spent,
    ra.avg_spent
FROM customer_spending cs
JOIN region_avg ra ON cs.region = ra.region
WHERE cs.total_spent > ra.avg_spent;


--17.
SELECT 
    customer_id,
    customer_name,
    region,
    SUM(total_amount) AS total_spent,
    RANK() OVER (
        PARTITION BY region
        ORDER BY SUM(total_amount) DESC
    ) AS spending_rank
FROM sales_data
GROUP BY customer_id, customer_name, region;

--18.
SELECT 
    customer_id,
    customer_name,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM sales_data;


--19.
WITH monthly_sales AS (
    SELECT 
        customer_id,
        customer_name,
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS total_sales
    FROM sales_data
    GROUP BY customer_id, customer_name, YEAR(order_date), MONTH(order_date)
)
SELECT 
    customer_id,
    customer_name,
    year,
    month,
    total_sales,
    LAG(total_sales) OVER (
        PARTITION BY customer_id ORDER BY year, month
    ) AS previous_month_sales,
    CASE 
        WHEN LAG(total_sales) OVER (PARTITION BY customer_id ORDER BY year, month) IS NOT NULL 
        THEN (total_sales - LAG(total_sales) OVER (PARTITION BY customer_id ORDER BY year, month)) / LAG(total_sales) OVER (PARTITION BY customer_id ORDER BY year, month) * 100
        ELSE NULL
    END AS growth_rate
FROM monthly_sales;

--19.
WITH monthly_sales AS (
    SELECT 
        customer_id,
        customer_name,
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS total_sales
    FROM sales_data
    GROUP BY customer_id, customer_name, YEAR(order_date), MONTH(order_date)
)
SELECT 
    customer_id,
    customer_name,
    year,
    month,
    total_sales,
    LAG(total_sales) OVER (
        PARTITION BY customer_id ORDER BY year, month
    ) AS previous_month_sales,
    CASE 
        WHEN LAG(total_sales) OVER (PARTITION BY customer_id ORDER BY year, month) IS NOT NULL 
        THEN (total_sales - LAG(total_sales) OVER (PARTITION BY customer_id ORDER BY year, month)) / LAG(total_sales) OVER (PARTITION BY customer_id ORDER BY year, month) * 100
        ELSE NULL
    END AS growth_rate
FROM monthly_sales;

