WITH 
  sessions AS (
    SELECT 
      CONCAT(user_pseudo_id, CAST((SELECT value.int_value FROM UNNEST(event_params) WHERE key='ga_session_id') AS STRING)) AS user_session_id,
      REPLACE((SELECT value.string_value FROM UNNEST(event_params) WHERE key='page_location'), 
              'https://shop.googlemerchandisestore.com/', '') AS page_path
    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
    WHERE event_name = 'session_start'
      AND _TABLE_SUFFIX BETWEEN '20200101' AND '20201231'
          GROUP BY user_session_id, page_path
  ),
  purchases AS (
    SELECT 
      CONCAT(user_pseudo_id, CAST((SELECT value.int_value FROM UNNEST(event_params) WHERE key='ga_session_id') AS STRING)) AS user_session_id
    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
    WHERE event_name = 'purchase'
      AND _TABLE_SUFFIX BETWEEN '20200101' AND '20201231'
          GROUP BY user_session_id
  )
SELECT
  s.page_path,
  COUNT(DISTINCT s.user_session_id) AS session_count,
  COUNT(DISTINCT p.user_session_id) AS purchase_count,
  ROUND(COUNT(p.user_session_id) * 100.0 / COUNT(s.user_session_id), 2) AS conversion_rate_percent
FROM sessions AS s
LEFT JOIN purchases AS p
  ON s.user_session_id = p.user_session_id
GROUP BY s.page_path
ORDER BY session_count DESC;
