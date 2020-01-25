-- Challenge 1 - Who Have Published What At Where?
SELECT au.au_id AS 'AUTHOR ID', au.au_lname AS 'LAST NAME', au.au_fname AS 'FIRST NAME', ti.title AS 'TITLE', pu.pub_name AS 'PUBLISHER'
FROM authors AS au
INNER JOIN titleauthor AS tiau ON tiau.au_id = au.au_id
INNER JOIN titles AS ti ON tiau.title_id = ti.title_id
INNER JOIN publishers AS pu ON pu.pub_id = ti.pub_id
ORDER BY au.au_id DESC;

-- Challenge 2 - Who Have Published How Many At Where?
SELECT au.au_id AS 'AUTHOR ID', au.au_lname AS 'LAST NAME', au.au_fname AS 'FIRST NAME', pu.pub_name AS 'PUBLISHER', COUNT(ti.title) AS 'TITLE COUNT'
FROM authors AS au
INNER JOIN titleauthor AS tiau ON tiau.au_id = au.au_id
INNER JOIN titles AS ti ON tiau.title_id = ti.title_id
INNER JOIN publishers AS pu ON pu.pub_id = ti.pub_id
GROUP BY au.au_id, pu.pub_name
ORDER BY au.au_id DESC;

-- Challenge 3 - Best Selling Authors
SELECT au.au_id AS 'AUTHOR ID', au.au_lname AS 'LAST NAME', au.au_fname AS 'FIRST NAME', SUM(ti.ytd_sales) AS 'TOTAL'
FROM authors AS au
LEFT JOIN titleauthor AS tiau ON tiau.au_id = au.au_id
LEFT JOIN titles AS ti ON tiau.title_id = ti.title_id
GROUP BY au.au_id
ORDER BY SUM(ti.ytd_sales) DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT au.au_id AS 'AUTHOR ID', au.au_lname AS 'LAST NAME', au.au_fname AS 'FIRST NAME', IFNULL(SUM(ti.ytd_sales),0) AS 'TOTAL'
FROM authors AS au
LEFT JOIN titleauthor AS tiau ON tiau.au_id = au.au_id
LEFT JOIN titles AS ti ON tiau.title_id = ti.title_id
GROUP BY au.au_id
ORDER BY SUM(ti.ytd_sales) DESC;
