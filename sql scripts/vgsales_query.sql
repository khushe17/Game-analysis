#SQL Analysis – Video Game Sales (vgsales)

#1. Which region generates the most game sales?
#Insight: North America emerges as the largest contributor to global video game sales.
SELECT
    SUM(na_sales) AS na_total_sales,
    SUM(eu_sales) AS eu_total_sales,
    SUM(jp_sales) AS jp_total_sales,
    SUM(other_sales) AS other_total_sales
FROM vgsales;


#2. What are the Top 10 best-selling platforms?
# Insight: A small number of platforms account for a majority of total game sales.

SELECT platform,
       ROUND(SUM(global_sales), 2) AS total_global_sales
FROM vgsales
GROUP BY platform
ORDER BY total_global_sales DESC
LIMIT 10;


#3. What’s the trend of game releases and sales over past 10 years?
#Insight: Game releases and sales show distinct growth and decline phases over time.

SELECT release_year,
       COUNT(*) AS games_released,
       ROUND(SUM(global_sales), 2) AS total_sales
FROM vgsales
GROUP BY release_year
ORDER BY release_year desc limit 10;


#4. Who are the top 10 publishers by global sales?
#Insights: A few dominant publishers generate a disproportionately high share of global sales.

SELECT publisher,
       ROUND(SUM(global_sales), 2) AS total_global_sales
FROM vgsales
GROUP BY publisher
ORDER BY total_global_sales DESC
LIMIT 10;


#5. Which games are the top 10 best-sellers globally?
#Insight: Blockbuster titles significantly outperform the majority of games in the market.

SELECT name,
       ROUND(global_sales, 2) AS global_sales
FROM vgsales
ORDER BY global_sales DESC
LIMIT 10;


#6.How do regional sales compare for specific platforms?
#Insight: Platform performance varies significantly by region, indicating regional market preferences.

SELECT platform,
       ROUND(SUM(na_sales), 2) AS na_sales,
       ROUND(SUM(eu_sales), 2) AS eu_sales,
       ROUND(SUM(jp_sales), 2) AS jp_sales
FROM vgsales
GROUP BY platform
ORDER BY na_sales DESC;


#7.What are the top 5 best-selling games per platform?
#Insight: Each platform is driven by a small set of high-performing flagship titles.

SELECT platform,
       name,
       global_sales
FROM (
    SELECT platform,
           name,
           global_sales,
           ROW_NUMBER() OVER (PARTITION BY platform ORDER BY global_sales DESC) AS rank_within_platform
    FROM vgsales
) ranked_games
WHERE rank_within_platform <= 5
ORDER BY platform, global_sales DESC;


#8. How has the market evolved by platform over time?
#Insight: Platforms show clear rise-and-decline cycles reflecting changing consumer preferences.

SELECT release_year,
       platform,
       ROUND(SUM(global_sales), 2) AS yearly_sales
FROM vgsales
GROUP BY release_year, platform
ORDER BY release_year, yearly_sales DESC;










