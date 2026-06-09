CREATE TABLE sales_data (
    order_id INT,
    product VARCHAR(100),
    quantity_ordered INT,
    price_each DECIMAL(10,2),
    order_date DATE,
    purchase_address VARCHAR(255),
    month INT,
    sales DECIMAL(10,2),
    city VARCHAR(100),
    hour INT
);

//Count the rows//
SELECT COUNT(*) FROM sales_data;

//Preview a sample of the data//
SELECT * FROM sales_data LIMIT 10;

//Check for missing values//
SELECT * FROM sales_data WHERE order_id IS NULL;

//Inspect the table schema//
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sales_data';

//Optional sanity checks//
//Date range//
SELECT MIN(order_date), MAX(order_date) FROM sales_data;

//Total sales//
SELECT SUM(sales) FROM sales_data;


-- 1. Total Revenue
SELECT SUM(quantity_ordered * price_each) AS total_revenue
FROM sales_data;

-- 2. Top 5 Products by Sales
SELECT product, SUM(quantity_ordered) AS total_sold
FROM sales_data
GROUP BY product
ORDER BY total_sold DESC
LIMIT 5;

-- 3. Monthly Revenue Trend
SELECT month, SUM(quantity_ordered * price_each) AS monthly_revenue
FROM sales_data
GROUP BY month
ORDER BY month;

-- 4. Best Customers (Top 10 by Spend)
SELECT purchase_address, SUM(quantity_ordered * price_each) AS customer_spend
FROM sales_data
GROUP BY purchase_address
ORDER BY customer_spend DESC
LIMIT 10;

-- 5. Sales by City 
SELECT SPLIT_PART(purchase_address, ',', 1) AS city,
       SUM(quantity_ordered * price_each) AS city_sales
FROM sales_data
GROUP BY SPLIT_PART(purchase_address, ',', 1)
ORDER BY city_sales DESC;






















