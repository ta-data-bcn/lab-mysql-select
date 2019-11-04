#Challenge1 

select a.au_id, a.au_fname, a.au_lname, t.title, p.pub_name 
from 
	authors as a 
		join titleauthor ta on a.au_id = ta.au_id 
		join titles as t on ta.title_id = t.title_id
		join publishers as p on p.pub_id = t.pub_id 
order by a.au_id;

#Challenge2

select a.au_id, a.au_fname, a.au_lname, p.pub_name, count(*) as title_count 
from 
	authors as a 
		join titleauthor ta on a.au_id = ta.au_id 
		join titles as t on ta.title_id = t.title_id
		join publishers as p on p.pub_id = t.pub_id 
group by a.au_id, a.au_fname, a.au_lname, p.pub_name;

#Challeng3

select a.au_id, a.au_fname, a.au_lname, count(*) as total 
from 
	authors as a 
		join titleauthor ta on a.au_id = ta.au_id 
group by a.au_id, a.au_fname, a.au_lname
order by total desc
limit 3;