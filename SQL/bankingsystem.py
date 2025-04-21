import sqlite3
import tkinter as tk
from tkinter import messagebox
from datetime import datetime

def connect_db():
    conn = sqlite3.connect('bank_system.db')
    return conn

def create_tables():
    conn = connect_db()
    c = conn.cursor()
    c.execute('''
    CREATE TABLE IF NOT EXISTS Customers (
        customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        phone TEXT UNIQUE NOT NULL,
        address TEXT,
        date_of_birth DATE NOT NULL,
        balance REAL DEFAULT 0,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
    ''')
    conn.commit()
    conn.close()

def insert_customer(first_name, last_name, email, phone, address, dob):
    conn = connect_db()
    c = conn.cursor()
    c.execute('SELECT * FROM Customers WHERE phone = ? OR email = ?', (phone, email))
    existing_customer = c.fetchone()
    if existing_customer:
        conn.close()
        raise ValueError("A customer with this phone number or email already exists.")
    c.execute('''
    INSERT INTO Customers (first_name, last_name, email, phone, address, date_of_birth)
    VALUES (?, ?, ?, ?, ?, ?)
    ''', (first_name, last_name, email, phone, address, dob))
    conn.commit()
    conn.close()

def update_balance(customer_id, amount, is_deposit=True):
    conn = connect_db()
    c = conn.cursor()
    c.execute('SELECT balance FROM Customers WHERE customer_id = ?', (customer_id,))
    customer = c.fetchone()
    if not customer:
        conn.close()
        raise ValueError("Customer not found.")
    current_balance = customer[0]
    new_balance = current_balance + amount if is_deposit else current_balance - amount
    if new_balance < 0:
        conn.close()
        raise ValueError("Insufficient funds.")
    c.execute('UPDATE Customers SET balance = ?, updated_at = CURRENT_TIMESTAMP WHERE customer_id = ?', (new_balance, customer_id))
    conn.commit()
    conn.close()

def display_customers():
    conn = connect_db()
    c = conn.cursor()
    c.execute('SELECT * FROM Customers')
    customers = c.fetchall()
    conn.close()
    return customers

def search_customer():
    search_term = entry_search.get().strip()
    conn = connect_db()
    c = conn.cursor()
    c.execute('''
    SELECT * FROM Customers 
    WHERE first_name LIKE ? OR last_name LIKE ? OR email LIKE ?
    ''', ('%' + search_term + '%', '%' + search_term + '%', '%' + search_term + '%'))
    customers = c.fetchall()
    conn.close()
    update_customer_listbox(customers)

def deposit_amount():
    customer_id = entry_customer_id.get().strip()
    amount = entry_transaction_amount.get().strip()
    if not customer_id or not amount:
        messagebox.showerror("Error", "Please fill in Customer ID and Amount.")
        return
    try:
        amount = float(amount)
        if amount <= 0:
            raise ValueError("Amount must be positive.")
        update_balance(int(customer_id), amount, is_deposit=True)
        messagebox.showinfo("Success", "Deposit successful!")
        update_customer_listbox(display_customers())
    except ValueError as e:
        messagebox.showerror("Error", str(e))

def withdraw_amount():
    customer_id = entry_customer_id.get().strip()
    amount = entry_transaction_amount.get().strip()
    if not customer_id or not amount:
        messagebox.showerror("Error", "Please fill in Customer ID and Amount.")
        return
    try:
        amount = float(amount)
        if amount <= 0:
            raise ValueError("Amount must be positive.")
        update_balance(int(customer_id), amount, is_deposit=False)
        messagebox.showinfo("Success", "Withdrawal successful!")
        update_customer_listbox(display_customers())
    except ValueError as e:
        messagebox.showerror("Error", str(e))

def update_customer_listbox(customers):
    listbox_customers.delete(0, tk.END)
    for customer in customers:
        balance = float(customer[7]) if customer[7] is not None else 0.0
        listbox_customers.insert(
            tk.END,
            f"ID: {customer[0]} | Name: {customer[1]} {customer[2]} | Email: {customer[3]} | Balance: {balance:.2f}"
        )

