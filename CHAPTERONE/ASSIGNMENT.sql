CREATE DATABASE e_commerce;

CREATE TABLE Users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) UNIQUE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    address VARCHAR(300)
    );
    
    CREATE TABLE products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL (50,2),
    quantity_available INT,
    quantity_sold INT ,
    product_category VARCHAR(100)
    );
    
    
	CREATE TABLE orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL (50,2),
    quantity INT,
    user_id INT,
    product_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
   
    );