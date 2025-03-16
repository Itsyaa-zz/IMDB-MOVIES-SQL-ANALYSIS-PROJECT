SELECT * FROM project_movies_database.directors;
show databases;
use project_movies_database;
desc directors;
desc movies;

alter table directors
modify id int Primary key;

ALTER TABLE movies
ADD CONSTRAINT fk_id
FOREIGN KEY (id)
REFERENCES directors(id);

select id from movies;
select id from directors;
-- ----------------

-- e)	Find all directors with name starting with S.
select * from directors where name like"S%";
-- ----------------
ALTER TABLE directors
modify Gender2 VARCHAR(20);

UPDATE directors
SET Gender2 = CASE 
                WHEN Gender = 1 THEN 'Female'
				WHEN Gender =2 THEN 'Male'
                ELSE 'NOT Specified'
            END;
alter table directors drop gender;
alter table directors rename column Gender2 to Gender;
-- ------------------------------
-- f)	Count female directors.
select count(gender) as Female_Director_count
from directors
where Gender="Female";         
-- -----------------------------
select m.original_title,d.name as Director from directors as d join movies as m where m.id=d.id and d.name = "Brenda Chapman";
-- ------------------------------
select id,name from directors;
-- ----------------------------
-- a)	Can you get all data about movies? 
select * from movies;

-- b)	How do you get all data about directors?
select * from directors;

-- d)	Find these 3 directors: James Cameron; Luc Besson; John Woo;
select * from directors where name in("James Cameron","Luc Besson","John Woo");

-- h)	What are the 3 most popular movies?
select * from movies;
SELECT title, popularity
FROM movies
ORDER BY popularity DESC
LIMIT 3;

-- i)	What are the 3 most bankable movies?
select * from movies;
select * from directors;
SELECT title, revenue
FROM movies
ORDER BY revenue DESC
LIMIT 3;

-- k)	Which movie(s) were directed by Brenda Chapman?
SELECT m.title, d.name as director
FROM movies as m join directors as d
where m.id=d.id and d.name="Brenda Chapman";

-- l)	Which director made the most movies?
select count(m.id) as movie_count ,d.name as director from movies as m join directors as d where m.id=d.id  group by d.name order by movie_count desc limit 1;

-- m)	Which director is the most bankable?
select sum(m.revenue),d.name as director from directors as d join movies as m where m.id=d.id group by d.name order by sum(m.revenue) desc limit 1;


-- c)	Check how many movies are present in IMDB.
select count(*)  as IMDB_movies_count
from movies;

-- j)	What is the most awarded average vote since the January 1st, 2000?
select vote_average from movies WHERE release_date >= '2000-01-01' order by vote_average desc limit 1;
SELECT title, vote_average, release_date
FROM movies
WHERE release_date >= '2000-01-01'
ORDER BY vote_average DESC
LIMIT 1;

-- g)	Find the name of the 10th first women directors?
select name from directors where Gender="female" order by id limit 10;



select d.name from movies where Gender='female';
SELECT d.name, m.release_date
FROM directors AS d
JOIN movies AS m ON m.id = d.id
WHERE d.Gender = 'female';

