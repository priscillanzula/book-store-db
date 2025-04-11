USE bookstoredb;
-- creating new users 
CREATE USER 'leisha'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'faith'@'localhost' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON bookstoredb.* TO 'leisha'@'localhost';
GRANT ALL PRIVILEGES ON bookstoredb.* TO 'faith'@'localhost';

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


