# Creating tables in SNOWFLAKE

USE SCHEMA retail_bi.raw;

CREATE TABLE dim_customers (
    customer_id STRING,
    gender STRING,
    age NUMBER
);

CREATE TABLE dim_products (
    product_category STRING
);

CREATE TABLE dim_date (
    date_id DATE,
    year NUMBER,
    month NUMBER,
    day NUMBER,
    weekday_name STRING
);

CREATE TABLE fact_sales (
    transaction_id NUMBER,
    date_id DATE,
    customer_id STRING,
    product_category STRING,
    quantity NUMBER,
    price_per_unit NUMBER(10,2),
    total_amount NUMBER(10,2)
);