-- SAMPLE QUERIES, DANILIN --

-- 1) What is the supplier dependency index for each supplier, and what is their revenue contribution? --
SELECT 
    supplier,
    ROUND(AVG(supplier_dependency),1) AS avg_dependency,
    SUM(monthly_revenue) AS total_monthly_revenue,
    ROUND(CAST(SUM(monthly_revenue) * 100.0 / SUM(SUM(monthly_revenue)) OVER () AS NUMERIC), 1) AS revenue_share_percentage
FROM 
    amazavr
GROUP BY 
    supplier
ORDER BY 
    avg_dependency DESC, total_monthly_revenue DESC;



-- 2) What is the average defect rate (units defective as a percentage of stock quantity) for each supplier across all categories? --
SELECT 
    supplier,
    category,
    AVG(units_defective::FLOAT / stock_quantity::FLOAT) * 100 AS avg_defect_rate
FROM 
    amazavr
GROUP BY 
    supplier, category
ORDER BY 
    avg_defect_rate DESC;



-- 3) Which suppliers offer the highest discount rates and how are they related to supplier dependency? --
SELECT 
    supplier, 
    ROUND(AVG("discount_%")::NUMERIC, 1) AS avg_discount, 
    ROUND(AVG(supplier_dependency)::NUMERIC, 1) AS avg_supplier_dep
FROM 
    amazavr
GROUP BY 
    supplier
ORDER BY 
    2 DESC;



-- 4) Which product categories have the highest market concentration (Herfindahl-Hirschman Index), based on the revenue contributions of suppliers? --
WITH RevenueShare AS (
    SELECT 
        category,
        supplier,
        SUM(monthly_revenue) AS supplier_revenue,
        SUM(SUM(monthly_revenue)) OVER (PARTITION BY category) AS category_total_revenue
    FROM 
        amazavr
    GROUP BY 
        category, supplier
),
HHI AS (
    SELECT 
        category,
        supplier,
        (supplier_revenue::FLOAT / category_total_revenue::FLOAT)^2 AS market_share_squared
    FROM 
        RevenueShare
)
SELECT 
    category,
    SUM(market_share_squared) AS hhi
FROM 
    HHI
GROUP BY 
    category
ORDER BY 
    hhi DESC;



-- 5) What are the average supplier dependency and the average monthly revenue in total and by category? How many suppliers are avaialable in total and in each product category? --

SELECT category, 
       ROUND(AVG(supplier_dependency)::NUMERIC, 1) AS avg_supplier_dependency,
       ROUND(AVG(monthly_revenue)::NUMERIC, 1) AS avg_monthly_revenue,
       count(distinct supplier)
FROM amazavr
GROUP BY category
ORDER BY AVG(supplier_dependency) DESC;

SELECT 
    category, 
    ROUND(AVG(supplier_dependency)::NUMERIC, 1) AS avg_supplier_dependency,
    ROUND(AVG(monthly_revenue)::NUMERIC, 1) AS avg_monthly_revenue,
    COUNT(DISTINCT supplier) AS total_suppliers
FROM amazavr
GROUP BY category

UNION ALL

SELECT 
    'Total' AS category,
    ROUND(AVG(supplier_dependency)::NUMERIC, 1) AS avg_supplier_dependency,
    ROUND(AVG(monthly_revenue)::NUMERIC, 1) AS avg_monthly_revenue,
    COUNT(DISTINCT supplier) AS total_suppliers
FROM amazavr
order by category;

