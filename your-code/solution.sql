use publications;

SELECT 
    a.au_id AS `AUTHOR ID`,
    a.au_lname AS `LAST NAME`,
    a.au_fname AS `FIRST NAME`,
    t.title AS `TITLE`,
    p.pub_name AS `PUBLISHER`
FROM
    authors AS a
        JOIN
    titleauthor AS ta ON a.au_id=ta.au_id
		JOIN
	titles AS t ON t.title_id=ta.title_id
        JOIN
    publishers AS p ON p.pub_id=t.pub_id;
    
SELECT 
    a.au_id AS `AUTHOR ID`,
    a.au_lname AS `LAST NAME`,
    a.au_fname AS `FIRST NAME`,
    p.pub_name AS `PUBLISHER`,
    COUNT(ta.au_id) AS `TITLE COUNT`
FROM
    authors AS a
        JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
        JOIN
    titles AS t ON t.title_id = ta.title_id
        JOIN
    publishers AS p ON p.pub_id = t.pub_id
GROUP BY ta.au_id
ORDER BY COUNT(ta.au_id) DESC;

SELECT 
    a.au_id AS `AUTHOR ID`,
    a.au_lname AS `LAST NAME`,
    a.au_fname AS `FIRST NAME`,
    COUNT(s.title_id) AS 'TOTAL'
FROM
    authors AS a
        JOIN
	titleauthor AS ta ON ta.au_id = a.au_id
        JOIN
    sales AS s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY COUNT(a.au_id) DESC LIMIT 3;

SELECT 
    a.au_id AS `AUTHOR ID`,
    a.au_lname AS `LAST NAME`,
    a.au_fname AS `FIRST NAME`,
    COUNT(s.title_id) AS 'TOTAL'
FROM
    authors AS a
        LEFT JOIN
	titleauthor AS ta ON ta.au_id = a.au_id
        LEFT JOIN
    sales AS s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY COUNT(s.title_id) DESC;