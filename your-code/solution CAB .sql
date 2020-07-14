# Challenge 1 - who have published what at where

SELECT a. au_id, a. au_lname, a. au_fname, c. title, d. pub_name
FROM `authors` a
LEFT JOIN titleauthor b ON a.au_id = b.au_id
LEFT JOIN titles c ON  b.title_id = c.title_id
LEFT JOIN publishers d ON c.pub_id = d.pub_id;

SELECT COUNT(*)
FROM titleauthor;

# Challenge 2 Who have published how many at where

SELECT a.au_id, a.au_lname, a.au_fname, d.pub_name, count(c.title)
FROM `authors` a
LEFT JOIN titleauthor b ON a.au_id = b.au_id
LEFT JOIN titles c ON  b.title_id = c.title_id
LEFT JOIN publishers d ON c.pub_id = d.pub_id
group by a.au_id, a.au_lname, a.au_fname, d.pub_name
order by count(c.title) desc;

##IMP: count function only works by grouping.
##The grouping needs to be done for every column in the table so that it keeps the same order (otherwise there is a conflict and we get an error)

# Challenge 3 Top 3 authors who have sold the highest number of titles

SELECT a.au_id, a.au_lname, a.au_fname, count(c.title)
FROM `authors` a
LEFT JOIN titleauthor b ON a.au_id = b.au_id
LEFT JOIN titles c ON  b.title_id = c.title_id
group by a.au_id
order by count(c.title) desc
limit 3;

# Challenge 4 Best selling authors

SELECT a.au_id, a.au_lname, a.au_fname, count(c.title)
FROM `authors` a
LEFT JOIN titleauthor b ON a.au_id = b.au_id
LEFT JOIN titles c ON  b.title_id = c.title_id
group by a.au_id
order by count(c.title) desc;
