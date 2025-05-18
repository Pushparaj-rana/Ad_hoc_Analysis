/*Follow-up: Which segment had the most increase in unique products in 
2021 vs 2020? The final output contains these fields, 
segment 
product_count_2020 
product_count_2021 
difference */

SELECT * FROM gdb023.dim_product;

select dim_product.product_code, fact_sales_monthly.fiscal_year, sum(fact_sales_monthly.sold_quantity) from dim_product join fact_sales_monthly on dim_product.product_code = fact_sales_monthly.product_code  where fact_sales_monthly.fiscal_year='2020'  group by dim_product.product_code order by dim_product.product_code ;

select dim_product.product_code, fact_sales_monthly.fiscal_year, sum(fact_sales_monthly.sold_quantity) from dim_product join fact_sales_monthly on dim_product.product_code = fact_sales_monthly.product_code  where fact_sales_monthly.fiscal_year='2021'  group by dim_product.product_code order by dim_product.product_code;

select segment,product_code from dim_product;

select count(product_code) from dim_product;

with
query1 as(
	select dim_product.segment as Segment1, sum(fact_sales_monthly.sold_quantity)as product_count_2020 from dim_product join fact_sales_monthly on dim_product.product_code = fact_sales_monthly.product_code  where fact_sales_monthly.fiscal_year='2020'  group by dim_product.segment order by segment),
query2 as(
	select dim_product.segment as Segment2, sum(fact_sales_monthly.sold_quantity)as product_count_2021 from dim_product join fact_sales_monthly on dim_product.product_code = fact_sales_monthly.product_code  where fact_sales_monthly.fiscal_year='2021'  group by dim_product.segment order by segment)

select q1.Segment1, q1.product_count_2020,q2.product_count_2021,(q2.product_count_2021 - q1.product_count_2020) as differance from query1 q1 join query2 q2 on q1.Segment1=q2.Segment2;

with
query3 as(
	select dim_product.segment as segment3,dim_product.product_code as product_code3, fact_sales_monthly.fiscal_year, sum(fact_sales_monthly.sold_quantity) as product_count_2020 from dim_product join fact_sales_monthly on dim_product.product_code = fact_sales_monthly.product_code  where fact_sales_monthly.fiscal_year='2020'  group by dim_product.product_code, dim_product.segment /* if you not enter dim_product.segment in group by SQL shows FULL_GROUP_ERROR because SQL default work on full group by, here TOTAL No. of ROW of product_count_2020 are not same. so dim_product.segment must enter to show segment column */ order by dim_product.product_code),
query4 as(
	select dim_product.product_code as product_code4, fact_sales_monthly.fiscal_year, sum(fact_sales_monthly.sold_quantity) as product_count_2021 from dim_product join fact_sales_monthly on dim_product.product_code = fact_sales_monthly.product_code  where fact_sales_monthly.fiscal_year='2021'  group by dim_product.product_code order by dim_product.product_code)

select q3.segment3, q3.product_count_2020,q4.product_count_2021,(q4.product_count_2021 - q3.product_count_2020) as differance from query3 q3 cross join query4 q4 on q3.product_code3=q4.product_code4;