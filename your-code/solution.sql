"Challenge 1"
SELECT a.au_id, a.`au_lname`, a.`au_fname`, b.title, c.pub_name
FROM authors a
LEFT JOIN `titleauthor` d ON a.`au_id`=d.au_id
INNER JOIN titles b ON b.`title_id`=d.`title_id`
LEFT JOIN publishers c ON c.pub_id=b.pub_id;

"Challenge 2"
SELECT a.au_id, a.`au_lname`, a.`au_fname`, c.pub_name, COUNT(b.title) AS Title_count
FROM authors a
LEFT JOIN `titleauthor` d ON a.`au_id`=d.au_id
INNER JOIN titles b ON b.`title_id`=d.`title_id`
LEFT JOIN publishers c ON c.pub_id=b.pub_id
GROUP BY a.au_id, a.`au_lname`, a.`au_fname`, c.pub_name
ORDER BY title_count DESC;

"Challenge 3"
SELECT a.au_id, a.`au_lname`, a.`au_fname`, SUM(b.qty) AS TOTAL
FROM authors a
LEFT JOIN `titleauthor` d ON a.`au_id`=d.au_id
LEFT JOIN sales b ON d.`title_id`=b.`title_id`
GROUP BY a.au_id, a.`au_lname`, a.`au_fname`
ORDER BY TOTAL DESC
LIMIT 3;

"Challenge 4"
SELECT a.au_id, a.`au_lname`, a.`au_fname`, SUM(IFNULL(b.qty, 0)) AS TOTAL
FROM authors a
LEFT JOIN `titleauthor` d ON a.`au_id`=d.au_id
LEFT JOIN sales b ON d.`title_id`=b.`title_id`
GROUP BY a.au_id, a.`au_lname`, a.`au_fname`
ORDER BY TOTAL DESC;