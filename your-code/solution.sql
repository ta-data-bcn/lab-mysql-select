#Challenge 1
SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
from authors a
inner join titleauthor b
on a.au_id = b.au_id
left join titles t
on b.title_id = t.title_id
left join publishers p
on t.pub_id = p.pub_id;

