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


CREATE DATABASE bookstoredb;
USE bookstoredb;
-- creating tables--
CREATE TABLE Book ( Book_id INT PRIMARY KEY, 
BookName VARCHAR(100) NOT NULL,
PageCount INT,
Price DECIMAL(10.2),
Language VARCHAR(50) NOT NULL,
Publisher_id VARCHAR(100) NOT NULL,
PublishYear INT
);
CREATE TABLE author (
id INT PRIMARY KEY,
firstName VARCHAR(50),
lastName VARCHAR(50),
biography TEXT
);
CREATE TABLE book_author (
book_id INT,
author_id INT,
PRIMARY KEY (book_id, author_id),
FOREIGN KEY (book_id) REFERENCES book (book_id),
FOREIGN KEY (author_id) REFERENCES author (author_id)
);
CREATE TABLE book_language (
id INT AUTO_INCREMENT,
book_id INT NOT NULL,
language VARCHAR(50) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (book_id) REFERENCES book (book_id)
);

CREATE TABLE publisher(
id INT,
email VARCHAR(50),
phoneNumber VARCHAR(20),
Name VARCHAR(150) NOT NULL
);

CREATE TABLE customer(
id INT AUTO_INCREMENT,
firstName VARCHAR(100) NOT NULL,
lastName VARCHAR(100) NOT NULL,
email VARCHAR(50) NOT NULL,
phoneNumber VARCHAR(20)
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
history VARCHAR(100) NOT NULL,
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
