use publications;

select * from authors;
select * from titles;
select * from publishers;
select * from titleauthor;
select * from pub_info;

-- Challenge 1
select authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name  
from authors
left join titleauthor on authors.au_id = titleauthor.au_id  
left join titles on titleauthor.title_id =titles.title_id
left join publishers on titles.pub_id = publishers.pub_id;

-- Challenge 2
select authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name, COUNT(titles.title) Count
from authors
left join titleauthor on authors.au_id = titleauthor.au_id  
left join titles on titleauthor.title_id =titles.title_id
left join publishers on titles.pub_id = publishers.pub_id
group by authors.au_id
order by count desc;

-- Chanllenge 3
select authors.au_id, authors.au_lname, authors.au_fname, titles.ytd_sales
from authors
left join titleauthor on authors.au_id = titleauthor.au_id  
left join titles on titleauthor.title_id =titles.title_id
left join publishers on titles.pub_id = publishers.pub_id
group by authors.au_id
order by ytd_sales desc
limit 3;

-- Challenge 4
select authors.au_id, authors.au_lname LastName, authors.au_fname FirstName, ifnull(titles.ytd_sales,0) sales 
from authors
left join titleauthor on authors.au_id = titleauthor.au_id  
left join titles on titleauthor.title_id =titles.title_id
left join publishers on titles.pub_id = publishers.pub_id
group by authors.au_id
order by ytd_sales desc;

