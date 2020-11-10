-- initiate
use publications;
-- Challenge 1: Which titles has each author published at whcih publishers?
select * from authors;
select * from publishers;
select * from titles;
select * from titleauthor;
select *
into table titleauthor
from titles;

drop table table1;
create table table1 as 
select au_id,titleauthor.title_id, title,titles.pub_id
from titleauthor
inner join titles
on titleauthor.title_id = titles.title_id;

select * from table1;

drop table table2;

create table table2 as
select table1.au_id, table1.title_id, table1.title, authors.au_lname, authors.au_fname, table1.pub_id
from table1
inner join authors
on table1.au_id=authors.au_id;

select * from table2;

drop table final_table;

create table final_table as
select table2.au_id, table2.title_id, table2.title, table2.au_lname, table2.au_fname, table2.pub_id, publishers.pub_name
from table2
inner join publishers
on table2.pub_id=publishers.pub_id;

select * from final_table;

-- Challenge 2 - Who Has Published How Many And Where?

select *, count(title)
from final_table
group by au_id, pub_id
order by count(title) desc;

-- Challenge 3 - Best Selling Authors?
create table challenge3 as
select final_table.au_id, final_table.title_id, final_table.title, final_table.au_lname, final_table.au_fname, final_table.pub_id, final_table.pub_name, sales.qty
from final_table
inner join sales
on final_table.title_id=sales.title_id;

select *, sum(qty)
from challenge3
group by au_id
order by sum(qty) desc
limit 3;

-- Challenge 4 - Best-selling Authors Ranking

select *, sum(qty)
from challenge3
group by au_id
order by sum(qty) desc;