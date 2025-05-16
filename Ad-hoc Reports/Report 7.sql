/* Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month . 
This analysis helps to get an idea of low and high-performing months and take strategic decisions. 
The final report contains these columns: Month, Year, Gross sales Amount */

select * from fact_sales_monthly;
select * from dim_customer;
select * from fact_gross_price;

select 
	Month (s.date) as Month,
	Year (s.date) as Year,
    round(sum(g.gross_price * s.sold_quantity), 2) as `Gross Sales Amount`
FROM fact_sales_monthly s
JOIN fact_gross_price g
	USING (product_code)
JOIN dim_customer c 	
	USING (customer_code)
WHERE c.customer = "Atliq Exclusive"
	GROUP BY YEAR, MONTH
	ORDER BY YEAR, MONTH;
