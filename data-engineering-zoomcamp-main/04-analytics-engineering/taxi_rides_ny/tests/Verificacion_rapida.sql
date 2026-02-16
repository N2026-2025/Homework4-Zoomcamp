SELECT 
    pickup_zone, 
    service_type, 
    SUM(revenue_monthly_total_amount) as total_revenue
FROM {{ ref('fct_monthly_zone_revenue') }}
GROUP BY 1, 2
ORDER BY total_revenue DESC
LIMIT 5;
