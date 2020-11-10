use publications;
select * from authors; -- au_id=title_id au_lname au_fname
select * from publishers; -- pub_id pub_names
select * from titles; -- title pub_id titile_id
select * from titleauthor;
-- Challenge 1

-- INNER JOIN
SELECT a.au_id, a.au_lname, a.au_fname, c.title, d.pub_name
FROM authors AS a
INNER JOIN titleauthor as b
ON a.au_id = b.au_id
INNER JOIN titles as c 
ON b.title_id = c.title_id
INNER JOIN publishers as d
ON c.pub_id = d.pub_id;

-- Challenge 2 

SELECT a.au_id, a.au_lname, a.au_fname, d.pub_name, COUNT(d.pub_name) as title_count
FROM authors AS a
INNER JOIN titleauthor as b
ON a.au_id = b.au_id
INNER JOIN titles as c 
ON b.title_id = c.title_id
INNER JOIN publishers as d
ON c.pub_id = d.pub_id
GROUP BY a.au_id, d.pub_name;


-- Challenge 3
SELECT a.au_id, a.au_lname, a.au_fname, d.pub_name, COUNT(d.pub_name) as title_count
FROM authors AS a
INNER JOIN titleauthor as b
ON a.au_id = b.au_id
INNER JOIN titles as c 
ON b.title_id = c.title_id
INNER JOIN publishers as d
ON c.pub_id = d.pub_id
GROUP BY a.au_id, d.pub_name
ORDER BY COUNT(d.pub_name) DESC
LIMIT 3;

-- Challenge 4
SELECT a.au_id, a.au_lname, a.au_fname, d.pub_name, COUNT(d.pub_name) as title_count
FROM authors AS a
INNER JOIN titleauthor as b
ON a.au_id = b.au_id
INNER JOIN titles as c 
ON b.title_id = c.title_id
INNER JOIN publishers as d
ON c.pub_id = d.pub_id
GROUP BY a.au_id, d.pub_name
ORDER BY COUNT(d.pub_name) DESC;







