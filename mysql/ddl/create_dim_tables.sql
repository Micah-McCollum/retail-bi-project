# SQL script to create dim tables from the original retail_sales_dataset

# Staging table
CREATE TABLE retail_sales_raw (
    transaction_id INT PRIMARY KEY,
    date DATE,
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);

# TABLE dim_customers
CREATE TABLE dim_customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    age INT
);

INSERT INTO dim_customers (customer_id, gender, age)
SELECT DISTINCT customer_id, gender, age
FROM retail_sales_raw;

# TABLE dim_products
CREATE TABLE dim_products (
    product_category VARCHAR(50) PRIMARY KEY
);

INSERT INTO dim_products (product_category)
SELECT DISTINCT product_category
FROM retail_sales_raw;

# TABLE dim_date
CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT,
    weekday_name VARCHAR(10)
);

INSERT INTO dim_date (date_id, year, month, day, weekday_name)
SELECT DISTINCT
    date,
    YEAR(date),
    MONTH(date),
    DAY(date),
    DAYNAME(date)
FROM retail_sales_raw;

# TABLE fact_sales
CREATE TABLE fact_sales (
    transaction_id INT PRIMARY KEY,
    date_id DATE,
    customer_id VARCHAR(20),
    product_category VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
    FOREIGN KEY (product_category) REFERENCES dim_products(product_category)
);

INSERT INTO fact_sales (
    transaction_id, date_id, customer_id, product_category, quantity, price_per_unit, total_amount
)
SELECT
    transaction_id,
    date,
    customer_id,
    product_category,
    quantity,
    price_per_unit,
    total_amount
FROM retail_sales_raw;