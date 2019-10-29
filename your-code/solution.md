Challenge 1 - Who Have Published What At Where?

use publications;

select authors.au_id, authors.au_fname, authors.au_lname, titles.title, publishers.pub_name

from authors

join titleauthor on authors.au_id = titleauthor.au_id

join titles on titleauthor.title_id = titles.title_id

join publishers on titles.pub_id = publishers.pub_id
order by au_id asc;



------------------------------------------------------------------------------------------------------
Challenge 2 - Who Have Published How Many At Where?

use publications;

select a.au_id, a.au_fname, a.au_lname, publishers.pub_name, count(titles.title)

from authors as a

join titleauthor on a.au_id = titleauthor.au_id

join titles on titleauthor.title_id = titles.title_id

join publishers on titles.pub_id = publishers.pub_id

group by a.au_id, a.au_fname, a.au_lname, publishers.pub_name

order by au_id desc;



------------------------------------------------------------------------------------------------------
Challenge 3 - Best Selling Authors

use publications;

select a.au_id, a.au_lname, a.au_fname, sum(qty)

from authors as a

left join titleauthor on a.au_id = titleauthor.au_id

left join sales on titleauthor.title_id = sales.title_id

group by a.au_id, a.au_fname, a.au_lname

order by sum(qty) desc
limit 3;



------------------------------------------------------------------------------------------------------
Challenge 4 - Best Selling Authors Ranking

use publications;

select a.au_id, a.au_lname, a.au_fname, sum(coalesce(qty,0))

from authors as a

left join titleauthor on a.au_id = titleauthor.au_id

left join sales on titleauthor.title_id = sales.title_id

group by a.au_id, a.au_fname, a.au_lname

order by sum(coalesce(qty,0)) desc;