# Challenge 1
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name FROM authors
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON publishers.pub_id = titles.pub_id;

# Challenge 2
SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, count(titles.title) AS TITLE_COUNT 
FROM authors
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_name, authors.au_id
ORDER BY TITLE_COUNT DESC, authors.au_id DESC;

# Challenge 3
SELECT authors.au_id, authors.au_lname, authors.au_fname, sum(titles.ytd_sales) AS TOTAL
FROM authors
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

# Challenge 4
SELECT authors.au_id, authors.au_lname, authors.au_fname, IFNULL(SUM(titles.ytd_sales), 0) AS TOTAL
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;