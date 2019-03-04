-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

-- Your output should have the following columns:
-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TOTAL - total number of titles sold from this author
-- Your output should be ordered based on TOTAL from high to low.
-- Only output the top 3 best selling authors.

-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.

-- Hints:
-- If a title has multiple authors, how they split the royalties can be found in the royaltyper column of the titleauthor table.
-- We assume the coauthors will split the advance in the same way as the royalties.

SELECT authors.au_id, authors.au_lname, authors.au_fname, IFNULL(SUM(sales.qty * titleauthor.royaltyper/100),0) AS sales_per_author
FROM `authors`
LEFT JOIN titleauthor 
	ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
	ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
	ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sales_per_author DESC
LIMIT 23