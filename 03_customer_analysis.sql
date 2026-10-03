WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        o.order_id,
        o.order_purchase_timestamp,

        ROW_NUMBER() OVER (
            PARTITION BY c.customer_unique_id
            ORDER BY o.order_purchase_timestamp
        ) AS order_number

    FROM public.customers c

    JOIN public.orders o
        ON c.customer_id = o.customer_id
),

order_values AS (
    SELECT
        order_id,
        SUM(price + freight_value) AS order_value
    FROM public.order_items
    GROUP BY order_id
)

SELECT
    co.order_number,
    COUNT(*) AS orders,

    ROUND(
        AVG(ov.order_value)::numeric,
        2
    ) AS avg_order_value,

    ROUND(
        SUM(ov.order_value)::numeric,
        2
    ) AS total_sales

FROM customer_orders co

JOIN order_values ov
    ON co.order_id = ov.order_id

GROUP BY co.order_number

ORDER BY co.order_number;