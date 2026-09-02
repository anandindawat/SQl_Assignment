1. Create two tables in your database: 'restaurants' (id, name, city) and 'dishes' (id, restaurant_id, dish_name, price). Insert at least 3 restaurants and 2-3 dishes for each restaurant.

CREATE TABLE restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE dishes (
    id INT PRIMARY KEY,
    restaurant_id INT,
    dish_name VARCHAR(100),
    price DECIMAL(10,2),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

INSERT INTO restaurants (id, name, city)
VALUES
(1, 'Spice Garden', 'Ahmedabad'),
(2, 'Biryani House', 'Hyderabad'),
(3, 'Pizza Hub', 'Mumbai');

INSERT INTO dishes (id, restaurant_id, dish_name, price)
VALUES
(1, 1, 'Paneer Tikka', 250.00),
(2, 1, 'Butter Naan', 80.00),
(3, 1, 'Veg Biryani', 220.00),

(4, 2, 'Chicken Biryani', 320.00),
(5, 2, 'Mutton Biryani', 400.00),
(6, 2, 'Chicken Kebab', 280.00),

(7, 3, 'Margherita Pizza', 299.00),
(8, 3, 'Farmhouse Pizza', 399.00),
(9, 3, 'Garlic Bread', 149.00);


2. Write an SQL INNER JOIN query to display each dish along with its restaurant name and city, similar to how Zomato shows dish details with the restaurant info.

SELECT 
    dishes.dish_name,
    restaurants.name AS restaurant_name,
    restaurants.city
FROM dishes
INNER JOIN restaurants
    ON dishes.restaurant_id = restaurants.id;


3. Write an SQL LEFT JOIN query to list all restaurants and their dishes, showing restaurants even if they currently have no dishes on the menu.<br><br><em><strong>Hint:</strong> Use LEFT JOIN so restaurants without dishes still appear in the results with NULL for dish columns.</em>

SELECT 
    restaurants.name AS restaurant_name,
    restaurants.city,
    dishes.dish_name,
    dishes.price
FROM restaurants
LEFT JOIN dishes
    ON restaurants.id = dishes.restaurant_id;


4. Write an SQL RIGHT JOIN query to display all dishes and their restaurant names, including any dishes that might not be linked to a restaurant (simulate a data error where a dish has a restaurant_id that doesn't match any restaurant).

SELECT 
    dishes.dish_name,
    dishes.price,
    restaurants.name AS restaurant_name
FROM restaurants
RIGHT JOIN dishes
    ON restaurants.id = dishes.restaurant_id;



5. Given this scenario: You want to show a list of all playlists and the songs inside them, like Spotify. Explain which JOIN type (INNER, LEFT, or RIGHT) you would use to show all playlists, even if some are empty, and write the SQL query for it.

SELECT 
    playlists.id AS playlist_id,
    playlists.name AS playlist_name,
    songs.song_name,
    songs.artist
FROM playlists
LEFT JOIN songs
    ON playlists.id = songs.playlist_id;