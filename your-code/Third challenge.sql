SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', SUM(sales.qty) AS 'Total' FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
INNER JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) desc
LIMIT 3;