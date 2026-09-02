1. Create a SQL table called Restaurant with columns: id, name, cuisine, location, and average_rating. Insert at least 5 sample rows representing popular restaurants from Zomato.

CREATE TABLE Restaurant (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    cuisine VARCHAR(100),
    location VARCHAR(255),
    average_rating DECIMAL(3,2)
);

INSERT INTO Restaurant (id, name, cuisine, location, average_rating)
VALUES
    (1, 'The Bombay Canteen', 'Indian', 'Mumbai', 4.70),
    (2, 'Indian Accent', 'Indian', 'New Delhi', 4.80),
    (3, 'Peter Luger Steak House', 'Steakhouse', 'New York', 4.60),
    (4, 'Bukhara', 'North Indian', 'New Delhi', 4.50),
    (5, 'Trishna', 'Seafood', 'Mumbai', 4.40);



2. Write a SQL query to generate a report showing the number of restaurants for each cuisine type from your Restaurant table, ordered by the count in descending order.<br><br><em><strong>Hint:</strong> Use GROUP BY and ORDER BY.</em>

SELECT
    cuisine,
    COUNT(*) AS restaurant_count
FROM Restaurant
GROUP BY cuisine
ORDER BY restaurant_count DESC;


3. Add a new table called Review with columns: id, restaurant_id, user_name, rating, and review_date. Insert at least 10 sample reviews, linking them to restaurants using restaurant_id.

CREATE TABLE Review (
    id INTEGER PRIMARY KEY,
    restaurant_id INTEGER,
    user_name VARCHAR(255),
    rating DECIMAL(2,1),
    review_date DATE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(id)
);

INSERT INTO Review (id, restaurant_id, user_name, rating, review_date)
VALUES
    (1, 1, 'Rahul Sharma', 4.8, '2026-01-10'),
    (2, 1, 'Priya Mehta', 4.6, '2026-01-15'),
    (3, 2, 'Amit Patel', 4.9, '2026-02-02'),
    (4, 2, 'Neha Singh', 4.7, '2026-02-08'),
    (5, 3, 'John Smith', 4.5, '2026-02-14'),
    (6, 3, 'Emily Brown', 4.7, '2026-02-20'),
    (7, 4, 'Arjun Kapoor', 4.6, '2026-03-01'),
    (8, 4, 'Sneha Verma', 4.4, '2026-03-05'),
    (9, 5, 'Vikram Shah', 4.3, '2026-03-12'),
    (10, 5, 'Ananya Rao', 4.5, '2026-03-18');


4. Write a SQL query using a JOIN to display each restaurant's name, cuisine, and its average review rating (from the Review table), ordered by highest average rating first.<br><br><em><strong>Hint:</strong> Use JOIN and GROUP BY with aggregate functions.</em>

SELECT
    r.name,
    r.cuisine,
    AVG(rv.rating) AS average_review_rating
FROM Restaurant r
JOIN Review rv
    ON r.id = rv.restaurant_id
GROUP BY r.id, r.name, r.cuisine
ORDER BY average_review_rating DESC;


5. Use a window function to rank restaurants by their average review rating within each cuisine type, showing the restaurant name, cuisine, average rating, and rank.<br><br><em><strong>Hint:</strong> Use the RANK() or DENSE_RANK() window function partitioned by cuisine.</em>

WITH RestaurantRatings AS (
    SELECT
        r.id,
        r.name AS restaurant_name,
        r.cuisine,
        AVG(rv.rating) AS average_rating
    FROM Restaurant r
    JOIN Review rv
        ON r.id = rv.restaurant_id
    GROUP BY r.id, r.name, r.cuisine
)
SELECT
    restaurant_name,
    cuisine,
    ROUND(average_rating, 2) AS average_rating,
    RANK() OVER (
        PARTITION BY cuisine
        ORDER BY average_rating DESC
    ) AS cuisine_rank
FROM RestaurantRatings
ORDER BY cuisine, cuisine_rank;
