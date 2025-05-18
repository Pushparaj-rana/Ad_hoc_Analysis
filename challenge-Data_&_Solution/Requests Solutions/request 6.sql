/*Generate a report which contains the top 5 customers who received an 
average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
Indian  market. The final output contains these fields, 
customer_code 
customer 
average_discount_percentage*/

SELECT dim_customer.customer_code, dim_customer.customer, round(AVG((fact_pre_invoice_deductions.pre_invoice_discount_pct)*100),2) as average_discount_percentage FROM dim_customer join fact_pre_invoice_deductions on dim_customer.customer_code = fact_pre_invoice_deductions.customer_code where fact_pre_invoice_deductions.fiscal_year = '2021' and dim_customer.market = 'india' group by customer,customer_code order by average_discount_percentage desc limit 5 ;




