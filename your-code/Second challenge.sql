SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', publishers.pub_name AS 'Publisher', COUNT(*) AS 'Title Count' FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_lname, authors.au_id, authors.au_fname, publishers.pub_name
ORDER BY COUNT(*) desc;