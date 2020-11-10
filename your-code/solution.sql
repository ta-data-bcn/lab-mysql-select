#Challenge 1

SELECT 	a.au_id, a.au_fname, a.au_lname, t.title, p.pub_name
FROM authors AS a
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON ta.title_id = t.title_id
INNER JOIN publishers AS p ON t.pub_id = p.pub_id;

#Challenge 2 

SELECT 	a.au_id, a.au_fname, a.au_lname, p.pub_name, COUNT(ta.au_id) AS `TITLE COUNT`
FROM authors AS a
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN publishers AS p ON p.pub_id = t.pub_id
GROUP BY ta.au_id, p.pub_name
ORDER BY COUNT(ta.au_id) DESC;


#Challenge3 

SELECT 	a.au_id, a.au_fname, a.au_lname, p.pub_name, COUNT(ta.au_id) AS `TITLE COUNT`
FROM authors AS a
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN publishers AS p ON p.pub_id = t.pub_id
GROUP BY ta.au_id, p.pub_name
ORDER BY COUNT(ta.au_id) DESC LIMIT 3;

#Challenge4

SELECT 	a.au_id, a.au_fname, a.au_lname, COUNT(ta.au_id) AS `TITLE COUNT`
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t ON t.title_id = ta.title_id
LEFT JOIN publishers AS p ON p.pub_id = t.pub_id
GROUP BY a.au_id
ORDER BY COUNT(ta.au_id) DESC;