def add_customer():
    first_name = entry_first_name.get().strip()
    last_name = entry_last_name.get().strip()
    email = entry_email.get().strip()
    phone = entry_phone.get().strip()
    address = entry_address.get().strip()
    dob = entry_dob.get().strip()
    if first_name and last_name and email and phone and dob:
        try:
            datetime.strptime(dob, "%Y-%m-%d")
        except ValueError:
            messagebox.showerror("Error", "Date of Birth must be in YYYY-MM-DD format.")
            return
        try:
            insert_customer(first_name, last_name, email, phone, address, dob)
            messagebox.showinfo("Success", "Customer added successfully!")
            clear_fields()
            update_customer_listbox(display_customers())
        except ValueError as e:
            messagebox.showerror("Error", str(e))
        except sqlite3.IntegrityError:
            messagebox.showerror("Error", "This phone number or email is already registered!")
    else:
        messagebox.showerror("Error", "All required fields must be filled!")

def clear_fields():
    entry_first_name.delete(0, tk.END)
    entry_last_name.delete(0, tk.END)
    entry_email.delete(0, tk.END)
    entry_phone.delete(0, tk.END)
    entry_address.delete(0, tk.END)
    entry_dob.delete(0, tk.END)
    entry_customer_id.delete(0, tk.END)
    entry_transaction_amount.delete(0, tk.END)

window = tk.Tk()
window.title("Bank System - Customer Management")

tk.Label(window, text="First Name").grid(row=0, column=0, padx=10, pady=5)
entry_first_name = tk.Entry(window)
entry_first_name.grid(row=0, column=1)

tk.Label(window, text="Last Name").grid(row=1, column=0, padx=10, pady=5)
entry_last_name = tk.Entry(window)
entry_last_name.grid(row=1, column=1)

tk.Label(window, text="Email").grid(row=2, column=0, padx=10, pady=5)
entry_email = tk.Entry(window)
entry_email.grid(row=2, column=1)

tk.Label(window, text="Phone").grid(row=3, column=0, padx=10, pady=5)
entry_phone = tk.Entry(window)
entry_phone.grid(row=3, column=1)

tk.Label(window, text="Address").grid(row=4, column=0, padx=10, pady=5)
entry_address = tk.Entry(window)
entry_address.grid(row=4, column=1)

tk.Label(window, text="Date of Birth (YYYY-MM-DD)").grid(row=5, column=0, padx=10, pady=5)
entry_dob = tk.Entry(window)
entry_dob.grid(row=5, column=1)

btn_add_customer = tk.Button(window, text="Add Customer", command=add_customer)
btn_add_customer.grid(row=6, column=0, columnspan=2, pady=10)

tk.Label(window, text="Customer ID").grid(row=7, column=0, padx=10, pady=5)
entry_customer_id = tk.Entry(window)
entry_customer_id.grid(row=7, column=1)

tk.Label(window, text="Amount").grid(row=8, column=0, padx=10, pady=5)
entry_transaction_amount = tk.Entry(window)
entry_transaction_amount.grid(row=8, column=1)

btn_deposit = tk.Button(window, text="Deposit", command=deposit_amount)
btn_deposit.grid(row=9, column=0, pady=10)

btn_withdraw = tk.Button(window, text="Withdraw", command=withdraw_amount)
btn_withdraw.grid(row=9, column=1, pady=10)

tk.Label(window, text="Search Customer").grid(row=10, column=0, padx=10, pady=5)
entry_search = tk.Entry(window)
entry_search.grid(row=10, column=1)
btn_search = tk.Button(window, text="Search", command=search_customer)
btn_search.grid(row=10, column=2, padx=10, pady=5)

tk.Label(window, text="Customers").grid(row=0, column=2, padx=10, pady=5)
listbox_customers = tk.Listbox(window, width=60, height=15)
listbox_customers.grid(row=1, column=2, rowspan=9, padx=10, pady=5)

create_tables()
update_customer_listbox(display_customers())

window.mainloop()
