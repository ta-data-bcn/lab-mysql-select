use publications;

# AUTHORS
SELECT 
    *
FROM
    authors;

# TITLEAUTHOR
SELECT 
    *
FROM
    titleauthor;

# TITLES
SELECT 
    *
FROM
    titles;

# PUBLISHERS
SELECT 
    *
FROM
    publishers;

#Challenge 1 - Who Have Published What At Where?
SELECT 
    a.au_id AS AUTHOR_ID,
    au_lname AS LAST_NAME,
    au_fname AS FIRST_NAME,
    t.title AS TITLE,
    p.pub_name AS PUBLISHER
FROM
    titleauthor AS ta
        LEFT JOIN
    authors AS a ON ta.au_id = a.au_id
        LEFT JOIN
    titles AS t ON ta.title_id = t.title_id
        LEFT JOIN
    publishers AS p ON p.pub_id = t.pub_id
    
    order by TITLE;
    
    
# Challenge 2 - Who Have Published How Many At Where?
SELECT 
    a.au_id AS AUTHOR_ID,
    au_lname AS LAST_NAME,
    au_fname AS FIRST_NAME,
    p.pub_name AS PUBLISHER,
	count(t.title) AS TITLE_COUNT
FROM
    titleauthor AS ta
        LEFT JOIN
    authors AS a ON ta.au_id = a.au_id
        LEFT JOIN
    titles AS t ON ta.title_id = t.title_id
        LEFT JOIN
    publishers AS p ON p.pub_id = t.pub_id
    
    group by PUBLISHER, AUTHOR_ID
    order by TITLE_COUNT desc;
    
#Challenge 3 - Best Selling Authors
 SELECT 
    *
FROM
    sales;
SELECT 
    *
FROM
    titleauthor;


SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    SUM(s.qty) AS TOTAL
FROM
    titleauthor AS ta
        LEFT JOIN
    authors AS a ON a.au_id = ta.au_id
        RIGHT JOIN
    sales AS s ON s.title_id = ta.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;
 


#Challenge 4 - Best Selling Authors Ranking
SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    SUM(s.qty) AS TOTAL
FROM
    titleauthor AS ta
        LEFT JOIN
    authors AS a ON a.au_id = ta.au_id
        INNER JOIN
    sales AS s ON s.title_id = ta.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;

 