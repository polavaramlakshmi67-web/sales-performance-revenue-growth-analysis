CREATE DATABASE weekly_reporting;
USE weekly_reporting;

SELECT 
    COUNT(*) AS total_rows
FROM
superstore;
   

   USE weekly_reporting;
SHOW TABLES;

SELECT *
FROM superstore_cleaned
LIMIT 10;


USE weekly_reporting;
SELECT COUNT(*) AS total_rows
FROM superstore_cleaned;

USE weekly_reporting;

SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM superstore_cleaned;


SELECT
    DATE_FORMAT(`Order Date`, '%Y-%m') AS month,
    ROUND(SUM(Sales), 2) AS monthly_sales,
    ROUND(SUM(Profit), 2) AS monthly_profit
FROM superstore_cleaned
GROUP BY DATE_FORMAT(`Order Date`, '%Y-%m')
ORDER BY month;

SELECT
    MIN(`Order Date`) AS first_order_date,
    MAX(`Order Date`) AS last_order_date,
    COUNT(`Order Date`) AS valid_order_dates
FROM superstore_cleaned;
SELECT
    YEAR(`Order Date`) AS order_year,
    COUNT(*) AS total_rows
FROM superstore_cleaned
GROUP BY YEAR(`Order Date`)
ORDER BY order_year;


SELECT
    `Order Date`,
    YEAR(`Order Date`) AS order_year,
    MONTH(`Order Date`) AS order_month
FROM superstore_cleaned
LIMIT 10;

DESCRIBE superstore_cleaned;
SELECT
    `Order Date`,
    `Ship Date`
FROM superstore_cleaned
LIMIT 10;
SELECT
    `Order Date`,
    STR_TO_DATE(`Order Date`, '%d-%m-%Y') AS converted_order_date,
    STR_TO_DATE(`Ship Date`, '%d-%m-%Y') AS converted_ship_date
FROM superstore_cleaned
LIMIT 10;

SELECT
    DATE_FORMAT(
        STR_TO_DATE(`Order Date`, '%d-%m-%Y'),
        '%Y-%m'
    ) AS month,
    ROUND(SUM(Sales), 2) AS monthly_sales,
    ROUND(SUM(Profit), 2) AS monthly_profit
FROM superstore_cleaned
GROUP BY month
ORDER BY month;

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity
FROM superstore_cleaned
GROUP BY Region
ORDER BY total_sales DESC;
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity
FROM superstore_cleaned
GROUP BY Category
ORDER BY total_sales DESC;
USE weekly_reporting;

SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore_cleaned
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 5;
