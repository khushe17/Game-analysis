#SQL Analysis – Video Game Sales (merged dataset)

#1. Which game genres generate the most global sales?
#Insight: Action and Sports genres generate the highest global sales, indicating strong mass-market appeal and revenue potential.

SELECT
    genre,
    ROUND(SUM(global_sales), 2) AS total_global_sales
FROM games_vgsales_merged
GROUP BY genre
ORDER BY total_global_sales DESC;


#2.Which platforms have the most highly rated games (rating ≥ 4)?
#Insight: PlayStation and Xbox platforms host the highest number of well-rated games, reflecting strong developer ecosystems and quality standards.

SELECT
    platform,
    COUNT(DISTINCT title) AS high_rated_games
FROM games_vgsales_merged
WHERE rating >= 4
GROUP BY platform
ORDER BY high_rated_games DESC;


#3. Which genres have high user engagement but relatively low sales?
#Insight: Some niche genres show high engagement but lower sales, suggesting opportunities for better monetization or marketing strategies.

SELECT
    genre,
    ROUND(AVG(plays + wishlist + backlogs), 0) AS avg_user_engagement,
    ROUND(AVG(global_sales), 2) AS avg_global_sales
FROM games_vgsales_merged
WHERE plays IS NOT NULL
  AND wishlist IS NOT NULL
  AND backlogs IS NOT NULL
GROUP BY genre
ORDER BY avg_user_engagement DESC;



#4. How does user engagement differ across genres?
#Insight: Action and RPG genres show the highest overall engagement, indicating longer playtimes and sustained player interest.

SELECT
    genre,
    ROUND(AVG(plays), 0) AS avg_plays,
    ROUND(AVG(wishlist), 0) AS avg_wishlist,
    ROUND(AVG(backlogs), 0) AS avg_backlogs
FROM games_vgsales_merged
GROUP BY genre
ORDER BY avg_plays DESC;


#5. What are the top-performing Genre + Platform combinations?
#Insight: Certain genre–platform combinations (e.g., Action games on PlayStation) significantly outperform others, highlighting optimal publishing strategies.

SELECT
    genre,
    platform,
    ROUND(SUM(global_sales), 2) AS total_global_sales
FROM games_vgsales_merged
GROUP BY genre, platform
ORDER BY total_global_sales DESC
LIMIT 10;


