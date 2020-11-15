use publications;

SELECT * FROM titles;

select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
from titleauthor
join titles on titles.title_id = titleauthor.title_id
join authors on authors.au_id = titleauthor.au_id
join publishers on publishers.pub_id = titles.pub_id
order by titleauthor.au_id;


select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', publishers.pub_name as 'PUBLISHER', count(publishers.pub_id) as "TITLE COUNT"
from titleauthor
join titles on titles.title_id = titleauthor.title_id
join authors on authors.au_id = titleauthor.au_id
join publishers on publishers.pub_id = titles.pub_id
where titleauthor.au_ord=1
group by publishers.pub_name, authors.au_id
order by "TITLE COUNT" desc;
 


select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as'FIRST NAME', sum(sales.qty) as TOTAL 
from titleauthor
join titles on titles.title_id = titleauthor.title_id
join authors on authors.au_id = titleauthor.au_id
join sales on sales.title_id=titles.title_id
group by authors.au_id
order by TOTAL desc
limit 3;

select  authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as'FIRST NAME', COALESCE(sum(sales.qty),0) as TOTAL
from titleauthor
join titles on titles.title_id = titleauthor.title_id
right join authors on authors.au_id = titleauthor.au_id
left join sales on sales.title_id=titleauthor.title_id
group by authors.au_id
order by TOTAL desc;