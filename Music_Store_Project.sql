SELECT *
FROM employee

-- Q1]Who is the senior most employee based on Job Title?

SELECT *
FROM employee
ORDER by levels DESC
LIMIT 1

-- Q2] Which country have the most invoices?
SELECT count(*) as c,billing_country
FROM invoice
GROUP BY billing_country
ORDER BY c DESC

-- Q3] What are the top 3 values of total invoices?
SELECT total
FROM invoice
ORDER BY total DESC
LIMIT 3


-- Q4]WHich City has the best customer?We would like to 
-- throw a Promotional Music Festival in the city we made the most money.
-- Write a query that returns one city that has highest sum of invoice totals.
-- Return both the city name and the sum of all invoice totals.

SELECT sum(total) total_sum,billing_city
FROM invoice
GROUP BY billing_city
ORDER BY total_sum DESC;


-- Q5]Who is the best customer? The customer who has spent the most money will
-- be declared the best customer. Write a query that returns the person who has
-- spent the most money

SELECT * 
FROM customer;



SELECT * 
FROM invoice;



SELECT sum(total) as s,c.first_name,c.last_name,c.customer_id
FROM customer c
JOIN invoice k
on c.customer_id= k.customer_id
GROUP BY c.customer_id
ORDER BY s DESC
LIMIT 1;


-- Q6]Write a Query to return the email,first name,last name and the genre of all 
-- Rock music listeners. Return your list order alphabetically by email starting with A.


SELECT * 
FROM invoice;

SELECT * 
FROM track;

SELECT * 
FROM customer;

SELECT * 
FROM genre;



SELECT DISTINCT c.email,c.first_name,c.last_name
FROM customer c
Join invoice i on c.customer_id= i.customer_id
JOIN invoice_line on i.invoice_id=invoice_line.invoice_id
WHERE track_id IN
   (SELECT t.track_id
    FROM track t
    JOIN genre g
    on t.genre_id= g.genre_id
    WHERE g.name LIKE 'Rock')
ORDER BY email
	
  


 
-- Q7]Let's invite the artist who have written the most rock music in our dataset.
-- Write a query that return the Artist name and total track count of the top 10 rock bands.

SELECT * 
FROM artist;

SELECT * 
FROM album


SELECT * 
FROM genre;

SELECT * 
FROM track;


SELECT art.name,art.artist_id,COUNT(art.artist_id) as number_of_songs
FROM artist art
JOIN album alb on art.artist_id=alb.artist_id
JOIN track ON alb.album_id=track.album_id
WHERE track_id In
(
SELECT t.track_id
	FROM track t
	JOIN genre g
	ON t.genre_id=g.genre_id
	WHERE g.name LIKE 'Rock'

)
GRoup by art.artist_id
ORDER BY number_of_songs DESC
LIMIT 10






-- Q8]Return all the track names that have a song length longer than the avg song length.
-- Return the name and millisecond for each track .Order by the song length with the longest
-- song listed first.


SELECT * 
FROM artist;

SELECT * 
FROM album


SELECT * 
FROM genre;

SELECT * 
FROM track;



SELECT name ,milliseconds
FROM track
WHERE milliseconds > 
  (SELECT AVG(milliseconds)
   FROM track
 ) 
ORDER BY milliseconds DESC

























 