## Challenge 1 - Who Have Published What At Where?

use publications;

SELECT
		a.au_id, 
		a.au_lname, 
		a.au_fname,
		ti.title,
		p.pub_name

FROM authors as a 
JOIN titleauthor as ta on a.au_id = ta.au_id
JOIN titles as ti on ta.title_id = ti.title_id
JOIN publishers as p on ti.pub_id = p.pub_id;

SELECT
	count(*) as table_count

FROM authors as a 
JOIN titleauthor as ta on a.au_id = ta.au_id
JOIN titles as ti on ta.title_id = ti.title_id
JOIN publishers as p on ti.pub_id = p.pub_id;


## Challenge 2 - Who Have Published How Many At Where?

SELECT
		a.au_id, 
		a.au_lname, 
		a.au_fname,
		p.pub_name,
		count(distinct ti.title)

FROM authors as a 
JOIN titleauthor as t on a.au_id = t.au_id
JOIN titles as ti on t.title_id = ti.title_id
JOIN publishers as p on ti.pub_id = p.pub_id
GROUP BY 1,2,3,4;
    
## Challenge 3 - Best Selling Authors

SELECT 
		a.au_id, 
		a.au_lname, 
		a.au_fname,
		SUM(ti.ytd_sales)

FROM authors as a
JOIN titleauthor as t on a.au_id = t.au_id
JOIN titles as ti on t.title_id = ti.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY sum(ti.ytd_sales) DESC
LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking

SELECT 
		a.au_id, 
		a.au_lname, 
		a.au_fname,
		COALESCE(sum(ytd_sales),0)
		
FROM authors as a
LEFT JOIN titleauthor as t on a.au_id = t.au_id
LEFT JOIN titles as ti on t.title_id = ti.title_id
GROUP BY a.au_id
ORDER BY sum(ti.ytd_sales) DESC
;
