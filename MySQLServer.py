import mysql.connector
from mysql.connector import Error

def connect_to_mysql():
    """Connects to MySQL server and ensures the database exists."""
    try:
        # Step 1: Connect to MySQL server (without specifying database yet)
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='YourPassword'  # replace with your MySQL root password
        )

        if connection.is_connected():
            print("Connected to MySQL Server successfully")

            # Step 2: Create cursor
            cursor = connection.cursor()

            # Step 3: Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' ensured")

            # Step 4: Switch to the database
            cursor.execute("USE alx_book_store")
            print("Using database 'alx_book_store'")

            # Example: check current database
            cursor.execute("SELECT DATABASE();")
            db_name = cursor.fetchone()
            print(f"Currently connected to database: {db_name[0]}")

    except mysql.connector.Error as err:
        print(f"MySQL Error: {err}")

    finally:
        # Step 5: Close connection safely
        if 'connection' in locals() and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed")

# Run the function
if __name__ == "__main__":
    connect_to_mysql()
