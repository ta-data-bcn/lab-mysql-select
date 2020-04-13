
# create database publications;

use publications;

# challenge 1: Who Have Published What At Where?
select AuthorID,LastName,FirstName,Title, publishers.pub_name as Publisher
from (select AuthorID,LastName,FirstName, titles.title as Title, titles.pub_id as PublisherID
from (select aut.au_id as AuthorID, aut.au_lname as LastName, aut.au_fname as FirstName,
tit.title_id as TitleID
from authors aut
inner join titleauthor tit on aut.au_id = tit.au_id) getTitID
inner join titles on getTitID.TitleID = titles.title_id) authorPub
inner join publishers on authorPub.PublisherID = publishers.pub_id
order by AuthorID,Title desc;

# challenge 2: Who Have Published How Many At Where?
select AuthorID,LastName,FirstName,
publishers.pub_name as Publisher,count(publishers.pub_name) as TitleCount
from (select AuthorID,LastName,FirstName, titles.title as Title, titles.pub_id as PublisherID
from (select aut.au_id as AuthorID, aut.au_lname as LastName, aut.au_fname as FirstName,
tit.title_id as TitleID
from authors aut
inner join titleauthor tit on aut.au_id = tit.au_id) getTitID
inner join titles on getTitID.TitleID = titles.title_id) authorPub
inner join publishers on authorPub.PublisherID = publishers.pub_id
group by Publisher,AuthorID
order by AuthorID desc;

# challenge 3: Best Selling Authors
select AuthorID,LastName,FirstName,count(sales.ord_num) as Total from
(select aut.au_id as AuthorID, aut.au_lname as LastName, aut.au_fname as FirstName,
tit.title_id as TitleID
from authors aut
inner join titleauthor tit on aut.au_id = tit.au_id) getTitID
inner join sales on TitleID = sales.title_id
group by AuthorID
order by Total desc, LastName asc
limit 3;

# challenge 4: Best Selling Authors Ranking (including no-sellers)
select AuthorID,LastName,FirstName,count(sales.ord_num) as Total from
(select aut.au_id as AuthorID, aut.au_lname as LastName, aut.au_fname as FirstName,
tit.title_id as TitleID
from authors aut
left join titleauthor tit on aut.au_id = tit.au_id) getTitID
left join sales on TitleID = sales.title_id
group by AuthorID
order by Total desc, LastName asc;

# STRICTLY, challenge 4 counts all authors. Those with zero counts are those
# that have a null entry in TitleID. That means they don't have any title associated!!!
# Indeed, all authors that have a title also have at least one sale.

/* # From here below are only SQL drafted code commented


#group by LastName,TitleID

# first step: figure out titles ID per author (who has published?)
-- select aut.au_id as AuthorID, aut.au_lname as LastName, aut.au_fname as FirstName,
-- tit.title_id as TitleID
-- from authors aut
-- inner join titleauthor tit
-- on aut.au_id = tit.au_id
-- order by LastName;

# second step, use the query above as a subquery getTitID, and
# return the Title Names and PublisherID
-- select AuthorID,LastName,FirstName, titles.title as Title, titles.pub_id as PublisherID
-- from (select aut.au_id as AuthorID, aut.au_lname as LastName, aut.au_fname as FirstName,
-- tit.title_id as TitleID
-- from authors aut
-- inner join titleauthor tit on aut.au_id = tit.au_id) getTitID
-- inner join titles on getTitID.TitleID = titles.title_id
-- order by LastName; */