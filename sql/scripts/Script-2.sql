WITH main_table AS (
    SELECT 
        ad_date, 
        spend,
        value
    FROM facebook_ads_basic_daily
    WHERE spend > 0 AND value > 0

    UNION ALL

    SELECT 
        ad_date, 
        spend,
        value
    FROM google_ads_basic_daily
    WHERE spend > 0 AND value > 0
),

table_totals AS (
    SELECT 
        ad_date, 
        SUM(spend) AS total_spend,
        SUM(value) AS total_value,
        ROUND(SUM(value)::numeric / SUM(spend) * 100, 2) AS romi_percent
    FROM main_table
    GROUP BY ad_date
)

SELECT 
    ad_date, 
    romi_percent
FROM table_totals
ORDER BY romi_percent DESC
LIMIT 5;


