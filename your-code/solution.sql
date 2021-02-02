USE publications;
select * from authors;
select * from titles;
select * from publishers;

select a.au_id AS "Author ID",
 a.au_lname AS "Last Name",
 a.au_fname AS "First Name",
 t.title AS "Title",
 p.pub_name AS "Publisher"
from titles t
Left join titleauthor ta ON t.title_id = ta.title_id
left join publishers p ON t.pub_id = p.pub_id
join authors a ON ta.au_id = a.au_id;


#

select a.au_id AS "Author ID",
 a.au_lname AS "Last Name",
 a.au_fname AS "First Name",
 p.pub_name AS "Publisher",
 count(t.title) AS Title_Count
from titleauthor ta
left join authors a ON ta.au_id = a.au_id
left join titles t ON t.title_id = ta.title_id
left join publishers p ON t.pub_id = p.pub_id
group by p.pub_id, a.au_id
order by Title_Count DESC;

#

select a.au_id,
 a.au_lname as last_name,
 a.au_fname as first_name,
 SUM(s.qty) as total
from titleauthor ta
inner join authors a on ta.au_id = a.au_id
inner join sales s on ta.title_id = s.title_id
group by a.au_id, s.qty
order by s.qty desc
limit 3;

#

select a.au_id,
 a.au_lname as last_name,
 a.au_fname as first_name,
 SUM(s.qty) as total
from titleauthor ta
inner join authors a on ta.au_id = a.au_id
inner join sales s on ta.title_id = s.title_id
group by a.au_id, s.qty
order by s.qty desc
limit 23;

