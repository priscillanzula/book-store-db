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

-- create book table
CREATE TABLE Book ( 
book_id INT PRIMARY KEY, 
bookName VARCHAR(100) NOT NULL,
pageCount INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
language VARCHAR(100) NOT NULL,
language_id INT NOT NULL,
publisher_id VARCHAR(100) NOT NULL,
publishYear INT NOT NULL,
FOREIGN KEY (language_id) REFERENCES book_language(language_id),
FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

-- create table author
CREATE TABLE author (
author_id INT PRIMARY KEY,
firstName VARCHAR(100),
lastName VARCHAR(100),
biography TEXT
);

-- create table book_author
CREATE TABLE book_author (
book_id INT NOT NULL,
author_id INT NOT NULL,
PRIMARY KEY (book_id, author_id),
FOREIGN KEY (book_id) REFERENCES book (book_id),
FOREIGN KEY (author_id) REFERENCES author (author_id)
);

-- create book_language table
CREATE TABLE book_language (
language_id INT NOT NULL,
book_id INT NOT NULL,
language VARCHAR(100) NOT NULL,
PRIMARY KEY (langugae_id),
FOREIGN KEY (book_id) REFERENCES book (book_id)
);

-- create publisher table
CREATE TABLE publisher(
publisher_id INT NOT NULL,
email VARCHAR(100) NOT NULL,
phoneNumber VARCHAR(100) NOT NULL,
publisherName VARCHAR(100) NOT NULL,
PRIMARY KEY(publisher_id)
);

CREATE TABLE customer(
customer_id INT NOT NULL,
firstName VARCHAR(100) NOT NULL,
lastName VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
phoneNumber VARCHAR(100) NOT NULL,
PRIMARY KEY(customer_id)
);

-- create order_line table
CREATE TABLE order_line (
    orderline_id INT NOT NULL,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (orderLine_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);
-- create shipping_method table
CREATE TABLE Shipping_method (
    shippingMethod_id INT NOT NULL,
    methodName VARCHAR(100) NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (shippingMethod_id)
);

-- create order_history
CREATE TABLE Order_history(
hitory_id INT NOT NULL,
order_id INT NOT NULL,
orderStatus_id INT NOT NULL,
history TEXT,
PRIMARY KEY(history_id),
FOREIGN KEY(order_id) REFERENCES Cust_order(order_id),
FOREIGN KEY(orderStatus_id) REFERENCES Order_status(orderStatus_id)
);


-- create order_status
CREATE TABLE Order_status(
orderStatus_id INT NOT NULL,
statusName VARCHAR(100) NOT NULL,
PRIMARY KEY(orderStatus_id)
);
