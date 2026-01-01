import mysql.connector
from mysql.connector import Error  # Make sure to import Error

def connect_to_mysql():
    try:
        # Establish connection
        connection = mysql.connector.connect(
            host='localhost',      # change if needed
            user='root',           # your MySQL username
            password='YourPassword',  # your MySQL password
            database='test_db'     # optional, change as needed
        )

        if connection.is_connected():
            print("Connected to MySQL Server successfully")
            # Example query
            cursor = connection.cursor()
            cursor.execute("SELECT DATABASE();")
            db_name = cursor.fetchone()
            print(f"Currently connected to database: {db_name[0]}")

    except mysql.connector.Error as err:  # Catch MySQL-specific errors
        print(f"Error: {err}")

    finally:
        if 'connection' in locals() and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed")

# Call the function
connect_to_mysql()
