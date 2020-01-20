-- CHALLENGE 1
/**
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published
**/
SELECT a.au_id AS AUTHORS, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME
	, t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors a
	left join titleauthor ta on ta.au_id = a.au_id
	left join titles t on t.title_id = ta.title_id
	left join publishers p on p.pub_id = t.pub_id
ORDER BY a.au_id ASC, p.pub_name ASC
;


-- Challenge 2 - Who Have Published How Many At Where?
SELECT a.au_id AS AUTHORS, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME
	, p.pub_name AS PUBLISHER, count(t.title) AS TITLE_COUNT
FROM authors a
	inner join titleauthor ta on ta.au_id = a.au_id
	inner join titles t on t.title_id = ta.title_id
	inner join publishers p on p.pub_id = t.pub_id
GROUP BY p.pub_id, a.au_id
ORDER BY a.au_id, p.pub_name
;


-- Challenge 3 - Best Selling Authors
/**
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
**/
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME
	, a.au_fname AS FIRST_NAME, sum(s.qty) AS TOTAL
FROM authors a
	left join titleauthor ta on ta.au_id = a.au_id
	left join sales s on s.title_id = ta.title_id
GROUP BY a.au_id
ORDER BY sum(s.qty) DESC
LIMIT 3
;


-- Challenge 4 - Best Selling Authors Ranking

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME
	, a.au_fname AS FIRST_NAME, IFNULL(sum(s.qty), 0) AS TOTAL
FROM authors a
	left join titleauthor ta on ta.au_id = a.au_id
	left join sales s on s.title_id = ta.title_id
GROUP BY a.au_id
ORDER BY sum(s.qty) DESC
;


