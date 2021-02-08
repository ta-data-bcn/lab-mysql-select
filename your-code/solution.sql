USE publications;

SELECT * FROM authors;
SELECT * FROM titleauthor;
SELECT * FROM titles;
SELECT * FROM publishers;

-- Challenge 1 - Who Have Published What At Where?
SELECT 
    au.au_id AS 'AUTHOR ID',
    au.au_lname AS 'LAST NAME',
    au.au_fname AS 'FIRST NAME',
    ti.title AS 'TITLE',
    pu.pub_name AS 'PUBLISHER'
FROM
    authors au
INNER JOIN
	titleauthor ta ON ta.au_id = au.au_id
INNER JOIN
	titles ti ON ti.title_id = ta.title_id
INNER JOIN
	publishers pu ON pu.pub_id = ti.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
SELECT 
    au.au_id AS `AUTHOR ID`,
    au.au_lname AS `LAST NAME`,
    au.au_fname AS `FIRST NAME`,
    pu.pub_name AS `PUBLISHER`,
    COUNT(ti.title) AS `TITLE COUNT`
FROM
    authors au
INNER JOIN
	titleauthor ta ON ta.au_id = au.au_id
INNER JOIN
	titles ti ON ti.title_id = ta.title_id
INNER JOIN
	publishers pu ON pu.pub_id = ti.pub_id
GROUP BY
	`AUTHOR ID`, `LAST NAME`, `FIRST NAME`, `PUBLISHER`
ORDER BY `TITLE COUNT` DESC;

