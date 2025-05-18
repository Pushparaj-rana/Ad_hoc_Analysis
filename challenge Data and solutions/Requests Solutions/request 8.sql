/* In which quarter of 2020, got the maximum total_sold_quantity? The final 
output contains these fields sorted by the total_sold_quantity, 
Quarter 
total_sold_quantity*/

SELECT * FROM gdb023.fact_sales_monthly;
select 
CASE
		WHEN Month(date) in (9,10,11) then 'quarter 1'
		WHEN Month(date) in (12,1,2) then 'quarter 2'
		when month(date) in (3,4,5) then 'quarter 3'
		else 'quarter 4'
end as Quarter,sum(sold_quantity) as total_sold_quantity from fact_sales_monthly where fiscal_year='2020' group by Quarter order by total_sold_quantity;