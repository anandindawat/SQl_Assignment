1. Create a table named MusicPlaylist with columns: id, song_name, artist, genre, and duration. Insert at least 5 records representing songs from your favorite Spotify playlist, then write a SELECT statement to retrieve all columns for all songs.

CREATE TABLE MusicPlaylist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    genre VARCHAR(50),
    duration INT
);

INSERT INTO MusicPlaylist (id, song_name, artist, genre, duration)
VALUES
(1, 'Tum Hi Ho', 'Arijit Singh', 'Bollywood', 262),
(2, 'Kesariya', 'Arijit Singh', 'Bollywood', 268),
(3, 'Apna Bana Le', 'Arijit Singh', 'Bollywood', 261),
(4, 'Heeriye', 'Jasleen Royal', 'Pop', 194),
(5, 'Excuses', 'AP Dhillon', 'Punjabi', 146);

SELECT * FROM MusicPlaylist;

2. Write a SQL query to display only the song_name and artist columns from the MusicPlaylist table, showing just the first 3 records using the LIMIT keyword.

SELECT song_name, artist
FROM MusicPlaylist
LIMIT 3;

3. Suppose you have a table named FoodOrders with columns: id, restaurant, food_item, and order_date. Write a SQL query to list all unique restaurant names where you have placed orders, using the DISTINCT keyword.

SELECT DISTINCT restaurant
FROM FoodOrders;

4. Write a SQL query on the FoodOrders table to select food_item as 'Dish' and order_date as 'Date Ordered', displaying only these two columns with the column aliases in the output.

SELECT 
    food_item AS Dish,
    order_date AS `Date Ordered`
FROM FoodOrders;

5. You tried running this query: SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2, but it returns an error or doesn't work as expected. Identify and fix the mistake in the query.<br><br><em><strong>Hint:</strong> Check the correct placement and usage of the LIMIT keyword in SQL syntax.</em>

SELECT DISTINCT food_item, restaurant
FROM FoodOrders
LIMIT 2;