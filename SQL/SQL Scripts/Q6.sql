USE gdb023;

WITH result AS (
  SELECT 
    gross_price, 
    EXTRACT(YEAR FROM date) as year, EXTRACT(MONTH FROM date) AS month, 
    (gp.gross_price * sm.sold_quantity) AS gross_sales_amount 
  FROM 
    fact_sales_monthly sm 
  JOIN 
    fact_gross_price gp ON sm.product_code = gp.product_code
) 

SELECT 
  month, 
  year, 
  SUM(gross_sales_amount) 
FROM 
  result 
GROUP BY 
  month, year;
