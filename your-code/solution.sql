# Challenge 1 - Who Have Published What At Where?

SELECT 
au.au_id AS author_id,
au.au_lname AS author_last_name,
au.au_fname AS author_first_name,
ti.title AS title,
pu.pub_name AS publisher_name


FROM authors AS au

LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
LEFT JOIN titles AS ti ON ta.title_id = ti.title_id
LEFT JOIN publishers AS pu ON ti.pub_id = pu.pub_id

WHERE pub_name IS NOT NULL;




# Challenge 2 - Who Have Published How Many At Where?
 
SELECT 
au.au_id AS author_id,
au.au_lname AS author_last_name,
au.au_fname AS author_first_name,
pu.pub_name AS publisher_name,
COUNT(ti.title) AS title


FROM authors AS au

LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
LEFT JOIN titles AS ti ON ta.title_id = ti.title_id
LEFT JOIN publishers AS pu ON ti.pub_id = pu.pub_id

WHERE pub_name IS NOT NULL

GROUP BY 1,4;



#Challenge 3 - Best Selling Authors
#Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

SELECT 
au.au_id AS author_id,
au.au_lname AS author_last_name,
au.au_fname AS author_first_name,
SUM(ti.ytd_sales) AS total


FROM authors AS au

LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
LEFT JOIN titles AS ti ON ti.title_id = ta.title_id


WHERE ti.ytd_sales IS NOT NULL

GROUP BY 1

ORDER BY 4 DESC

LIMIT 3;


#Challenge 4 - Best Selling Authors Ranking

SELECT 
au.au_id AS author_id,
au.au_lname AS author_last_name,
au.au_fname AS author_first_name,
COALESCE(SUM(sales.qty) ,0) AS total


FROM authors AS au

LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
LEFT JOIN sales AS sales ON sales.title_id = ta.title_id

GROUP BY 1

ORDER BY 4 DESC;


