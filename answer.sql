CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,          
    product_name VARCHAR(50),        
    category VARCHAR(30),            
    quantity INT,                   
    price DECIMAL(10, 2),             
    sale_date DATE                    
);


INSERT INTO Sales (sale_id, product_name, category, quantity, price, sale_date)
VALUES
  (1, 'Laptop', 'Electronics', 5, 800.00, '2024-01-10'),
  (2, 'Tablet', 'Electronics', 3, 400.00, '2024-01-12'),
  (3, 'Chair', 'Furniture', 10, 50.00, '2024-01-15'),
  (4, 'Desk', 'Furniture', 7, 120.00, '2024-01-20'),
  (5, 'Smartphone', 'Electronics', 8, 600.00, '2024-02-01'),
  (6, 'Chair', 'Furniture', 5, 50.00, '2024-02-05'),
  (7, 'Laptop', 'Electronics', 2, 800.00, '2024-02-10');

SELECT DISTINCT category FROM Sales;

SELECT product_name, price FROM Sales ORDER BY price DESC;

SELECT category, SUM(quantity) AS total_quantity FROM Sales GROUP BY category;

SELECT product_name, AVG(price) AS average_price FROM Sales GROUP BY product_name;

SELECT sale_id, product_name, (quantity * price) AS revenue FROM Sales ORDER BY revenue DESC ;

SELECT product_name, SUM(quantity) AS   total_quantity FROM Sales GROUP BY product_name HAVING SUM(quantity) > 10;
