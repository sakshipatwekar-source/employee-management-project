# E-Commerce Sales Analysis

## Project Overview

This project analyzes e-commerce sales data using SQL and SQLite.

The project contains customer, product, order, order item, and payment data. SQL queries are used to analyze sales performance, customer spending, product performance, order trends, and payment information.

## Objectives

- Analyze total and average sales
- Identify top customers
- Analyze sales by city and category
- Identify best-selling and highest-revenue products
- Analyze monthly sales and orders
- Analyze order and payment status
- Identify low-stock products
- Practice SQL joins, aggregations, subqueries, and window functions

## Database Schema

The database contains five tables:

- `customers` – Customer information
- `products` – Product information
- `orders` – Order details
- `order_items` – Products included in each order
- `payments` – Payment information

## Tools & Technologies

- SQL
- SQLite
- Git
- GitHub
- macOS Terminal

## SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- JOIN
- Aggregate Functions
- Subqueries
- CASE
- Window Functions
- RANK()
- SUM()
- AVG()
- COUNT()
- MAX()
- MIN()

## Key Analysis

The project analyzes:

1. Total revenue
2. Average order value
3. Sales by city
4. Sales by product
5. Sales by category
6. Top customers by spending
7. Monthly revenue
8. Order status
9. Payment status
10. Low-stock products
11. Product revenue ranking
12. Customer spending analysis

## Key Findings

- Total completed revenue: ₹170,500
- Completed orders: 9
- Cancelled orders: 1
- Average completed order value: ₹18,944.44
- Highest-value order: ₹57,000
- Highest-revenue product: Laptop
- Top sales city: Pune
- Most popular paid payment method: UPI

## How to Run

1. Clone or download the repository.
2. Open the project folder in Terminal.
3. Open the SQLite database:

```bash
sqlite3 ecommerce.db
4Run the SQL queries from ecommerce_analysis.sql.
Project Structure
ecommerce-sale-analysis/
│
├── ecommerce_analysis.sql
├── ecommerce.db
└── README.md
Author

Sakshi Patwekar

This project was created as part of my SQL and Git/GitHub learning journey.


### After pasting
Press:

**Control + O** → **Enter** → **Control + X**

Then tell me **Done**. We'll do the next Git step

