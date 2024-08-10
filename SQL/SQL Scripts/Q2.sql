SELECT COUNT(*) AS unique_products_2020 FROM (SELECT DISTINCT product_code FROM fact_sales_monthly
WHERE product_code IN (SELECT product_code FROM fact_sales_monthly
WHERE date>='2020-01-01' and date<='2021-01-01')) AS unique_products_2020;

SELECT COUNT(*) AS unique_products_2021 FROM (SELECT DISTINCT product_code FROM fact_sales_monthly
WHERE product_code IN (SELECT product_code FROM fact_sales_monthly
WHERE date>='2021-01-01' and date<='2022-01-01')) AS unique_products_2021;

CREATE TABLE if not exists unique_products (unique_products_2020 INT, unique_products_2021 INT);

INSERT INTO unique_products
VALUES(347,334);

SELECT unique_products_2020, unique_products_2021, (unique_products_2020-unique_products_2021) AS new_products,
((unique_products_2020-unique_products_2021)/unique_products_2020)*100 AS percentage_change FROM unique_products;
