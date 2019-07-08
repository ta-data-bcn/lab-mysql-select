-- Challenge 1
select authors.`au_id`, authors.`au_lname`, authors.`au_fname`, titles.`title` , publishers.`pub_name` from authors
join titleauthor on titleauthor.`au_id` = authors.`au_id`
join titles on titles.`title_id` = titleauthor.`title_id`
join publishers on publishers.`pub_id` = titles.`pub_id`;

-- Challenge 2
select authors.`au_id`, authors.`au_lname`, authors.`au_fname`, count(titles.`title`) , publishers.`pub_name` from authors
join titleauthor on titleauthor.`au_id` = authors.`au_id`
join titles on titles.`title_id` = titleauthor.`title_id`
join publishers on publishers.`pub_id` = titles.`pub_id`
group by authors.`au_id`, publishers.`pub_id`;

-- Challenge 3

select authors.`au_id`, authors.`au_lname`, authors.`au_fname`, sum(sales.`qty`) 
from authors
join titleauthor on titleauthor.`au_id` = authors.`au_id`
join sales on sales.`title_id` = titleauthor.`title_id`
group by authors.`au_id`
order by sum(sales.`qty`) desc
limit 3;

-- Challenge 4

select authors.`au_id`, authors.`au_lname`, authors.`au_fname`, ifnull(sum(sales.`qty`), 0)
from authors
left join titleauthor on titleauthor.`au_id` = authors.`au_id`
left join sales on sales.`title_id` = titleauthor.`title_id`
group by authors.`au_id`
order by sum(sales.`qty`) desc
limit 23;
