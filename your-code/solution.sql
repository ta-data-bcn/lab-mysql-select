USE publications;
SELECT * FROM authors;
SELECT * FROM publishers;
SELECT * FROM titles;
SELECT * FROM titleauthor;

SELECT 
    a.au_id 'Author ID',
    a.au_lname 'Last Name',
    a.au_fname 'First Name',
    d.pub_name 'Publisher',
    c.title 'Title'
FROM
    authors a
        LEFT JOIN
    titleauthor b ON a.au_id = b.au_id
        JOIN
    titles c ON b.title_id = c.title_id
        JOIN
    publishers d ON c.pub_id = d.pub_id;



USE publications;
SELECT * FROM authors;
SELECT * FROM publishers;
SELECT * FROM titles;
SELECT * FROM titleauthor;

SELECT 
    a.au_id 'Author ID',
    a.au_lname 'Last Name',
    a.au_fname 'First Name',
    d.pub_name 'Publisher',
    count(a.au_id) 'Title Count'
FROM
    authors a
        LEFT JOIN
    titleauthor b ON a.au_id = b.au_id
        JOIN
    titles c ON b.title_id = c.title_id
        JOIN
    publishers d ON c.pub_id = d.pub_id
GROUP BY a.au_id
ORDER BY count(a.au_id) DESC;


USE publications;
SELECT * FROM authors;
SELECT * FROM titles;
SELECT * FROM titleauthor;

SELECT 
    a.au_id 'Author ID',
    a.au_lname 'Last Name',
    a.au_fname 'First Name',
    count(c.title) 'Title Count'
FROM
    authors a    
LEFT JOIN
    titleauthor b ON a.au_id = b.au_id    
LEFT JOIN
    titles c ON b.title_id = c.title_id
GROUP BY a.au_id
ORDER BY count(c.title) DESC LIMIT 3;


USE publications;
SELECT * FROM authors;
SELECT * FROM titles;
SELECT * FROM titleauthor;

SELECT 
    a.au_id 'Author ID',
    a.au_lname 'Last Name',
    a.au_fname 'First Name',
    count(c.title) 'Title Count'
FROM
    authors a    
LEFT JOIN
    titleauthor b ON a.au_id = b.au_id    
LEFT JOIN
    titles c ON b.title_id = c.title_id
GROUP BY a.au_id
ORDER BY count(c.title) DESC;