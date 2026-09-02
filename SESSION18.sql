1. Write an SQL query to display the total number of songs uploaded by each artist from a table 'songs' (columns: song_id, artist_name, title) and show only those artists who have uploaded more than 3 songs.

SELECT
    artist_name,
    COUNT(*) AS total_songs
FROM songs
GROUP BY artist_name
HAVING COUNT(*) > 3
ORDER BY total_songs DESC;


2. Given two tables, 'orders' (order_id, user_id, amount) and 'users' (user_id, username), write a SQL JOIN query to display each username along with their total order amount.

SELECT
    u.username,
    SUM(o.amount) AS total_order_amount
FROM users u
JOIN orders o
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.username
ORDER BY total_order_amount DESC;


3. Write a SQL subquery to find the names of all restaurants from a 'restaurants' table (id, name, rating) whose rating is higher than the average rating of all restaurants.

SELECT name
FROM restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM restaurants
);


4. Using a 'transactions' table (id, user_id, amount, transaction_date), write a SQL query with a window function to display each user's transaction amount and their running total (cumulative sum) ordered by transaction_date.

SELECT
    id,
    user_id,
    amount,
    transaction_date,
    SUM(amount) OVER (
        PARTITION BY user_id
        ORDER BY transaction_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM transactions
ORDER BY user_id, transaction_date;


5. List two optimizations you would apply to speed up a query that filters Flipkart products by category and price, and briefly explain how each helps.<br><br><em><strong>Hint:</strong> Think about indexes and query structure.</em>

CREATE INDEX 
idx_products_category_price 
ON products (category, price);

SELECT *
FROM products
WHERE category = 'Electronics'
  AND price BETWEEN 10000 AND 50000;
