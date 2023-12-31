use org;
select* from actor;
select* from cast;
select* from director;
select* from genres;
select* from movie;
select* from ratings;
select* from actor;
select* from movie_genres;
#i. Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.
select * from movie where mov_title = 'american beauty';

#ii. Write a SQL query to find those movies, which were released before 1998. Return movie title.
select * from movie where mov_year <= ('1998');

#iii. Write a query where it should contain all the data of the movies which were released after 1995 and their movie duration was greater than 120.
select * from movie where mov_year > 1995 and mov_time = 120;

#iv. Write a query to determine the Top 7 movies which were released in United Kingdom. Sort the data in ascending order of the movie year.
select * from movie where mov_rel_country = 'uk' order by mov_year asc limit 7;

#v. Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese and the movie year was 2001.
select* from movie where mov_lang = 'japanese' and mov_year = 2001;

#vi. Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire'.
select * from movie m join ratings r using (mov_id) where mov_title = 'slumdog millionaire'; 

#vii. Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors.
select a.act_fname, a.act_lname, a.act_gender, c.* from actor a join cast c using(act_id) where a.act_gender != 'm';

#viii. Write a SQL query to find the actors who played a role in the movie 'Annie Hall'.Fetch all the fields of actor table. (Hint: Use the IN operator).
select * from actor a join cast c using(act_id) join movie m using (mov_id) where mov_title ='annie hall';

#ix. Write a SQL query to find those movies that have been released in countries other than the United Kingdom. Return movie title, movie year, movie time, and date of release, releasing country.
select * from movie where mov_rel_country != 'uk';

#x. Print genre title, maximum movie duration and the count the number of movies in each genre. (HINT: By using inner join)
select g.gen_title, m.mov_time, g.gen_id from genres g join movie_genres mg using (gen_id) join movie m using (mov_id) ;
#xi. Create a view which should contain the first name, last name, title of the movie & role played by particular actor.
create view movie_actor as
select a.act_fname, a.act_lname, m.mov_title, c.role from actor a join cast c using (act_id) join movie m using (mov_id);
select* from movie_actor;
#xii. Write a SQL query to find the movies with the lowest ratings
select * from ratings where rev_stars <= 7;

#xiii. Finally Mail the script to jeevan.raj@imarticus.com