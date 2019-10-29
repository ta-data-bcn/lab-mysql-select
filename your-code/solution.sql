## Challenge 1 - Who Have Published What At Where?
use publications;
SELECT a.au_id, a.au_fname, a.au_lname, t.title, p.pub_name
FROM authors a
JOIN titleauthor ta on a.au_id = ta.au_id
JOIN titles t on ta.title_id = t.title_id
JOIN publishers p on t.pub_id = p.pub_id
ORDER BY a.au_id
;
#Check count of titleauthor Total: 25
SELECT count(*) FROM titleauthor;
#Check count of output table Total: 25
SELECT COUNT(*) FROM authors a
JOIN titleauthor ta on a.au_id = ta.au_id
JOIN titles t on ta.title_id = t.title_id
JOIN publishers p on t.pub_id = p.pub_id
;

## Challenge 2 - Who Have Published How Many At Where?
SELECT a.au_id, a.au_fname, a.au_lname, p.pub_name,
COUNT(t.title)
FROM authors a
JOIN titleauthor ta on a.au_id = ta.au_id
JOIN titles t on ta.title_id = t.title_id
JOIN publishers p on t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_fname, a.au_lname, p.pub_name
ORDER BY a.au_id
;

## Challenge 3 - Best Selling Authors
SELECT a.au_id, a.au_fname, a.au_lname,
SUM(s.qty) AS total
FROM authors a
JOIN titleauthor ta on a.au_id = ta.au_id
JOIN sales s on ta.title_id = s.title_id
GROUP BY a.au_id, a.au_fname, a.au_lname
ORDER BY total DESC
LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking
SELECT a.au_id, a.au_fname, a.au_lname,
COALESCE(SUM(s.qty),0) AS total
FROM authors a
LEFT JOIN titleauthor ta on a.au_id = ta.au_id
LEFT JOIN sales s on ta.title_id = s.title_id
GROUP BY a.au_id, a.au_fname, a.au_lname
ORDER BY total DESC
;