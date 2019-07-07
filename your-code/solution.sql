SELECT
	authors.au_id AS 'AUTHOR_ID',
    authors.au_lname AS 'LAST_NAME',
    authors.au_fname AS 'FIRST_NAME',
    titles.title AS 'TITLE',
    publishers.pub_name AS 'PUBLISHER'
    
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id;