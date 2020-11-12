use publications;

/* challenge 1 */
SELECT a.au_id, a.au_lname, a.au_fname, tit.title, p.pub_name
FROM titleauthor AS t
LEFT JOIN authors as a
ON t.au_id = a.au_id

LEFT JOIN titles as tit
ON t.title_id = tit.title_id

LEFT JOIN publishers as p
ON tit.pub_id = p.pub_id;

/* challenge 2 */

SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, COUNT(tit.title) as 'TITLE COUNT' 
FROM titleauthor AS t
LEFT JOIN authors as a
ON t.au_id = a.au_id

LEFT JOIN titles as tit
ON t.title_id = tit.title_id

LEFT JOIN publishers as p
ON tit.pub_id = p.pub_id

GROUP BY a.au_id, p.pub_id;

/* challenge 3 */

select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME' ,a.au_fname as 'FIRST NAME', sum(s.qty) as 'TOTAL'
FROM authors as a
LEFT JOIN titleauthor as ta
ON a.au_id = ta.au_id

LEFT JOIN titles as t
ON ta.title_id = t.title_id

LEFT JOIN sales as s
on t.title_id = s.title_id

GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

/* challenge 4 */
select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME' ,a.au_fname as 'FIRST NAME', COALESCE(sum(s.qty), 0) as 'TOTAL'
FROM authors as a
LEFT JOIN titleauthor as ta
ON a.au_id = ta.au_id

LEFT JOIN titles as t
ON ta.title_id = t.title_id

LEFT JOIN sales as s
on t.title_id = s.title_id

GROUP BY a.au_id
ORDER BY 'TOTAL' DESC;