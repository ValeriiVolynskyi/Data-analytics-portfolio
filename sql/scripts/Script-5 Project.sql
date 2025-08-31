WITH main_table_all_days AS (
    SELECT ad_date::date AS show_date, adset_name
    FROM facebook_ads_basic_daily t1
    JOIN facebook_adset t2 ON t1.adset_id = t2.adset_id
    WHERE impressions > 0

    UNION

    SELECT ad_date::date AS show_date, adset_name
    FROM google_ads_basic_daily
    WHERE impressions > 0
),

pr_date AS (
    SELECT *,
           LAG(show_date) OVER (PARTITION BY adset_name ORDER BY show_date) AS previous_date
    FROM main_table_all_days
),

date_flags AS (
    SELECT *,
           CASE 
               WHEN previous_date IS NULL THEN 1
               WHEN show_date - previous_date = 1 THEN 0
               ELSE 1
           END AS is_new_group
    FROM pr_date
),

grouped_dates AS (
    SELECT *,
           SUM(is_new_group) OVER (PARTITION BY adset_name ORDER BY show_date ROWS UNBOUNDED PRECEDING) AS group_id
    FROM date_flags
),

grouped_ranges AS (
    SELECT adset_name,
           MIN(show_date) AS start_date,
           MAX(show_date) AS end_date,
           COUNT(*) AS duration_days
    FROM grouped_dates
    GROUP BY adset_name, group_id
)


    SELECT *
    FROM grouped_ranges
    ORDER BY duration_days DESC
    LIMIT 1


