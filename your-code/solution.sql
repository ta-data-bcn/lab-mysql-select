use publications;

select *
from titleauthor
order by title_id;

-- 1
-- Who Have Published What At Where?
-- * `AUTHOR ID` - the ID of the author
-- * `LAST NAME` - author last name
-- * `FIRST NAME` - author first name
-- * `TITLE` - name of the published title
-- * `PUBLISHER` - name of the publisher where the title was published
-- Solution 1 after analyzing that there are authors without a contract:

select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
from authors a 
left join titleauthor ta
on a.au_id = ta.au_id
left join titles t
on t.title_id = ta.title_id
left join publishers p
on p.pub_id = t.pub_id
where a.contract = 1;

-- Solution 2 with a right join between authors and titleauthor, because there are authors without published books
select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
from authors a 
right join titleauthor ta
on a.au_id = ta.au_id
left join titles t
on t.title_id = ta.title_id
left join publishers p
on p.pub_id = t.pub_id;

-- 2 Who Have Published How Many At Where?
select a.au_id as AUTHOR_ID,
a.au_lname AS LAST_NAME,
a.au_fname as FIRST_NAME,
p.pub_name as PUBLISHER,
count(t.title) as TITLE_COUNT  
from authors a 
right join titleauthor ta
on a.au_id = ta.au_id
left join titles t
on t.title_id = ta.title_id
left join publishers p
on p.pub_id = t.pub_id
group by AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER;

-- 3 Best Selling Authors
select a.au_id as AUTHOR_ID,
a.au_lname AS LAST_NAME,
a.au_fname as FIRST_NAME,
SUM(s.qty) as TOTAL  
from authors a 
left join titleauthor ta
on a.au_id = ta.au_id
left join titles t
on t.title_id = ta.au_id
left join sales s
on s.title_id = t.title_id
group by AUTHOR_ID, LAST_NAME, FIRST_NAME
order by TOTAL desc;
-- limit 3;

-- solution workaround
select a.au_id as AUTHOR_ID,
a.au_lname AS LAST_NAME,
a.au_fname as FIRST_NAME,
TIT.TOTAL as TOTAL 
from authors a 
right join titleauthor ta
on a.au_id = ta.au_id
right join (select t.title_id AS TITLE_ID, t.title TITLE,
sum(s.qty) as TOTAL
from titles t
left join sales s
on s.title_id = t.title_id
group by TITLE
order by total desc
limit 3) TIT
on TIT.title_id = ta.title_id;


select *
from sales;

select *
from titles
where title_id = 'BU1032';


select *
from titleauthor
where title_id = 'BU1032';

select a.au_id, a.au_lname, a.au_fname, t.title
from authors a 
left join titleauthor ta
on a.au_id = ta.au_id
left join titles t
on t.title_id = ta.title_id
where t.title_id = 'BU1032';