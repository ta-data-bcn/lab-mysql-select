SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name,  COUNT(titles.title) AS title_count
FROM `authors`
INNER JOIN titleauthor 
	ON authors.au_id = titleauthor.au_id
INNER JOIN titles
	ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
	ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name