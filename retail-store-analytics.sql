# Level 1: Basics
SELECT name, email FROM Customers;

SELECT * FROM Products;

SELECT DISTINCT category FROM Products;

SELECT * FROM Products WHERE price > 1000;

SELECT * FROM Products WHERE price BETWEEN 2000 AND 5000;

SELECT * FROM Customers WHERE customer_id IN (5, 10, 15, 20, 25);

SELECT * FROM Customers WHERE name LIKE 'A%';

SELECT * FROM Products WHERE category = 'Electronics' AND price < 3000;

SELECT name, price FROM Products ORDER BY price DESC;

SELECT name, price FROM Products ORDER BY price DESC, name ASC;



# Level 2: Filtering and Formatting
SELECT * FROM Orders WHERE customer_id IS NULL;

Select * from customers;

SELECT name AS "Customer Name", email AS "Contact Email" FROM Customers;

SELECT order_id, product_id, quantity, item_price, 
(quantity * item_price) AS  Total_Value_per_item_ordered
FROM order_items;

SELECT order_id, order_date AS "Full_Timestamp", 
DATE(order_date) AS "Reporting_Date" FROM Orders;

SELECT name, phone, 
CONCAT(name, ' - ', phone) AS "Customer Contact Info" FROM Customers;

SELECT product_id, name, stock_quantity FROM Products WHERE stock_quantity = 0;

# Level 3: Aggregations

SELECT COUNT(*) AS Total_Orders_Placed FROM Orders;

SELECT SUM(total_amount) AS total_revenue FROM Orders;

SELECT AVG(total_amount) AS average_order_value FROM Orders;

SELECT COUNT(DISTINCT customer_id) AS Total_Active_Customers FROM Orders;

SELECT customer_id, COUNT(order_id) AS total_orders_placed
FROM Orders
GROUP BY customer_id
ORDER BY total_orders_placed DESC;


SELECT customer_id, SUM(total_amount) AS Total_Sales FROM Orders
GROUP BY customer_id
ORDER BY total_Sales DESC;


SELECT p.category, SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;

SELECT category, AVG(price) AS Average_price_per_Category FROM products
GROUP BY category
ORDER BY Average_price_per_Category DESC;

SELECT DATE(order_date) AS Order_Day, COUNT(order_id) AS Total_Orders
FROM orders
GROUP BY order_day
ORDER BY order_day ASC;

SELECT method, SUM(amount_paid) AS total_payments FROM payments
GROUP BY method
ORDER BY total_payments DESC;


# Level 4: Multi-Table Queries (JOINS)

SELECT 
    o.order_id, 
    o.order_date, 
    c.name AS customer_name, 
    o.total_amount,
    o.status
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_id ASC;


SELECT DISTINCT 
    p.product_id, 
    p.name, 
    p.category
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id;


SELECT 
    o.order_id, 
    o.order_date, 
    p.method, 
    o.total_amount
FROM orders o
INNER JOIN payments p ON o.order_id = p.order_id;

SELECT 
    c.customer_id, 
    c.name, 
    o.order_id, 
    o.total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT 
    p.product_id, 
    p.name AS product_name, 
    oi.quantity
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id;


SELECT 
    o.order_id, 
    p.payment_id, 
    p.method, 
    p.amount_paid AS amount_paid
FROM orders o
RIGHT JOIN payments p ON o.order_id = p.order_id;


SELECT *
FROM customers
INNER JOIN orders USING (customer_id)
INNER JOIN payments USING (order_id);


# Level 5: Subqueries (Inner Queries) 
SELECT 
    product_id, 
    name, 
    price
FROM products
WHERE price > (SELECT AVG(price) FROM products)
ORDER BY price DESC;

SELECT 
    customer_id, 
    name AS "Customer_Name", 
    email
FROM customers
WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders);


SELECT 
    o1.order_id, o1.customer_id, o1.total_amount,
    (SELECT ROUND(AVG(o2.total_amount), 2) 
     FROM orders o2 
     WHERE o2.customer_id = o1.customer_id) AS customer_avg_spend
FROM orders o1
WHERE o1.total_amount > (
    SELECT AVG(o2.total_amount) 
    FROM orders o2 
    WHERE o2.customer_id = o1.customer_id);
    
SELECT c.customer_id, c.name
FROM customers c
WHERE NOT EXISTS (SELECT 1 
    FROM orders o 
    WHERE o.customer_id = c.customer_id);
    
    
SELECT p.product_id, p.name
FROM products p
WHERE NOT EXISTS (
SELECT 1 
FROM order_items oi 
WHERE oi.product_id = p.product_id);


SELECT c.customer_id, 
       c.name,
       (SELECT MAX(o.total_amount) 
        FROM orders o 
        WHERE o.customer_id = c.customer_id) AS highest_order_value
FROM customers c
ORDER BY highest_order_value DESC;


SELECT o1.customer_id, o1.order_id, o1.total_amount AS Highest_Value
FROM orders o1
WHERE o1.total_amount = (SELECT MAX(o2.total_amount)
FROM orders o2
WHERE o2.customer_id = o1.customer_id)
ORDER BY o1.total_amount DESC;

SELECT 
    c.name AS customer_name,
    o1.order_id,
    o1.total_amount AS highest_order_value
FROM customers c
JOIN orders o1 ON c.customer_id = o1.customer_id
WHERE o1.total_amount = (
    SELECT MAX(o2.total_amount) FROM orders o2 
    WHERE o2.customer_id = o1.customer_id)
ORDER BY highest_order_value DESC;


#Level 6: Set Operations 
SELECT customer_id, name 
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders)
AND customer_id IN (SELECT customer_id FROM product_reviews);

SELECT customer_id, name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders)
AND customer_id IN (SELECT customer_id FROM product_reviews);