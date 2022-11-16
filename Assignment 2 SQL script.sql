use sakila;
Select * from Customer;
Select * from Rental;

#1) For each customer who has rented a movie, give customer name, customer_id and rental_id. 
#Write an Equi-Join, a Natural join and an Inner join for Question 1.

#1a Inner Join:
Select c.customer_id, concat(c.first_name, '  ', c.last_name) as name, rental_id
from Rental r
inner join customer c 
on c.customer_id = r.customer_id;

#1b) Equi-Join:
Select c.customer_id, concat(c.first_name, '  ', c.last_name) as name, rental_id 
from customer c, rental r 
where c.customer_id = r.customer_id;

#Alter table Customer drop column last_update;
#1c) Natural join
Select c.customer_id, concat(c.first_name, '  ', c.last_name) as name, rental_id 
from customer c natural join rental r ;


#2) List the customer_name, ID and rental_id for all customers. Include those customers also who have not rented any movies
Select c.customer_id, concat(c.first_name, '  ', c.last_name) as name, rental_id 
from customer c left outer join rental r on
c.customer_id=r.customer_id;

#3) List out store_id, staff_name and staff_id. Include all staff information irrespective store.
Select s.store_id, staff_id, concat(st.first_name, '  ', st.last_name) as name
from store S right outer join staff st
on s.store_id = st.store_id;


#4) List customer_name, customer_id, email, rental_id and rental_date. Result should include all customers and rental information
Select c.customer_id, concat(c.first_name, '  ', c.last_name) as name, c.email, rental_id, rental_date
from customer c left outer join rental r
on c.customer_id = r.customer_id
UNION
select c.customer_id, concat(c.first_name, '  ', c.last_name) as name, c.email, rental_id, rental_date
from customer c right outer join rental r
on c.customer_id = r.customer_id;


#5. List customer_name, customer_id, address, rental_id, rental_date and store_id information
Select concat(c.first_name, ' ', c.last_name) as name,  c.customer_id, address, rental_id, rental_date, s.store_id
from customer c, rental r, address a, store s
where c.address_id = a.address_id and c.customer_id = r.customer_id and c.store_id = s.store_id;


#6. Assemble all necessary customer and rental and related store information whose customer_id =374
Select c.customer_id, concat(c.first_name, ' ', c.last_name) as name, email, c.address_id, rental_id,
rental_date, return_date, s.store_id, manager_staff_id
from customer c, rental r, store s
where c.customer_id=374 and c.customer_id=r.customer_id and c.store_id = s.store_id;


#7. List out staff_id and name of each staff and name of their managers.
Select a.staff_id, concat(a.first_name, ' ', a.last_name) as 'name', 
concat(c.first_name, ' ', c.last_name) as 'name'
from staff a, store b, staff c
where a.staff_id = b.manager_staff_id
and c.staff_id = b.manager_staff_id;


#8. List out all customers who have rented the movie.
Select * from customer c inner join rental r
on c.customer_id=r.customer_id;

#9. Create view called “v_film” and include title, descr, release_year and actor_name where rating = ‘G’
Create view v_film as select title, description, release_year, concat (c.first_name, ' ', c.last_name) as name 
from film a, film_actor b , actor c
where a.film_id = b.film_id
and b.actor_id = c.actor_id
and rating ='G';

Select * from v_film;


#10.Create view called “I_film” and include title, descr, release_year and actor_name where rating = ‘G’
Create view I_film as select a.title, a.length, a.rating, a.release_year, c.name as 'language name'
from film a , language c
where a.language_id = c.language_id
and rating ='PG';

Select * from I_film;
