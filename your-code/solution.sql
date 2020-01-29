-- Challenge 1 --

# Step 0 . Defining the database that we will be using:

USE publications;

# Step 1, take all the relevant columns from the table authors and create a new table.

CREATE TABLE author_title_publisher AS
SELECT au_id, au_lname, au_fname
FROM authors;

SELECT * FROM author_title_publisher;

# Step 2, use Titleauthor table to get  matching value between au_id and title_id, since this table has both.
# We "Select" all existing columns from the previously created table, and add the additional one which we will need from the other table

CREATE TABLE author_title_publisher_1 AS
SELECT 
    author_title_publisher.au_id,
    author_title_publisher.au_lname,
    author_title_publisher.au_fname,
    title_id
FROM
    titleauthor
        JOIN
    author_title_publisher ON titleauthor.au_id = author_title_publisher.au_id;

SELECT * FROM author_title_publisher_1;

#3. We will now use the column title_id to append the relevant into (title and pub_id) available in the titles table.

CREATE TABLE author_title_publisher_2 AS
SELECT 
    author_title_publisher_1.au_id,
    author_title_publisher_1.au_lname,
    author_title_publisher_1.au_fname,
    author_title_publisher_1.title_id,
    title,
    pub_id
FROM
	titles
    JOIN 
    author_title_publisher_1 ON titles.title_id = author_title_publisher_1.title_id;
    
SELECT * FROM author_title_publisher_2;

#4. We will now use the column pub_id to append the relevant into (publisher) available in the publishers table.

CREATE TABLE author_title_publisher_3 AS
SELECT 
    author_title_publisher_2.au_id,
    author_title_publisher_2.au_lname,
    author_title_publisher_2.au_fname,
    author_title_publisher_2.title_id,
    author_title_publisher_2.title,
    author_title_publisher_2.pub_id,
    pub_name
FROM
	publishers
    JOIN 
    author_title_publisher_2 ON publishers.pub_id = author_title_publisher_2.pub_id;
    
SELECT * FROM author_title_publisher_3;
    
    # Create a final table in which we include only the "requested" fields.
    
CREATE TABLE author_title_publisher_fv AS
SELECT 
    author_title_publisher_3.au_id,
    author_title_publisher_3.au_lname,
    author_title_publisher_3.au_fname,
    author_title_publisher_3.title,
    author_title_publisher_3. pub_name
FROM
	author_title_publisher_3;
    
SELECT * FROM author_title_publisher_fv;   

#Rename columns to be aligned with excercise naming.

ALTER TABLE author_title_publisher_fv
    RENAME COLUMN au_id TO Author_Id, 
    RENAME COLUMN au_lname TO Last_Name,
    RENAME COLUMN au_fname TO First_Name,
	RENAME COLUMN title TO Title,
    RENAME COLUMN pub_name TO Publisher;
    
SELECT * FROM author_title_publisher_fv;  
    
# Finally, check if the number of rows is the same as in titleauthor table

SELECT COUNT(*)
FROM author_title_publisher_fv;

SELECT COUNT(*)
FROM titleauthor;

-- Challenge 2 -- Who Have Published How Many At Where?

CREATE TABLE table_titles_count AS
SELECT Author_Id, Last_Name, First_Name, Publisher, COUNT(*) AS count_title
FROM 
	author_title_publisher_fv
GROUP BY Author_Id, Last_Name, First_Name, Publisher;
 

SELECT * FROM table_titles_count;

-- Challenge 3 -- Best Selling Authors

# Create a table where we can match the title_id to the qty sales of that title
CREATE TABLE best_selling_authors AS
SELECT     
	author_title_publisher_3.au_id,
    author_title_publisher_3.au_lname,
    author_title_publisher_3.au_fname,
    author_title_publisher_3.title_id,
    qty
FROM 
	sales
    JOIN 
    author_title_publisher_3 ON author_title_publisher_3.title_id = sales.title_id;
    
    
SELECT * FROM best_selling_authors;

#Actually, the title id, is not needed witin the table since it aggrupates the quantity by individual title.
#We actually want it by author, so let´s drop the title

CREATE TABLE best_selling_authors_3 AS
SELECT     
	best_selling_authors.au_id,
    best_selling_authors.au_lname,
    best_selling_authors.au_fname,
    best_selling_authors.qty
    
FROM best_selling_authors
ORDER BY best_selling_authors.qty DESC
LIMIT 3;

SELECT * FROM best_selling_authors_3;

-- Challenge 4 -- Best Selling Authors Ranking

CREATE TABLE best_selling_authors_ranking AS
SELECT     
	best_selling_authors.au_id,
    best_selling_authors.au_lname,
    best_selling_authors.au_fname,
    best_selling_authors.qty,
    RANK() OVER (ORDER BY best_selling_authors.qty DESC) qty_rank    
FROM  best_selling_authors
ORDER BY best_selling_authors.qty DESC;

SELECT * FROM best_selling_authors_ranking;