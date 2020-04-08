Use publications;

# Challenge 1

SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id, titles.title, publishers.pub_name
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id

# Challenge 2

SELECT authors.au_id, authors.au_lname, authors.au_fname, COUNT(titles.title), publishers.pub_name
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY publishers.pub_name, authors.au_id;

# Challenge 3


SELECT authors.au_id, authors.au_lname, authors.au_fname, COUNT(qty)
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY COUNT(qty) DESC;

# Challenge 4

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(coalesce(qty,0))
FROM authors
LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id
LEFT JOIN sales on titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY sum(coalesce(qty,0)) DESC;
