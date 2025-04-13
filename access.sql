USE bookstoredb;

-- creating roles
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

