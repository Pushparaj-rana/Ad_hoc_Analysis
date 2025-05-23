/*Provide a report with all the unique product counts for each  segment  and 
sort them in descending order of product counts. The final output contains 
2 fields, 
segment 
product_count */

SELECT * FROM gdb023.dim_product;
select segment, count(*) as product_count from dim_product group by segment order by product_count desc;
select distinct segment from dim_product;