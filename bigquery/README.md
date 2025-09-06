# 📊 BigQuery GA4 Analysis  

This project focuses on analyzing **Google Analytics 4 (GA4)** event data using **BigQuery**.  
The tasks include preparing datasets, building conversion funnels, and comparing landing page performance.  

Dataset used:  
`bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`  

---

## 📊 Tasks Overview  

### Task 1. Data Preparation for BI  

**Goal:** Build a dataset with key GA4 fields for BI tools. The table should include:  
- `event_timestamp`  
- `user_pseudo_id`  
- `session_id`  
- `event_name`  
- `country`  
- `device_category`  
- `source`  
- `medium`  
- `campaign`  

Filtered by **2021** and events:  
`session_start`, `view_item`, `add_to_cart`, `begin_checkout`, `add_shipping_info`, `add_payment_info`, `purchase`.  

**SQL techniques used:** Filtering by event type and year, timestamp conversion, selecting required dimensions.  

**Result:** Generated a clean dataset for BI analysis with only relevant events.  

👉 [View Query](./scripts//script_bq1.sql)  

**Interpretation:**  
This dataset is the foundation for analytics and reporting. It ensures BI dashboards are built only on meaningful and consistent GA4 events.  

---

### Task 2. Conversion by Date & Traffic Channel  

**Goal:** Calculate the **conversion funnel** (visit → cart → checkout → purchase) broken down by **date, source, medium, campaign**.  

**SQL techniques used:**  
- Creating composite session keys (`user + session_id`)  
- Aggregation with `GROUP BY`  
- Calculating ratios using `CASE WHEN`  

**Result:** Produced a conversion funnel table showing step-by-step drop-off for each traffic channel and campaign.  

👉 [View Query](bigquery/assets/script_bq1.sql)  

**Interpretation:**  
This analysis highlights which channels bring **high-quality users** that move through the funnel to purchase. It provides insights for optimizing marketing budgets across campaigns.  

---

### Task 3. Conversion by Landing Page  

**Goal:** Compare different **landing pages** by their visit-to-purchase conversion rate using data for **2020**.  

**SQL techniques used:**  
- Extracting `page_path` from `page_location`  
- Joining `session_start` and `purchase` events by `user + session_id`  
- Aggregating results  

**Result:** Calculated unique sessions, purchases, and conversion rates for each landing page.  

👉 [View Query](script_bq3.sql)  

**Interpretation:**  
Shows which landing pages are most effective in driving purchases. Helps identify **high-performing entry points** and optimize underperforming ones.  

---

## 📊 Summary  

This BigQuery project demonstrates:  
- Strong skills in **data cleaning, transformation, and preparation**  
- Ability to **calculate conversion funnels** and session-based metrics in BigQuery  
- Knowledge of **GA4 event structure** and joining event types for analysis  
- Practical experience in applying BigQuery for **e-commerce analytics and marketing insights**  

---
