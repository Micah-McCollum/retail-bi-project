---

## `data_dictionary.md`
## Need to Update with created fields
```md
# Data Dictionary

This document describes the key tables and fields used in the Power BI Retail Summary Dashboard

---

## 1. FACT_SALES (Fact Table)
**Description**: Contains transaction-level sales data.

| Column            | Description                                 | Type        |
|-------------------|---------------------------------------------|-------------|
| TRANSACTION_ID    | Unique identifier for each transaction      | Integer     |
| CUSTOMER_ID       | Foreign key to DIM_CUSTOMERS                | Integer     |
| DATE_ID           | Foreign key to DIM_DATE                     | Date        |
| PRODUCT_CATEGORY  | Product grouping                            | Text        | (linked to DIM_PRODUCTS)
| QUANTITY          | Quantity sold                               | Integer     |
| PRICE_PER_UNIT    | Unit price                                  | Decimal     |
| TOTAL_AMOUNT      | Revenue = Quantity × Price                  | Decimal     |

---

## 2. DIM_DATE (Dimension Table)
**Description**: Contains detailed date breakdown used for time-based analysis.

| Column         | Description              | Type   |
|----------------|--------------------------|--------|
| DATE_ID        | Date key                 | Date   | (links to FACT_SALES)
| DAY            | Day of month             | Integer|  
| MONTH          | Month number (1-12)      | Integer|
| MONTH_NAME     | Full month name          | Text   |
| WEEKDAY_NAME   | Day of week              | Text   |
| YEAR           | Calendar year            | Integer|

---

## 3. DIM_CUSTOMERS (Dimension Table)
**Description**: Contains demographic information about customers.

| Column      | Description                | Type    |
|-------------|----------------------------|---------|
| CUSTOMER_ID | Unique customer identifier | Integer |
| AGE         | Customer age               | Integer |
| GENDER      | Gender                     | Text    |

---

## 4. DIM_PRODUCTS (Dimension Table)
**Description**: Contains product categorization.

| Column           | Description                         | Type    |
|------------------|-------------------------------------|---------|
| PRODUCT_CATEGORY | Product Category name               | Text    |

---

## 5. V_SALES_SUMMARY (Views Table / Aggregated Table)
**Description**: Summary table used for finalized display from Snowflake

| Column           | Description                                 | Type    |
|------------------|---------------------------------------------|---------|
| DATE_ID          | Date ID                                     | Date    |
| CUSTOMER_ID      | Customer ID                                 | Integer |
| PRODUCT_CATEGORY | Product Category                            | Text    |
| TOTAL_AMOUNT     | Revenue amount                              | Decimal |
| TRANSACTION_ID   | Transaction count (may be aggregated)       | Integer |

---