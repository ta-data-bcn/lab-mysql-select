-- Challenge 1

SELECT a.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, title as TITLE, pub_name AS PUBLISHER
FROM authors AS a
JOIN titleauthor AS t2
ON a.au_id = t2.au_id

JOIN titles AS t1
ON t2.title_id = t1.title_id

JOIN publishers AS p
ON t1.pub_id = p.pub_id
;


-- Challenge 2

SELECT a.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, pub_name AS PUBLISHER,  COUNT(title) as TITLE_COUNT
FROM authors AS a
JOIN titleauthor AS t2
ON a.au_id = t2.au_id

JOIN titles AS t1
ON t2.title_id = t1.title_id

JOIN publishers AS p
ON t1.pub_id = p.pub_id

GROUP BY PUBLISHER, AUTHOR_ID
ORDER BY  TITLE_COUNT DESC
;

-- Challenge 3

SELECT a.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, SUM(qty) AS TOTAL
FROM authors AS a
JOIN titleauthor AS t2
ON a.au_id = t2.au_id

JOIN titles AS t1
ON t2.title_id = t1.title_id

JOIN sales AS s
ON t1.title_id = s.title_id

GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3
;

-- Challenge 4

SELECT a.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, IFNULL(SUM(qty),0) AS TOTAL
FROM publications.authors as a
LEFT JOIN titleauthor as t1
ON a.au_id = t1.au_id

LEFT JOIN sales AS s
ON t1.title_id = s.title_id

GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC;

