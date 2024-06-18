-- use database 
create database Project2;
use Project2;

-- show tables
select * from work;
select * from museum;
select * from artist;
select * from product_size;
select * from Canvas_size;

-- Joining Tables:

/* 1. Retrieve the full name of artists along with the 
	names of the museums where their works are displayed.*/

select a.full_name, m.name, w.style from artist a
join work w on a.artist_id = w.artist_id
join museum m on w.museum_id = m.museum_id;


/* 2. Group By and Count: How many works does each artist have in 
    the database? Display the artist's full name along with the 
    count of their works, ordered by the count in descending order.*/

select a.full_name, COUNT(*) as work_count from artist a
join work w on a.artist_id = w.artist_id
group by a.full_name
order by work_count desc;


/* 3. Order By and Limit: List the top 5 museums with the 
   highest number of works displayed in the database, 
   along with their respective counts.*/

select m.name, COUNT(*) as work_count from museum m
join work w on m.museum_id = w.museum_id
group by m.name
order by work_count desc
limit 5;




/* 4. Join, Order By, and Limit: Display the names 
   and styles of the works along with the corresponding
   museum names, ordered by the museum name in ascending 
   order. Limit the results to 10.*/

select w.name, a.style, m.name from work w
join artist a on w.artist_id = a.artist_id
join museum m on w.museum_id = m.museum_id
order by m.name asc
limit 10;



/* 5.Join, Group By, and Sum: Show the total sale price for each artist's works. 
   Display the artist's full name along with the total sale price, ordered by 
   the total sale price in descending order.*/

select a.full_name, SUM(p.sale_price) as total_sale_price from artist a
join product_size p on a.artist_id = p.work_id
group by a.full_name
order by total_sale_price desc;




/* 6. Join, Group By, and Having: List artists who have more than
   3 works in the database, along with the count of their works.*/

select a.full_name, COUNT(*) as work_count from artist a
join work w on a.artist_id = w.artist_id
group by a.full_name
having work_count > 3;



/* 7. Join, Where, and Order By: Retrieve the names of works 
  and their corresponding artists' full names for works that 
  have a sale price smaller than their regular price.*/

select w.name, a.full_name, p.sale_price from work w
join artist a on w.artist_id = a.artist_id
join product_size p on w.work_id = p.work_id
where p.sale_price < p.regular_price;



/* 8. Join, Group By, and Average: Calculate the average height and width
   of the artworks in the database. Display the average height and width.*/

select avg(height) as avg_height, avg(width) as avg_width from canvas_size;



/* 9. Join, Group By, and Max: Find the maximum sale price among all 
   the works in each museum. Display the museum name along with the 
   maximum sale price.*/

select m.name, MAX(p.sale_price) as max_sale_price from museum m
join product_size p on m.museum_id = p.size_id
group by m.name;


/* 10. Join, Group By, and Concatenate: Concatenate the full name of artists along with their nationality, 
   separated by a comma. Display the concatenated string along with the count of works by each artist, 
   ordered by the count in descending order.*/

select CONCAT(a.full_name, ', ', a.nationality) as artist_info, COUNT(*) as work_count from artist a
join work w on a.artist_id = w.artist_id
group by a.full_name, a.nationality
order by work_count desc;



