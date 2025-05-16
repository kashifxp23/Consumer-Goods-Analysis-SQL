/* Generate a report which contains the top 5 customers 
who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. 
The final output contains these fields: customer_code, customer, average_discount_percentage */

SELECT c.customer_code, c.customer, round(avg(p.pre_invoice_discount_pct),4) as `Avg Discount %`	 
FROM dim_customer c
JOIN fact_pre_invoice_deductions p
USING (customer_code)
Where p.fiscal_year= 2021 and c.Market= 'India'
GROUP BY c.customer_code, c.customer
ORDER BY `Avg Discount %` DESC
LIMIT 5;
