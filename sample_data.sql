USE bookstoredb;

-- Insert into independent tables first
INSERT INTO country (countryName) VALUES ('Uganda');
INSERT INTO Address (`streetName`, city, postalCode, country_id) 
VALUES ('Kampala Road', 'Kampala', '00256', LAST_INSERT_ID());
INSERT INTO address_status (statusName) VALUES ('Billing');
INSERT INTO customer (customer_id,firstName, lastName, email, phoneNumber) 
VALUES (2329,'kamau', 'jane', 'jane.kamau@gmail.com', '0723456789');
INSERT INTO Book (bookName, pageCount, price, language, language_id, publisher_id,publishYear)
VALUES ('The Lion', 300, 25.99, 'English', 224, 68, 2005);
INSERT INTO Book_language (languageName) VALUES ('English');
INSERT INTO publisher (publisher_id,email, phoneNumber, publisherName) 
VALUES (70,'publisher@example.com', '0734567890', 'Safari Publishers Ltd.');
INSERT INTO Author (author_id,firstName, lastName, biography) 
VALUES (791,'john', 'Doe', 'John Doe is a renowned author known for his thrilling novels and engaging storytelling.');
INSERT INTO Book_author (book_id, author_id) VALUES (10, 791);

-- Insert into dependent tables
INSERT INTO customer_address (customer_id, address_id,addressStatus_id) 
VALUES (2329,60,570);

INSERT INTO cust_order (customer_id,shippingMethod_id,shippingAddress_id,orderDate,orderTotal) 
VALUES (2329, 6058,60,'2025-04-14 10:30:00', 2500.00);
INSERT INTO order_line (order_id, book_id, quantity,unitPrice) 
VALUES (4, 11, 3, 77.97);
INSERT INTO shipping_method (shippingMethod_id,methodName, cost) VALUES (6059,'air', 1000.00);
INSERT INTO order_history (order_id,orderStatus_id, history) 
VALUES (4, 570, 'Order has been shipped.');
INSERT INTO order_status (orderStatus_id,statusName) VALUES (571,'shipped');

