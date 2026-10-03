SELECT
    (SELECT COUNT(DISTINCT customer_unique_id)
     FROM public.customers) AS unique_customers,

    (SELECT COUNT(DISTINCT customer_unique_id)
     FROM public.customers c
     JOIN public.orders o
       ON c.customer_id = o.customer_id) AS customers_with_orders,

    (SELECT COUNT(*)
     FROM public.payments
     WHERE payment_type = 'credit_card') AS credit_card_payment_records,

    (
        SELECT ROUND(
            (
                SUM(payment_value) * 100.0 /
                (SELECT SUM(payment_value)
                 FROM public.payments)
            )::numeric,
            2
        )
        FROM public.payments
        WHERE payment_type = 'credit_card'
    ) AS credit_card_value_share_pct;