CREATE DATABASE game_market_analysis;
USE game_market_analysis;

SET GLOBAL local_infile = 1;

#Creating games table and importing cleaned games data
CREATE TABLE games_final (
	game_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    team TEXT,
    rating FLOAT,
    times_listed INT,
    number_of_reviews INT,
    genres TEXT,
    summary TEXT,
    reviews LONGTEXT,
    plays INT,
    playing INT,
    backlogs INT,
    wishlist INT
);


LOAD DATA LOCAL INFILE 'C:/mysql_import/games_cleaned.csv'
INTO TABLE games_final
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    title,
    release_date,
    team,
    rating,
    times_listed,
    number_of_reviews,
    genres,
    summary,
    reviews,
    plays,
    playing,
    backlogs,
    wishlist
);

SELECT COUNT(*) AS total_rows
FROM games_final;
SELECT * FROM games_final;
SHOW TABLES;



    
    
    
    
    



