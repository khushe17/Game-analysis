#SQL Analysis – Video Game Sales (games dataset)

#1. Identify the highest-quality games based on user feedback.
#Insight: Highlights TOP 10 games that consistently receive excellent user ratings, serving as quality benchmarks.

SELECT title, rating
FROM games_final
WHERE rating IS NOT NULL
ORDER BY rating DESC
LIMIT 10;

#2. Evaluate developer teams based on the quality of their games.
#Insight: Some development teams consistently produce higher-rated games, reflecting better development quality and design standards.
SELECT team,
       ROUND(AVG(rating), 2) AS avg_rating,
       COUNT(*) AS total_games
FROM games_final
WHERE team IS NOT NULL
GROUP BY team
HAVING COUNT(*) >= 5
ORDER BY avg_rating DESC;

#3. Understand genre dominance in the dataset.
#Insight: Some development teams consistently produce higher-rated games, reflecting better development quality and design standards.
SELECT genres, COUNT(*) AS total_games
FROM games_final
GROUP BY genres
ORDER BY total_games DESC
LIMIT 10;

#4. Measure future demand and player interest.
#Insight: The most common genres show where the market is highly competitive and where player interest is currently concentrated.
SELECT title, wishlist
FROM games_final
ORDER BY wishlist DESC
LIMIT 10;

#5. Identify games with the strongest combined user engagement.
#Insight: These games show the highest overall engagement, combining strong play activity with high player interest and intent.
SELECT title,
       (plays + wishlist + backlogs) AS engagement_score
FROM games_final
ORDER BY engagement_score DESC
LIMIT 10;









