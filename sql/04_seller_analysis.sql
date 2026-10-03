
WITH seller_sales AS (
    SELECT
        seller_id,
        SUM(price) AS product_sales
    FROM public.order_items
    GROUP BY seller_id
),
ranked_sellers AS (
    SELECT
        seller_id,
        product_sales,
        RANK() OVER (ORDER BY product_sales DESC) AS seller_rank
    FROM seller_sales
)
SELECT
    CASE
        WHEN seller_rank <= 5 THEN 'Top 5'
        WHEN seller_rank <= 10 THEN 'Top 10'
        WHEN seller_rank <= 20 THEN 'Top 20'
        WHEN seller_rank <= 50 THEN 'Top 50'
        WHEN seller_rank <= 100 THEN 'Top 100'
        ELSE 'Remaining Sellers'
    END AS seller_group,
    
    COUNT(*) AS sellers,
    
    ROUND(SUM(product_sales), 2) AS product_sales,
    
    ROUND(
        SUM(product_sales) * 100.0 /
        SUM(SUM(product_sales)) OVER (),
        2
    ) AS sales_share_pct

FROM ranked_sellers

GROUP BY
    CASE
        WHEN seller_rank <= 5 THEN 'Top 5'
        WHEN seller_rank <= 10 THEN 'Top 10'
        WHEN seller_rank <= 20 THEN 'Top 20'
        WHEN seller_rank <= 50 THEN 'Top 50'
        WHEN seller_rank <= 100 THEN 'Top 100'
        ELSE 'Remaining Sellers'
    END

ORDER BY
    MIN(seller_rank);
	WITH category_sales AS (
    SELECT
        COALESCE(ct.product_category_name_english,
                 p.product_category_name,
                 'Unknown') AS category,
        COUNT(DISTINCT oi.order_id) AS orders,
        COUNT(*) AS items_sold,
        SUM(oi.price) AS product_sales
    FROM public.order_items oi
    JOIN public.products p
        ON oi.product_id = p.product_id
    LEFT JOIN public.category_translation ct
        ON p.product_category_name = ct.product_category_name
    GROUP BY
        COALESCE(ct.product_category_name_english,
                 p.product_category_name,
                 'Unknown')
)

SELECT
    category,
    orders,
    items_sold,
    ROUND(product_sales, 2) AS product_sales,
    ROUND(
        product_sales * 100.0 /
        SUM(product_sales) OVER (),
        2
    ) AS sales_share_pct
FROM category_sales
ORDER BY product_sales DESC;
