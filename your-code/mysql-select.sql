#Challenge 1
SELECT a.au_id as Autor_id, a.au_lname as Last_Name, a.au_fname as First_name, t.title as Tittle, p.pub_name as Publisher
FROM titleauthor ti
INNER JOIN authors a on a.au_id = ti.au_id
INNER JOIN titles t on t.title_id = ti.title_id
INNER JOIN publishers p on p.pub_id = t.pub_id;

#Challenge 2
SELECT a.au_id as Autor_id, a.au_lname as Last_Name, a.au_fname as First_name, p.pub_name as Publisher, count(*) as Title_Count
FROM titleauthor ti
INNER JOIN authors a on a.au_id = ti.au_id
INNER JOIN titles t on t.title_id = ti.title_id
INNER JOIN publishers p on p.pub_id = t.pub_id
GROUP BY 1,4
ORDER BY 5 DESC;

#Challenge 3
SELECT a.au_id as Autor_id, a.au_lname as Last_Name, a.au_fname as First_name, sum(s.qty) as Total
FROM titleauthor ti
INNER JOIN authors a on a.au_id = ti.au_id
INNER JOIN sales s on s.title_id = ti.title_id
GROUP BY 1
ORDER BY 4 DESC
LIMIT 3;

#Challenge 4
SELECT a.au_id as Autor_id, a.au_lname as Last_Name, a.au_fname as First_name, sum(s.qty) as Total
FROM titleauthor ti
RIGHT JOIN authors a on a.au_id = ti.au_id
LEFT JOIN sales s on s.title_id = ti.title_id
GROUP BY 1
ORDER BY 4 DESC;

