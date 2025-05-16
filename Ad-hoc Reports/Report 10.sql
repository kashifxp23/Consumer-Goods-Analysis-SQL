/* Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
The final output contains these fields: 
division, product_code, product, total_sold_quantity, rank_order */

WITH CTE1 as
(SELECT 
	p.division, p.product_Code, p.product, SUM(s.sold_quantity) as Quantity_sold
FROM dim_product p
JOIN fact_sales_monthly s using (product_Code)
WHERE s.fiscal_year = 2021
GROUP BY p.division, p.product_code, p.product
),
CTErank AS
(SELECT *, RANK() OVER(PARTITION BY Division ORDER BY Quantity_sold DESC) as Rank_Order
from CTE1)
SELECT 
	division, product_code, product, Quantity_sold, Rank_Order
FROM CTErank
WHERE Rank_Order<=3
ORDER BY Division, Rank_Order;