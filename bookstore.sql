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
