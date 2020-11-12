USE publications;

-- Challenge 1

SELECT * FROM authors;
SELECT * FROM titleauthor;
SELECT * FROM titles;
SELECT * FROM publishers;
SELECT * FROM sales;

SELECT titleauthor.au_id AS "AUTHOR ID" , authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM titleauthor
JOIN authors
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id
;

-- Challenge 2

SELECT titleauthor.au_id AS "AUTHOR ID" , authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", publishers.pub_name AS PUBLISHER, count(publishers.pub_name) AS "TITLE COUNT"
FROM titleauthor
JOIN authors
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id, publishers.pub_name
;

-- Challenge 3

SELECT titleauthor.au_id AS "AUTHOR ID" , authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", titles.ytd_sales as TOTAL
FROM titleauthor
JOIN authors
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
ORDER BY TOTAL DESC
LIMIT 3
;


-- Challenge 4

SELECT titleauthor.au_id AS "AUTHOR ID" , authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", titles.ytd_sales as TOTAL
FROM titleauthor
JOIN authors
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
ORDER BY TOTAL DESC
;






	
    


;

