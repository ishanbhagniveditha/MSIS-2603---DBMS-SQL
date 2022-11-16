use assignment_3;

#Q1) Create a table book_store with columns Book_id VARCHAR(255) NOT NULL, Book_Name VARCHAR(255) NOT NULL, Book_genre VARCHAR(255) NOT NULL, Status VARCHAR(255) NOT NULL, PRIMARY KEY (Book_id).
CREATE TABLE book_store(              
Book_id VARCHAR(255) NOT NULL,           
Book_Name VARCHAR(255) NOT NULL,  
Book_genre VARCHAR(255) NOT NULL,
Status VARCHAR(255) NOT NULL,
PRIMARY KEY (Book_id));
Select * from book_store;

#2) Create a table book with columns Book_id VARCHAR(255) NOT NULL, Book_Name VARCHAR(255) NOT NULL, Book_release integer, Book_price integer , Publisher Varchar(10), Book_genre VARCHAR(255) NOT NULL, PRIMARY KEY (Book_id)
CREATE TABLE book(
Book_id VARCHAR(255) NOT NULL,
Book_Name VARCHAR(255) NOT NULL,
Book_release integer,
Book_price integer, 
Publisher Varchar(10),
Book_genre VARCHAR(255) NOT NULL, 
PRIMARY KEY (Book_id));
Select * from book;

#3) Create a table price_logs  with columns  id INT(11) NOT NULL AUTO_INCREMENT, Book_id VARCHAR(255) NOT NULL, Old_Book_price DOUBLE NOT NULL, New_Book_price DOUBLE NOT NULL, updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, updated_by varchar(30) NOT NULL, PRIMARY KEY (id), KEY Book (Book_id), CONSTRAINT price_logs_ibfk_1 FOREIGN KEY (Book_id) REFERENCES Book (Book_id) ON DELETE CASCADE ON UPDATE CASCADE 
CREATE TABLE price_logs(
id INT(11) NOT NULL AUTO_INCREMENT, 
Book_id VARCHAR(255) NOT NULL, 
Old_Book_price DOUBLE NOT NULL, 
New_Book_price DOUBLE NOT NULL, 
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
updated_by varchar(30) NOT NULL, 
PRIMARY KEY (id), 
KEY Book (Book_id),
CONSTRAINT price_logs_ibfk_1 FOREIGN KEY (Book_id) REFERENCES Book (Book_id) 
ON DELETE CASCADE ON UPDATE CASCADE);
Select * from price_logs;

#4) Insert Trigger : Create a trigger to insert rows in book_store table every time a new book is inserted in book table.
CREATE TRIGGER new_Book_added 
AFTER INSERT ON BOOK
FOR EACH ROW INSERT INTO Book_Store (`Book_id`,`Book_Name`, `Book_genre`, `Status`) 
VALUES (NEW.Book_id,NEW.Book_Name, NEW.Book_genre,'Available');

INSERT INTO BOOK (Book_id, Book_Name, Book_release, Book_price, Publisher, 
Book_genre) VALUES ('1', 'The Chicken Soup', '2009', '25', 'JK Rowling', 'Fiction');
INSERT INTO BOOK (Book_id, Book_Name, Book_release, Book_price, Publisher, 
Book_genre) VALUES ('2', 'Harry Potter and Chambers of Secrets', '2003', '100', 'JK Rowling', 'Non-Fiction');
INSERT INTO BOOK (Book_id, Book_Name, Book_release, Book_price, Publisher, 
Book_genre) VALUES ('3', 'Matilda', '2012', '14', 'Agatha', 'Non-Fiction');
INSERT INTO BOOK (Book_id, Book_Name, Book_release, Book_price, Publisher, 
Book_genre) VALUES ('4', 'Lizzie Mcguire', '2011', '50', 'Jin Lim', 'Fiction');
INSERT INTO BOOK (Book_id, Book_Name, Book_release, Book_price, Publisher, 
Book_genre) VALUES ('5', 'The Family', '2018', '27', 'Parker', 'Fiction');
INSERT INTO BOOK (Book_id, Book_Name, Book_release, Book_price, Publisher, 
Book_genre) VALUES ('6', 'The Hollow Man', '2002', '29', 'Brian', 'Non-Fiction');
INSERT INTO BOOK (Book_id, Book_Name, Book_release, Book_price, Publisher, 
Book_genre) VALUES ('7', 'The Invisible Man', '2002', '35', 'Loren', 'Non-Fiction');
Select * from Book_Store;

#Q5) Update Trigger: Create a trigger to record/insert the price in price_logs table before updating the book table . Also record the user who updated the price. 
DELIMITER $$ 
CREATE TRIGGER
before_bookprice_update 
BEFORE UPDATE ON Book 
FOR EACH ROW BEGIN INSERT INTO 
price_logs(Book_id,Old_Book_price,New_Book_price,updated_by) 
VALUES(old.Book_id,old.Book_price,new.Book_price,user()); 
END $$ 
DELIMITER ;

UPDATE BOOK SET Book_price='30' WHERE Book_id='1';
Select * from price_logs;

#Q6) Delete Trigger: Create a trigger to delete record from Book_store when a book is deleted. 
CREATE TRIGGER delete_books 
AFTER DELETE ON BOOK 
FOR EACH ROW DELETE FROM BOOK_STORE WHERE book_store.book_id = old.book_id ;

Delete from BOOK WHERE BOOK_ID = '6';
SELECT * FROM BOOK_STORE;

#Q7) Stored Procedure: 
#a. Clarification – We want top3, top5 and all books ranked by their book_id 
#i. Use book table.

DELIMITER // 
CREATE PROCEDURE GetBooks(all_books varchar(10)) 
BEGIN IF all_books = 'TOP3' THEN SELECT * FROM BOOK ORDER BY Book_id LIMIT 3; 
ELSEIF all_books = 'TOP5' THEN SELECT * FROM BOOK ORDER BY Book_id LIMIT 5; 
ELSE SELECT * FROM BOOK ORDER BY Book_id ; 
END IF; 
END 
// DELIMITER ; 
CALL GETBooks('ALL');
CALL GETBooks('TOP3');
CALL GETBooks('TOP5');