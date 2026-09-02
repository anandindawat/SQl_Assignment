1. Create a table called Orders with columns: order_id, user_name, total_amount, and order_date. Insert 5 sample rows with different users and order amounts, including at least one NULL value for total_amount.

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    total_amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO Orders (order_id, user_name, total_amount, order_date)
VALUES
(1, 'Amit', 799.00, '2026-08-25'),
(2, 'Rahul', 1250.50, '2026-08-26'),
(3, 'Sufiyan', NULL, '2026-08-27'),
(4, 'Priya', 499.00, '2026-08-28'),
(5, 'Neha', 2150.75, '2026-08-29');

2. Write a SQL query to count how many orders were placed by each user in the Orders table, displaying user_name and the number of orders as order_count.

SELECT user_name, COUNT(*) AS order_count
FROM Orders
GROUP BY user_name;

3. Write a SQL query to calculate the average total_amount of all orders in the Orders table, making sure to ignore any NULL values.

SELECT AVG(total_amount) AS average_total_amount
FROM Orders;

4. Suppose you are building a Flipkart-style dashboard: Write a SQL query to find the highest and lowest order amounts (MAX and MIN) from the Orders table, and display both values in a single result row.

SELECT 
    MAX(total_amount) AS highest_order_amount,
    MIN(total_amount) AS lowest_order_amount
FROM Orders;

5. Write a SQL query to calculate the total sales (SUM of total_amount) for all orders, but only include orders where total_amount is not NULL.<br><br><em><strong>Hint:</strong> Use a WHERE clause to filter out NULL values before applying the SUM function.</em>

SELECT SUM(total_amount) AS total_sales
FROM Orders
WHERE total_amount IS NOT NULL;