USE publications;

SELECT * FROM authors;

SELECT * FROM titles
LIMIT 1;

SELECT * FROM titleauthor;

SELECT * FROM publishers;

-- CHALLENGE 1
SELECT a.au_id AS AUTHOR, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, p.pub_name AS PUBLISHER
FROM authors as a, titles as t, titleauthor as ta ,publishers as p
WHERE a.au_id = ta.au_id AND t.title_id = ta.title_id AND t.pub_id = p.pub_id
ORDER BY AUTHOR;

-- CHALLENGE 2
SELECT a.au_id AS AUTHOR, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, p.pub_name AS PUBLISHER,COUNT(t.title) AS TITLE_COUNT
FROM authors as a, titles as t, titleauthor as ta ,publishers as p
WHERE a.au_id = ta.au_id AND t.title_id = ta.title_id AND t.pub_id = p.pub_id
GROUP BY AUTHOR
ORDER BY AUTHOR DESC;

-- CHALLENGE 3
SELECT a.au_id AS AUTHOR, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME,COUNT(t.title) AS TOTAL
FROM authors as a, titles as t, titleauthor as ta ,publishers as p
WHERE a.au_id = ta.au_id AND t.title_id = ta.title_id AND t.pub_id = p.pub_id
GROUP BY AUTHOR
ORDER BY TOTAL DESC
LIMIT 3;

-- CHALLENGE 4
SELECT 
    a.au_id,
    a.au_lname,
    a.au_fname,
    IFNULL(SUM(s.qty), 0) AS sales
FROM
    authors a
        LEFT JOIN
    titleauthor ta ON a.au_id = ta.au_id
        LEFT JOIN
    titles t ON ta.title_id = t.title_id
        LEFT JOIN
    sales s ON t.title_id = s.title_id
GROUP BY a.au_fname
ORDER BY sales DESC;



