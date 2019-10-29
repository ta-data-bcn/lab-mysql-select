#CHALLENGE ONE

use publications;

select 
a.au_id, 
a.au_fname,
a.au_lname,
t.title,
p.pub_name
from authors a 
join titleauthor ta on a.au_id=ta.au_id
join titles as t on ta.title_id=t.title_id
join publishers p on p.pub_id=t.pub_id
order by a.au_id
;

select count(*) from titleauthor;

select 
count(*) as table_count
from authors a 
join titleauthor ta on a.au_id=ta.au_id
join titles as t on ta.title_id=t.title_id
join publishers p on p.pub_id=t.pub_id
;



#CHALLENGE TWO

use publications;
select 
a.au_id,
a.au_fname,
a.au_lname,
p.pub_name,
count(*) as title_count
from authors a 
	join titleauthor ta on a.au_id=ta.au_id
	join titles as t on ta.title_id=t.title_id
	join publishers p on p.pub_id=t.pub_id
group by 
a.au_id,
a.au_fname,
a.au_lname,
p.pub_name
;



#CHALLENGE THREE
select a.au_id, a.au_lname, a.au_fname, sum(ti.ytd_sales)
from authors as a 
	join titleauthor t on a.au_id=t.au_id
	join titles as ti on t.title_id=ti.title_id
group by 
a.au_id,
a.au_fname,
a.au_lname
order by sum(ti.ytd_sales) desc
limit 3
;



#CHALLENGE FOUR 

SELECT
        a.au_id,
        a.au_lname,
        a.au_fname,
        SUM(ti.ytd_sales)
FROM authors as a
JOIN titleauthor as t on a.au_id = t.au_id
JOIN titles as ti on t.title_id = ti.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY sum(ti.ytd_sales) DESC
LIMIT 3;
## Challenge 4 - Best Selling Authors Ranking
SELECT
        a.au_id,
        a.au_lname,
        a.au_fname,
        COALESCE(sum(ytd_sales),0)
        
FROM authors as a
LEFT JOIN titleauthor as t on a.au_id = t.au_id
LEFT JOIN titles as ti on t.title_id = ti.title_id
GROUP BY a.au_id
ORDER BY sum(ti.ytd_sales) DESC
;