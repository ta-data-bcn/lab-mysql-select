USE publications;
/*
Challenge 1 - Who Have Published What At Where?
In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published
*/


SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM authors a
INNER JOIN titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN publishers p
ON t.pub_id = p.pub_id;


/*Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:

  */
  

SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, COUNT(*) AS title_count
FROM authors a
INNER JOIN titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN publishers p
ON t.pub_id = p.pub_id
GROUP BY a.au_id
ORDER BY title_count DESC;


/*
Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.

*/


SELECT a.au_id, a.au_lname, a.au_fname, SUM(s.qty) AS sales
FROM authors a
INNER JOIN titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN sales s
ON t.title_id = s.title_id
GROUP BY a.au_fname
ORDER BY sales DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 
23 authors instead of the top 3. Note that the authors who have sold 0 titles 
should also appear in your output (ideally display 0 instead of NULL as the TOTAL).
 Also order your results based on TOTAL from high to low.*/


SELECT a.au_id, a.au_lname, a.au_fname, IFNULL(SUM(s.qty),0) AS sales
FROM authors a
LEFT JOIN titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN titles t
ON ta.title_id = t.title_id
LEFT JOIN sales s
ON t.title_id = s.title_id
GROUP BY a.au_fname
ORDER BY sales DESC;