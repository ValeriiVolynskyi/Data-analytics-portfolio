WITH main_data AS (
  SELECT
    DATE(TIMESTAMP_MICROS(event_timestamp)) AS event_date,
    CONCAT (user_pseudo_id,
    (SELECT value.int_value
     FROM UNNEST(event_params)
     WHERE key = 'ga_session_id')) AS user_session_id,
    event_name,
    traffic_source.source,
    traffic_source.medium,
    traffic_source.name AS campaign
    
  FROM
    `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
    _TABLE_SUFFIX BETWEEN '20210101' AND '20211231'
    AND event_name IN (
      'session_start',
      'add_to_cart',
      'begin_checkout',
      'purchase')

),

count_data as (
  SELECT event_date, campaign, source, medium,
    COUNT(DISTINCT CASE WHEN event_name = 'session_start' THEN user_session_id END) as session_start_count,
    COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_session_id END) as visit_to_cart_count,
    COUNT(DISTINCT CASE WHEN event_name = 'begin_checkout' THEN user_session_id END) as begin_checkout_count,
    COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN user_session_id END) as purchase_count
  FROM main_data
  GROUP BY event_date, campaign, source, medium
)
SELECT event_date, campaign, source, medium,session_start_count,
  ROUND((visit_to_cart_count/session_start_count)*100,3) as visit_to_cart_rate,
  ROUND((begin_checkout_count/session_start_count)*100,3) as visit_to_checkout_rate,
  ROUND((purchase_count/session_start_count)*100,3) as visit_to_purchase_rate
FROM count_data
WHERE session_start_count IS NOT NULL AND session_start_count > 0
