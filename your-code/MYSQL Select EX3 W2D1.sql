;
select * from titles
;
select * from titleauthor
;
select * from authors
;
select * from publishers
;
select * from roysched
;

select `title`, `pub_name`, `au_id`, au_lname, l_fname from 
join authors 
;
SELECT authors.au_id, au_fname, au_lname, COUNT(DISTINCT title) as title_count, pub_name
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id
group by pub_name, au_id, au_lname, au_fname
order by title_count DESC
;
SELECT authors.au_id, au_fname, au_lname, sum(DISTINCT qty) as quantity_sold
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN sales
ON sales.title_id = titles.title_id
group by authors.au_id, au_fname, au_lname
order by quantity_sold DESC
limit 3
;


"""
END
Crate table "applications" ("id" bigint(20) NOT NULL AUTO_INCREMENT, "name" varchar(512) not null auto_increment, "size" bigint(20) not null, "price" double not null, "genre" bigint(20) default null, primary key("ID"), key "genre" ("genre"), foreign key ("genre") REFERENCES "prime_genres" ("id");
"""





