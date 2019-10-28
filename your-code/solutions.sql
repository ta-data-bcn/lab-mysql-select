use publications;
-- CHALLENGE 1
select ta.au_id 'AUTHOR ID', a.au_lname 'LAST NAME', a.au_fname 'FIRST NAME', t.title 'TITLE', p.pub_name  'PUBLISHER'
from titleauthor ta
inner join titles t on t.title_id = ta.title_id
inner join authors a on a.au_id = ta.au_id
inner join publishers p on p.pub_id = t.pub_id;

-- CHALLENGE 2
select ta.au_id 'AUTHOR ID', a.au_lname 'LAST NAME', a.au_fname 'FIRST NAME',  p.pub_name  'PUBLISHER', count(t.title_id) 'TITLE COUNT'
from titleauthor ta
LEFT OUTER JOIN titles t on t.title_id = ta.title_id
LEFT OUTER JOIN authors a on a.au_id = ta.au_id
LEFT OUTER JOIN publishers p on p.pub_id = t.pub_id
group by ta.au_id , a.au_lname , a.au_fname ,  p.pub_name
order by ta.au_id desc;

-- CHALLENGE 3
select ta.au_id 'AUTHOR ID', a.au_lname 'LAST NAME', a.au_fname 'FIRST NAME', 	sum(s.qty) 'TOTAL'
from sales s
LEFT OUTER JOIN titleauthor ta on s.title_id = ta.title_id
#LEFT OUTER JOIN sales s on s.title_id = ta.title_id
#LEFT OUTER JOIN titles t on t.title_id = ta.title_id
LEFT OUTER JOIN authors a on a.au_id = ta.au_id
#LEFT OUTER JOIN publishers p on p.pub_id = t.pub_id
group by ta.au_id , a.au_lname , a.au_fname
order by sum(s.qty)  desc
limit 3;

-- CHALLENGE 4
select ta.au_id 'AUTHOR ID', a.au_lname 'LAST NAME', a.au_fname 'FIRST NAME', IFNULL(sum(s.qty),0) AS 'TOTAL'
from sales s
LEFT OUTER JOIN titleauthor ta on s.title_id = ta.title_id
RIGHT OUTER JOIN authors a on a.au_id = ta.au_id
group by ta.au_id , a.au_lname , a.au_fname
order by sum(s.qty)  desc;
