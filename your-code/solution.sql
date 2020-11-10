USE publications;

/*In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles 
each author has published at which publishers. Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published*/

select authors.au_id as Author_ID, authors.au_lname as Last_name, authors.au_fname as First_name, titles.title as Title, publishers.pub_name as Publisher
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titles.title_id = titleauthor.title_id
inner join publishers
on titles.pub_id = publishers.pub_id;

SELECT a.au_id, a.au_fname, a.au_lname, t.title, p.pub_name
FROM authors as a, titles as t, publishers as p, titleauthor as ta
WHERE a.au_id = ta.au_id AND p.pub_id = t.pub_id AND ta.title_id = t.title_id;


/*Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each 
author has published at each publisher. 
To check if your output is correct, sum up the TITLE COUNT column. 
The sum number should be the same as the total number of records in Table titleauthor.*/

select authors.au_id,authors.au_lname, authors.au_fname,publishers.pub_name, count(*) as Title_count
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titles.title_id = titleauthor.title_id
inner join publishers
on titles.pub_id = publishers.pub_id
group by authors.au_id,authors.au_lname, authors.au_fname,publishers.pub_name;


select * from authors limit 1;
select * from titles limit 1;
select * from publishers limit 1;
select * from titleauthor limit 1;

/* Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors. */


select authors.au_id,authors.au_lname, authors.au_fname,publishers.pub_name, titles.ytd_sales
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titles.title_id = titleauthor.title_id
inner join publishers
on titles.pub_id = publishers.pub_id
order by titles.ytd_sales DESC limit 3;

/*Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
Also order your results based on TOTAL from high to low.*/

select authors.au_id,authors.au_lname, authors.au_fname,publishers.pub_name, titles.ytd_sales
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titles.title_id = titleauthor.title_id
inner join publishers
on titles.pub_id = publishers.pub_id
order by titles.ytd_sales DESC;

update titles
set ytd_sales = 0 
where title_id = "MC3026";

update titles
set ytd_sales = 0 
where title_id = "PC9999";




