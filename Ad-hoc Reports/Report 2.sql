/* What is the percentage of unique product increase in 2021 vs. 2020? 
The final output contains these fields, unique_products_2020 unique_products_2021 percentage_chg */

WITH Cte1 as(
SELECT COUNT(distinct(s.product_code)) AS `Unique Products 2021`
FROM fact_sales_monthly s
WHERE fiscal_year=2021),

CTE2 as (
SELECT COUNT(distinct(s.product_code)) AS `Unique Products 2020`
FROM fact_sales_monthly s
WHERE fiscal_year=2020)

SELECT *, 
	ROUND((`Unique Products 2021`-`Unique Products 2020`)*100/`Unique Products 2020`, 2) AS `% Change`
FROM CTE1 CROSS JOIN CTE2;
