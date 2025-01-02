CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,           -- Unique identifier for each customer
    first_name VARCHAR(50) NOT NULL,       -- Customer's first name (required)
    last_name VARCHAR(50) NOT NULL,        -- Customer's last name (required)
    email VARCHAR(100) UNIQUE,            -- Unique email address
    phone VARCHAR(15),                    -- Phone number (optional)
    city VARCHAR(50) DEFAULT 'Unknown'    -- City with a default value
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,              -- Unique identifier for each order
    customer_id INT NOT NULL,              -- Customer who placed the order
    product_name VARCHAR(100) NOT NULL,    -- Name of the product ordered
    quantity INT CHECK (quantity > 0),     -- Quantity must be greater than 0
    order_date DATE NOT NULL,              -- Date the order was placed
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) -- Link to Customers table
);

INSERT INTO Customers (customer_id, first_name, last_name, email, phone, city)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '1234567890', 'New York'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', NULL, 'Los Angeles'),
    (3, 'Sam', 'Brown', 'sam.brown@example.com', '9876543210', 'Chicago');

INSERT INTO Orders (order_id, customer_id, product_name, quantity, order_date)
VALUES
    (101, 1, 'Laptop', 2, '2024-01-10'),
    (102, 2, 'Smartphone', 1, '2024-01-15'),
    (103, 1, 'Tablet', 3, '2024-01-20'),
    (104, 3, 'Headphones', 5, '2024-01-25');

SELECT DISTINCT city FROM Customers;

SELECT Orders.product_name, Orders.quantity, Customers.first_name, Customers.last_name, Customers.city
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id;

SELECT customer_id, SUM(quantity) AS total_quantity
FROM Orders
GROUP BY customer_id;

SELECT * FROM Orders WHERE quantity > 3;

SELECT * FROM Customers WHERE city = 'Unknown';

