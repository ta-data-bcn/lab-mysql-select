-- Challenge 1 - Who Have Published What At Where?

SELECT ta.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname FIRST_NAME, t.title AS TITLE, p.pub_name AS PUBLISHER
FROM titleauthor ta
LEFT JOIN
	titles t ON ta.title_id = t.title_id
LEFT JOIN
	authors a ON ta.au_id = a.au_id
LEFT JOIN
	publishers p ON t.pub_id = p.pub_id;

	-- Challenge 2 - Who Have Published How Many At Where?

	SELECT AUTHOR_ID, LAST_NAME, PUBLISHER, COUNT(*) AS TOTAL_COUNT
	FROM
	(
	SELECT ta.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname FIRST_NAME, p.pub_name AS PUBLISHER, p.pub_id as publisher_id
	FROM titleauthor ta
	LEFT JOIN
		titles t ON ta.title_id = t.title_id
	LEFT JOIN
		authors a ON ta.au_id = a.au_id
	LEFT JOIN
		publishers p ON t.pub_id = p.pub_id) T
	GROUP BY AUTHOR_ID, LAST_NAME, publisher;

-- Challenge 3 - Who are the top 3 authors who have sold the highest number of titles?
--based on total books sold. However here there is a tie for the third position if observe the query results from challenge 4.


SELECT nq.author_id, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME
FROM
(SELECT ta.au_id AS author_id, sum(s.qty) AS sold
FROM sales s
LEFT JOIN
	titleauthor ta ON s.title_id = ta.title_id
GROUP BY ta.au_id
ORDER BY sold DESC
LIMIT 3) nq
LEFT JOIN
	authors a ON nq.AUTHOR_ID = a.au_id;

-----based on titles. In this case, we get exactly 3 authors.
SELECT nq.author_id, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, nq.sold as TOTAL
FROM
(SELECT ta.au_id AS author_id, count(s.title_id) AS sold
FROM sales s
LEFT JOIN
	titleauthor ta ON s.title_id = ta.title_id
GROUP BY ta.au_id
ORDER BY sold DESC
LIMIT 3) nq
LEFT JOIN
	authors a ON nq.AUTHOR_ID = a.au_id;

-- Challenge 4 - Best Selling Authors Ranking
--based on total books sold.
SELECT nq.author_id, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME
FROM
(SELECT ta.au_id AS author_id, sum(s.qty) AS sold
FROM sales s
LEFT JOIN
	titleauthor ta ON s.title_id = ta.title_id
GROUP BY ta.au_id
ORDER BY sold DESC) nq
LEFT JOIN
	authors a ON nq.AUTHOR_ID = a.au_id;

	-----based on titles. 
	SELECT nq.author_id, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, nq.sold as TOTAL
	FROM
	(SELECT ta.au_id AS author_id, count(s.title_id) AS sold
	FROM sales s
	LEFT JOIN
		titleauthor ta ON s.title_id = ta.title_id
	GROUP BY ta.au_id
	ORDER BY sold DESC
	LIMIT 3) nq
	LEFT JOIN
		authors a ON nq.AUTHOR_ID = a.au_id;
