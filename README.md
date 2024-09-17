-- Identify the top 5 categories for launching new free apps based on average ratings
SELECT category, ROUND(AVG(rating), 2) AS 'average'
FROM playstore
WHERE type = 'Free'
GROUP BY category
ORDER BY average DESC
LIMIT 5;
