USE publications;

# Challenge 1
SELECT authors.au_id, authors.au_lname, authors.au_fname, t.title, p.pub_name
FROM authors
         INNER JOIN titleauthor ta on authors.au_id = ta.au_id
         INNER JOIN titles t on ta.title_id = t.title_id
         INNER JOIN publishers p on t.pub_id = p.pub_id
ORDER BY authors.au_id ASC;

# Challenge 2
SELECT authors.au_id, authors.au_lname, authors.au_fname, p.pub_name, COUNT(t.title)
FROM authors
         INNER JOIN titleauthor ta on authors.au_id = ta.au_id
         INNER JOIN titles t on ta.title_id = t.title_id
         INNER JOIN publishers p on t.pub_id = p.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, p.pub_name
ORDER BY authors.au_id DESC;

# Challenge 3
SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(s.qty)
FROM authors
         INNER JOIN titleauthor ta on authors.au_id = ta.au_id
         INNER JOIN titles t on ta.title_id = t.title_id
         INNER JOIN sales s on t.title_id = s.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(s.qty) DESC
LIMIT 3;

# Challenge 4
SELECT authors.au_id, authors.au_lname, authors.au_fname, IFNULL(SUM(s.qty), 0)
FROM authors
         INNER JOIN titleauthor ta on authors.au_id = ta.au_id
         INNER JOIN titles t on ta.title_id = t.title_id
         INNER JOIN sales s on t.title_id = s.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(s.qty) DESC;
