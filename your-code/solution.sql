use publications;

select * from authors;

select * from publishers;

select * from titleauthor;

select * from titles;


-- Challeneg1
select au.au_id, au.au_lname, au.au_fname, t.title, p.pub_name
from titleauthor ta
left join authors au
on au.au_id = ta.au_id
left join titles t
on ta.title_id = t.title_id
left join publishers p 
on p.pub_id = t.pub_id;

select count(*)
from titleauthor ta
left join authors au
on au.au_id = ta.au_id
left join titles t
on ta.title_id = t.title_id
left join publishers p 
on p.pub_id = t.pub_id;

select count(*) from titleauthor;

-- Challenge2 - how many titles each author has published at each publisher

select au.au_id, au.au_lname, au.au_fname, p.pub_name, count(t.title) as count_title
from titleauthor ta
left join authors au
on au.au_id = ta.au_id
left join titles t
on ta.title_id = t.title_id
left join publishers p 
on p.pub_id = t.pub_id
group by au.au_id, p.pub_name
order by count_title DESC;



-- Q3: Who are the top 3 authors who have sold the highest number of titles? 

select * from sales;
select * from titleauthor;
select * from authors;

select au.au_id, au.au_lname, au.au_fname ,sum(s.qty) as total
from sales as s
inner join titleauthor as ta
on s.title_id = ta.title_id
left join authors as au
on ta.au_id = au.au_id
group by au.au_id, s.title_id
order by total DESC
limit 3;

-- Q4: Who are the top 3 authors who have sold the highest number of titles? 
select au.au_id, au.au_lname, au.au_fname ,sum(s.qty) as total
from titleauthor as ta
left join sales as s
on s.title_id = ta.title_id
left join authors as au
on ta.au_id = au.au_id
group by au.au_id, s.title_id
order by total DESC;


