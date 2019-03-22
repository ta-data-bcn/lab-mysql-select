SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors AS a
INNER JOIN titleauthor AS ta ON ta.au_id = a.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN publishers AS p ON p.pub_id = t.pub_id;

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, p.pub_name AS PUBLISHER, COUNT(t.title) AS TITLE_COUNT
FROM authors AS a
INNER JOIN titleauthor AS ta ON ta.au_id = a.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN publishers AS p ON p.pub_id = t.pub_id
GROUP BY PUBLISHER, AUTHOR_ID
ORDER BY TITLE_COUNT DESC;

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, SUM(s.qty) AS TITLES_SOLD
FROM authors AS a
INNER JOIN titleauthor AS ta ON ta.au_id = a.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN sales AS s ON s.title_id = t.title_id
GROUP BY AUTHOR_ID
ORDER BY TITLES_SOLD DESC
LIMIT 3;

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, COALESCE(SUM(s.qty), 0) AS TITLES_SOLD
FROM authors AS a
LEFT JOIN titleauthor AS ta ON ta.au_id = a.au_id
LEFT JOIN titles AS t ON t.title_id = ta.title_id
LEFT JOIN sales AS s ON s.title_id = t.title_id
GROUP BY AUTHOR_ID
ORDER BY TITLES_SOLD DESC;
