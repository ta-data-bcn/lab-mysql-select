USE publications;

SELECT 
    *
FROM
    authors;
SELECT 
    *
FROM
    titles;
SELECT 
    *
FROM
    titleauthor;
SELECT 
    *
FROM
    sales;

-- CHALLENGE 1

SELECT 
    ta.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    t.title AS 'TITLE',
    p.pub_name AS 'PUBLISHER'
FROM
    titleauthor AS ta
        LEFT JOIN
    authors AS a USING (au_id)
        LEFT JOIN
    titles AS t USING (title_id)
        LEFT JOIN
    publishers AS p USING (pub_id);

-- CHALLENGE 2

SELECT 
    ta.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    p.pub_name AS 'PUBLISHER',
    COUNT(*) AS 'TITLE COUNT'
FROM
    titleauthor AS ta
        LEFT JOIN
    authors AS a USING (au_id)
        LEFT JOIN
    titles AS t USING (title_id)
        LEFT JOIN
    publishers AS p USING (pub_id)
GROUP BY ta.au_id , p.pub_name;

-- CHALLENGE 3

SELECT 
    ta.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    SUM(t.ytd_sales) AS TOTAL
FROM
    titleauthor AS ta
        LEFT JOIN
    authors AS a USING (au_id)
        LEFT JOIN
    titles AS t USING (title_id)
GROUP BY ta.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- CHALLENGE 4

SELECT 
    ta.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    SUM(t.ytd_sales) AS TOTAL
FROM
    titleauthor AS ta
        LEFT JOIN
    authors AS a USING (au_id)
        LEFT JOIN
    titles AS t USING (title_id)
GROUP BY ta.au_id
ORDER BY TOTAL DESC;