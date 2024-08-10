SELECT
  CASE
    WHEN EXTRACT(MONTH FROM sm.date) IN (9, 10, 11) AND EXTRACT(YEAR FROM sm.date) = 2020 THEN 'Q1'
    WHEN EXTRACT(MONTH FROM sm.date) IN (12, 1, 2) AND EXTRACT(YEAR FROM sm.date) = 2020 THEN 'Q2'
    WHEN EXTRACT(MONTH FROM sm.date) IN (3, 4, 5) AND EXTRACT(YEAR FROM sm.date) = 2020 THEN 'Q3'
    WHEN EXTRACT(MONTH FROM sm.date) IN (6, 7, 8) AND EXTRACT(YEAR FROM sm.date) = 2020 THEN 'Q4'
  END AS quarter,
  SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly AS sm
GROUP BY quarter
ORDER BY total_sold_quantity DESC;
