1 - Who Have Published What At Where?
SELECT a.au_id, a.au_fname, a.au_lname, t.title, p.pub_name 
from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join publishers p on p.pub_id = t.pub_id
order by a.au_id;


2 - Who Have Published How Many At Where?

select count(*) from titleauthor

SELECT count(*) as table_count
from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join publishers p on p.pub_id = t.pub_id;

3 - Best Selling Authors

select a.au_id, a.au_lname, a.au_fname, 
t.ytd_sales as TOTAL
from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles t on t.title_id = ta.title_id
group by a.au_id, a.au_lname, a.au_fname, TOTAL
order by TOTAL
DESC
limit 3;

4 - Best Selling Authors Ranking

select a.au_id, a.au_lname, a.au_fname, COALESCE(t.ytd_sales, 0) as TOTAL
from authors a
left join titleauthor ta on a.au_id = ta.au_id
left join titles t on t.title_id = ta.title_id
order by t.ytd_sales
DESC;