use publications;

##sales_royalty = titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100
WITH output as (
WITH subtable as (

SELECT
ti.title_id,
ta.au_id,
ti.price, 
ti.royalty,
s.qty,
ti.price * (ti.royalty/100) * s.qty as sales_royalty,
ti.advance * (ta.royaltyper/100) as advance_1

FROM titles ti
LEFT JOIN sales s ON s.title_id = ti.title_id
LEFT JOIN titleauthor ta ON ti.title_id = ta.title_id)

SELECT 
title_id,
au_id,
SUM(sales_royalty) as sum_sales_royalty,
advance_1

FROM subtable
GROUP BY 1,2)

SELECT 

au_id,
sum_sales_royalty + advance_1 as total_profits
FROM output
ORDER BY total_profits DESC
LIMIT 3;

