-- =====================================================
-- E-Commerce Sales Analysis
-- SQL Analysis Queries
-- =====================================================

-- Q1. Display all customers
SELECT * FROM customers;

-- Q2. Display all products
SELECT * FROM products;

-- Q3. Display all orders
SELECT * FROM orders;

-- Q4. Display all order items
SELECT * FROM order_items;

-- Q5. Display all payments
SELECT * FROM payments;

-- Q6. Count total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Q7. Count total products
SELECT COUNT(*) AS total_products
FROM products;

-- Q8. Count total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Q9. Find total sales
SELECT SUM(total_amount) AS total_sales
FROM orders
WHERE status != 'Cancelled';

-- Q10. Find average order value
SELECT ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
WHERE status != 'Cancelled';

-- Q11. Find maximum order value
SELECT MAX(total_amount) AS highest_order
FROM orders;

-- Q12. Find minimum order value
SELECT MIN(total_amount) AS lowest_order
FROM orders;

-- Q13. Find orders by status
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;

-- Q14. Find sales by city
SELECT c.city,
       SUM(o.total_amount) AS city_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled'
GROUP BY c.city
ORDER BY city_sales DESC;

-- Q15. Find sales by category
SELECT p.category,
       SUM(oi.quantity * oi.unit_price) AS category_sales
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status != 'Cancelled'
GROUP BY p.category
ORDER BY category_sales DESC;

-- Q16. Find product sales
SELECT p.product_name,
       SUM(oi.quantity * oi.unit_price) AS product_sales
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status != 'Cancelled'
GROUP BY p.product_name
ORDER BY product_sales DESC;

-- Q17. Find units sold by product
SELECT p.product_name,
       SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status != 'Cancelled'
GROUP BY p.product_name
ORDER BY units_sold DESC;

-- Q18. Find customers with total spending
SELECT c.customer_name,
       SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled'
GROUP BY c.customer_name
ORDER BY total_spent DESC;

-- Q19. Find customers with spending above 10000
SELECT c.customer_name,
       SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled'
GROUP BY c.customer_name
HAVING SUM(o.total_amount) > 10000
ORDER BY total_spent DESC;

-- Q20. Find customers with their order count
SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled'
GROUP BY c.customer_name
ORDER BY total_orders DESC;

-- Q21. Find monthly sales
SELECT substr(order_date, 1, 7) AS order_month,
       SUM(total_amount) AS monthly_sales
FROM orders
WHERE status != 'Cancelled'
GROUP BY order_month
ORDER BY order_month;

-- Q22. Find monthly order count
SELECT substr(order_date, 1, 7) AS order_month,
       COUNT(*) AS total_orders
FROM orders
WHERE status != 'Cancelled'
GROUP BY order_month
ORDER BY order_month;

-- Q23. Find highest-selling product
SELECT p.product_name,
       SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status != 'Cancelled'
GROUP BY p.product_name
ORDER BY units_sold DESC
LIMIT 1;

-- Q24. Find highest-revenue product
SELECT p.product_name,
       SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status != 'Cancelled'
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Q25. Find products with stock below 20
SELECT product_name, stock
FROM products
WHERE stock < 20
ORDER BY stock;

-- Q26. Find total sales excluding cancelled orders
SELECT SUM(total_amount) AS total_sales
FROM orders
WHERE status != 'Cancelled';

-- Q27. Find average customer spending
SELECT ROUND(AVG(total_spent), 2) AS average_customer_spending
FROM (
    SELECT customer_id,
           SUM(total_amount) AS total_spent
    FROM orders
    WHERE status != 'Cancelled'
    GROUP BY customer_id
);

-- Q28. Rank customers by total spending
SELECT c.customer_name,
       SUM(o.total_amount) AS total_spent,
       RANK() OVER (
           ORDER BY SUM(o.total_amount) DESC
       ) AS customer_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled'
GROUP BY c.customer_name
ORDER BY customer_rank;

-- Q29. Find low-stock products
SELECT product_name, stock
FROM products
WHERE stock < 20
ORDER BY stock;

-- Q30. Payment status analysis
SELECT payment_status,
       COUNT(*) AS payment_count
FROM payments
GROUP BY payment_status
ORDER BY payment_count DESC;

-- Q31. Product sales percentage
SELECT p.product_name,
       SUM(oi.quantity * oi.unit_price) AS product_sales,
       ROUND(
           SUM(oi.quantity * oi.unit_price) * 100.0 /
           SUM(SUM(oi.quantity * oi.unit_price)) OVER (),
           2
       ) AS sales_percentage
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status != 'Cancelled'
GROUP BY p.product_name
ORDER BY sales_percentage DESC;

-- Q32. Sales by order status
SELECT status,
       SUM(total_amount) AS total_sales
FROM orders
GROUP BY status
ORDER BY total_sales DESC;

-- Q33. Average sales by order status
SELECT status,
       ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
GROUP BY status
ORDER BY average_order_value DESC;

-- Q34. Best-selling product by revenue
SELECT p.product_name,
       SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status != 'Cancelled'
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Q35. Customer with the most orders
SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled'
GROUP BY c.customer_name
ORDER BY total_orders DESC
LIMIT 1;

-- Q36. Customers who placed orders in June
SELECT c.customer_name,
       o.order_date,
       o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled'
  AND substr(o.order_date, 1, 7) = '2026-06'
ORDER BY o.order_date;

-- Q37. Highest-spending customer in each city
SELECT city,
       customer_name,
       total_spent
FROM (
    SELECT c.city,
           c.customer_name,
           SUM(o.total_amount) AS total_spent,
           RANK() OVER (
               PARTITION BY c.city
               ORDER BY SUM(o.total_amount) DESC
           ) AS city_rank
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    WHERE o.status != 'Cancelled'
    GROUP BY c.city, c.customer_name
)
WHERE city_rank = 1
ORDER BY total_spent DESC;

-- Q38. Most popular payment method
SELECT payment_method,
       COUNT(*) AS usage_count
FROM payments
WHERE payment_status = 'Paid'
GROUP BY payment_method
ORDER BY usage_count DESC
LIMIT 1;

-- Q39. Monthly revenue and order count
SELECT substr(order_date, 1, 7) AS order_month,
       COUNT(*) AS total_orders,
       SUM(total_amount) AS total_revenue
FROM orders
WHERE status != 'Cancelled'
GROUP BY order_month
ORDER BY order_month;

-- Q40. Overall project summary
SELECT
    COUNT(*) AS total_orders,
    SUM(CASE WHEN status != 'Cancelled' THEN 1 ELSE 0 END) AS completed_orders,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    SUM(CASE WHEN status != 'Cancelled' THEN total_amount ELSE 0 END) AS total_revenue,
    ROUND(
        AVG(CASE WHEN status != 'Cancelled' THEN total_amount END),
        2
    ) AS average_order_value
FROM orders;
