-- Practice Joins

-- 1
SELECT * FROM Invoice
JOIN InvoiceLine ON invoice.InvoiceId = InvoiceLine.InvoiceId
WHERE InvoiceLine.unitprice > '0.99'

--2
SELECT Invoice.InvoiceDate, Customer.FirstName, Customer.LastName, Invoice.Total 
FROM Invoice JOIN Customer ON Invoice.CustomerId = Customer.CustomerId 

--3
SELECT Customer.FirstName, Customer.LastName, Employee.FirstName, Employee.LastName 
FROM Customer JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId 

--4
SELECT Album.Title, Artist.Name FROM Album JOIN Artist on Album.ArtistId = Artist.ArtistId

--5
SELECT TrackId FROM PlaylistTrack JOIN Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId 
WHERE Playlist.Name = 'Music'

--6
SELECT Track.Name FROM Track JOIN PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId 
WHERE PlaylistTrack.PlaylistId = 5

--7
SELECT Track.Name AS Track_Name, Playlist.Name As Playlist_Name 
FROM Track 
JOIN PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId
JOIN Playlist ON PlaylistTrack.PlaylistID = Playlist.PlaylistId

--8
SELECT Track.Name AS Track_Name, Album.Title As Album_Title, Genre.Name AS Genre_Name 
FROM Track 
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name LIKE 'Alternative & Punk' 


--Practice nested queries

--1
SELECT * FROM Invoice
WHERE InvoiceId IN (Select InvoiceID FROM InvoiceLine WHERE unitPrice > '0.99')

--2
SELECT * FROM Track WHERE TrackId IN 
	(Select TrackID FROM PlayListTrack WHERE PlaylistId IN 
     	(Select PlaylistId FROM Playlist WHERE Name Like 'Music'))

--3
SELECT Name FROM Track WHERE TrackId IN 
	(Select TrackID FROM PlayListTrack WHERE PlaylistId = 5)

--4
SELECT Name FROM Track WHERE GenreId IN 
	(Select GenreId FROM Genre WHERE Name = 'Comedy')

--5
SELECT Name FROM Track WHERE AlbumId IN 
	(Select AlbumId FROM Album WHERE Title LIKE 'FireBall')

--6
SELECT Name FROM Track WHERE AlbumId IN 
	(Select AlbumId FROM Album WHERE ArtistId IN
    	(SELECT ArtistId FROM Artist WHERE Name LIKE 'Queen'))


--Practice updating Rows

--1
UPDATE Customer
SET Fax = NULL
WHERE Fax NOT NULL

--2
UPDATE Customer
SET Company = 'Self'
WHERE Company IS NULL

--3
UPDATE Customer
SET LastName = 'Thompson'
WHERE FirstName LIKE 'Julia' AND LastName LIKE 'Barnett'

--4
UPDATE Customer
SET SupportRepId = 4
WHERE Email LIKE 'luisrojas@yahoo.cl'

--5
UPDATE Track
SET Composer = 'The darkness around us'
WHERE Composer IS NULL AND GenreId IN (SELECT GenreId FROM Genre WHERE Name LIKE 'Metal')


--Group By

--1
SELECT COUNT(*), Genre.Name From Genre JOIN Track ON Genre.GenreID = Track.GenreID GROUP BY Genre.Name 

--2
SELECT COUNT(*), Genre.Name From Genre JOIN Track ON Genre.GenreID = Track.GenreID 
WHERE Genre.name LIKE 'Pop' OR Genre.Name LIKE 'Rock'
GROUP BY Genre.Name 

--3
SELECT COUNT(*), Artist.Name From Artist JOIN Album ON Artist.ArtistId = Album.ArtistId 
GROUP BY Artist.Name 


--Use Distinct

--1
SELECT DISTINCT composer from Track

--2
SELECT DISTINCT billingpostalcode from Invoice

--3
SELECT DISTINCT company from customer


--Delete Rows

--1
check

--2
DELETE FROM practice_delete WHERE type LIKE 'Bronze'

--3
DELETE FROM practice_delete WHERE type LIKE 'Silver'

--4
DELETE FROM practice_delete WHERE value = 150


--eCommerce Simulation - No Hints

--1
CREATE TABLE users ( name TEXT, email TEXT, user_id INTEGER PRIMARY KEY );

CREATE TABLE products ( name TEXT, price INTEGER, product_id integer PRIMARY KEY );

CREATE TABLE orders ( product_id INTEGER, order_id INTEGER PRIMARY KEY ); 

INSERT INTO orders ( product_id, order_id ) VALUES (3, 1);
INSERT INTO orders ( product_id, order_id ) VALUES (2, 2);
INSERT INTO orders ( product_id, order_id ) VALUES (1, 3);

SELECT * FROM products JOIN orders ON orders.product_id = products.product_id WHERE orders.order_id = 1

 SELECT * FROM orders
