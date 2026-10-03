SELECT
    CASE
        WHEN o.order_delivered_customer_date
             <= o.order_estimated_delivery_date
        THEN 'On Time / Early'
        ELSE 'Delayed'
    END AS delivery_status,

    COUNT(*) AS reviews,

    ROUND(
        AVG(r.review_score)::numeric,
        2
    ) AS avg_review_score,

    ROUND(
        (
            SUM(
                CASE
                    WHEN r.review_score IN (4, 5)
                    THEN 1
                    ELSE 0
                END
            ) * 100.0 / COUNT(*)
        )::numeric,
        2
    ) AS positive_review_pct

FROM public.orders o

JOIN public.reviews r
    ON o.order_id = r.order_id

WHERE
    o.order_delivered_customer_date IS NOT NULL
    AND o.order_delivered_carrier_date IS NOT NULL
    AND o.order_delivered_carrier_date >= o.order_purchase_timestamp
    AND o.order_delivered_customer_date >= o.order_delivered_carrier_date

GROUP BY
    CASE
        WHEN o.order_delivered_customer_date
             <= o.order_estimated_delivery_date
        THEN 'On Time / Early'
        ELSE 'Delayed'
    END

ORDER BY avg_review_score DESC;
