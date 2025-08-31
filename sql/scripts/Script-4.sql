WITH main_data AS (
    SELECT 
        date_trunc('month', ad_date)::date AS ad_month,
        t3.campaign_name,
        reach
    FROM facebook_ads_basic_daily t1
    LEFT JOIN facebook_campaign t3 ON t1.campaign_id = t3.campaign_id
    WHERE reach > 0

    UNION ALL

    SELECT 
        date_trunc('month', ad_date)::date AS ad_month,
        campaign_name,
        reach
    FROM google_ads_basic_daily
    WHERE reach > 0
),

monthly_reach AS (
    SELECT 
        ad_month,
        campaign_name,
        SUM(reach) AS total_reach
    FROM main_data
    GROUP BY ad_month, campaign_name
),

reach_previous_month AS (
    SELECT ad_month,
        campaign_name,
        total_reach,
        LAG(total_reach) OVER (PARTITION BY campaign_name ORDER BY ad_month) AS prev_month_reach
    FROM monthly_reach
),

reach_differens AS (
    SELECT *,
        (total_reach - prev_month_reach) AS reach_diff
    FROM reach_previous_month 
    WHERE prev_month_reach IS NOT NULL
)

SELECT ad_month, campaign_name, reach_diff
FROM reach_differens
ORDER BY reach_diff DESC
LIMIT 1;
