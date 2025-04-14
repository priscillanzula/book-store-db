-- create database bookstore
CREATE DATABASE bookstoredb;

USE bookstoredb;
-- creating new users 
CREATE USER 'leishahttp'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'faithchepkemoi99'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'priscillanzula'@'localhost' IDENTIFIED BY '1234';

--  grant access to bookstoredb
GRANT ALL PRIVILEGES ON bookstore.* TO 'leishahttp'@'localhost';
GRANT ALL PRIVILEGES ON bookstore.* TO 'faithchepkemoi99'@'localhost';
GRANT ALL PRIVILEGES ON bookstore.* TO 'priscillanzula'@'localhost';

-- tables to hold all books in the store
CREATE TABLE Book ( 
book_id INT AUTO_INCREMENT PRIMARY KEY, 
bookName VARCHAR(100) NOT NULL,
pageCount INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
language VARCHAR(100) NOT NULL,
language_id INT NOT NULL,
publisher_id INT NOT NULL,
publishYear INT NOT NULL,
FOREIGN KEY (language_id) REFERENCES Book_language(language_id),
FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);

-- table for all authors
CREATE TABLE Author (
author_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
firstName VARCHAR(100) NOT NULL,
lastName VARCHAR(100) NOT NULL,
biography TEXT NOT NULL
);

-- table to manage the many-to-many relationship between books and authors.
CREATE TABLE Book_author (
book_id INT  NOT NULL,
author_id INT NOT NULL,
PRIMARY KEY (book_id, author_id),
FOREIGN KEY (book_id) REFERENCES Book (book_id),
FOREIGN KEY (author_id) REFERENCES Author (author_id)
);

-- table for all the possible languages of books.
CREATE TABLE Book_language (
language_id INT AUTO_INCREMENT NOT NULL,
languageName VARCHAR(100) NOT NULL,
PRIMARY KEY (language_id)
);

-- table to stores information about book publishers
CREATE TABLE Publisher(
publisher_id INT AUTO_INCREMENT NOT NULL,
email VARCHAR(100) NOT NULL,
phoneNumber VARCHAR(100) NOT NULL,
publisherName VARCHAR(100) NOT NULL,
PRIMARY KEY(publisher_id)
);
-- table to stores information about the bookstore's customers
CREATE TABLE Customer(
customer_id INT AUTO_INCREMENT NOT NULL,
firstName VARCHAR(100) NOT NULL,
lastName VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
phoneNumber VARCHAR(100) NOT NULL,
PRIMARY KEY(customer_id)
);

-- table to stores list of countries
CREATE TABLE Country(
country_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
countryName VARCHAR(100) NOT NULL
);


