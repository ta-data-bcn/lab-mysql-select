# Challenge 1
use publications;
Select authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
join publishers on titles.pub_id = publishers.pub_id
order by authors.au_id asc;

#Challenge 2
select authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, count(titles.title)
from authors 
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
join publishers on titles.pub_id = publishers.pub_id
group by authors.au_id, authors.au_fname, authors.au_lname, publishers.pub_name
order by authors.au_id desc;

#Challenge 3
select authors.au_id, authors.au_lname, authors.au_fname, sum(qty)
from authors
left join titleauthor on authors.au_id = titleauthor.au_id
left join sales on titleauthor.title_id = sales.title_id
group by authors.au_id, authors.au_fname, authors.au_lname
order by sum(qty) desc
limit 3;

#Challenge 4
select authors.au_id, authors.au_lname, authors.au_fname, sum(coalesce(qty,0))
from authors
left join titleauthor on authors.au_id = titleauthor.au_id
left join sales on titleauthor.title_id = sales.title_id
group by authors.au_id, authors.au_fname, authors.au_lname
order by sum(coalesce(qty,0)) desc;