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
