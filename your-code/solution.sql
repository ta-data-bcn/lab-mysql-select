USE publications

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name 
FROM authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
join publishers on titles.pub_id = publishers.pub_id
ORDER BY au_id asc;

SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, count(titles.title) AS TITLE_COUNT
FROM authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
join publishers on titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
ORDER BY TITLE_COUNT DESC;

select authors.au_id, authors.au_lname, authors.au_fname, sum(sales.qty) AS sumsales
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join sales on titleauthor.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
order by sumsales DESC
limit 3;

select authors.au_id, authors.au_lname, authors.au_fname, sum(coalesce(sales.qty))
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join sales on titleauthor.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
order by sum(coalesce(sales.qty)) DESC;
