use publications;
# Challenge 1
SELECT titleauthor.au_id as AuthorID, authors.au_lname AS LastName, authors.au_fname AS FirstName, titles.title AS Title, publishers.pub_name
FROM titleauthor
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN titles on titleauthor.title_id = titles.title_id
INNER JOIN publishers on titles.pub_id = publishers.pub_id;

# Challenge 2
SELECT titleauthor.au_id as AuthorID, authors.au_lname AS LastName, authors.au_fname AS FirstName, publishers.pub_name AS Publisher, count(titles.title) as Count
FROM titleauthor
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN titles on titleauthor.title_id = titles.title_id
INNER JOIN publishers on titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY Count DESC;

# Challenge 3
SELECT titleauthor.au_id as AuthorID, authors.au_lname AS LastName , authors.au_fname AS FirstName, SUM(sales.qty) AS Sales
FROM titleauthor
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN titles on titleauthor.title_id = titles.title_id
INNER JOIN sales on titles.title_id = sales.title_id
INNER JOIN publishers on titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY Sales DESC
LIMIT 3;

# Challenge 4
SELECT titleauthor.au_id as AuthorID, authors.au_lname AS LastName , authors.au_fname AS FirstName, SUM(sales.qty) AS Sales
FROM titleauthor
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN titles on titleauthor.title_id = titles.title_id
INNER JOIN sales on titles.title_id = sales.title_id
INNER JOIN publishers on titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY Sales DESC;
