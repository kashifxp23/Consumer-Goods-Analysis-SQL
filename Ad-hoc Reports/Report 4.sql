/* Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? 
The final output contains these fields, 
segment, product_count_2020, product_count_2021, difference*/

With CTE1 as
(SELECT p.segment,
		COUNT(DISTINCT(s.product_Code)) AS product_count_2020 
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code = p.product_code
WHERE fiscal_year = 2020
GROUP BY fiscal_year, p.segment),

CTE2 as
(SELECT p.segment,
		COUNT(DISTINCT(s.product_Code)) AS product_count_2021 
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code = p.product_code
WHERE fiscal_year = 2021
GROUP BY fiscal_year, p.segment)

Select 
	segment, 
	product_count_2020,
	product_count_2021,
    product_count_2021 - product_count_2020 as `Difference`
FROM CTE1 JOIN CTE2
USING (segment)
ORDER BY `Difference` desc
;
