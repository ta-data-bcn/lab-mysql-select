#1
#SELECT a.`au_id` "AUTHOR ID", a.au_lname "LAST NAME",a.au_fname "FIRST NAME", titles.`title` as "TITLE", publishers.`pub_name` 'PUBLISHER' FROM authors a
#JOIN titleauthor ta on a.au_id = ta.`au_id`
#JOIN titles on ta.`title_id` = titles.title_id
#JOIN publishers on titles.pub_id = publishers.pub_id

#2

#SELECT a.au_id "AUTHOR ID", a.au_lname "LAST NAME",a.au_fname "FIRST NAME",p.`pub_name` 'PUBLISHER',count(title) from `authors` a
#JOIN titleauthor ta ON a.au_id = ta.au_id
#JOIN titles t ON ta.title_id = t.title_id
#JOIN publishers p ON t.pub_id = p.pub_id
#group by a.au_id, a.`au_lname`, p.pub_name

#3

#select a.au_id "AUTHOR ID", a.au_lname "LAST NAME",a.au_fname "FIRST NAME", sum(qty) "TOTAL" FROM authors as a
#left JOIN titleauthor ta ON a.au_id = ta.`au_id`
#left JOIN sales s ON ta.title_id = s.title_id
#group by a.au_id, a.au_lname, a.au_fname
#order by sum(qty) DESC
#limit 3

#4. 
select a.au_id "AUTHOR ID", a.au_lname "LAST NAME",a.au_fname "FIRST NAME", coalesce(sum(qty),0) "TOTAL" FROM authors as a
left JOIN titleauthor ta ON a.au_id = ta.`au_id`
left JOIN sales s ON ta.title_id = s.title_id
group by a.au_id, a.au_lname, a.au_fname
order by sum(qty) DESC
limit 25