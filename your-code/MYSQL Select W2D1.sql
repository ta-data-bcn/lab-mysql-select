
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
SELECT authors.au_id, au_fname, au_lname, title, pub_name
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id;


"""
Crate table "applications" ("id" bigint(20) NOT NULL AUTO_INCREMENT, "name" varchar(512) not null auto_increment, "size" bigint(20) not null, "price" double not null, "genre" bigint(20) default null, primary key("ID"), key "genre" ("genre"), foreign key ("genre") REFERENCES "prime_genres" ("id");
"""





