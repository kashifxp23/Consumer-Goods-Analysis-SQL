/* Which channel helped to bring more gross sales in the fiscal year 2021 
and the percentage of contribution? 
The final output contains these fields: channel, gross_sales_mln, percentage */

With OUTPUT AS
(SELECT 
c.channel, 
ROUND(SUM(s.sold_quantity * g.gross_price/1000000),2) as `Gross Sales Mln` 
FROM dim_customer c
JOIN fact_sales_monthly s 
USING (Customer_code)
JOIN fact_gross_price g 
USING (product_code)
WHERE s.fiscal_year = 2021
GROUP BY c.Channel),
TotalSales AS
(SELECT SUM(`Gross Sales Mln`) AS Total FROM OUTPUT)
SELECT Channel, CONCAT(o.`Gross Sales Mln`, ' M') AS gross_sales_mln,
  CONCAT(ROUND(o.`Gross Sales Mln` * 100 / t.total, 2), ' %') AS percentage
FROM Output o
CROSS JOIN TotalSales t
ORDER BY o.`Gross Sales Mln` DESC;