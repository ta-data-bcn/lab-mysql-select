SELECT publishers.pub_name, COUNT(titles.title_id) AS Titles
FROM publishers
#Challenge 1

-- Joining publishers with titles

SELECT au_id AS Author_ID, au_fname AS Author_name, au_lname AS Author_surname, 
title AS Book_title, publishers.pub_name AS Publisher_name
FROM publishers
INNER JOIN titles
ON publishers.pub_id = titles.pub_id
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN authors
ON titleauthor.au_id = authors.au_id

-- GROUP BY Author_ID, Author_name, Author_surname
-- ORDER BY Author_ID DESC;
-- COUNT(title_id) AS No_titles



-- Validation. Count of rows of titleauthor table is the same as in the output coming from the join queries above.
SELECT COUNT(au_id)
FROM titleauthor;

# Challenge 2

SELECT a.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, pub_name AS PUBLISHER, COUNT(title) AS TITLE_COUNT
FROM authors AS a
JOIN titleauthor AS t2
ON a.au_id = t2.au_id
JOIN titles AS t1
ON t2.title_id = t1.title_id
JOIN publishers AS p
ON t1.pub_id = p.pub_id
GROUP BY AUTHOR_ID, FIRST_NAME, LAST_NAME, PUBLISHER
ORDER BY TITLE_COUNT DESC;

#Challenge 3
SELECT a.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, title, pub_name AS PUBLISHER, qty AS SOLD_BOOKS
FROM authors AS a
JOIN titleauthor AS t2
ON a.au_id = t2.au_id
JOIN titles AS t1
ON t2.title_id = t1.title_id
JOIN publishers AS p
ON t1.pub_id = p.pub_id
JOIN sales AS s
ON t1.title_id = s.title_id
ORDER BY SOLD_BOOKS DESC
LIMIT 3;

#Challenge 4

SELECT a.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, sum(qty) AS TOTAL
FROM authors AS a
JOIN titleauthor AS t2
ON a.au_id = t2.au_id
JOIN titles AS t1
ON t2.title_id = t1.title_id
JOIN publishers AS p
ON t1.pub_id = p.pub_id
LEFT JOIN sales AS s
ON t1.title_id = s.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC;











