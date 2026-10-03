SELECT 'customers' AS table_name, COUNT(*) AS row_count
FROM public.customers

UNION ALL

SELECT 'orders', COUNT(*)
FROM public.orders

UNION ALL

SELECT 'order_items', COUNT(*)
FROM public.order_items

UNION ALL

SELECT 'products', COUNT(*)
FROM public.products

UNION ALL

SELECT 'sellers', COUNT(*)
FROM public.sellers

UNION ALL

SELECT 'payments', COUNT(*)
FROM public.payments

UNION ALL

SELECT 'reviews', COUNT(*)
FROM public.reviews

UNION ALL

SELECT 'category_translation', COUNT(*)
FROM public.category_translation

ORDER BY table_name;
