1. Create a table called Orders with columns: order_id, user_id, payment_method, and amount. Insert at least 8 sample records representing different users and payment methods (like UPI, Card, Wallet, COD).

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    payment_method VARCHAR(20),
    amount DECIMAL(10,2)
);

INSERT INTO Orders (order_id, user_id, payment_method, amount)
VALUES
(1, 101, 'UPI', 499.00),
(2, 102, 'Card', 799.00),
(3, 103, 'Wallet', 299.50),
(4, 104, 'COD', 1200.00),
(5, 105, 'UPI', 650.00),
(6, 106, 'Card', 999.99),
(7, 107, 'Wallet', 450.00),
(8, 108, 'COD', 750.00);

2. Write an SQL query to count how many orders were placed using each payment_method in the Orders table, similar to how Zomato shows payment breakdown in analytics.

SELECT payment_method, COUNT(*) AS order_count
FROM Orders
GROUP BY payment_method;

3. Write an SQL query to find the total amount spent by each user_id in the Orders table. Display user_id and their total spend.

SELECT user_id, SUM(amount) AS total_spend
FROM Orders
GROUP BY user_id;

4. Write an SQL query to show only those payment methods where the average order amount is greater than 300, using GROUP BY and HAVING.<br><br><em><strong>Hint:</strong> Use AVG(amount) in your HAVING clause.</em>

SELECT payment_method, AVG(amount) AS average_order_amount
FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;

5. Explain the difference between WHERE and HAVING by giving one example query for each, using the Orders table. Your examples should show a scenario where WHERE and HAVING filter different things.

SELECT *
FROM Orders
WHERE amount > 500;