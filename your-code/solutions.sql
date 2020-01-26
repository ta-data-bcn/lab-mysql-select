
# Challenge 1 - Who Have Published What At Where?

SELECT au.au_id, au.au_fname, au.au_lname, ti.`title`, pu.pub_name 
FROM authors AS au
LEFT JOIN `titleauthor` AS ta ON ta.au_id = au.au_id
LEFT JOIN titles AS ti ON ti.title_id = ta.title_id
LEFT JOIN publishers as pu ON pu.`pub_id`= ti.`pub_id`;

# Challenge 2 - Who Have Published What At Where?

SELECT au.au_id, au.au_fname, au.au_lname, pu.pub_name, count(ti.title) as title_count
	FROM authors AS au
	JOIN titleauthor AS ta ON ta.au_id = au.au_id
	JOIN titles AS ti ON ti.title_id = ta.title_id
	JOIN publishers as pu ON pu.`pub_id`= ti.`pub_id`
group by au.au_id, au.au_fname, au.au_lname, pu.pub_name
order by au.au_id desc;


# Challenge 3 - Best Selling Authors

SELECT au.au_id, au.au_fname, au.au_lname, sum(sl.qty) as tot_sales
FROM authors AS au
JOIN titleauthor AS ta ON ta.au_id = au.au_id
JOIN titles AS ti ON ti.title_id = ta.title_id
JOIN publishers as pu ON pu.`pub_id`= ti.`pub_id`
JOIN sales as sl ON sl.title_id = ti.title_id
GROUP BY au.au_id
ORDER BY tot_sales desc
LIMIT 3;

# Challenge 4 - Best Selling Authors Ranking

SELECT au.au_id, au.au_fname, au.au_lname, sum(COALESCE(qty,0)) as tot_sales
FROM authors AS au
left JOIN titleauthor AS ta ON ta.au_id = au.au_id
left JOIN titles AS ti ON ti.title_id = ta.title_id
left JOIN sales as sl ON sl.title_id = ti.title_id
GROUP BY au.au_id
ORDER BY tot_sales desc;




