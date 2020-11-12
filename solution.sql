use publications;
SELECT * FROM titleauthor;
SELECT * FROM titles;
SELECT * FROM authors;
SELECT * FROM publishers;
SELECT * FROM sales;

-- CHALLENGE 1

SELECT 
a.au_id as author_id,
a.au_lname as last_name,
a.au_fname as first_name,
t.title as title,
p.pub_name as publisher
FROM titleauthor as ta 

LEFT JOIN authors as a
ON a.au_id = ta.au_id

LEFT JOIN titles as t
ON t.title_id = ta.title_id

LEFT JOIN publishers as p
ON p.pub_id = t.pub_id;

-- CHALLENGE 2

SELECT 
a.au_id as author_id,
a.au_lname as last_name,
a.au_fname as first_name,
p.pub_name as publisher,
count(t.title) as title_count
FROM titleauthor as ta 

LEFT JOIN authors as a
ON a.au_id = ta.au_id

LEFT JOIN titles as t
ON t.title_id = ta.title_id

LEFT JOIN publishers as p
ON p.pub_id = t.pub_id

GROUP BY author_id, publisher
ORDER BY title_count DESC;

-- CHALLENGE 3

SELECT 
ta.au_id AS author_id,
a.au_lname AS last_name,
a.au_fname AS first_name,
sum(t.ytd_sales) AS total
FROM titleauthor AS ta

LEFT JOIN authors as a
ON ta.au_id = a.au_id

LEFT JOIN titles as t
ON ta.title_id = t.title_id

GROUP BY author_id
ORDER BY total DESC

LIMIT 3;

-- CHALLENGE 4

SELECT 
ta.au_id AS author_id,
a.au_lname AS last_name,
a.au_fname AS first_name,
sum(t.ytd_sales) AS total
FROM titleauthor AS ta

LEFT JOIN authors as a
ON ta.au_id = a.au_id

LEFT JOIN titles as t
ON ta.title_id = t.title_id

GROUP BY author_id
ORDER BY total DESC;
