# uploading vgsales data


CREATE TABLE vgsales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    rank_num INT,
    name VARCHAR(255),
    platform VARCHAR(50),
    release_year INT,
    genre VARCHAR(100),
    publisher VARCHAR(150),
    na_sales DECIMAL(6,2),
    eu_sales DECIMAL(6,2),
    jp_sales DECIMAL(6,2),
    other_sales DECIMAL(6,2),
    global_sales DECIMAL(6,2)
);

LOAD DATA LOCAL INFILE 'C:/mysql_import/vgsales_cleaned.csv'
INTO TABLE vgsales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    rank_num,
    name,
    platform,
    release_year,
    genre,
    publisher,
    na_sales,
    eu_sales,
    jp_sales,
    other_sales,
    global_sales
);

SELECT COUNT(*) FROM vgsales;
select * from vgsales;
DESCRIBE vgsales;
show create table vgsales;
