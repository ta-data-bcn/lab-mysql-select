USE publications;
# CH 1
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "SURNAME", a.au_fname AS "FIRST NAME", t.title AS "TITLE",  p.pub_name AS "PUBLISHER"

FROM titleauthor AS tt
JOIN authors AS a 
ON a.au_id = tt.au_id

JOIN titles AS t
ON tt.title_id = t.title_id

JOIN title_id_and_title_and_pub_id_table AS ttp
ON ttp.title_id = t.title_id

JOIN publishers as p
ON ttp.pub_id = p.pub_id;

# CH 2
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "SURNAME", a.au_fname AS "FIRST NAME",  p.pub_name AS "PUBLISHER", count(t.title_id) AS "TITLE"

FROM titleauthor AS tt
JOIN authors AS a 
ON a.au_id = tt.au_id

JOIN titles AS t
ON tt.title_id = t.title_id

JOIN title_id_and_title_and_pub_id_table AS ttp
ON ttp.title_id = t.title_id

JOIN publishers as p
ON ttp.pub_id = p.pub_id

GROUP BY a.au_id, p.pub_name;

# CH 3
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "SURNAME", a.au_fname AS "FIRST NAME", sum(qty) AS "TOTAL"

FROM authors AS a
JOIN titleauthor AS tt
ON tt.au_id = a.au_id

JOIN sales AS s
ON s.title_id = tt.title_id

GROUP BY a.au_id
ORDER BY sum(qty) DESC
LIMIT 3;

# CH 4
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "SURNAME", a.au_fname AS "FIRST NAME", sum(qty) AS "TOTAL"

FROM authors AS a
JOIN titleauthor AS tt
ON tt.au_id = a.au_id

JOIN sales AS s
ON s.title_id = tt.title_id

GROUP BY a.au_id
ORDER BY sum(qty) DESC;