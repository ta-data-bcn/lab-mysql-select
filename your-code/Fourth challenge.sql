SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', COALESCE(SUM(sales.qty * titles.price * titleauthor.royaltyper/100), 0) AS 'Total' FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) desc;