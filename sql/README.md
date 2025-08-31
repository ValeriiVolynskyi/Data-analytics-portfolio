# SQL Practice Projects

This folder contains my SQL practice tasks completed in **PostgreSQL** using **DBeaver**.  
The project is based on datasets with advertising campaign data from **Google Ads** and **Facebook Ads**.  
The main goal was to analyze campaign performance, calculate key marketing metrics, and practice advanced SQL queries.

---

## 📊 Tasks Overview

### Task 1 — Daily Spend Aggregation
**Goal:** Calculate aggregated metrics (average, max, min) of daily ad spend separately for Google Ads and Facebook Ads.  
**SQL techniques used:** `UNION ALL`, `GROUP BY`, aggregate functions (`AVG`, `MAX`, `MIN`).  
**Result:** Built daily spend overview that helps to quickly compare spending patterns across platforms.  

👉 [View Script](./scripts/Script-1.sql)

---

### Task 2 — Top-5 Days by ROMI
**Goal:** Find the top 5 days with the highest ROMI (Return on Marketing Investment) across both platforms.  
**SQL techniques used:** `WITH`, filtering data, `SUM`, calculating ratios, `ORDER BY ... DESC LIMIT`.  
**Result:** Identified days with the most efficient ad spend, which can be used for budgeting decisions.  

👉 [View Script](./scripts/Script-2.sql)

---

### Task 3 — Weekly Campaign Value
**Goal:** Determine the campaign with the highest total weekly value.  
**SQL techniques used:** `DATE_TRUNC`, table joins, aggregation by campaign, `LIMIT`.  
**Result:** Discovered which campaign delivered the best performance at the weekly level.  

👉 [View Script](./scripts/Script-3.sql)

---

### Task 4 — MoM Reach Growth
**Goal:** Find the campaign with the largest month-to-month growth in reach.  
**SQL techniques used:** Window functions (`LAG`), percentage growth calculations.  
**Result:** Highlighted the fastest-growing campaign in terms of audience reach.  

👉 [View Script](./scripts/Script-4.sql)

---

### Task 5 — Longest Continuous Adset Run
**Goal:** Write a query that returns the adset name and duration of the longest continuous daily run (across Google and Facebook).  
**SQL techniques used:** Consecutive date sequences, grouping, and calculating streaks.  
**Result:** Identified the adset with the longest uninterrupted run.  

👉 [View Script](./scripts/Script-5.sql)

---

## 🛠️ Tools
- PostgreSQL  
- DBeaver  
- SQL (CTEs, JOINs, aggregation, window functions)

---

## 📂 Repository Structure

```
SQL/
├── README.md
├── scripts/
│   ├── Script-1.sql
│   ├── Script-2.sql
│   ├── Script-3.sql
│   ├── Script-4.sql
│   └── Script-5.sql

```

