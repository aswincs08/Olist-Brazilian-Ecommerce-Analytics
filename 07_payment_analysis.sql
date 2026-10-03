SELECT
    payment_type,
    COUNT(*) AS payment_records,
    COUNT(DISTINCT order_id) AS unique_orders,
    ROUND(SUM(payment_value), 2) AS total_payment_value,
    ROUND(
        (
            SUM(payment_value) * 100.0 /
            SUM(SUM(payment_value)) OVER ()
        )::numeric,
        2
    ) AS payment_value_share_pct

FROM public.payments

GROUP BY payment_type

ORDER BY total_payment_value DESC;