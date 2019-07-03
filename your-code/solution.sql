-- Challenge 1
SELECT A.au_id As AUTHORS_ID , A.au_lname AS LAST_NAME, A.au_fname AS FIRST_NAME, T.title AS TITLE, P.pub_name AS PUBLISHER 
FROM titleauthor
JOIN authors AS A 
ON A.au_id = titleauthor.au_id
JOIN titles AS T
ON T.title_id = titleauthor.title_id
JOIN publishers AS P
ON P.pub_id = T.pub_id;



-- Challenge 2
SELECT A.au_id As AUTHORS_ID , A.au_lname AS LAST_NAME, A.au_fname AS FIRST_NAME, P.pub_name AS PUBLISHER, COUNT(T.title) AS TITLE_COUNT
FROM titleauthor
JOIN authors AS A 
ON A.au_id = titleauthor.au_id
JOIN titles AS T
ON T.title_id = titleauthor.title_id
JOIN publishers AS P
ON P.pub_id = T.pub_id
GROUP BY AUTHORS_ID, PUBLISHER
ORDER BY TITLE_COUNT DESC;



-- Challenge 3
SELECT A.au_id As AUTHORS_ID , A.au_lname AS LAST_NAME, A.au_fname AS FIRST_NAME, SUM(S.qty) AS TOTAL
FROM titleauthor
JOIN authors AS A 
ON A.au_id = titleauthor.au_id
JOIN titles AS T
ON T.title_id = titleauthor.title_id
JOIN sales AS S
ON T.title_id = S.title_id
GROUP BY AUTHORS_ID
ORDER BY TOTAL DESC
LIMIT 3;


-- Challenge 4
SELECT A.au_id As AUTHORS_ID , A.au_lname AS LAST_NAME, A.au_fname AS FIRST_NAME, SUM(S.qty) AS TOTAL
FROM titleauthor
LEFT JOIN authors AS A 
ON A.au_id = titleauthor.au_id
JOIN titles AS T
ON T.title_id = titleauthor.title_id
JOIN sales AS S
ON T.title_id = S.title_id
GROUP BY AUTHORS_ID
ORDER BY TOTAL DESC;

SELECT A.au_id As AUTHORS_ID , A.au_lname AS LAST_NAME, A.au_fname AS FIRST_NAME, SUM(S.qty) AS TOTAL
FROM authors AS A
LEFT JOIN titleauthor
ON A.au_id = titleauthor.au_id
LEFT JOIN titles AS T
ON T.title_id = titleauthor.title_id
LEFT JOIN sales AS S
ON T.title_id = S.title_id
GROUP BY AUTHORS_ID
ORDER BY TOTAL DESC;
