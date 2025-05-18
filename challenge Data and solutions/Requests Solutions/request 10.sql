/* Get the Top 3 products in each division that have a high 
total_sold_quantity in the fiscal_year 2021? The final output contains these 
fields, 
division 
product_code 
codebasics.io 
product 
total_sold_quantity 
rank_order */

SELECT * FROM gdb023.dim_product;
SELECT distinct division FROM gdb023.dim_product;

with 
Query1 as (select dim_product.division, dim_product.product_code,dim_product.product,sum(fact_sales_monthly.sold_quantity) as total_sold_quantity from dim_product join fact_sales_monthly on dim_product.product_code = fact_sales_monthly.product_code where fact_sales_monthly.fiscal_year = '2021' group by dim_product.product_code,dim_product.division,dim_product.product )

/*here we make first table with rank_order-->   

select q1.division,q1.product_code,q1.product,q1.total_sold_quantity, (rank()over(partition by q1.division order by q1.total_sold_quantity desc)) as rank_order from Query1 q1 

Then -->
limit those rank_order by limit 3, here above query store as rankedData in below query*/


select rankedData.division,rankedData.product_code,rankedData.product,rankedData.total_sold_quantity,rank_order from ( select q1.division,q1.product_code,q1.product,q1.total_sold_quantity, (rank()over(partition by q1.division order by q1.total_sold_quantity desc)) as rank_order from Query1 q1) as rankedData where rank_order <=3;