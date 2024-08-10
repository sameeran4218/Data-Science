SELECT product, manufacturing_cost FROM
fact_manufacturing_cost f JOIN dim_product d
ON
f.product_code=d.product_code
WHERE manufacturing_cost=(SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost)
or manufacturing_cost=(SELECT MIN (manufacturing_cost) FROM fact_manufacturing_cost)
