
USE gdb023;
WITH ranked_products AS(
SELECT p.product, SUM(sm.sold_quantity) as total_sold_quantity,p.division,
ROW_NUMBER() OVER (PARTITION BY p.division ORDER BY sum(sm.sold_quantity) DESC) AS ranked FROM dim_product p JOIN fact_sales_monthly sm ON p.product_code=sm.product_code
WHERE EXTRACT(YEAR FROM sm.date)=2021
GROUP BY p.division,p.product)
SELECT product, total_sold_quantity,division
FROM ranked_products
WHERE ranked<=3
ORDER BY total_sold_quantity DESC