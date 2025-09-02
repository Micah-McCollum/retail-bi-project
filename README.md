# retail-bi-project
This project simulates a full retail analytics pipeline using MySQL, Snowflake, and Power BI. Uses Kaggle retail dataset

---

## Getting Started

This project simulates the complete BI process. Here's how to get started:

### MySQL Setup
1. Load the flat CSV from `data/source_datasets/`
2. Use the scripts in `mysql/ddl/` to create the normalized schema
3. Load the dimension/fact CSVs from `mysql/data/` into the corresponding tables

### Snowflake Setup
1. Run `create_db_and_schema.sql`, `create_tables.sql`, then `create_views.sql` from `snowflake/ddl/`
2. Verify that the `V_SALES_SUMMARY` view returns expected aggregates

### Power BI
1. Open `retail_sales_dashboard.pbix` in Power BI Desktop
2. Refresh the dataset with your SQL or Snowflake connection
3. Navigate pages using slicers (Month, Category, Demographics) to explore KPIs and tooltips

---

## Tools & Frameworks

- **MySQL** – Initial data cleaning, normalization, and schema development
- **Snowflake** – Cloud-based data warehouse for scalable storage and querying
- **Power BI** – Interactive dashboards and KPI-driven insights
- **DAX** – Custom calculations and logic within Power BI
- **Power Query** – Data transformation and M-language scripts
- **Kaggle Dataset** – Source of transactional and customer-level data

---

## Key Metrics Defined

This report includes dynamic KPIs, conditional formatting, tooltips, and title logic for month-to-month comparisons:

| Metric | Description |
|--------|-------------|
| **Transaction Count**           | Number of unique transactions per month                                                         |
| **Total Revenue**               | Sum of `TOTAL_AMOUNT` for the filtered period                                                   |
| **Revenue per Customer**        | Total Revenue ÷ Unique Customers                                                                |
| **Average Order Value (AOV)**   | Total Revenue ÷ Transaction Count                                                               |
| **Unique Customer Count**       | Distinct count of customers in filtered range                                                   |
| **Transaction Count Change**    | Directional change vs previous month ("Up", "Down", "Same")                                     |

Dynamic elements like callout visuals and titles are fully responsive to slicer selections (month, product category, age buckets)

---

## Visuals & Features

| Page | Visuals |
|------|---------|
| **KPI Page**                    | 3 Main KPI cards (Revenue, AOV, Unique Customers), dynamic titles & conditional colors          |
| **Tooltip Pages**               | Custom-built tooltip pages with line graphs and stacked area charts for monthly breakdowns      |
| **Category Breakdown**          | Revenue by Product Category using area/column chart with active slicer context                  |
| **Trend Analysis**              | Time series visuals with DAX-driven tooltips                                                    |

---

## Data Model

Star schema design with one fact table and supporting dimensions:

- **FACT_SALES**      – Transactions, revenue, quantity, customer/date/category FK
- **DIM_DATE**        – Full calendar table (day, month name, weekday, etc.)
- **DIM_CUSTOMERS**   – Demographic information
- **DIM_PRODUCTS**    – Product categories
- **V_SALES_SUMMARY** – View used for pre-aggregated metrics and simplification

All relationships are *one-to-many* and enforced via Power BI model view.

---

## Files Included

| File | Description |
|------|-------------|
| `metrics_defined.md` | Definitions of all DAX metrics and KPIs                                                                    |
| `data_dictionary.md` | Data model reference for fact/dimension tables                                                             |
| `.pbix` file         | Power BI dashboard with multiple pages and tooltip tabs                                                    |
| SQL scripts          | (Optional use) Initial schema and view creation scripts                                                    |

---

## Finished Project Features

The following are now implemented:

- Dynamic month-level KPI updates
- Conditional color logic based on prior performance
- Responsive tooltip graphs with slicer context
- Properly sorted and formatted visuals
- Clean and relational star schema backend

---

## Dataset Source

Kaggle Retail Dataset
(Included in data folder)

Original Link: https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset/data

---

## Author

Micah McCollum – Computer Science Graduate, Franklin University  
Feel free to fork or reference for BI/analytics portfolio work.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
(Or update the wording if you're using another license.)