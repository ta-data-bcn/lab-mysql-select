#Challenge 1 - Who have published what at where?

SELECT au.au_id, 
au.au_lname,
au.au_fname,
ti.title,
pu.pub_name
FROM authors AS au
JOIN titleauthor AS ta ON au.au_id = ta.au_id
JOIN titles AS ti ON ta.title_id = ti.title_id
JOIN publishers AS pu ON ti.pub_id = pu.pub_id;

#Challenge 2 - Who have published how many at where?

SELECT au.au_id, 
au.au_lname,
au.au_fname,
pu.pub_name,
count(ti.title)
FROM authors AS au
JOIN titleauthor AS ta ON au.au_id = ta.au_id
JOIN titles AS ti ON ta.title_id = ti.title_id
JOIN publishers AS pu ON ti.pub_id = pu.pub_id
GROUP BY au.au_id, pu.pub_name
ORDER BY count(ti.title) DESC;

#Challenge 3 - Best selling authors

SELECT au.au_id, 
au.au_lname,
au.au_fname,
sa.qty
FROM authors AS au
JOIN titleauthor AS ta ON au.au_id = ta.au_id
JOIN titles AS ti ON ta.title_id = ti.title_id
JOIN sales AS sa ON ti.title_id = sa.title_id
GROUP BY au.au_id, sa.qty
ORDER BY sa.qty DESC
LIMIT 3;

#Challenge 4 - Best selling authors ranking

SELECT au.au_id, 
au.au_lname,
au.au_fname,
sa.qty
FROM authors AS au
JOIN titleauthor AS ta ON au.au_id = ta.au_id
JOIN titles AS ti ON ta.title_id = ti.title_id
JOIN sales AS sa ON ti.title_id = sa.title_id
GROUP BY au.au_id, sa.qty
ORDER BY sa.qty DESC;