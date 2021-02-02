-- In this challenge you will write a MySQL SELECT query that joins various tables to figure out:
-- what titles each author has published at which publishers. Your output should have at least the following columns:
-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TITLE - name of the published title
-- PUBLISHER - name of the publisher where the title was published
USE publications;
SELECT * from authors;
SELECT * from titles;
SELECT * from publishers;
SELECT * from titleauthor;

SELECT ta.au_id, a.au_fname, a.au_lname, t.title, p.pub_name
FROM titles t
LEFT JOIN titleauthor ta
ON t.title_id = ta.title_id
INNER JOIN authors a
ON ta.au_id = a.au_id
LEFT JOIN publishers p
ON t.pub_id = p.pub_id;

-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher
SELECT ta.au_id, a.au_fname, a.au_lname, t.title, p.pub_name, count(title) as number_titles
FROM titles t
LEFT JOIN titleauthor ta
ON t.title_id = ta.title_id
INNER JOIN authors a
ON ta.au_id = a.au_id
LEFT JOIN publishers p
ON t.pub_id = p.pub_id
GROUP BY au_id, pub_name;

-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.Your output should have the following columns:
-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TOTAL - total number of titles sold from this author
-- Your output should be ordered based on TOTAL from high to low.
-- Only output the top 3 best selling authors.

SELECT ta.au_id, a.au_fname, a.au_lname, t.title, sum(qty) as total
FROM titles t
LEFT JOIN titleauthor ta
ON t.title_id = ta.title_id
INNER JOIN authors a
ON ta.au_id = a.au_id
left join sales s
on s.title_id = t.title_id
GROUP BY au_id
order by total desc
limit 3;

-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
-- Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL)
-- Also order your results based on TOTAL from high to low.
SELECT * from authors;
SELECT * from titles;
SELECT * from publishers;
SELECT * from titleauthor;
select * from sales;
SELECT a.au_id, a.au_fname, a.au_lname, COALESCE(sum(qty), 0) as total
FROM authors a
LEFT JOIN titleauthor ta
ON ta.au_id = a.au_id
left join sales s
on s.title_id = ta.title_id
GROUP BY a.au_id
order by total desc;


