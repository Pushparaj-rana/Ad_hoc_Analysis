/*Which channel helped to bring more gross sales in the fiscal year 2021 
and the percentage of contribution?  The final output  contains these fields, 
channel 
gross_sales_mln 
percentage */

with
Query1 As (
		SELECT dim_customer.channel as channel1, sum(fact_sales_monthly.sold_quantity*fact_gross_price.gross_price) as gross_sales_mln FROM fact_sales_monthly join dim_customer on fact_sales_monthly.customer_code=dim_customer.customer_code join fact_gross_price on fact_sales_monthly.product_code=fact_gross_price.product_code where fact_gross_price.fiscal_year='2021' group by channel
        )
select q1.channel1, q1.gross_sales_mln, round(((q1.gross_sales_mln*100)/sum(q1.gross_sales_mln)over()),2) as percentage from Query1 q1 order by percentage desc;