USE publications;

#Challenge1:
SELECT a.au_id as author_id, a.au_lname as last_name, a.au_fname as first_name, t.title, p.pub_name as publisher
FROM titles as t
INNER JOIN publishers as p
ON t.pub_id = p.pub_id
INNER JOIN titleauthor as ta
ON ta.title_id = t.title_id
INNER JOIN authors as a
ON a.au_id = ta.au_id;

#Challenge2:
SELECT a.au_id as author_id, a.au_lname as last_name, a.au_fname as first_name, p.pub_name, count(t.title) as title_count
FROM titles t
INNER JOIN publishers as p
ON t.pub_id = p.pub_id
INNER JOIN titleauthor as ta
ON ta.title_id = t.title_id
INNER JOIN authors as a
ON a.au_id = ta.au_id
GROUP BY author_id;

#Challenge3:
SELECT a.au_id as author_id, a.au_lname as last_name, a.au_fname as first_name, count(t.title) as total
FROM titles t
INNER JOIN publishers as p
ON t.pub_id = p.pub_id
INNER JOIN titleauthor as ta
ON ta.title_id = t.title_id
INNER JOIN authors as a
ON a.au_id = ta.au_id 
GROUP BY author_id 
ORDER BY total DESC
LIMIT 3;

#Challenge4:
SELECT a.au_id, a.au_lname, a.au_fname, IFNULL(sum(s.qty), 0) as total
FROM authors a
LEFT JOIN titleauthor ta 
ON a.au_id = ta.au_id
LEFT JOIN titles t
ON ta.title_id = t.title_id
LEFT JOIN sales s
ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY total DESC;
