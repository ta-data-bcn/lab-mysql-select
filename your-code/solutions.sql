-- Your output should have at least the following columns:

-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TITLE - name of the published title
-- PUBLISHER - name of the publisher where the title was published

-- If your query is correct, the total rows in your output should be the same as the total number of records in Table titleauthor.

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name 
FROM `authors`
INNER JOIN titleauthor 
	ON authors.au_id = titleauthor.au_id
INNER JOIN titles
	ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
	ON titles.pub_id = publishers.pub_id
