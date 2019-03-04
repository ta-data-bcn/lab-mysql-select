-- Challenge 1 - Who Have Published What At Where?

SELECT authors.au_id, au_lname, au_fname, title, pub_name FROM titleauthor
INNER JOIN titles ON titleauthor.`title_id` = titles.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id

-- Challenge 2 - Who Have Published How Many At Where?

SELECT authors.au_id, publishers.pub_name, count(titles.title) FROM titleauthor
INNER JOIN titles ON titleauthor.`title_id` = titles.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_name;

-- Challenge 3 - Best Selling Authors

SELECT authors.`au_id`, authors.`au_lname`, authors.`au_fname`, SUM(sales.`qty`) FROM titleauthor
INNER JOIN authors ON titleauthor.`au_id` = authors.`au_id`
INNER JOIN sales ON titleauthor.`title_id` = sales.`title_id`
GROUP BY authors.`au_id`, authors.`au_lname`, authors.`au_fname`
ORDER BY SUM(sales.qty) desc
LIMIT 3

-- Challenge 4 - Best Selling Authors Ranking

SELECT authors.`au_id`, authors.`au_lname`, authors.`au_fname`, IFNULL(SUM(sales.`qty`), 0) as TOTAL FROM titleauthor
RIGHT JOIN sales ON titleauthor.`title_id` = sales.`title_id`
RIGHT JOIN authors ON titleauthor.`au_id` = authors.`au_id`
GROUP BY authors.`au_id`, authors.`au_lname`, authors.`au_fname`
ORDER BY TOTAL desc
LIMIT 23