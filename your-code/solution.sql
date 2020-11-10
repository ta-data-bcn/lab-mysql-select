use  publications;
select * from titles;
select * from titleauthor;
select * from publishers;
select * from sales;

/* CHALLENGE 1: WHICH AUTORS HAS PUBLISHED WHAT TITLES ON WHICH PUBLISHERS */
select ta.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title as TITLE,p.pub_id as PUBLISHER_ID, p.pub_name as PUBLISHER_NAME   
from titles as t
inner join titleauthor as ta
on t.title_id=ta.title_id
inner join publishers as p
on p.pub_id=t.pub_id
inner join authors as a
on a.au_id=ta.au_id
ORDER BY LAST_NAME;

/* CHALLENGE 2:query how many titles each author has published at each PUBLISHER.*/
select ta.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, 
a.au_fname as FIRST_NAME, p.pub_id as PUBLISHER_ID, 
p.pub_name as PUBLISHER_NAME, count(*) as TITLE_COUNT
from titles as t
inner join titleauthor as ta
on t.title_id=ta.title_id
inner join publishers as p
on p.pub_id=t.pub_id
inner join authors as a
on a.au_id=ta.au_id
group by AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER_ID, PUBLISHER_NAME
order by TITLE_COUNT DESC;

/* CHALLENGE 3:Who are the top 3 authors who have sold the highest number of titles?*/
select ta.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, 
a.au_fname as FIRST_NAME,t.title as TITLE, t.title_id, t.ytd_sales as sales
from titles as t
inner join titleauthor as ta
on t.title_id=ta.title_id
inner join publishers as p
on p.pub_id=t.pub_id
inner join authors as a
on a.au_id=ta.au_id

order by sales DESC LIMIT 3;

/* CHALLENGE 4:Best Selling Authors Ranking*/
select ta.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, 
a.au_fname as FIRST_NAME,t.title as TITLE, t.title_id, t.ytd_sales as sales
from titles as t
inner join titleauthor as ta
on t.title_id=ta.title_id
inner join publishers as p
on p.pub_id=t.pub_id
inner join authors as a
on a.au_id=ta.au_id
order by sales DESC LIMIT 23;



