/* Get the complete report of the Gross sales amount for the customer  “Atliq 
Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
high-performing months and take strategic decisions. 
The final report contains these columns: 
Month 
Year 
Gross sales Amount */

SELECT month(fact_sales_monthly.date) as month_value,fact_sales_monthly.fiscal_year,sum(fact_sales_monthly.sold_quantity * fact_gross_price.gross_price) As gross_sales_amount FROM fact_sales_monthly join fact_gross_price on fact_sales_monthly.product_code = fact_gross_price.product_code and fact_sales_monthly.fiscal_year=fact_gross_price.fiscal_year join dim_customer on fact_sales_monthly.customer_code = dim_customer.customer_code where dim_customer.customer = 'atliq exclusive' group by fact_sales_monthly.date, fact_sales_monthly.fiscal_year order by month_value;

select distinct date from fact_sales_monthly;
SELECT fact_sales_monthly.date,fact_sales_monthly.fiscal_year,sum(fact_sales_monthly.sold_quantity * fact_gross_price.gross_price) As gross_sales_amount FROM fact_sales_monthly join fact_gross_price on fact_sales_monthly.product_code = fact_gross_price.product_code and fact_sales_monthly.fiscal_year=fact_gross_price.fiscal_year join dim_customer on fact_sales_monthly.customer_code = dim_customer.customer_code where dim_customer.customer = 'atliq exclusive' group by fact_sales_monthly.date, fact_sales_monthly.fiscal_year;