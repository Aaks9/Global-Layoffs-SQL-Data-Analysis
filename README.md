# Global-Layoffs-SQL-Data-Analysis
SQL-based data cleaning and exploratory analysis of global layoffs dataset

# 📊 Global Layoffs Data Analysis (SQL Project)

## 📌 Project Overview

This project analyzes global tech layoffs using SQL.
The goal was to simulate a real-world data analyst workflow:

1. Import raw data into a relational database
2. Clean and standardize messy data
3. Perform exploratory data analysis (EDA)
4. Extract business insights using SQL queries

The entire project is written in SQL and demonstrates strong skills in:

* Data cleaning
* Data transformation
* Aggregations & grouping
* Window functions
* Business-oriented analysis

---

## 🗂️ Project Structure

```
├── data import_layoffs.sql
├── Data cleaning_layoffs.sql
├── data exploration_layoffs.sql
└── README.md
```

### 1️⃣ Data Import (`data import_layoffs.sql`)

* Created database and table structure
* Defined appropriate data types
* Imported raw layoffs dataset into SQL environment

### 2️⃣ Data Cleaning (`Data cleaning_layoffs.sql`)

Performed comprehensive cleaning including:

* Removing duplicate records
* Handling NULL and blank values
* Standardizing company names and industries
* Formatting date columns
* Correcting inconsistent country and stage entries
* Creating cleaned dataset table for analysis

### 3️⃣ Data Exploration (`data exploration_layoffs.sql`)

Performed analytical queries such as:

* Total layoffs by company
* Layoffs by industry
* Layoffs by country
* Year-wise and month-wise trends
* Companies with highest single-day layoffs
* Percentage layoffs vs total employees
* Ranking companies using window functions

---

## 🛠️ Tools & Technologies

* **SQL (MySQL / compatible RDBMS)**
* Relational Database concepts
* Aggregate functions
* Window functions (RANK, DENSE_RANK)
* CTEs (Common Table Expressions)
* Data cleaning techniques

---

## 🔍 Key Business Insights

* Identified industries most impacted by layoffs.
* Determined countries with highest workforce reductions.
* Found peak layoff periods (year/month trends).
* Ranked companies based on total layoffs.
* Analyzed funding stage vs layoff correlation.

---

## 📈 Example Analytical Queries

Examples of SQL concepts used:

```sql
-- Total layoffs by company
SELECT company, SUM(total_laid_off)
FROM layoffs_cleaned
GROUP BY company
ORDER BY SUM(total_laid_off) DESC;

-- Ranking companies by layoffs
SELECT company,
       SUM(total_laid_off) AS total_layoffs,
       RANK() OVER (ORDER BY SUM(total_laid_off) DESC) AS ranking
FROM layoffs_cleaned
GROUP BY company;
```

---

## 🎯 Skills Demonstrated

✔ Data Cleaning & Preparation
✔ Handling messy real-world datasets
✔ SQL Aggregations & Grouping
✔ Window Functions
✔ Business Insight Extraction
✔ Structured Problem-Solving

---
