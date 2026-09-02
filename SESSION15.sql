1. Install the sqlite3 module in Python and write a script to create a new database called foodie.db with a table Restaurants (id, name, cuisine, rating).

import sqlite3

# Connect to (or create) the database
conn = sqlite3.connect("foodie.db")

# Create a cursor
cursor = conn.cursor()

# Create the Restaurants table
cursor.execute("""
CREATE TABLE IF NOT EXISTS Restaurants (
    id INTEGER PRIMARY KEY,
    name TEXT,
    cuisine TEXT,
    rating REAL
)
""")

# Save changes and close the connection
conn.commit()
conn.close()

print("foodie.db database and Restaurants table created successfully!")


2. Using sqlite3 in Python, insert three sample restaurants into the Restaurants table in foodie.db and write a query to fetch all restaurants with a rating above 4.0, then print their names.

import sqlite3

# Connect to the database
conn = sqlite3.connect("foodie.db")
cursor = conn.cursor()

# Insert three sample restaurants
restaurants = [
    (1, "Spice Garden", "North Indian", 4.5),
    (2, "Pizza Hub", "Italian", 3.8),
    (3, "Biryani House", "Mughlai", 4.6)
]

cursor.executemany("""
    INSERT OR IGNORE INTO Restaurants (id, name, cuisine, rating)
    VALUES (?, ?, ?, ?)
""", restaurants)

conn.commit()

# Fetch restaurants with rating above 4.0
cursor.execute("""
    SELECT name
    FROM Restaurants
    WHERE rating > 4.0
""")

# Print restaurant names
for row in cursor.fetchall():
    print(row[0])

# Close the connection
conn.close()

output:

Spice Garden
Biryani House

3. Write Python code to load all rows from the Restaurants table in foodie.db into a Pandas DataFrame and display the top 2 rows using DataFrame.head().

import sqlite3
import pandas as pd

# Connect to the SQLite database
conn = sqlite3.connect("foodie.db")

# Load all rows from Restaurants table into a DataFrame
df = pd.read_sql_query("SELECT * FROM Restaurants", conn)

# Display the top 2 rows
print(df.head(2))

# Close the connection
conn.close()

4. Add a new column 'delivery_charge' to your DataFrame, setting it to 50 for all restaurants, and then calculate a new column 'final_rating' as rating + (0.1 if cuisine is 'Italian').<br><br><em><strong>Hint:</strong> Use DataFrame.apply() or a lambda function for the conditional logic.</em>

import sqlite3
import pandas as pd

# Connect to the SQLite database
conn = sqlite3.connect("foodie.db")

# Load Restaurants table into DataFrame
df = pd.read_sql_query("SELECT * FROM Restaurants", conn)

# Add delivery_charge column
df["delivery_charge"] = 50

# Calculate final_rating
df["final_rating"] = df.apply(
    lambda row: row["rating"] + 0.1 if row["cuisine"] == "Italian" else row["rating"],
    axis=1
)

# Display the updated DataFrame
print(df)

# Close connection
conn.close()

5. Automate a daily summary: Write a Python script that connects to foodie.db, fetches all restaurants with rating above 4.5, loads them into a DataFrame, and saves the result as a CSV file named top_rated_restaurants.csv.

import sqlite3
import pandas as pd

# Connect to the database
conn = sqlite3.connect("foodie.db")

try:
    # Fetch restaurants rated above 4.5
    query = """
        SELECT *
        FROM restaurants
        WHERE rating > 4.5
    """

    # Load results into a DataFrame
    df = pd.read_sql_query(query, conn)

    # Save to CSV
    df.to_csv("top_rated_restaurants.csv", index=False)

    print("Saved top_rated_restaurants.csv successfully.")

finally:
    conn.close()
