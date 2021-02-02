USE publications;

-- Challenge 1

SELECT 
    a.au_id AS Author_ID,
    a.au_lname AS Last_Name,
    a.au_fname AS First_name,
    t.title AS Title,
    p.pub_name AS Publishers
    
FROM
    titles t
        INNER JOIN
    publishers p ON t.pub_id = p.pub_id
        INNER JOIN
    titleauthor ta ON ta.title_id = t.title_id
        INNER JOIN
    authors a ON a.au_id = ta.au_id;
    
-- Challenge 2

SELECT 
    a.au_id AS Author_ID,
    a.au_lname AS Last_Name,
    a.au_fname AS First_name,
    p.pub_name AS Publishers,
    COUNT(t.title) AS Title_Count
FROM
    titles t
        INNER JOIN
    publishers p ON t.pub_id = p.pub_id
        INNER JOIN
    titleauthor ta ON ta.title_id = t.title_id
        INNER JOIN
    authors a ON a.au_id = ta.au_id
GROUP BY a.au_id, p.pub_name
ORDER BY Title_Count DESC;

-- Challenge 3

SELECT 
    a.au_id AS Author_ID,
    a.au_lname AS Last_Name,
    a.au_fname AS First_Name,
    SUM(s.qty) AS Total
FROM
    authors AS a
        INNER JOIN
    titleauthor ta ON a.au_id = ta.au_id
        INNER JOIN
    sales s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY Total DESC;
-- LIMIT 3;

-- Challenge 4

SELECT 
    a.au_id AS Author_ID,
    a.au_lname AS Last_Name,
    a.au_fname AS First_Name,
    CASE WHEN SUM(qty) IS NOT NULL THEN SUM(qty) ELSE 0 END AS Total
FROM
    authors AS a
        LEFT JOIN
    titleauthor ta ON a.au_id = ta.au_id
        LEFT JOIN
    sales s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY Total DESC;

