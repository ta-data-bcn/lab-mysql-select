USE publications;
/*
Challenge 1 - Who Have Published What At Where?
*/
SELECT * FROM authors; -- au_id, au_lname, au_fname
SELECT * FROM titleauthor; -- au_id title_id
SELECT * FROM publishers; -- pub_id, pub_name
SELECT * FROM titles; -- title_id, title, pub_id

SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM authors a
INNER JOIN titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN publishers p
ON t.pub_id = p.pub_id;

/*
Challenge 2 - Who Have Published How Many At Where? (34 output)
*/

SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, COUNT(*) AS title_count
FROM authors a
INNER JOIN titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN publishers p
ON t.pub_id = p.pub_id
GROUP BY a.au_fname, p.pub_name
ORDER BY title_count DESC;

/*
Challenge 3 - Best Selling Authors
*/
SELECT * FROM sales;
SELECT * FROM titles;

SELECT a.au_id, a.au_lname, a.au_fname, SUM(s.qty) AS sales
FROM authors a
INNER JOIN titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN sales s
ON t.title_id = s.title_id
GROUP BY a.au_fname
ORDER BY sales DESC
LIMIT 3;

/*
Challenge 4 - Best Selling Authors Ranking
*/

SELECT a.au_id, a.au_lname, a.au_fname, IFNULL(SUM(s.qty),0) AS sales
FROM authors a
LEFT JOIN titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN titles t
ON ta.title_id = t.title_id
LEFT JOIN sales s
ON t.title_id = s.title_id
GROUP BY a.au_fname
ORDER BY sales DESC;