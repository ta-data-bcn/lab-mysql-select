SELECT titleauthor.au_id AS AuthorID, authors.au_lname AS LastName, authors.au_fname AS FirstName, titles.title AS Title, publishers.pub_name AS Publisher
FROM `titleauthor`
LEFT JOIN `authors` ON titleauthor.au_id = authors.au_id
LEFT JOIN `titles` ON titleauthor.title_id = titles.title_id
LEFT JOIN `publishers` ON titles.pub_id = publishers.pub_id; 


SELECT authors.au_id AS AuthorID, authors.au_lname AS LastName, authors.au_fname AS FirstName, publishers.pub_name AS Publisher, COUNT(publishers.pub_name) AS TitleCount
FROM `authors`
LEFT JOIN `titleauthor` ON titleauthor.au_id = authors.au_id
LEFT JOIN `titles` ON titleauthor.title_id = titles.title_id
LEFT JOIN `publishers` ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;


SELECT authors.au_id AS AuthorID, authors.au_lname AS LastName, authors.au_fname AS FirstName, SUM(sales.qty) AS Total
FROM `authors`
LEFT JOIN `titleauthor` ON titleauthor.au_id = authors.au_id
LEFT JOIN `sales` ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC
LIMIT 3;

SELECT authors.au_id AS AuthorID, authors.au_lname AS LastName, authors.au_fname AS FirstName, SUM(sales.qty) AS Total
FROM `authors`
LEFT JOIN `titleauthor` ON titleauthor.au_id = authors.au_id
LEFT JOIN `sales` ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC;

