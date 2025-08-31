with main_data as (
	select date_trunc('week', ad_date)::DATE AS start_week,
	'Facebook Ads' as media_source,
	t3.campaign_name, 
	t2.adset_name,
	t1.value
from facebook_ads_basic_daily as t1
	left join facebook_adset as t2
	on t1.adset_id = t2.adset_id 
	left join facebook_campaign as t3
	on t3.campaign_id = t1.campaign_id
    WHERE value > 0
union all

select date_trunc('week', ad_date)::DATE AS start_week,
	'Google Ads' as media_source,
	campaign_name, 
	adset_name,
	value
from google_ads_basic_daily
WHERE value > 0
)
select start_week, campaign_name, sum(value) as total_value
FROM main_data
GROUP BY start_week,  campaign_name
ORDER BY 
    total_value desc
    limit 1;

------------------

