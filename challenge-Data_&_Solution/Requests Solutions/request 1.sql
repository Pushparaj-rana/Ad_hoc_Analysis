/* Provide the list of markets in which customer  "Atliq  Exclusive"  operates its 
business in the  APAC  region. */

SELECT * FROM gdb023.dim_customer;
select customer, market from dim_customer where customer = "Atliq exclusive" and region = 'APAC';