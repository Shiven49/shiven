import sqlite3
import tkinter as tk
from tkinter import messagebox

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
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )''')
    
    c.execute('''
    CREATE TABLE IF NOT EXISTS Accounts (
        account_id INTEGER PRIMARY KEY AUTOINCREMENT,
        customer_id INTEGER,
        account_type TEXT NOT NULL,
        balance REAL DEFAULT 0.0,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    )''')
    
    c.execute('''
    CREATE TABLE IF NOT EXISTS Transactions (
        transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
        account_id INTEGER,
        transaction_type TEXT NOT NULL,
        amount REAL NOT NULL,
        date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
    )''')
    
    c.execute('''
    CREATE TABLE IF NOT EXISTS Loans (
        loan_id INTEGER PRIMARY KEY AUTOINCREMENT,
        customer_id INTEGER,
        loan_amount REAL,
        loan_status TEXT DEFAULT 'Active',
        loan_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    )''')
    
    conn.commit()
    conn.close()

def insert_customer(first_name, last_name, email, phone, address, dob):
    conn = connect_db()
    c = conn.cursor()
    c.execute('''
    INSERT INTO Customers (first_name, last_name, email, phone, address, date_of_birth)
    VALUES (?, ?, ?, ?, ?, ?)
    ''', (first_name, last_name, email, phone, address, dob))
    conn.commit()
    conn.close()

def insert_account(customer_id, account_type):
    conn = connect_db()
    c = conn.cursor()
    c.execute('''
    INSERT INTO Accounts (customer_id, account_type)
    VALUES (?, ?)
    ''', (customer_id, account_type))
    conn.commit()
    conn.close()

def deposit(account_id, amount):
    conn = connect_db()
    c = conn.cursor()
    c.execute('''
    UPDATE Accounts SET balance = balance + ? WHERE account_id = ?
    ''', (amount, account_id))
    c.execute('''
    INSERT INTO Transactions (account_id, transaction_type, amount)
    VALUES (?, ?, ?)
    ''', (account_id, 'Deposit', amount))
    conn.commit()
    conn.close()

def withdraw(account_id, amount):
    conn = connect_db()
    c = conn.cursor()
    c.execute('''
    SELECT balance FROM Accounts WHERE account_id = ?
    ''', (account_id,))
    balance = c.fetchone()[0]
    if balance >= amount:
        c.execute('''
        UPDATE Accounts SET balance = balance - ? WHERE account_id = ?
        ''', (amount, account_id))
        c.execute('''
        INSERT INTO Transactions (account_id, transaction_type, amount)
        VALUES (?, ?, ?)
        ''', (account_id, 'Withdrawal', amount))
        conn.commit()
        messagebox.showinfo("Success", f"Withdrawal of {amount} successful!")
    else:
        messagebox.showerror("Error", "Insufficient balance!")
    conn.close()

def create_loan(customer_id, amount):
    conn = connect_db()
    c = conn.cursor()
    c.execute('''
    INSERT INTO Loans (customer_id, loan_amount)
    VALUES (?, ?)
    ''', (customer_id, amount))
    conn.commit()
    conn.close()

def view_transactions(account_id):
    conn = connect_db()
    c = conn.cursor()
    c.execute('''
    SELECT * FROM Transactions WHERE account_id = ? ORDER BY date DESC
    ''', (account_id,))
    transactions = c.fetchall()
    conn.close()
    return transactions

def display_customers():
    conn = connect_db()
    c = conn.cursor()
    c.execute('SELECT * FROM Customers')
    customers = c.fetchall()
    conn.close()
    return customers

def update_customer_listbox(customers):
    listbox_customers.delete(0, tk.END)
    for customer in customers:
        listbox_customers.insert(tk.END, f"{customer[1]} {customer[2]} - {customer[3]}")

def search_customer():
    search_term = entry_search.get()
    conn = connect_db()
    c = conn.cursor()
    c.execute('''
    SELECT * FROM Customers 
    WHERE first_name LIKE ? OR last_name LIKE ? OR email LIKE ?
    ''', ('%' + search_term + '%', '%' + search_term + '%', '%' + search_term + '%'))
    customers = c.fetchall()
    conn.close()
    update_customer_listbox(customers)

def add_customer():
    first_name = entry_first_name.get()
    last_name = entry_last_name.get()
    email = entry_email.get()
    phone = entry_phone.get()
    address = entry_address.get()
    dob = entry_dob.get()
    if first_name and last_name and email and phone and dob:
        insert_customer(first_name, last_name, email, phone, address, dob)
        messagebox.showinfo("Success", "Customer added successfully!")
        clear_fields()
        update_customer_listbox(display_customers())
    else:
        messagebox.showerror("Error", "All fields must be filled!")

def create_account():
    selected_customer = listbox_customers.curselection()
    if selected_customer:
        customer_id = display_customers()[selected_customer[0]][0]
        account_type = account_type_var.get()
        insert_account(customer_id, account_type)
        messagebox.showinfo("Success", "Account created successfully!")
    else:
        messagebox.showerror("Error", "No customer selected.")

def handle_deposit():
    selected_customer = listbox_customers.curselection()
    if selected_customer:
        customer_id = display_customers()[selected_customer[0]][0]
        account_id = selected_customer[0] + 1  # Assuming one account per customer for simplicity
        amount = float(entry_amount.get())
        deposit(account_id, amount)
        update_balance(account_id)
    else:
        messagebox.showerror("Error", "No account selected.")

def handle_withdraw():
    selected_customer = listbox_customers.curselection()
    if selected_customer:
        customer_id = display_customers()[selected_customer[0]][0]
        account_id = selected_customer[0] + 1  # Assuming one account per customer for simplicity
        amount = float(entry_amount.get())
        withdraw(account_id, amount)
        update_balance(account_id)
    else:
        messagebox.showerror("Error", "No account selected.")

def update_balance(account_id):
    conn = connect_db()
    c = conn.cursor()
    c.execute('''
    SELECT balance FROM Accounts WHERE account_id = ?
    ''', (account_id,))
    balance = c.fetchone()[0]
    conn.close()
    label_balance.config(text=f"Balance: {balance}")

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

tk.Label(window, text="Search Customer").grid(row=7, column=0, padx=10, pady=5)
entry_search = tk.Entry(window)
entry_search.grid(row=7, column=1)
btn_search = tk.Button(window, text="Search", command=search_customer)
btn_search.grid(row=7, column=2, padx=10, pady=5)

btn_create_account = tk.Button(window, text="Create Account", command=create_account)
btn_create_account.grid(row=8, column=0, columnspan=2, pady=10)

tk.Label(window, text="Account Type").grid(row=9, column=0, padx=10, pady=5)
account_type_var = tk.StringVar()
account_type_var.set("Savings")
account_type_menu = tk.OptionMenu(window, account_type_var, "Savings", "Checking")
account_type_menu.grid(row=9, column=1)

tk.Label(window, text="Deposit Amount").grid(row=10, column=0, padx=10, pady=5)
entry_amount = tk.Entry(window)
entry_amount.grid(row=10, column=1)

btn_deposit = tk.Button(window, text="Deposit", command=handle_deposit)
btn_deposit.grid(row=11, column=0, columnspan=2, pady=10)

btn_withdraw = tk.Button(window, text="Withdraw", command=handle_withdraw)
btn_withdraw.grid(row=12, column=0, columnspan=2, pady=10)

label_balance = tk.Label(window, text="Balance: 0.0")
label_balance.grid(row=13, column=0, columnspan=2, pady=10)

tk.Label(window, text="Customers").grid(row=0, column=2, padx=10, pady=5)
listbox_customers = tk.Listbox(window, width=50, height=10)
listbox_customers.grid(row=1, column=2, rowspan=6, padx=10, pady=5)

create_tables()
update_customer_listbox(display_customers())

window.mainloop()
