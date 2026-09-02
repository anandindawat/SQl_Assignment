@SESSION -1 
1. Create two tables: Influencers (id, name) and Collaborations (id, influencer1_id, influencer2_id, collab_date). Write a SQL FULL JOIN query to list all influencers and show their collaboration partner names if any, including influencers with no collaborations.

CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Collaborations (
    id INT PRIMARY KEY,
    influencer1_id INT,
    influencer2_id INT,
    collab_date DATE
);

2. Using a SELF JOIN, write a query on a table called Playlists (id, user_id, playlist_name, parent_playlist_id) to display each playlist alongside its parent playlist name, similar to how Spotify shows nested playlists.<br><br><em><strong>Hint:</strong> Join Playlists with itself on parent_playlist_id = id.</em>

SELECT 
    p.playlist_name AS playlist_name,
    parent.playlist_name AS parent_playlist_name
FROM Playlists p
LEFT JOIN Playlists parent
    ON p.parent_playlist_id = parent.id;


3. Given three tables: Users (id, username), Orders (id, user_id, order_date), and Payments (id, order_id, amount), write a SQL query using multiple JOINs to display each username, their order date, and payment amount, showing all users even if they have no orders or payments.

SELECT 
    u.username,
    o.order_date,
    p.amount AS payment_amount
FROM Users u
LEFT JOIN Orders o
    ON u.id = o.user_id
LEFT JOIN Payments p
    ON o.id = p.order_id;


4. You notice that your JOIN query between Zomato's Restaurants and Reviews tables is returning duplicate rows for some restaurants. Modify your query to eliminate duplicates and explain in one line why the duplicates were happening.<br><br><em><strong>Hint:</strong> Use DISTINCT or GROUP BY and consider the relationship between restaurants and reviews.</em>

SELECT DISTINCT
    r.id,
    r.name,
    r.city
FROM Restaurants r
INNER JOIN Reviews rev
    ON r.id = rev.restaurant_id;


5. Write two different JOIN queries on a Products and Categories table (like Flipkart) to list all products with their category names, but use different join conditions in each. Briefly explain which join condition is more efficient and why.

Query 1 — Join using the matching category ID
SELECT 
    p.name AS product_name,
    c.name AS category_name
FROM Products p
INNER JOIN Categories c
    ON p.category_id = c.id;

Query 2 — Join using category name
SELECT 
    p.name AS product_name,
    c.name AS category_name
FROM Products p
INNER JOIN Categories c
    ON p.category_name = c.name;