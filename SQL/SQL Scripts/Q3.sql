USE gdb023;

SELECT segment, count(DISTINCT product_code) AS product_count
FROM dim_product
GROUP BY segment;
