-- Challenge 1 - Who Have Published What At Where?

/*
In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author 
has published at which publishers. Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published

*/

USE publications;

SELECT * FROM authors
LIMIT 1;
SELECT * FROM publishers
LIMIT 1;
SELECT * FROM titles
LIMIT 1;
SELECT * FROM titleauthor
LIMIT 1;

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors AS a
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON ta.title_id = t.title_id
INNER JOIN publishers AS p ON t.pub_id = p.pub_id;


-- Challenge 2 - Who Have Published How Many At Where?

/* Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. 
Your output should look something like below:

Hint: In order to count the number of titles published by an author, you need to use MySQL COUNT. 
Also check out MySQL Group By because you will count the rows of different groups of data. 
Refer to the references and learn by yourself. 
These features will be formally discussed in the Temp Tables and Subqueries lesson.
*/

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, p.pub_name AS PUBLISHER ,COUNT(*) AS TITLE_COUNT
FROM authors AS a
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON ta.title_id = t.title_id
INNER JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER;

/*
ELECT a.au_id, a.au_fname, a.au_lname, t.title, p.pub_name
FROM authors as a, titles as t, publishers as p, titleauthor as ta
WHERE a.au_id = ta.au_id AND p.pub_id = t.pub_id AND ta.title_id = t.title_id 
*/

-- Challenge 3 - Best Selling Authors

/*
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.

*/

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname, t.ytd_sales
FROM authors AS a
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON ta.title_id = t.title_id
INNER JOIN publishers AS p ON t.pub_id = p.pub_id
ORDER BY t.ytd_sales DESC
LIMIT 3;


-- Challenge 4 - Best Selling Authors Ranking
/*
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
Also order your results based on TOTAL from high to low.
*/

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname, t.ytd_sales
FROM authors AS a
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON ta.title_id = t.title_id
INNER JOIN publishers AS p ON t.pub_id = p.pub_id
ORDER BY t.ytd_sales DESC
LIMIT 50;

select * from titles;

UPDATE titles
SET ytd_sales = 0
WHERE title_id = "MC3026";

UPDATE titles
SET ytd_sales = 0
WHERE title_id = "PC9999";