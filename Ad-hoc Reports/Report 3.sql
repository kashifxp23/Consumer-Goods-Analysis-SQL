/* Provide a report with all the unique product counts for each segment 
and sort them in descending order of product counts. 
The final output contains 2 fields, segment product_count */

SELECT Segment, COUNT(distinct(p.product_code)) AS Count
FROM dim_product p
GROUP BY Segment
ORDER BY Count desc;