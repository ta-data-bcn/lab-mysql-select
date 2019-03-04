-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

-- Your output should have the following columns:
-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TOTAL - total number of titles sold from this author
-- Your output should be ordered based on TOTAL from high to low.
-- Only output the top 3 best selling authors.

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS sales_per_author
FROM `authors`
INNER JOIN titleauthor 
	ON authors.au_id = titleauthor.au_id
INNER JOIN titles
	ON titleauthor.title_id = titles.title_id
INNER JOIN sales
	ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sales_per_author DESC
LIMIT 3