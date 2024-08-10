USE gdb023;
SELECT customer, q.customer_code, pre_invoice_discount_pct
FROM fact_pre_invoice_deductions f
JOIN dim_customer c
ON f.customer_code = c.customer_code
ORDER BY pre_invoice_discount_pct DESC
LIMIT 5;
