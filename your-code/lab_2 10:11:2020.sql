use publications;

select * from authors;
select * from titles;
select * from publishers;
select * from titleauthor;
select * from sales;



select a.au_id as author_id , a.au_lname as last_name, a.au_fname as first_name, t.title, p.pub_name as pubilisher

from titles as t 

inner join publishers as p 

on t.pub_id = p.pub_id 

inner join titleauthor as ta 

on ta.title_id = t.title_id

inner join authors as a 

on a.au_id = ta.au_id;



select a.au_id as author_id , a.au_lname as last_name, a.au_fname as first_name, t.title, p.pub_name as pubilisher

from titles as t 

left join publishers as p 

on t.pub_id = p.pub_id 

left join titleauthor as ta 

on ta.title_id = t.title_id

left join authors as a 

on a.au_id = ta.au_id;




select a.au_id as author_id , a.au_lname as last_name, a.au_fname as first_name, t.title, p.pub_name as pubilisher
from authors as a
left join titleauthor as ta 
on a.au_id = ta.au_id
left join titles as t 
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id 
group by author_id;

