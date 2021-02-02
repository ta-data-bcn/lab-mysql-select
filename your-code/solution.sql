USE publications;

SELECT * FROM authors;
SELECT * FROM titles;
SELECT * FROM titleauthor;
SELECT * FROM sales;



-- challenge 1 
SELECT 
    a.au_id AS 'AUTHOR_ID',
    a.au_lname AS 'LAST_NAME',
    a.au_fname AS 'FIRST_NAME',
    t.title AS 'TITLE',
    p.pub_name AS 'PUBLISHER'
FROM
    authors a
        INNER JOIN
    titleauthor  ta 
		ON a.au_id = ta.au_id
        INNER JOIN
    titles AS t 
		ON ta.title_id = t.title_id
        INNER JOIN
    publishers p 
		ON t.pub_id = p.pub_id;

        
-- challenge 2 
SELECT 
    a.au_id AS 'AUTHOR_ID',
    a.au_lname AS 'LAST_NAME',
    a.au_fname AS 'FIRST_NAME',
	COUNT(t.title) AS 'TITLE_COUNT',
    p.pub_name AS 'PUBLISHER'
FROM
    authors a
        INNER JOIN
    titleauthor  ta 
		ON a.au_id = ta.au_id
        INNER JOIN
    titles AS t 
		ON ta.title_id = t.title_id
        INNER JOIN
    publishers p 
		ON t.pub_id = p.pub_id

GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER
ORDER BY TITLE_COUNT DESC;

-- Challenge 3 

SELECT 
    a.au_id AS 'AUTHOR_ID',
    a.au_lname AS 'LAST_NAME',
    a.au_fname AS 'FIRST_NAME',
    SUM(s.qty) AS 'Sales_per_author'
FROM
    authors  a
        INNER JOIN
    titleauthor  t 
		ON a.au_id = t.au_id
        INNER JOIN
    sales s
		ON t.title_id = s.title_id
     
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME
ORDER BY Sales_per_author desc
LIMIT 3 ;


-- Challenge 4 

SELECT 
    a.au_id AS 'AUTHOR_ID',
    a.au_lname AS 'LAST_NAME',
    a.au_fname AS 'FIRST_NAME',
    CASE
        WHEN SUM(s.qty) IS NOT NULL THEN SUM(s.qty)
        ELSE 0
    END AS 'Sales_per_author'
FROM
    authors a
        LEFT JOIN
    titleauthor t ON a.au_id = t.au_id
        LEFT JOIN
    sales s ON t.title_id = s.title_id
GROUP BY AUTHOR_ID , LAST_NAME , FIRST_NAME
ORDER BY Sales_per_author DESC;




       
       









