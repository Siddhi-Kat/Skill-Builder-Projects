-- Which  channels bring visitors who actually purchase?
SELECT 
    ws.utm_source,
    CONCAT(ROUND(SUM(price_usd)/1000,2), 'k') as 'revenue generated',
    COUNT(DISTINCT ws.website_session_id) AS sessions,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(
        COUNT(DISTINCT o.order_id) * 100.0 /
        COUNT(DISTINCT ws.website_session_id),2
    ) AS conversion_rate
FROM website_sessions ws
LEFT JOIN orders o
ON ws.website_session_id = o.website_session_id
GROUP BY ws.utm_source
ORDER BY conversion_rate DESC;

-- How many sessions lead to purchase?
SELECT
    CASE
        WHEN o.order_id IS NULL THEN 'No Purchase'
        ELSE 'Purchased'
    END AS session_type,
    COUNT(*) AS total_sessions,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(DISTINCT website_session_id) FROM website_sessions),
        2
    ) AS session_percentage
FROM website_sessions ws
LEFT JOIN orders o
ON ws.website_session_id = o.website_session_id
GROUP BY session_type;

-- Which products are viewed frequently but purchased less?
SELECT 
	pageview_url,
    COUNT(*) AS 'total page views',
    COUNT(DISTINCT(o.order_id)) AS 'total orders',
    ROUND(
		COUNT(DISTINCT o.order_id)*100.0 /
		COUNT(*),2
) AS product_conversion_rate

FROM website_pageviews wp
LEFT JOIN orders o
ON wp.website_session_id = o.website_session_id
WHERE pageview_url IN ("/the-original-mr-fuzzy", "/the-forever-love-bear", "/the-birthday-sugar-panda", "/the-hudson-river-mini-bear")
GROUP BY pageview_url;

-- Which landing page has the highest conversion
SELECT 
	pageview_url,
    COUNT(wp.website_session_id) AS 'total sessions',
    COUNT(DISTINCT(o.order_id)) AS 'total orders',
    ROUND(
		COUNT(DISTINCT o.order_id)*100.0 /
		COUNT(wp.website_session_id),2
) AS product_conversion_rate

FROM website_pageviews wp
LEFT JOIN orders o
ON wp.website_session_id = o.website_session_id
WHERE pageview_url IN ("/home", "/lander-1", "/lander-2", "/lander-3","/lander-4","/lander-5")
GROUP BY pageview_url
ORDER BY product_conversion_rate desc;

-- Are customers returning or purchasing only once?
SELECT
	CASE
	WHEN order_count=1 THEN 'One Time Customer'
	ELSE 'Repeat Customer'
	END AS customer_type,
	COUNT(*) AS customers
FROM
(
SELECT
user_id,
COUNT(order_id) AS order_count
FROM orders
GROUP BY user_id
)t
GROUP BY customer_type; 