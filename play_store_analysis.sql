SELECT * FROM playstore.playstore;

/* You're working as a market analyst for a mobile app development company. 
Your task is to identify the most promising categories (TOP 5) for launching new free apps based on their average ratings. */

SELECT Category , round(avg(Rating),2) as avg_rating FROM playstore.playstore
WHERE Type = "Free"
group by Category
order by avg_rating desc
limit 5;

/*As a business strategist for a mobile app company, your objective is to pinpoint the three categories that generate the most revenue from paid apps.
 This calculation is based on the product of the app price and its number of installations. */
 
 select Category, avg((Installs * Price)) as revenue from playstore.playstore
 where Type = "Paid"
 Group by Category
 order by revenue DESC
 limit 3;
 
 /*As a data analyst for a gaming company, you're tasked with calculating the percentage of games within each category.
 This information will help the company understand the distribution of gaming apps across different categories.
*/

set @total = (SELECT count(*) FROM playstore.playstore );
Select @total;


select Category, cnt / (Select @total) * 100 as percentage FROM (
SELECT Category, count(*) as cnt FROM playstore.playstore 
group by Category 
order by cnt DESC)t;

/* As a data analyst at a mobile app-focused market research firm you’ll recommend whether the company should develop paid 
or free apps for each category based on the ratings of that category. */


Select f.Category ,Paid_rating, Free_rating, 
Case when Paid_rating > Free_rating then "PAID" 
	 when Paid_rating < Free_rating then "FREE" 
     ELSE "Both" END as choice from (
SELECT Category, round(avg(Rating),2) as Paid_rating
FROM playstore.playstore
where Type = "Paid"
Group by Category)p
Join
(SELECT Category, round(avg(Rating),2) as Free_rating
FROM playstore.playstore
where Type = "Free"
Group by Category)f ON p.Category = f.Category;

