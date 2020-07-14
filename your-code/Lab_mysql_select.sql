USE `publications`;

SELECT * FROM publishers;

#CHALLENGE 1

SELECT
a. au_id AS 'AUTHOR ID', b. au_lname AS 'LAST NAME', b. au_fname AS 'FIRST NAME', c. title AS 'TITLE', d. pub_name AS 'PUBLISHER'
FROM `titleauthor` a
INNER JOIN `authors` b 
ON a. au_id = b. au_id
INNER JOIN titles c
ON a. title_id = c. title_id
INNER JOIN publishers d
ON c. `pub_id` = d. `pub_id`;

#CHALLENGE 2

SELECT
a. au_id AS 'AUTHOR ID', b. au_lname AS 'LAST NAME', b. au_fname AS 'FIRST NAME', d. pub_name AS 'PUBLISHER', COUNT(c. title) AS 'TITLE COUNT'
FROM `titleauthor` a
INNER JOIN `authors` b 
ON a. au_id = b. au_id
INNER JOIN titles c
ON a. title_id = c. title_id
INNER JOIN publishers d
ON c. `pub_id` = d. `pub_id`
GROUP BY a. au_id, b. au_lname, b. au_fname, d. pub_name
ORDER BY COUNT(c. title) DESC;

#CHALLENGE 3

SELECT
a. au_id AS 'AUTHOR ID', b. au_lname AS 'LAST NAME', b. au_fname AS 'FIRST NAME', COUNT(c. title) AS 'TOTAL'
FROM `titleauthor` a
INNER JOIN `authors` b 
ON a. au_id = b. au_id
INNER JOIN titles c
ON a. title_id = c. title_id
GROUP BY a. au_id, b. au_lname, b. au_fname
ORDER BY COUNT(c. title) DESC
LIMIT 3;

#CHALLENGE 4

SELECT
b. au_id AS 'AUTHOR ID', b. au_lname AS 'LAST NAME', b. au_fname AS 'FIRST NAME', COUNT(c. title) AS 'TOTAL'
FROM AUTHORS B
LEFT JOIN `titleauthor` a 
ON a. au_id = b. au_id
LEFT JOIN titles c
ON a. title_id = c. title_id
GROUP BY b. au_id, b. au_lname, b. au_fname
ORDER BY COUNT(c. title) DESC;











