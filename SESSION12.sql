1. Create a CTE using the WITH clause to select all products with a rating above 4.5 from a 'Products' table, similar to how Flipkart or Myntra might highlight top-rated items.

WITH TopRatedProducts AS (
    SELECT *
    FROM Products
    WHERE rating > 4.5
)
SELECT *
FROM TopRatedProducts;

2. Rewrite a query that finds all restaurants in 'Ahmedabad' with delivery charges under 50 from a 'Restaurants' table, first using a subquery and then using a CTE. Compare both queries for readability.<br><br><em><strong>Hint:</strong> Focus on making the CTE version cleaner and easier to understand.</em>

WITH AhmedabadRestaurants AS (
    SELECT *
    FROM Restaurants
    WHERE city = 'Ahmedabad'
)
SELECT *
FROM AhmedabadRestaurants
WHERE delivery_charge < 50;

3. Using two CTEs in a single query, find the top 3 most-followed users and the top 3 most-liked posts from a 'Users' and 'Posts' table (think Instagram-style data). Output both lists in the same result set.

WITH TopUsers AS (
    SELECT id, username, followers
    FROM Users
    ORDER BY followers DESC
    LIMIT 3
),
TopPosts AS (
    SELECT id, post_content, likes
    FROM Posts
    ORDER BY likes DESC
    LIMIT 3
)
SELECT 
    'Top Users' AS list_type,
    username AS name,
    followers AS count_value
FROM TopUsers

UNION ALL

SELECT 
    'Top Posts' AS list_type,
    post_content AS name,
    likes AS count_value
FROM TopPosts;

4. Write a recursive CTE that generates a list of dates for the next 7 days starting from today, similar to how BookMyShow shows available dates for movie bookings.<br><br><em><strong>Hint:</strong> Use a base case for today and recursion to add one day at a time.</em>

WITH RECURSIVE DateList AS (
    SELECT CURDATE() AS booking_date

    UNION ALL

    SELECT DATE_ADD(booking_date, INTERVAL 1 DAY)
    FROM DateList
    WHERE booking_date < DATE_ADD(CURDATE(), INTERVAL 6 DAY)
)
SELECT booking_date
FROM DateList;

5. Given a messy SQL query that finds all users with more than 1000 followers from a 'Users' table, refactor it to use a CTE for better clarity and maintainability.

WITH PopularUsers AS (
    SELECT *
    FROM Users
    WHERE followers > 1000
)
SELECT *
FROM PopularUsers;