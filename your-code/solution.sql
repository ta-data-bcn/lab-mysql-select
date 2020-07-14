USE publications;

-- Challenge 1;
SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
	FROM authors a
    RIGHT JOIN titleauthor z ON a.au_id = z.au_id
    LEFT JOIN titles t ON z.title_id = t.title_id
    LEFT JOIN publishers p ON t.pub_id = p.pub_id;
    
-- Challenge 2
SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, COUNT(t.title)
	FROM authors a
    RIGHT JOIN titleauthor z ON a.au_id = z.au_id
    LEFT JOIN titles t ON z.title_id = t.title_id
    LEFT JOIN publishers p ON t.pub_id = p.pub_id
    GROUP BY au_id, pub_name
    ORDER BY au_id;
    
-- Challenge 3
SELECT a.au_id, a.au_lname, a.au_fname, SUM( s.qty) as total_titles_sold
	FROM authors a
    RIGHT JOIN titleauthor z ON a.au_id = z.au_id
    RIGHT JOIN sales s ON z.title_id = s.title_id
    GROUP BY au_id
    ORDER BY total_titles_sold DESC
    LIMIT 3;
    
-- CHALLENGE 4
SELECT a.au_id, a.au_lname, a.au_fname, IFNULL(SUM(s.qty),0) as total_titles_sold
	FROM authors a
    LEFT JOIN titleauthor z ON a.au_id = z.au_id
    LEFT JOIN sales s ON z.title_id = s.title_id
    GROUP BY au_id
    ORDER BY total_titles_sold DESC;