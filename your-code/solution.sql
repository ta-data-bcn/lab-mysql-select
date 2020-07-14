#Challenge 1
use publications;
select au.au_id, au.au_lname, au.au_fname, titles.title, publishers.pub_name
from titleauthor as ta
join titles
on titles.title_id=ta.title_id
join authors as au
on au.au_id=ta.au_id
join publishers
on publishers.pub_id=titles.pub_id

#Challenge 2:
use publications;
select au.au_id, au.au_lname, au.au_fname, publishers.pub_name, count(title) as title_count
from titleauthor as ta
join titles
on titles.title_id=ta.title_id
join authors as au
on au.au_id=ta.au_id
join publishers
on publishers.pub_id=titles.pub_id


group by au.au_id

#Challenge 3:
use publications;
select au.au_id, au.au_lname, au.au_fname, sum(sales.qty) as total
from titleauthor as ta
join titles
on titles.title_id=ta.title_id
join authors as au
on au.au_id=ta.au_id
join publishers
on publishers.pub_id=titles.pub_id
join sales
on sales.title_id=ta.title_id


group by title, au_id
order by total DESC

limit 3

#Challenge 4: 
use publications;
select au.au_id, au.au_lname, au.au_fname, sum(coalesce(sales.qty, 'NA')) as total
from titleauthor as ta
left join titles
on titles.title_id=ta.title_id
left join authors as au
on au.au_id=ta.au_id
left join publishers
on publishers.pub_id=titles.pub_id
left join sales
on sales.title_id=ta.title_id


group by title, au_id
order by total DESC