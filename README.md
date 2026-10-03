# Olist Brazilian E-Commerce Analytics

## End-to-End Data Analytics Portfolio Project

An end-to-end data analytics project using the Brazilian E-Commerce Public Dataset by Olist. The project analyzes sales, customers, products, sellers, payments, delivery performance, and customer satisfaction to identify actionable business insights.

## Business Objective

To analyze the sales, customer, product, seller, payment, delivery, and customer satisfaction data of the Olist Brazilian e-commerce marketplace and identify meaningful business insights that can support better business decision-making.

## Project Objectives

- Analyze overall sales and order performance
- Understand customer purchasing and retention patterns
- Analyze product category and seller performance
- Examine payment methods and installment behavior
- Evaluate delivery and logistics performance
- Analyze customer satisfaction and review patterns
- Develop business recommendations from the analysis

## Dataset

**Source:** Brazilian E-Commerce Public Dataset by Olist  
**Platform:** Kaggle

The dataset contains information about orders, customers, products, sellers, payments, reviews, and delivery-related information from the Olist marketplace.

The original dataset files are not included in this repository.

## Tools & Technologies

- Python
- Jupyter Notebook
- PostgreSQL
- SQL
- Microsoft Excel
- Power BI
- DAX
- GitHub
- Generative AI for analytical productivity and documentation support

## Project Workflow

```text
Business Understanding
        ↓
Data Understanding
        ↓
Data Quality Assessment
        ↓
Python / Jupyter Analysis
        ↓
PostgreSQL / SQL Analysis
        ↓
Excel Analysis
        ↓
Power BI Dashboard
        ↓
Business Insights
        ↓
Recommendations

Key Business Metrics
Metric	Value
Total Orders	99,441
Unique Customers	96,096
Total Sales Value	R$15.84M
Average Order Value	R$160.58
Average Review Score	4.09 / 5
Valid Deliveries	96,287
Delayed Deliveries	7,823
Delayed Delivery Rate	8.12%
Key Insights
Customer Retention

Most customers were one-time purchasers, while a relatively small proportion made repeat purchases. This highlights customer retention as an important business opportunity.

Sales Performance

The marketplace generated approximately R$15.84 million in total order value across 99,441 orders.

Product Categories

Sales are concentrated across a number of major product categories, with the top 10 categories accounting for a substantial share of total product sales.

Delivery Performance

Among orders with valid delivery information, 8.12% were classified as delayed. Delivery performance also varied considerably across geographic regions.

Customer Satisfaction

The overall average review score was 4.09 out of 5. Delayed orders generally received lower review scores than orders delivered on time or early.

This is an observed association in the dataset and should not be interpreted as proof of causation.

Payment Behavior

Credit cards represented the largest payment method by value, while installment payments were also widely used.

Dashboard

The Power BI dashboard contains dedicated analysis pages covering:

Executive Overview
Sales Performance
Customer Analysis
Product & Seller Analysis
Delivery & Logistics
Customer Satisfaction
Payment Analysis
Repository Structure
Olist-Brazilian-Ecommerce-Analytics/
│
├── notebooks/
│   └── 01_olist_data_profiling.ipynb
│
├── sql/
│   ├── 01_data_validation.sql
│   ├── 02_sales_analysis.sql
│   ├── 03_customer_analysis.sql
│   ├── 04_seller_analysis.sql
│   ├── 05_delivery_analysis.sql
│   ├── 06_category_analysis.sql
│   └── 07_payment_analysis.sql
│
├── excel/
│   └── Olist_Ecommerce_Analysis.xlsx
│
├── powerbi/
│   └── Olist_Ecommerce_Analytics.pbix
│
├── report/
│   └── Olist_Brazilian_Ecommerce_Analytics_Report.docx
│
└── screenshots/
Notes

The original Olist dataset files are not included in this repository because of repository size and data-distribution considerations. The dataset can be obtained from Kaggle using the source identified above.

The analysis focuses on descriptive and diagnostic business analysis. Observed relationships, particularly between delivery performance and customer reviews, should not automatically be interpreted as causal relationships.

Author

Aswin C S

M.Sc. Statistics | Data Analytics & Data Science