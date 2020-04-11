# Lab MySQL SELECT

## Challenge 1 Who Have Published How Many At Where?

SELECT authors.au_id, authors.au_lname, authors.au_fname, t.title, p.pub_name
FROM authors
         INNER JOIN titleauthor ta on authors.au_id = ta.au_id
         INNER JOIN titles t on ta.title_id = t.title_id
         INNER JOIN publishers p on t.pub_id = p.pub_id;

## Challenge 2 Who Have Published How Many At Where?

SELECT authors.au_id, authors.au_lname, authors.au_fname, p.pub_name, COUNT(t.title) AS number_publications
FROM AUTHORS
         INNER JOIN titleauthor ta ON authors.au_id = ta.au_id
         INNER JOIN titles t ON ta.title_id = t.title_id
         INNER JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, p.pub_name
ORDER BY number_publications DESC;

## Challenge 3

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(s.qty) AS Total
FROM authors
         INNER JOIN titleauthor ta on authors.au_id = ta.au_id
         INNER JOIN titles t on ta.title_id = t.title_id
         INNER JOIN sales s on t.title_id = s.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY Total DESC
LIMIT 3;

#- Ringer	Anne	148
#- Ringer	Albert	133
#- Green	Marjorie	50

## Challenge 4

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(s.qty) AS Total
FROM authors
         INNER JOIN titleauthor ta on authors.au_id = ta.au_id
         INNER JOIN titles t on ta.title_id = t.title_id
         INNER JOIN sales s on t.title_id = s.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY Total DESC;