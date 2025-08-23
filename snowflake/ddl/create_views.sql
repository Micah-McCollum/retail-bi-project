# Joining tables to create simple sales view
CREATE OR REPLACE VIEW v_sales_summary AS
SELECT
    f.transaction_id,
    f.date_id,
    d.year,
    d.month,
    c.gender,
    c.age,
    f.product_category,
    f.quantity,
    f.total_amount
FROM fact_sales f
JOIN dim_customers c ON f.customer_id = c.customer_id
JOIN dim_date d ON f.date_id = d.date_id;