📊 Global Layoffs Data Cleaning & Analysis (SQL Project)
📌 Project Overview
This project analyzes global layoffs data to uncover key trends, identify companies most affected, and study industry patterns. It involves:

Data Cleaning: Removing duplicates, handling nulls, standardizing formats.

Exploratory Analysis: Understanding layoffs by company, industry, stage, geography, and time trends.

The project demonstrates end-to-end SQL workflow: from raw messy data to clean insights.

🛠 Tools & Technologies
SQL (MySQL 8.0) — Data cleaning, transformation, and analysis

CTEs & Window Functions — For ranking, rolling totals, and deduplication

Data Cleaning Techniques — Standardization, null handling, date conversion


🧹 Data Cleaning Process
Performed in 01_data_cleaning_world_layoffs.sql

Steps Taken
Created a staging table to protect raw data.

Removed duplicates

Used ROW_NUMBER() to find duplicates.

Deleted rows with row_num > 1.

Standardized text data

Trimmed extra spaces in company names.

Unified industry values (e.g., all variations of crypto → crypto).

Cleaned country names (United States. → United States).

Converted data types

Converted date column from TEXT to DATE using STR_TO_DATE().

Handled nulls and blanks

Filled missing industry values from other entries of the same company.

Deleted records with both total_laid_off and percentage_laid_off as NULL.

Dropped unnecessary column

Removed helper column row_num after cleanup.


🔍 Exploratory Data Analysis
Performed in 02_exploratory_analysis_world_layoffs.sql

Key Insights & Queries
Total layoffs across companies and industries.

Top companies by layoffs — aggregated layoffs by company.

Companies with 100% layoffs (percentage_laid_off = 1).

Layoffs by funding stage to see which stage was most affected.

Time trends

Monthly layoffs over time.

Rolling total (cumulative layoffs) using CTE.

Yearly top companies

Ranked top 5 companies per year using DENSE_RANK().


📈 Sample Insights
Peak Layoffs: Certain months show massive spikes due to large-scale layoffs from tech giants.

Industries Impacted Most: Crypto and consumer tech companies saw significant layoffs.

Stage Trends: Companies in late-stage funding faced higher layoffs.

Yearly Leaders: Some companies appeared in the top 5 layoff lists multiple years in a row.


💼 Skills Demonstrated
SQL Data Cleaning (duplicates, nulls, text standardization, data type conversion)

SQL Analysis (aggregations, grouping, time-based trends)

CTEs, Window Functions, and Ranking

Analytical thinking and storytelling with data


📎 How to Use
Import the dataset into MySQL.

Run 01_data_cleaning_world_layoffs.sql to clean the data.

Run 02_exploratory_analysis_world_layoffs.sql for insights.
