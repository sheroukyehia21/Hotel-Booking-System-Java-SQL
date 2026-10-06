# Transylvania Hotel Management System

This project is a Java Swing-based hotel management system developed as an academic university project. It provides hotel administration screens for managing rooms, employees, customers, check-in and check-out activity, payments, and user authentication.

> This repository contains a public-safe, sanitized copy. The original project files remain available locally and were not modified or deleted.

## Technologies

- Java 17+
- Swing GUI toolkit
- JDBC and MySQL
- NetBeans GUI Designer forms
- Maven
- MySQL Connector/J

## Main Features

- Login with username and password
- Add, view, and update hotel employees
- Add and view hotel rooms
- Manage customer information
- Record customer check-in and check-out activity
- Record payments
- Display room and customer-related records
- Use a MySQL database through JDBC

## My Database Connection and Integration Contribution

The database connection and integration are implemented in `DBconnection.java`. The class creates a MySQL JDBC connection and is used by the application forms for login, room management, employee management, customer management, check-in, check-out, and payment operations.

The public version reads credentials from environment variables instead of storing them in source code. This makes the connection safe to reuse with a local or managed MySQL database while keeping the repository free of secrets.

## Project Structure

```text
.
├── Database/
│   └── hotel database.sql
├── src/
│   └── main/
│       ├── java/
│       │   ├── AddEmployee.java
│       │   ├── AddRoom.java
│       │   ├── CheckIn.java
│       │   ├── Checkout.java
│       │   ├── Dashboard.java
│       │   ├── DBconnection.java
│       │   ├── Login.java
│       │   ├── ManageCustomers.java
│       │   ├── MangeEployee.java
│       │   ├── New_Customer_Form.java
│       │   ├── payment.java
│       │   ├── roomsDetails.java
│       │   └── ...
│       └── resources/
│           ├── Application images and UI assets
│           └── ...
├── pom.xml
├── .env.example
├── .gitignore
└── README.md
```

The `.form` files are retained alongside their Java classes so the NetBeans GUI Designer can continue to open the forms.

## Setup Requirements

- Java 17 or newer
- Maven
- MySQL Server or MySQL-compatible database
- MySQL Connector/J
- NetBeans IDE 27 or later, optional for GUI Designer editing

## Configure the Database Connection

1. Create the database using `Database/hotel database.sql`.
2. Copy `.env.example` to `.env` and replace the placeholder values.
3. Load the environment variables in your terminal or configure them in your IDE.
4. Set `DB_URL`, `DB_USER`, and `DB_PASSWORD` to values appropriate for your local database.

Example in PowerShell:

```powershell
$env:DB_URL = "jdbc:mysql://localhost:3306/hotel?useSSL=false&serverTimezone=UTC"
$env:DB_USER = "your_database_username"
$env:DB_PASSWORD = "your_database_password"
```

The application will not start database operations when the username or password is missing.

## Run the Project

```powershell
mvn clean compile
mvn exec:java -Dexec.mainClass=Login
```

If you use NetBeans, open the project folder and run the `Login` main class after configuring the environment variables.

## Database Notes

The repository intentionally does **not** contain a populated database dump. The schema file creates the tables only; it does not insert customer, employee, payment, room, or user records. This avoids publishing personal data and plaintext account information.

To create sample data for personal development, use a separate local file that is never committed to Git.

## Academic Project Notice

This system was developed as an academic university project. It is intended for educational use and demonstration, and it should not be treated as a production-ready hotel management system without additional security, testing, validation, and deployment controls.
