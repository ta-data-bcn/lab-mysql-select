USE publications;

select * from titleauthor;
select * from titles;
select * from authors;
select * from publishers;

CREATE TABLE authors_info as
select a.au_id, b.au_fname, b.au_lname, c.title, d.pub_name
from titleauthor as a
inner join authors as b
on a.au_id = b.au_id
inner join titles as c
on a.title_id = c.title_id
inner join publishers as d
on c.pub_id = d.pub_id;

select * from authors_info;

select *, count(pub_name) as title_count from authors_info
group by au_id, pub_name
order by title_count DESC;

select * from sales;
DROP TABLE IF EXISTS authors_sales;
CREATE TABLE authors_sales as
select a.au_id, b.au_fname, b.au_lname, c.title_id, s.qty
from titleauthor as a
inner join authors as b
on a.au_id = b.au_id
inner join titles as c
on a.title_id = c.title_id
inner join sales as s
on s.title_id = c.title_id;
ALTER TABLE authors_sales DROP COLUMN title_id;
select * from authors_sales
order by qty DESC
limit 3;
select * from authors_sales
order by qty DESC;
