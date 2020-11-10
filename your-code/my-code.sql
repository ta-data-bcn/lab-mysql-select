USE publications;

-- CHALLENGE 1:
-- In this challenge you will write a MySQL SELECT query 
-- that joins various tables to figure out what titles each 
-- author has published at which publishers. 

SELECT a.au_id, a.au_lname, a.au_fname, c.title, d.pub_name
FROM authors as a, titleauthor as b, titles as c, publishers as d
WHERE a.au_id = b.au_id AND b.title_id = c.title_id AND c.pub_id = d.pub_id;

-- CHALLENGE 2:
-- Elevating from your solution in Challenge 1, query how many 
-- titles each author has published at each publisher.

SELECT a.au_id, a.au_lname, a.au_fname, d.pub_name, COUNT(d.pub_name) as title_count
FROM authors as a, titleauthor as b, titles as c, publishers as d
WHERE a.au_id = b.au_id AND b.title_id = c.title_id AND c.pub_id = d.pub_id
GROUP BY a.au_id, d.pub_name;

-- CHALLENGE 3
-- Who are the top 3 authors who have sold the highest number of titles? 
-- Write a query to find out.

SELECT a.au_id, a.au_fname, a.au_lname, SUM(c.ytd_sales) as TOTAL
FROM authors as a, titleauthor as b, titles as c
WHERE a.au_id = b.au_id AND b.title_id = c.title_id
GROUP BY a.au_id, c.ytd_sales
ORDER BY TOTAL DESC
LIMIT 3;

-- CHALLENGE 4:
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors 
-- instead of the top 3. Note that the authors who have sold 0 titles should also appear 
-- in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results 
-- based on TOTAL from high to low.

SELECT a.au_id, a.au_fname, a.au_lname, COALESCE(SUM(c.ytd_sales), 0) as TOTAL
FROM authors as a, titleauthor as b, titles as c
WHERE a.au_id = b.au_id AND b.title_id = c.title_id
GROUP BY a.au_id, c.ytd_sales
ORDER BY TOTAL DESC;

SELECT * from titleauthor;
SELECT * from authors;
SELECT * from titles;
SELECT * FROM publishers;

