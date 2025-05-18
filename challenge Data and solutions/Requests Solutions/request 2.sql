/*What is the percentage of unique product increase in 2021 vs. 2020? The 
final output contains these fields, 
	unique_products_2020 
	unique_products_2021 
	percentage_chg */

with 
Query1 as (
	SELECT count(product_code) as unique_products_2020 FROM fact_gross_price where fiscal_year='2020' group by "product_code"
),
Query2 as (
	SELECT count(product_code) as unique_products_2021 FROM fact_gross_price where fiscal_year='2021' group by "product_code"
)

select q1.unique_products_2020, q2.unique_products_2021,((q2.unique_products_2021-q1.unique_products_2020)/q1.unique_products_2020)*100 as percentage_chg from Query1 q1, Query2 q2;
