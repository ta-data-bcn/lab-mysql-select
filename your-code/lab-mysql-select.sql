USE publications;

-- CHALLENGE 1.
SELECT * FROM authors; -- AUTHOR ID, LAST NAME, FIRST NAME
SELECT * FROM titles; -- TITLE ID, TITLE,PUB_ID
SELECT * FROM titleauthor; -- AUTHOR ID, TITLE ID
SELECT * FROM publishers; -- PUB ID, PUBLISHER


SELECT b.au_id as "AUTHOR ID", b.au_lname as "LAST NAME", b.au_fname as "FIRST NAME", c.title as "TITLE", d.pub_name "PUBLISHER"
FROM titleauthor AS a

LEFT JOIN authors AS b
ON a.au_id = b.au_id

LEFT JOIN titles AS c
ON a.title_id = c.title_id

LEFT JOIN publishers as d
ON c.pub_id = d.pub_id;

-- CHALLENGE 2.

SELECT b.au_id as AUTHOR_ID, b.au_lname as LAST_NAME, b.au_fname as FIRST_NAME, d.pub_name PUBLISHER, COUNT(c.title) as TITLE_COUNT
FROM titleauthor AS a

LEFT JOIN authors AS b
ON a.au_id = b.au_id

LEFT JOIN titles AS c
ON a.title_id = c.title_id

LEFT JOIN publishers as d
ON c.pub_id = d.pub_id

GROUP BY b.au_id, d.pub_id
ORDER BY TITLE_COUNT DESC, LAST_NAME;

-- CHALLENGE 3.

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, SUM(qty) AS TOTAL
FROM authors AS a

LEFT JOIN titleauthor as b
ON a.au_id = b.au_id

LEFT JOIN sales as c
ON b.title_id = c.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- CHALLENGE 4.
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, COALESCE(SUM(qty), 0) AS TOTAL
FROM authors AS a

LEFT JOIN titleauthor as b
ON a.au_id = b.au_id

LEFT JOIN sales as c
ON b.title_id = c.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;
