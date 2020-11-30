USE publications;

SELECT * FROM authors;
SELECT * FROM discounts;
SELECT * FROM employee;
SELECT * FROM jobs;
SELECT * FROM pub_info;
SELECT * FROM publishers;
SELECT * FROM roysched;
SELECT * FROM sales;
SELECT * FROM stores;
SELECT * FROM titleauthor;
SELECT * FROM titles;

-- Challenge 1 - Who Have Published What At Where? 
SELECT b.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, c.title as TITLE, d.pub_name as PUBLISHER
FROM authors AS a, titleauthor AS b, titles AS c, publishers AS d
WHERE a.au_id = b.au_id AND c.pub_id = d.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
SELECT b.au_id as AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, d.pub_name AS PUBLICATIONS, COUNT(d.pub_name) AS TITLE_COUNT
FROM authors as a, titleauthor as b, titles as c, publishers as d
WHERE a.au_id = b.au_id AND b.title_id = c.title_id AND c.pub_id = d.pub_id
GROUP BY a.au_id, d.pub_name;

-- Challenge 3 - Best Selling Authors
SELECT b.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, c.ytd_sales as TOTAL
FROM authors as a, titleauthor as b, titles as c
WHERE a.au_id = b.au_id AND b.title_id = c.title_id
GROUP BY a.au_id, c.ytd_sales
ORDER BY c.ytd_sales DESC
LIMIT 3;
 

-- Challenge 4 - Best Selling Authors Ranking
SELECT b.au_id as AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, c.ytd_sales as TOTAL
FROM authors as a, titleauthor as b, titles as c
WHERE a.au_id = b.au_id AND b.title_id = c.title_id
GROUP BY a.au_id, c.ytd_sales
ORDER BY c.ytd_sales DESC
LIMIT 50;

UPDATE titles
SET AUTHOR_ID = "486-29-1786"
WHERE TOTAL = 0;