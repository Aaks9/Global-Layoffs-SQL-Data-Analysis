SELECT * 
FROM layoffs_staging;

SELECT *, 
ROW_NUMBER() OVER(
PARTITION BY company, country, funds_raised_millions, location, industry, stage, total_laid_off, percentage_laid_off, `date`) as rn
FROM layoffs_staging;

WITH detect_duplicates AS(
SELECT *, 
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) as rn
FROM layoffs_staging
)

SELECT *
FROM detect_duplicates
WHERE rn>1;

-- Standardizing the Data
UPDATE layoffs_staging
SET company=TRIM(company);

SELECT *
FROM layoffs_staging
WHERE industry LIKE "Crypto%";

UPDATE layoffs_staging
SET industry='Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country
FROM layoffs_staging
ORDER BY 1;

UPDATE layoffs_staging
SET country=TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT *
FROM layoffs_staging
WHERE company='Airbnb';

SELECT *
FROM layoffs_staging st1
JOIN layoffs_staging st2 ON st1.company=st2.company
AND st1.location=st2.location
WHERE st1.industry IS NULL AND st2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging
WHERE industry IS NULL;

UPDATE layoffs_staging st1
JOIN layoffs_staging st2
ON st1.company=st2.company
SET st1.industry=st2.industry
WHERE st1.industry IS NULL AND st2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;





