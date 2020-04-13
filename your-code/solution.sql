# CHALLENGE 1

USE publications;
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id ASC;


# CHALLENGE 2

SELECT  authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, count(titles.title)
FROM authors 
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname, publishers.pub_name
ORDER BY authors.au_id DESC


# CHALLENGE 3

SELECT authors.au_id, authors.au_lname, authors.au_fname, sum(qty)
FROM authors
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY SUM(qty) DESC
LIMIT  3

# CHALLENGE 4
SELECT authors.au_id, authors.au_lname, authors.au_fname, sum(COALESCE(qty,0))
FROM authors
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY sum(coalesce(qty,0)) DESC;