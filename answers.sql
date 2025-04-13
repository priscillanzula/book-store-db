-- create database bookstoredb;
-- USE bookstoredb;
-- creating new users 
-- CREATE USER 'leisha'@'localhost' IDENTIFIED BY '1234';
-- CREATE USER 'faith'@'localhost' IDENTIFIED BY '1234';
-- CREATE USER 'priscilla'@'localhost' 	IDENTIFIED BY '1234';

-- GRANT ALL PRIVILEGES ON bookstoredb.* TO 'leisha'@'localhost';
-- GRANT ALL PRIVILEGES ON bookstoredb.* TO 'faith'@'localhost';
-- GRANT ALL PRIVILEGES ON bookstoredb.* TO 'priscilla'@'localhost';

-- CREATE  TABLE Order_line(
-- orderLine_id INT NOT NULL,
-- order_id INT NOT NULL,
-- book_id INT NOT NULL,
-- quantity INT NOT NULL,
-- unitPrice FLOAT NOT NULL,

-- PRIMARY KEY(orderLine_id),
-- FOREIGN KEY(order_id) REFERENCES Cust_order(order_id),
-- FOREIGN KEY(book_id) REFERENCES Book(book_id)
-- );


-- table for country
CREATE TABLE country(
country_id INT AUTO_INCREMENT PRIMARY KEY,
country_name VARCHAR(100)
);


-- table for addresses
CREATE TABLE address (
address_id INT AUTO_INCREMENT PRIMARY KEY,
streetName VARCHAR(200),
city VARCHAR(100),
postal_code VARCHAR(25),
country_id INT,
FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- table for address status
CREATE TABLE address_status (
status_id INT AUTO_INCREMENT PRIMARY KEY,
status_name VARCHAR (100)
);

-- table for customer address
CREATE TABLE customer_address(
customer_id INT,
address_id INT,
ststus_id INT,
PRIMARY KEY (customer_id, address_id),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
FOREIGN KEY (address_id) REFERENCES customer(address_id),
FOREIGN KEY (status_id) REFERENCES customer(status_id)
);

-- table cust_order
CREATE TABLE cust_order (
order_line_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
book_id INT,
quantity INT,
price DECIMAL(10,2),
FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
FOREIGN KEY (book_id) REFERENCES book(book_id)
);






