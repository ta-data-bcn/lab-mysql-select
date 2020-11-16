USE publications;

-- Challenge 1. What titles each author has published at which publishers.

SELECT ta.au_id as "Author ID", a.au_lname as "Last Name", a.au_fname as "First Name", t.title as Title, p.pub_name as Publisher
from titleauthor AS ta
JOIN authors AS a
ON ta.au_id = a.au_id
JOIN titles AS t
ON ta.title_id = t.title_id
JOIN publishers AS p
ON t.pub_id = p.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?

SELECT Author_ID, Last_Name, First_Name, Publisher, count(Title) as Title_Count FROM
(SELECT ta.au_id as Author_ID, a.au_lname as Last_Name, a.au_fname as First_Name, t.title as Title, p.pub_name as Publisher
from titleauthor AS ta
JOIN authors AS a
ON ta.au_id = a.au_id
JOIN titles AS t
ON ta.title_id = t.title_id
JOIN publishers AS p
ON t.pub_id = p.pub_id) total_publishings
GROUP BY Author_ID, Last_Name, First_Name, Publisher
ORDER BY Title_Count DESC, Author_ID DESC;

-- Challenge 3 - Best Selling Authors;


select ta.au_id as Author_ID, a.au_lname as Last_Name, a.au_fname as First_Name, sum(s.qty) as Total
from titleauthor AS ta
JOIN authors AS a
ON ta.au_id = a.au_id
JOIN sales AS s
ON ta.title_id = s.title_id
GROUP BY Author_ID, Last_Name, First_Name
ORDER BY Total DESC
limit 3;



-- Challenge 4 - Best Selling Authors RankinG

select ta.au_id as Author_ID, a.au_lname as Last_Name, a.au_fname as First_Name, ifnull(sum(s.qty),0) as Total
from titleauthor AS ta
RIGHT JOIN authors AS a
ON ta.au_id = a.au_id
LEFT JOIN sales AS s
ON ta.title_id = s.title_id
LEFT JOIN titles as t
ON ta.title_id = t.title_id
GROUP BY Author_ID, Last_Name, First_Name
ORDER BY Total DESC;

