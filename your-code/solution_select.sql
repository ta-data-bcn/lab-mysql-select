use publications;
-- challenge 1: use a mysql query that joins various tables.
-- output should have the following columns:
-- author_id, lname, fname, title, publisher

select * from authors; -- get au_id, au_lname, au_fname, use ud_id : a
select * from titleauthor; -- get title_id, use au_id, title_id : ta
select * from titles; -- get  title, use title_id, pub_id : t
select * from publishers; -- get  pub_name use pub_id, : p

--
select  a.au_id as "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME" ,
 t.title as "TITLE",
p.pub_name as "PUBLISHER"
from  authors a
left join titleauthor ta on a.au_id =ta.au_id
left join titles t on t.title_id=ta.title_id
left join publishers p on t.pub_id=p.pub_id
group by a.au_id, a.au_lname , a.au_fname ,t.title, p.pub_name ;

-- Challenge 2: 
-- query how many titles each author has published at each publisher

select  a.au_id, a.au_lname , a.au_fname ,
p.pub_name ,
count(t.title) as title_count
from  authors a
left join titleauthor ta on a.au_id =ta.au_id
left join titles t on t.title_id=ta.title_id
left join publishers p on t.pub_id=p.pub_id
group by au_id, au_fname, au_lname, pub_name;
--
-- the same with uppercase names
select  a.au_id as "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME",
p.pub_name as "PUBLISHER",
count(t.title) as "TITLE COUNT" 
from  authors a
left join titleauthor ta on a.au_id =ta.au_id
left join titles t on t.title_id=ta.title_id
left join publishers p on t.pub_id=p.pub_id
group by a.au_id, a.au_lname , a.au_fname , p.pub_name ;

-- Challenge 3:
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

select * from sales; -- get qty use title_id:
--
--
select  a.au_id , a.au_lname , a.au_fname A,
sum(s.qty) as total
from  authors a
left join titleauthor ta on a.au_id =ta.au_id
left join titles t on t.title_id=ta.title_id
left join sales s on s.title_id=ta.title_id
group by a.au_id, a.au_lname, a.au_fname
order by total DESC
limit 3
 ;

-- Challenge 4:
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3.
-- Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL).
-- Also order your results based on TOTAL from high to low.


select  a.au_id , a.au_lname , a.au_fname A,
coalesce(sum(s.qty),0) as total
from  authors a
left join titleauthor ta on a.au_id =ta.au_id
left join titles t on t.title_id=ta.title_id
left join sales s on s.title_id=ta.title_id
group by a.au_id, a.au_lname, a.au_fname
order by total DESC;

