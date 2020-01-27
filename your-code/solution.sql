# Challenge 1 - Who Have Published What At Where?
SELECT authors.au_id as "Author ID", authors.au_fname AS "First Name", authors.au_lname as "Last Name", titles.title as Title, publishers.pub_name as Publisher
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
;

# Challenge 2 - Who Have Published How Many At Where?
SELECT authors.au_id as "Author ID", authors.au_fname AS "First Name", authors.au_lname as "Last Name", count(titles.title) as "title count", publishers.pub_name as "Publisher"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY count(titles.title) DESC
;

# Challenge 3 - Best Selling Authors
SELECT authors.au_id as "Author ID", authors.au_fname AS "First Name", authors.au_lname as "Last Name", sum(`titles`.`ytd_sales`) as "Sales"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id
ORDER BY sum(titles.`ytd_sales`) DESC
LIMIT 3
;

# Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id as "Author ID", authors.au_fname AS "First Name", authors.au_lname as "Last Name", titles.ytd_sales as "sales"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
RIGHT JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY titles.ytd_sales DESC
LIMIT 23
;
