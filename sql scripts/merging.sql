CREATE TABLE games_vgsales_merged AS
SELECT
    g.game_id,
    g.title,
    v.platform,
    v.release_year,
    v.genre,
    v.publisher,
    v.na_sales,
    v.eu_sales,
    v.jp_sales,
    v.other_sales,
    v.global_sales,
    g.rating,
    g.plays,
    g.playing,
    g.backlogs,
    g.wishlist
FROM games_final g
INNER JOIN vgsales v
    ON g.game_id = v.game_id;
    
    
SELECT COUNT(*) FROM games_vgsales_merged;
select * from games_vgsales_merged;

show tables;



    
    
    
    