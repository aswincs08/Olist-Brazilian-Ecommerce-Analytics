WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
        SUM(oi.price + oi.freight_value) AS total_sales
    FROM public.orders o
    JOIN public.order_items oi
        ON o.order_id = oi.order_id
    GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
),

sales_with_previous AS (
    SELECT
        month,
        total_sales,
        LAG(total_sales) OVER (
            ORDER BY month
        ) AS previous_month_sales
    FROM monthly_sales
)

SELECT
    TO_CHAR(month, 'YYYY-MM') AS month,

    ROUND(total_sales, 2) AS total_sales,

    ROUND(previous_month_sales, 2) AS previous_month_sales,

    CASE
        WHEN previous_month_sales IS NULL
            THEN NULL
        WHEN previous_month_sales = 0
            THEN NULL
        ELSE ROUND(
            (
                (total_sales - previous_month_sales)
                * 100.0
                / previous_month_sales
            )::numeric,
            2
        )
    END AS mom_growth_pct

FROM sales_with_previous

ORDER BY month;
