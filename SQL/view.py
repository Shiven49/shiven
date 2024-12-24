import sqlite3

def view_customers():
    try:
        conn = sqlite3.connect('bank_system.db')
        c = conn.cursor()

        c.execute('SELECT * FROM Customers')
        customers = c.fetchall()

        if customers:
            for customer in customers:
                print(f"ID: {customer[0]} | Name: {customer[1]} {customer[2]} | Email: {customer[3]} | Phone: {customer[4]}")
        else:
            print("No customers found.")
            
        conn.close()
    except sqlite3.Error as e:
        print(f"An error occurred: {e}")

view_customers()
