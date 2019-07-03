-- Challenge 1 - Who Have Published What At Where?
SELECT authors.au_id AS AUTHOR_ID,
au_lname AS LAST_NAME,
au_fname AS FIRST_NAME,
titles.title AS TITLE,
pub_name AS PUBLISHER

FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;


-- Challenge 2 - Who Have Published How Many At Where?
SELECT authors.au_id AS AUTHOR_ID,
au_lname AS LAST_NAME,
au_fname AS FIRST_NAME,
pub_name AS PUBLISHER,
COUNT(titleauthor.au_id) AS TITLE_COUNT

FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_id
ORDER BY TITLE_COUNT DESC;


-- Challenge 3 - Best Selling Authors
SELECT authors.au_id AS AUTHOR_ID,
au_lname AS LAST_NAME,
au_fname AS FIRST_NAME,
sum(titles.ytd_sales) AS TOTAL

FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN sales ON titleauthor.title_id = sales.title_id

GROUP BY authors.au_id
ORDER BY TOTAL DESC;


-- Challenge 4 - Best Selling Authors Ranking
-- Challenge 4 says the following:
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
-- Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
-- Also order your results based on TOTAL from high to low.
--
-- I'm bit confused since the authors are 19, not 23. Second, there are NO authors that sold 0 titles. The only two books with 0 sales, (NULL, actually,
-- at least according to the ytd_sales column in the titles table) are PC9999 and MC3026, which are written by 486-29-1786 and NULL, respectively.
-- Author 486-29-1786 wrote another book which actually sold some units. Therefore my conclusion, even though I have my doubt given the content of Challenge 4,
-- is that NO ONE sold 0 books.


SELECT authors.au_id AS AUTHOR_ID,
au_lname AS LAST_NAME,
au_fname AS FIRST_NAME,
IFNULL(sum(titles.ytd_sales), 0) AS TOTAL

FROM authors

INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN sales ON titleauthor.title_id=sales.title_id
LEFT JOIN titles ON titleauthor.title_id=titles.title_id

GROUP BY authors.au_id
ORDER BY TOTAL DESC;