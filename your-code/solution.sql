-- 1 Challenge
SELECT
	authors.au_id AS 'AUTHOR_ID',
    authors.au_lname AS 'LAST_NAME',
    authors.au_fname AS 'FIRST_NAME',
    titles.title AS 'TITLE',
    publishers.pub_name AS 'PUBLISHER'
    
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id;

-- 2 Challenge
SELECT
	authors.au_id AS 'AUTHOR_ID',
    authors.au_lname AS 'LAST_NAME',
    authors.au_fname AS 'FIRST_NAME',
    publishers.pub_name AS 'PUBLISHER',
    -- titles.title AS 'TITLE',
    COUNT(titles.title) AS 'title_count'
    
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_name;

-- 3 Challenge
SELECT
	authors.au_id AS 'AUTHOR_ID',
    authors.au_lname AS 'LAST_NAME',
    authors.au_fname AS 'FIRST_NAME',
    SUM(sales.qty) AS 'QUANTITY'

FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3;

-- 4 Challenge
SELECT
	authors.au_id AS 'AUTHOR_ID',
    authors.au_lname AS 'LAST_NAME',
    authors.au_fname AS 'FIRST_NAME',
    SUM(sales.qty) AS 'QUANTITY'

FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 23;