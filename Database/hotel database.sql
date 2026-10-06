CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(100)
);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender ENUM('male','female'),
    job ENUM('front desk clerk','kitchen staff','room service','housekeeping','security','manager'),
    salary DECIMAL(10,2),
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE rooms (
    room_number INT PRIMARY KEY,
    availability ENUM('free','busy') DEFAULT 'free',
    cleaning_status ENUM('clean','dirty') DEFAULT 'clean',
    price DECIMAL(10,2),
    bed_type ENUM('single','double','suite')
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender ENUM('male','female'),
    phone VARCHAR(20),
    room_number INT,
    cost DECIMAL(10,2),
    check_in DATE,
    FOREIGN KEY (room_number) REFERENCES rooms(room_number)
);

CREATE TABLE check_in (
    checkin_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100), -- optional copy
    room_number INT,
    checkin_date DATE,
    amount_pending DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (room_number) REFERENCES rooms(room_number)
);

CREATE TABLE check_out (
    checkout_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100), -- optional copy
    room_number INT,
    checkin_date DATE,
    checkout_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (room_number) REFERENCES rooms(room_number)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    room_number INT,
    payment_date DATE,
    amount_paid DECIMAL(10,2),
    payment_method ENUM('cash','credit card','online','bank transfer'),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (room_number) REFERENCES rooms(room_number)
);