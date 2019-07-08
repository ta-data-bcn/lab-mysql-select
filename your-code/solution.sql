-- Task 1
select * from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join titles
on titleauthor.title_id=titles.title_id
join publishers
on titles.pub_id= publishers.pub_id;

-- Task 2
select authors.au_id, au_fname, au_lname, pub_name, COUNT(title) as TITLE_COUNT from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join titles
on titleauthor.title_id=titles.title_id
join publishers
on titles.pub_id= publishers.pub_id
GROUP BY pub_name, au_id, au_lname, au_fname
ORDER BY TITLE_COUNT DESC;

-- Task 3
select authors.au_id, au_fname, au_lname, sum(qty) as Total_Sold from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join titles
on titleauthor.title_id=titles.title_id
join publishers
on titles.pub_id= publishers.pub_id
join sales
on titles.title_id = sales.title_id
GROUP BY au_id, au_lname, au_fname
ORDER BY Total_Sold DESC
Limit 3;

-- Task 4
select authors.au_id, au_fname, au_lname, sum(qty) as Total_Sold from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join titles
on titleauthor.title_id=titles.title_id
join publishers
on titles.pub_id= publishers.pub_id
join sales
on titles.title_id = sales.title_id
GROUP BY au_id, au_lname, au_fname
ORDER BY Total_Sold DESC
limit 23;