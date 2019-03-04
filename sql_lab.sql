# Challenge 1 - Who Have Published What At Where?

SELECT 
    authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', title AS 'TITLE', pub_name AS 'PUBLISHER'
FROM
    titles
INNER JOIN
	titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN
	authors ON authors.au_id = titleauthor.au_id
INNER JOIN
	publishers ON publishers.pub_id = titles.pub_id;


# Challenge 2 - Who Have Published How Many At Where?

SELECT 
    authors.au_id AS 'AUTHOR ID', MAX(au_lname) AS 'LAST NAME', MAX(au_fname) AS 'FIRST NAME', pub_name AS 'PUBLISHER', COUNT(titles.title_id) AS 'TITLE COUNT'
FROM
    titles
INNER JOIN
	titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN
	authors ON authors.au_id = titleauthor.au_id
INNER JOIN
	publishers ON publishers.pub_id = titles.pub_id
GROUP BY
	authors.au_id, pub_name;
    


SELECT sum(t.TITLE) from 
	(SELECT 
    authors.au_id AS 'AUTHOR ID', MAX(au_lname) AS 'LAST NAME', MAX(au_fname) AS 'FIRST NAME', pub_name AS 'PUBLISHER', COUNT(titles.title_id) AS 'TITLE'
FROM
    titles
INNER JOIN
	titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN
	authors ON authors.au_id = titleauthor.au_id
INNER JOIN
	publishers ON publishers.pub_id = titles.pub_id
GROUP BY
	authors.au_id, pub_name
    ) t;
   
# Challenge 3 - Best Selling Authors
    
SELECT 
    MAX(authors.au_id) AS 'AUTHOR ID', MAX(au_lname) AS 'LAST NAME', MAX(au_fname) AS 'FIRST NAME', SUM(qty) as 'TOTAL'
FROM
    titles
INNER JOIN
	titleauthor ON titles.title_id = titleauthor.title_id
INNER JOIN
	authors ON authors.au_id = titleauthor.au_id
INNER JOIN
	sales ON sales.title_id = titles.title_id
GROUP BY
	titles.title_id
ORDER BY
	4 desc
LIMIT 3;

# Challenge 4 - Best Selling Authors Ranking

SELECT 
    MAX(authors.au_id) AS 'AUTHOR ID', MAX(au_lname) AS 'LAST NAME', MAX(au_fname) AS 'FIRST NAME', IFNULL(SUM(qty)*MAX(royaltyper)/100, 0) as 'TOTAL'
FROM
    authors
LEFT JOIN
	titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN
	titles ON titles.title_id = titleauthor.title_id
LEFT JOIN
	sales ON sales.title_id = titles.title_id
GROUP BY
	authors.au_id
ORDER BY
	4 desc;
    
