CREATE TABLE world_layoffs.layoffs_new (
    company VARCHAR(255),
    country VARCHAR(100),
    date DATE,
    funds_raised_millions INT,
    industry VARCHAR(255),
    percentage_laid_off DECIMAL(5,2),
    location VARCHAR(255),
    stage VARCHAR(100),
    total_laid_off INT
);
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '/Users/aakankshadayal/Downloads/layoffs_new.csv'
INTO TABLE world_layoffs.layoffs_new
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SHOW VARIABLES LIKE 'local_infile';

TRUNCATE TABLE world_layoffs.layoffs_new;

LOAD DATA LOCAL INFILE '/Users/aakankshadayal/Downloads/layoffs_new.csv'
INTO TABLE world_layoffs.layoffs_new
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    company,
    country,
    @date,
    @funds_raised_millions,
    industry,
    @percentage_laid_off,
    location,
    stage,
    @total_laid_off
)
SET
total_laid_off =
    CASE
        WHEN TRIM(@total_laid_off) REGEXP '^[0-9]+$'
        THEN CAST(TRIM(@total_laid_off) AS UNSIGNED)
        ELSE NULL
    END,

percentage_laid_off =
    CASE
        WHEN TRIM(@percentage_laid_off) REGEXP '^[0-9]+(\\.[0-9]+)?%?$'
        THEN
            CAST(
                REPLACE(TRIM(@percentage_laid_off),'%','')
                AS DECIMAL(6,3)
            )
        ELSE NULL
    END,

funds_raised_millions =
    CASE
        WHEN TRIM(@funds_raised_millions) REGEXP '^[0-9]+$'
        THEN CAST(TRIM(@funds_raised_millions) AS UNSIGNED)
        ELSE NULL
    END,

`date` =
    STR_TO_DATE(TRIM(@date), '%d/%m/%y');