-- table to stores detailed address information
CREATE TABLE Address (
address_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
streetName VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL,
postalCode VARCHAR(100) NOT NULL,
country_id INT NOT NULL,
FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- table to Stores different statuses an address can have
CREATE TABLE Address_status (
addressStatus_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
statusName VARCHAR (100) NOT NULL
);

-- customer_address junction table
-- Maps the many-to-many relationship between customers and addresses
CREATE TABLE Customer_address(
customer_id INT NOT NULL,
address_id INT NOT NULL,
addressStatus_id INT NOT NULL,
PRIMARY KEY (customer_id, address_id),
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
FOREIGN KEY (address_id) REFERENCES Address(address_id),
FOREIGN KEY (addressStatus_id) REFERENCES Address_status(addressStatus_id)
);



-- table to Stores the main information about customer orders
CREATE TABLE Cust_order (
order_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
customer_id INT NOT NULL,
orderDate DATETIME NOT NULL,
shippingAddress_id INT NOT NULL,
shippingMethod_id INT NOT NULL,
orderTotal DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
FOREIGN KEY (shippingAddress_id) REFERENCES Address(address_id),
FOREIGN KEY (shippingMethod_id) REFERENCES Shipping_method(shippingMethod_id)
);

-- table to Stores the individual line items in each order
CREATE TABLE Order_line (
    order_id INT  AUTO_INCREMENT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    unitPrice DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES Cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);
-- table to Stores available shipping options
CREATE TABLE Shipping_method (
    shippingMethod_id INT AUTO_INCREMENT  NOT NULL,
    methodName VARCHAR(100) NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (shippingMethod_id)
);

-- table to Tracks the status changes of orders over time
CREATE TABLE Order_history(
history_id INT AUTO_INCREMENT NOT NULL,
order_id INT NOT NULL,
orderStatus_id INT NOT NULL,
history TEXT,
PRIMARY KEY(history_id),
FOREIGN KEY(order_id) REFERENCES Cust_order(order_id),
FOREIGN KEY(orderStatus_id) REFERENCES Order_status(orderStatus_id)
);

-- table to Stores the different statuses an order can have
CREATE TABLE Order_status(
orderStatus_id INT NOT NULL,
statusName VARCHAR(100) NOT NULL,
PRIMARY KEY(orderStatus_id)
);


-- Access control
-- Create roles for different user groups
CREATE ROLE admin_role,managerial_role,sales_role, inventory_role, customer_role; 

-- create users
CREATE USER 'admin_lucy'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'manager_ann'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'sales_personel'@'localhost' IDENTIFIED BY '1234';   
CREATE USER 'customer_a'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'Lynn'@'localhost' IDENTIFIED BY '1234';

--  Assign Privileges to Roles
-- Admin role gets all privileges
GRANT ALL ON booktoredb.* TO 'admin_role';
-- Manager role gets most privileges but not administrative ones
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstoredb.book TO 'managerial_role';
REVOKE INSERT, UPDATE, DELETE ON bookstoredb.book FROM 'managerial_role';

-- Sales role gets access to customer and order tables
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstoredb.customer TO 'sales_role';
GRANT SELECT, INSERT, UPDATE, DELETE ON Bookstoredb.customer_address TO 'sales_role';
GRANT SELECT, INSERT, UPDATE, DELETE ON Bookstoredb.cust_order TO 'sales_role';
GRANT SELECT, INSERT, UPDATE, DELETE ON Bookstoredb.order_line TO 'sales_role';
GRANT SELECT, INSERT, UPDATE, DELETE ON Bookstoredb.order_history TO 'sales_role';
GRANT SELECT ON bookstoredb.book TO 'sales_role';
GRANT SELECT ON bookstoredb.publisher TO 'sales_role';

-- Inventory role focuses on book inventory
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstoredb.book TO 'inventory_role';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstoredb.book_author TO 'inventory_role';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstoredb.author TO 'inventory_role';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstoredb.publisher TO 'inventory_role';
GRANT SELECT ON bookstoredb.order_line TO 'inventory_role';
-- Read-only role can only view data
GRANT SELECT ON bookstoredb.* TO 'customer_role';

-- Assign the roles to a user
GRANT 'admin_role' TO 'admin_lucy'@'localhost';
GRANT 'managerial_role' TO 'manager_ann'@'localhost';
GRANT 'sales_role' TO 'sales_personel'@'localhost';
GRANT 'customer_role' TO 'customer_a'@'localhost';
GRANT 'inventory_role' TO 'Lynn'@'localhost';

-- Set default roles for users
SET DEFAULT ROLE admin_role TO 'admin_lucy'@'localhost';
SET DEFAULT ROLE managerial_role TO 'manager_ann'@'localhost';
SET DEFAULT ROLE sales_role TO 'sales_personel'@'localhost';
SET DEFAULT ROLE customer_role TO 'customer_a'@'localhost';
SET DEFAULT ROLE inventory_role TO 'Lynn'@'localhost';

-- List all books with their authors and publishers

SELECT b.BookName, a.firstName AS AuthorFirstName, a.lastName AS AuthorLastName, p.publisherName
FROM Book b
JOIN Book_author ba ON b.book_id = ba.book_id
JOIN Author a ON ba.author_id = a.author_id
JOIN publisher p ON b.publisher_id = p.publisher_id;


-- Get books in a specific language (e.g., 'English')
SELECT b.BookName, l.languageName
FROM Book b
JOIN Book_language l ON b.language_id = l.language_id
WHERE l.languageName = 'English';


-- Analytics 
-- Top 5 most ordered books
SELECT b.BookName, SUM(ol.quantity) AS TotalOrdered
FROM Book b
JOIN order_line ol ON b.book_id = ol.book_id
GROUP BY b.BookName
ORDER BY TotalOrdered DESC
LIMIT 5;

-- Total revenue generated by each publisher
SELECT p.publisherName, SUM(ol.unitPrice * ol.quantity) AS TotalRevenue
FROM Book b
JOIN order_line ol ON b.book_id = ol.book_id
JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY p.publisherName
ORDER BY TotalRevenue DESC;