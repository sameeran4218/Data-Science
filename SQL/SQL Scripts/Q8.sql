USE gdb023;

WITH result AS (
  SELECT 
    c.channel, 
    SUM(gp.gross_price*sm.sold_quantity)/1000000 AS gross_sales_mln
  FROM 
    fact_sales_monthly sm 
  JOIN 
    fact_gross_price gp ON sm.product_code= gp.product_code
  JOIN 
    dim_customer c ON sm.customer_code=c.customer_code
  WHERE 
    EXTRACT(YEAR FROM sm.date)=2021
  GROUP BY 
    c.channel
),

total_sales AS (
  SELECT 
    SUM(gross_sales_mln) as total_sales_mln 
  FROM 
    result
)

SELECT 
  channel, 
  gross_sales_mln, 
  (gross_sales_mln/total_sales_mln)*100 as percentage 
FROM 
  result, total_sales;
