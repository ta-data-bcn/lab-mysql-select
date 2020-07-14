use publications;

# Joins various tables

select au_id,  au_lname, au_fname
from authors
order by au_id;
###############

select au_id, title_id
from titleauthor;

select title_id, title, pub_id
from titles;

#################
select pub_id, pub_name
from publishers; 


######## Challenge 1
Select a.au_id,  a.au_lname, a.au_fname, c.title, d.pub_name
from authors a
right join titleauthor b on a.au_id = b.au_id
left join titles c on b.title_id = c.title_id
left join publishers d on c.pub_id = d.pub_id
;

#############################
# Challenge 2

# first new table
create table new_tb1 Select a.au_id,  a.au_lname, a.au_fname, c.title, d.pub_name
from authors a
right join titleauthor b on a.au_id = b.au_id
left join titles c on b.title_id = c.title_id
left join publishers d on c.pub_id = d.pub_id
;
############# 
select au_id, au_lname, au_fname,pub_name, count(title)
 
from new_tb1
group by au_lname,au_fname,pub_name
order by au_id desc;

################ Challenge 3
#Who are the top 3 authors who have sold the highest number of titles?

# from sales qtq, title_id

create table new_tb2 Select a.au_id,  a.au_lname, a.au_fname, c.title, d.pub_name, b.title_id, e.qty 
from authors a
right join titleauthor b on a.au_id = b.au_id
left join titles c on b.title_id = c.title_id
left join publishers d on c.pub_id = d.pub_id
left join sales e on e.title_id = c.title_id
;

#########


create table new_tb3 Select a.au_id,  a.au_lname, a.au_fname, c.title, d.pub_name,  e.qty 
from authors a
right join titleauthor b on a.au_id = b.au_id
left join titles c on b.title_id = c.title_id
left join publishers d on c.pub_id = d.pub_id
left join sales e on e.title_id = b.title_id
;

# Solution
Select au_id, au_lname, au_fname, SUM(qty) as TOTAL
from new_tb3
group by au_lname, au_fname
order by TOTAL desc
limit 3;

##################### Challenge 4
Select au_id, au_lname, au_fname, SUM(qty) as TOTAL
from new_tb3
group by au_lname, au_fname
order by TOTAL desc
limit 23;

Select a.au_id,  a.au_lname, a.au_fname, c.title, d.pub_name,  e.qty 
from authors a
right join titleauthor b on a.au_id = b.au_id
left join titles c on b.title_id = c.title_id
left join publishers d on c.pub_id = d.pub_id
left join sales e on e.title_id = b.title_id
;


