--- Number 1

SELECT  
	authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    titles.title AS 'TITLE',
    publishers.pub_name AS 'PUBLISHER'

FROM publications.titles 
JOIN publications.publishers ON publications.titles.pub_id = publications.publishers.pub_id
JOIN publications.titleauthor ON publications.titles.title_id = publications.titleauthor.title_id
JOIN publications.authors ON publications.titleauthor.au_id = publications.authors.au_id;

---
    
--- Number 2

SELECT  
	authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    publishers.pub_name AS 'PUBLISHER',
	COUNT(titles.title) AS 'TITLE COUNT'

FROM publications.titles 
JOIN publications.publishers ON publications.titles.pub_id = publications.publishers.pub_id
JOIN publications.titleauthor ON publications.titles.title_id = publications.titleauthor.title_id
JOIN publications.authors ON publications.titleauthor.au_id = publications.authors.au_id
GROUP BY authors.au_id,authors.au_fname,authors.au_lname,publishers.pub_name
ORDER BY COUNT(titles.title) DESC;

--- Number 3

SELECT  
	authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    sum(sales.qty) AS 'TOTAL'


FROM publications.authors
JOIN publications.titleauthor ON publications.authors.au_id = publications.titleauthor.au_id
JOIN publications.sales ON  publications.titleauthor.title_id = publications.sales.title_id
group by authors.au_id,authors.au_lname,authors.au_fname
order by sum(sales.qty) DESC
limit 3;

--- Number 4

SELECT  
	authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    COALESCE(sum(sales.qty),0) AS 'TOTAL'


FROM publications.sales
JOIN publications.titleauthor ON publications.sales.title_id = publications.titleauthor.title_id
RIGHT JOIN publications.authors ON  publications.titleauthor.au_id = publications.authors.au_id
group by authors.au_id
order by sum(sales.qty) DESC;

