/*Get the products that have the highest and lowest manufacturing costs. 
The final output should contain these fields, 
product_code 
product 
manufacturing_cost */

SELECT * FROM gdb023.fact_manufacturing_cost;

SELECT fact_manufacturing_cost.product_code, dim_product.product, fact_manufacturing_cost.manufacturing_cost FROM fact_manufacturing_cost join dim_product on fact_manufacturing_cost.product_code = dim_product.product_code
	WHERE fact_manufacturing_cost.manufacturing_cost = (
		SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost
	) 
	OR fact_manufacturing_cost.manufacturing_cost = (
		SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost
	) order by fact_manufacturing_cost.manufacturing_cost desc;