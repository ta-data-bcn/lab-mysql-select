![Ironhack logo](https://i.imgur.com/1QgrNNw.png)

# Lab | MySQL Select

## Introduction

In this lab you will practice how to use the MySQL `SELECT` statement which will be extremely useful in your future work as a data analyst/scientist/engineer. **You will use the `publications` database that we used in the *Joins and Relationships* lesson.** 

You will create a `solutions.sql` file in the `your-code` directory to record your solutions to all challenges.

## Challenge 1 - Who Have Published What At Where?

In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

* `AUTHOR ID` - the ID of the author
* `LAST NAME` - author last name
* `FIRST NAME` - author first name
* `TITLE` - name of the published title
* `PUBLISHER` - name of the publisher where the title was published

Your output will look something like below:

![Challenge 1 output](challenge-1.png)

*Note: the screenshot above is not the complete output.*

If your query is correct, the total rows in your output should be the same as the total number of records in Table `titleauthor`.

### Answer:
SELECT ta.au_id AS AuthorID,a.`au_lname` as LAST_NAME, a.`au_fname` as FIRST_NAME, t.title  as TITLE, p.`pub_name` as PUBLISHER
FROM titles t
INNER JOIN `publishers` p ON  t.`pub_id` = p.`pub_id`
INNER JOIN `titleauthor` ta ON t.`title_id` = ta.`title_id`
INNER JOIN authors a ON ta.`au_id` = a.au_id
ORDER BY AuthorID;

## Challenge 2 - Who Have Published How Many At Where?

Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:

![Challenge 2 output](challenge-2.png)

*Note: the screenshot above is not the complete output.*

To check if your output is correct, sum up the `TITLE COUNT` column. The sum number should be the same as the total number of records in Table `titleauthor`.

*Hint: In order to count the number of titles published by an author, you need to use [MySQL COUNT](https://dev.mysql.com/doc/refman/8.0/en/counting-rows.html). Also check out [MySQL Group By](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html) because you will count the rows of different groups of data. Refer to the references and learn by yourself. These features will be formally discussed in the Temp Tables and Subqueries lesson.*
### Answer:
SELECT ta.au_id AS AuthorID,a.`au_lname` as LAST_NAME, a.`au_fname` as FIRST_NAME, p.`pub_name` as PUBLISHER, count(t.title) as TITLE_COUNT
FROM titles t
INNER JOIN `publishers` p ON  t.`pub_id` = p.`pub_id`
INNER JOIN `titleauthor` ta ON t.`title_id` = ta.`title_id`
INNER JOIN authors a ON ta.`au_id` = a.au_id
GROUP BY PUBLISHER , AuthorID
ORDER BY TITLE_COUNT desc;

## Challenge 3 - Best Selling Authors

Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

* Your output should have the following columns:
	* `AUTHOR ID` - the ID of the author
	* `LAST NAME` - author last name
	* `FIRST NAME` - author first name
	* `TOTAL` - total number of titles sold from this author
* Your output should be ordered based on `TOTAL` from high to low.
* Only output the top 3 best selling authors.

*Hint: In order to calculate the total of profits of an author, you need to use the [MySQL SUM function](https://dev.mysql.com/doc/refman/8.0/en/group-by-functions.html#function_sum). Refer to the reference and learn how to use it.*

### Answer:
SELECT ta.au_id AS AuthorID,a.`au_lname` as LAST_NAME, a.`au_fname` as FIRST_NAME, SUM(s.qty) as SALES
FROM titles t
INNER JOIN `titleauthor` ta ON t.`title_id` = ta.`title_id`
INNER JOIN authors a ON ta.`au_id` = a.au_id
INNER JOIN sales s ON t.`title_id` = s.`title_id`
GROUP BY  AuthorID
ORDER BY SALES desc
LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking

Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). Also order your results based on `TOTAL` from high to low.


*Hints:* 

* If a title has multiple authors, how they split the royalties can be found in the `royaltyper` column of the `titleauthor` table.
* We assume the coauthors will split the advance in the same way as the royalties.

### Answer:
SELECT a.au_id AS AuthorID, a.`au_lname` as LAST_NAME, a.`au_fname` as FIRST_NAME,  COALESCE(SUM(s.qty), 0) as SALES
FROM authors a
LEFT JOIN `titleauthor` ta ON a.`au_id` = ta.`au_id`
LEFT JOIN `titles` t ON ta.`title_id` = t.`title_id`
LEFT JOIN sales s ON t.`title_id` = s.`title_id`
GROUP BY  AuthorID
ORDER BY SALES desc;

## Deliverables

* `solution.sql` that contains all your MySQL queries.

## Submission

* Add `solutions.sql` to git
* Commit your code
* Push to your fork
* Create a pull request to the class repo

## References

[MySQL Reference: Counting Rows](https://dev.mysql.com/doc/refman/8.0/en/counting-rows.html)

[MySQL Reference: Group By](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html)

[MySQL Reference: SUM Function](https://dev.mysql.com/doc/refman/8.0/en/group-by-functions.html#function_sum)
