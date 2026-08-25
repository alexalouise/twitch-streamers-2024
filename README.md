# 📊 Twitch Streamers Analysis 2024 (SQL & Excel Portfolio)

## 📌 Project Overview
This project explores a dataset of 1,000 top Twitch streamers to analyze broadcasting habits, popular gaming categories, viewer engagement, and creator performance. **Microsoft Excel** for data cleaning and dashboards. Using **SQL**, I answered core business and analytical questions ranging from basic aggregations to intermediate calculations like viewership concentration and creator segmentation. 

---

## 📁 What This Project Includes
- **`streamers2024.csv`**: The raw dataset containing Twitch streamer stats (rank, followers, total views, active days, games played, stream duration, language, etc.).
- **`twitch.sql`**: A complete collection of structured SQL queries used to analyze key metrics and extract insights from the data.
- **`streamers_2024.xlsx`**: An Excel workbook featuring cleaned data, calculated custom columns, Pivot Tables, and an interactive dashboard.

---

## 🛠️ Tools & Technologies
- **Database Engine & Environment:** Microsoft SQL Server Management Studio (SSMS)
- **Language:** T-SQL / Standard SQL
- **Source Data:** CSV format
- **Microsoft Excel:** Data cleaning, data formatting, Pivot Tables

---

## ⚡ SQL Concepts Applied
During this project, I used several core SQL concepts to process and analyze the data:

* **Data Filtering & Sorting:** `WHERE`, `AND`, `OR`, `ORDER BY`, `LIMIT` / `TOP`
* **Aggregations & Grouping:** `SUM()`, `AVG()`, `COUNT()`, `GROUP BY`, `HAVING`
* **Conditional Logic:** `CASE WHEN` (for creator segmentation)
* **Subqueries:** Nesting queries inside `WHERE` clauses for dynamic threshold filtering
* **Data Type Casting:** `CAST(... AS BIGINT)` (to handle large numeric aggregations and prevent arithmetic overflow errors)
* **Calculated Fields & Metrics:** Custom mathematical operations (e.g., ratio calculations and market share percentages)

---

## ⚡ Excel Concepts Applied
For this project, I applied simple pivot tables, visualizations, and formatting.

* **Data Cleaning & Formatting:** Custom number types, decimal formatting, comma separation, and Excel Table setup.
* **Summarization & Visuals:** Pivot Tables and visual styling.

## 💡 Key Findings & Highlights
1. **Variety vs. Focused Streamers:** Variety streamers (averaging >2 games per stream) pull significantly higher average viewers (~33.6k) compared to single-game creators (~17.6k).
2. **Viewership Concentration:** The top 50 ranked streamers account for **~18.6%** of total views across the entire dataset.
3. **Language & Regional Trends:** English is the most common language, but Spanish creators hold top spots in follower count (e.g., *auronplay*, *ibai*), and Portuguese streamers have a high concentration in categories like *Virtual Casino*.
4. **Peak Days:** **Sunday** is the single most common day for streamers to gain the most new followers and generates over 9.8 billion total views.
