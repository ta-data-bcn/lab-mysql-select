use publications; 
select * from authors;
select * from publishers;
select * from titleauthor;
select * from titles;

DROP table if exists solution1;

-- Challenge 1

CREATE TEMPORARY TABLE solution1 
select a.au_id, b.au_fname, b.au_lname, c.title, c.ytd_sales, d.pub_name
from titleauthor as a
inner join authors as b
on a.au_id = b.au_id
inner join titles as c
on a.title_id = c.title_id
inner join publishers as d
on c.pub_id = d.pub_id;

Select * from solution1;

-- Challenge 2

CREATE TEMPORARY TABLE solution2
SELECT au_id, pub_name, COUNT(pub_name) as title_count
FROM solution1
group by au_id, pub_name;

Select * from solution2;

-- Challenge 3

SELECT a.au_id, a.au_fname, a.au_lname, SUM(c.ytd_sales) as TOTAL
FROM authors as a, titleauthor as b, titles as c, publishers as d
WHERE a.au_id = b.au_id AND b.title_id = c.title_id
GROUP BY a.au_id, c.ytd_sales
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4

SELECT a.au_id, a.au_fname, a.au_lname, IFNULL(SUM(c.ytd_sales),0) as TOTAL
FROM authors as a, titleauthor as b, titles as c
WHERE a.au_id = b.au_id AND b.title_id = c.title_id
GROUP BY a.au_id, c.ytd_sales
ORDER BY TOTAL DESC;
