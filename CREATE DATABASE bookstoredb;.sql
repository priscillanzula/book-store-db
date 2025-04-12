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

