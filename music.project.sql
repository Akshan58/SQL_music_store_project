--Q1: Who is the senior most employee based on the job title
--ANS--
select * from employee
order by levels desc
limit 1



--Q2: Which countries have the most invoices?

--ANS--
select count(*) as c , billing_country from invoice
group by billing_country
order by c desc

--Q3: What are the tp 3 values of total invoice?
--ANS--

select cast((total)as int) from invoice
order by total desc
limit 3

--Q4: Which city has the best customer?We would like to throw a promotional music festival in city we made the most money.
--Write a query that returns one city that has the highest sum of invoice totals. 
--Return both the city name and sum of all invoice totals.
--ANS--

select cast(sum(total) as int) as invoice_total, billing_city from invoice
group by billing_city 
order by invoice_total desc

--Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer.
--Write a query that returns the person who has spent the most money.
--ANS--

select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total  desc
limit 1

--Q6: Write query to return the email, first name, last name and genre of all rock music listeners.
--Return your list order alphabetically by email starting with A

--ANS--
select * from genre
select * from track
 
select distinct email, first_name, last_name from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (
                 select track_id from track 
	             join genre on track.genre_id = genre.genre_id
	             where genre.name = 'Rock'
)
order by email;

--Q7: Let's invite the artist who have written the most rock music in our dataset.
--Wrtite a query that returns the artist name and total track count of the top 10 rock bands

--ANS--
select * from album
select artist.artist_id, artist.name , count(artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.album_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10;



--Q8: Return all the track names that have a song length longer than the average song length.
--Return the name and milliseconds for each track. Order by the song length with longest songs.

--ANS--

select * from track

select name, milliseconds from track
where milliseconds > ( select avg(milliseconds) as avg_track_length from track)
order by milliseconds desc;


create database covid



