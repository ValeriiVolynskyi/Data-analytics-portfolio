WITH t1 AS (
  SELECT 
    'Google Ads' AS media_source, 
    ad_date,
    spend
  FROM google_ads_basic_daily
  
  UNION ALL
  
  SELECT 
    'Facebook Ads' AS media_source, 
    ad_date,
    spend
  FROM facebook_ads_basic_daily
)
SELECT 
    ad_date,
    media_source,
  ROUND(AVG(spend), 2) AS avg_spend,
  ROUND(MAX(spend), 2) AS max_spend,
  ROUND(MIN(spend), 2) AS min_spend
FROM t1
GROUP BY  ad_date, media_source
ORDER BY ad_date;






SELECT 
  'Google Ads' AS media_source, 
  ad_date,
  ROUND(AVG(spend), 2) AS avg_spend,
  ROUND(MAX(spend), 2) AS max_spend,
  ROUND(MIN(spend), 2) AS min_spend
FROM google_ads_basic_daily
GROUP BY ad_date, media_source

UNION ALL

SELECT 
  'Facebook Ads' AS media_source, 
  ad_date,
  ROUND(AVG(spend), 2) AS avg_spend,
  ROUND(MAX(spend), 2) AS max_spend,
  ROUND(MIN(spend), 2) AS min_spend
FROM facebook_ads_basic_daily
GROUP BY ad_date, media_source
ORDER BY ad_date;