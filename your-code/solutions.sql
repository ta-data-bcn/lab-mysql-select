use publications;

#################################CHALLENGE 1
select *
from authors -- au_id, au_lname, au_fname
limit 30;

select *
from publishers -- pub_name
limit 30;

select *
from titles -- title, pub_id
limit 30;


####1 way to doy it: CALLING TITLEAUTHOR as first folder
select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name as PUBLISHER
from titleauthor
join titles on titles.title_id = titleauthor.title_id
join authors on authors.au_id = titleauthor.au_id
join publishers on publishers.pub_id = titles.pub_id
where titleauthor.au_ord = 1
;
-- this is because somo authors have published the same book (co-writing)
 
 
 
####2 way to doy it: CALLING AUTHORS as first folder 
select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name as PUBLISHER
from authors
join titleauthor on titleauthor.au_id = authors.au_id
join titles on titles.title_id = titleauthor.title_id  	#we link 3 folder from author--> title_author --> TITLE to get the title
join publishers on publishers.pub_id = titles.pub_id 	#we link 2 folders from titles --> publishers
where titleauthor.au_ord = 1
;
-- this is because somo authors have published the same book (co-writing)

 
 
 
 

#################################CHALLENGE 2


select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, publishers.pub_name as PUBLISHER, count(titles.title) as TITLE_COUNT
from authors
join titleauthor on titleauthor.au_id = authors.au_id
join titles on titles.title_id = titleauthor.title_id
join publishers on publishers.pub_id = titles.pub_id
group by AUTHOR_ID, PUBLISHER
order by TITLE_COUNT DESC
;


#################################CHALLENGE 3

##authors (au_id) --> titleauthor(title_id) --> sales(qty)

select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, sum(sales.qty) as TOTAL
FROM authors
join titleauthor on titleauthor.au_id = authors.au_id
join sales on sales.title_id = titleauthor.title_id
group by AUTHOR_ID
order by TOTAL desc
limit 3
;



#################################CHALLENGE 4
select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, ifnull(sum(sales.qty), 0) as TOTAL
FROM authors
left join titleauthor on titleauthor.au_id = authors.au_id
left join sales on sales.title_id = titleauthor.title_id
group by AUTHOR_ID
order by TOTAL desc
limit 23
;

