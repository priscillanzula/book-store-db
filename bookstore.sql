CREATE DATABASE bookstoredb;

use bookstoredb;




































































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








