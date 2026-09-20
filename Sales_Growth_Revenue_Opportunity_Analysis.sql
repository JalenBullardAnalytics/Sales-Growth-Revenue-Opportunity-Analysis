{\rtf1\ansi\ansicpg1252\cocoartf2870
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs26 \cf0 -- Business Problem #1 --\
\
-- Query 1: Product Category Revenue & Profitability Performance --\
SELECT\
    TRIM(Product_Category) AS product_category,\
\
    ROUND(SUM(Revenue), 2) AS total_revenue,\
\
    ROUND(SUM(Profit), 2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit), SUM(Revenue)) * 100,\
        2\
    ) AS profit_margin_percentage\
\
FROM round-device-457618-t0.sales_growth_analysis.Sales_Transactions\
\
WHERE LOWER(TRIM(Order_Status)) = 'completed'\
\
GROUP BY\
    product_category\
\
ORDER BY\
    total_revenue DESC;\
\
\
-- Query 2: Regional Revenue & Profitability Performance --\
SELECT\
    TRIM(Region) AS region,\
\
    ROUND(SUM(Revenue), 2) AS total_revenue,\
\
    ROUND(SUM(Profit), 2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit), SUM(Revenue)) * 100,\
        2\
    ) AS profit_margin_percentage\
\
FROM round-device-457618-t0.sales_growth_analysis.Sales_Transactions\
\
WHERE LOWER(TRIM(Order_Status)) = 'completed'\
\
GROUP BY\
    region\
\
ORDER BY\
    total_revenue DESC;\
\
\
-- Query 3: Product Category Revenue & Profitability by Region --\
SELECT\
    TRIM(Region) AS region,\
\
    TRIM(Product_Category) AS product_category,\
\
    ROUND(SUM(Revenue), 2) AS total_revenue,\
\
    ROUND(SUM(Profit), 2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit), SUM(Revenue)) * 100,\
        2\
    ) AS profit_margin_percentage\
\
FROM round-device-457618-t0.sales_growth_analysis.Sales_Transactions\
WHERE LOWER(TRIM(Order_Status)) = 'completed'\
\
GROUP BY\
    region,\
    product_category\
\
ORDER BY\
    region DESC,\
    total_revenue DESC;\
\
\
-- Query 4: Customer Segment Revenue & Profitability Performance --\
SELECT\
    CASE\
        WHEN Customer_Segment IS NULL\
          OR TRIM(Customer_Segment) = ''\
        THEN 'Missing Segment'\
        ELSE TRIM(Customer_Segment)\
    END AS customer_segment,\
\
    ROUND(SUM(Revenue), 2) AS total_revenue,\
\
    ROUND(SUM(Profit), 2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit), SUM(Revenue)) * 100,\
        2\
    ) AS profit_margin_percentage\
\
FROM round-device-457618-t0.sales_growth_analysis.Sales_Transactions\
\
WHERE LOWER(TRIM(Order_Status)) = 'completed'\
\
GROUP BY\
    customer_segment\
\
ORDER BY\
    total_revenue DESC;\
\
\
-- Business Problem #2 --\
\
-- Query 1: Product Category Performance & Average Discount Analysis --\
SELECT\
    TRIM(Product_Category) AS product_category,\
\
    COUNT(DISTINCT Transaction_ID) AS completed_orders,\
\
    ROUND(AVG(Discount_Percentage), 2) AS average_discount_percentage,\
\
    ROUND(SUM(Revenue), 2) AS total_revenue,\
\
    ROUND(SUM(Profit), 2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit), SUM(Revenue)) * 100,\
        2\
    ) AS profit_margin_percentage\
\
FROM `round-device-457618-t0.sales_growth_analysis.Sales_Transactions`\
\
WHERE LOWER(TRIM(Order_Status)) = 'completed'\
\
GROUP BY\
    product_category\
\
ORDER BY\
    average_discount_percentage DESC, completed_orders DESC;\
\
\
\
-- Query 2: Product Category Performance by Discount Range --\
SELECT\
    TRIM(Product_Category) AS product_category,\
\
    CASE\
        WHEN Discount_Percentage < 0.10 THEN 'Low: Under 10%'\
        WHEN Discount_Percentage < 0.20 THEN 'Moderate: 10%-19.99%'\
        WHEN Discount_Percentage < 0.30 THEN 'High: 20%-29.99%'\
        ELSE 'Very High: 30%+'\
    END AS discount_range,\
\
    COUNT(DISTINCT Transaction_ID) AS completed_orders,\
\
    ROUND(AVG(Discount_Percentage) * 100, 2)\
        AS average_discount_percentage,\
\
    ROUND(SUM(Revenue), 2) AS total_revenue,\
\
    ROUND(SUM(Profit), 2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit), SUM(Revenue)) * 100,\
        2\
    ) AS profit_margin_percentage\
\
FROM `round-device-457618-t0.sales_growth_analysis.Sales_Transactions`\
\
WHERE LOWER(TRIM(Order_Status)) = 'completed'\
  AND Product_Category IS NOT NULL\
  AND TRIM(Product_Category) <> ''\
  AND Discount_Percentage IS NOT NULL\
  AND Revenue IS NOT NULL\
  AND Profit IS NOT NULL\
  AND Transaction_ID IS NOT NULL\
\
GROUP BY\
    product_category,\
    discount_range\
\
ORDER BY\
    product_category ASC,\
    average_discount_percentage ASC;\
\
\
\
-- Query 3: High-Discount Profitability Risk by Product Category --\
SELECT\
    TRIM(Product_Category) AS product_category,\
\
    COUNT(DISTINCT Transaction_ID) AS completed_orders,\
\
    ROUND(\
        AVG(Discount_Percentage) * 100,\
        2\
    ) AS average_discount_percentage,\
\
    ROUND(SUM(Revenue), 2) AS total_revenue,\
\
    ROUND(SUM(Profit), 2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit), SUM(Revenue)) * 100,\
        2\
    ) AS profit_margin_percentage\
\
FROM `round-device-457618-t0.sales_growth_analysis.Sales_Transactions`\
\
WHERE LOWER(TRIM(Order_Status)) = 'completed'\
  AND Product_Category IS NOT NULL\
  AND TRIM(Product_Category) <> ''\
  AND Discount_Percentage IS NOT NULL\
  AND Revenue IS NOT NULL\
  AND Profit IS NOT NULL\
  AND Transaction_ID IS NOT NULL\
  AND Discount_Percentage >= 0.30\
\
GROUP BY\
    product_category\
\
HAVING\
    SAFE_DIVIDE(SUM(Profit), SUM(Revenue)) * 100 < 40\
\
ORDER BY\
    profit_margin_percentage ASC;\
\
\
-- Business Problem #3 --\
-- Query 1: Quarterly Sales & Profitability Performance --\
\
SELECT\
\
    EXTRACT(YEAR FROM Transaction_Date) AS sales_year,\
\
    EXTRACT(QUARTER FROM Transaction_Date) AS sales_quarter,\
\
    COUNT(DISTINCT Transaction_ID) AS completed_orders,\
\
    ROUND(SUM(Revenue),2) AS total_revenue,\
\
    ROUND(SUM(Profit),2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit),SUM(Revenue))*100,\
        2\
    ) AS profit_margin_percentage\
\
FROM `round-device-457618-t0.sales_growth_analysis.Sales_Transactions`\
\
WHERE LOWER(TRIM(Order_Status))='completed'\
\
GROUP BY\
    sales_year,\
    sales_quarter\
\
ORDER BY\
    sales_year,\
    sales_quarter;\
\
\
\
-- Query 2: Quarterly Product Category Performance --\
\
SELECT\
\
    EXTRACT(YEAR FROM Transaction_Date) AS sales_year,\
\
    EXTRACT(QUARTER FROM Transaction_Date) AS sales_quarter,\
\
    TRIM(Product_Category) AS product_category,\
\
    COUNT(DISTINCT Transaction_ID) AS completed_orders,\
\
    ROUND(SUM(Revenue),2) AS total_revenue,\
\
    ROUND(SUM(Profit),2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit),SUM(Revenue))*100,\
        2\
    ) AS profit_margin_percentage\
\
FROM `round-device-457618-t0.sales_growth_analysis.Sales_Transactions`\
\
WHERE LOWER(TRIM(Order_Status))='completed'\
\
GROUP BY\
\
    sales_year,\
\
    sales_quarter,\
\
    product_category\
\
ORDER BY\
\
    sales_year,\
\
    sales_quarter,\
\
    total_revenue DESC;\
\
\
\
\
-- Query 3: Quarterly Regional Performance --\
\
SELECT\
\
    EXTRACT(YEAR FROM Transaction_Date) AS sales_year,\
\
    EXTRACT(QUARTER FROM Transaction_Date) AS sales_quarter,\
\
    TRIM(Region) AS region,\
\
    ROUND(SUM(Revenue),2) AS total_revenue,\
\
    ROUND(SUM(Profit),2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit),SUM(Revenue))*100,\
        2\
    ) AS profit_margin_percentage\
\
FROM `round-device-457618-t0.sales_growth_analysis.Sales_Transactions`\
\
WHERE LOWER(TRIM(Order_Status))='completed'\
\
GROUP BY\
\
    sales_year,\
\
    sales_quarter,\
\
    region\
\
ORDER BY\
\
    sales_year,\
\
    sales_quarter,\
\
    total_revenue DESC;\
\
\
\
-- Query 4: 2025 Regional Product Category Performance --\
\
SELECT\
    EXTRACT(YEAR FROM Transaction_Date) AS sales_year,\
    EXTRACT(QUARTER FROM Transaction_Date) AS sales_quarter,\
    TRIM(Region) AS region,\
    TRIM(Product_Category) AS product_category,\
\
    COUNT(DISTINCT Transaction_ID) AS completed_orders,\
\
    ROUND(SUM(Revenue), 2) AS total_revenue,\
\
    ROUND(SUM(Profit), 2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit), SUM(Revenue)) * 100,\
        2\
    ) AS profit_margin_percentage\
\
FROM `round-device-457618-t0.sales_growth_analysis.Sales_Transactions`\
\
WHERE LOWER(TRIM(Order_Status)) = 'completed'\
    AND EXTRACT(YEAR FROM Transaction_Date) = 2025\
    AND EXTRACT(QUARTER FROM Transaction_Date) IN (1, 2)\
    AND TRIM(Product_Category) IN ('Office Supplies', 'Hardware')\
\
GROUP BY\
    sales_year,\
    sales_quarter,\
    region,\
    product_category\
\
ORDER BY\
    product_category,\
    region,\
    sales_quarter;\
\
\
\
-- Query 5: Office Supplies Profitability Drivers by Region (2025 Q1 & Q2) --\
\
SELECT\
    EXTRACT(YEAR FROM Transaction_Date) AS sales_year,\
    EXTRACT(QUARTER FROM Transaction_Date) AS sales_quarter,\
    TRIM(Region) AS region,\
    TRIM(Product_Category) AS product_category,\
\
    COUNT(DISTINCT Transaction_ID) AS completed_orders,\
\
    ROUND(AVG(Discount_Percentage) * 100, 2)\
        AS average_discount_percentage,\
\
    ROUND(SUM(Revenue), 2) AS total_revenue,\
\
    ROUND(SUM(Cost), 2) AS total_cost,\
\
    ROUND(SUM(Profit), 2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit), SUM(Revenue)) * 100,\
        2\
    ) AS profit_margin_percentage,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Cost), SUM(Revenue)) * 100,\
        2\
    ) AS cost_to_revenue_percentage\
\
FROM `round-device-457618-t0.sales_growth_analysis.Sales_Transactions`\
\
WHERE LOWER(TRIM(Order_Status)) = 'completed'\
\
AND EXTRACT(YEAR FROM Transaction_Date) = 2025\
\
AND EXTRACT(QUARTER FROM Transaction_Date) IN (1, 2)\
\
AND LOWER(TRIM(Product_Category)) = 'office supplies'\
\
AND Region IS NOT NULL\
AND TRIM(Region) <> ''\
\
AND Revenue IS NOT NULL\
AND Profit IS NOT NULL\
AND Cost IS NOT NULL\
AND Discount_Percentage IS NOT NULL\
\
GROUP BY\
    sales_year,\
    sales_quarter,\
    region,\
    product_category\
\
ORDER BY\
    region,\
    sales_quarter;\
\
\
\
-- Query 6: South Office Supplies Product-Level Profitability Drivers (2025 Q1 & Q2) --\
\
SELECT\
    EXTRACT(YEAR FROM Transaction_Date) AS sales_year,\
    EXTRACT(QUARTER FROM Transaction_Date) AS sales_quarter,\
    Product_Name,\
    COUNT(DISTINCT Transaction_ID) AS completed_orders,\
    ROUND(AVG(Discount_Percentage), 2) AS average_discount_percentage,\
    ROUND(SUM(Revenue), 2) AS total_revenue,\
    ROUND(SUM(Cost), 2) AS total_cost,\
    ROUND(SUM(Profit), 2) AS total_profit,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Profit), SUM(Revenue)) * 100,\
        2\
    ) AS profit_margin_percentage,\
\
    ROUND(\
        SAFE_DIVIDE(SUM(Cost), SUM(Revenue)) * 100,\
        2\
    ) AS cost_to_revenue_percentage\
\
FROM\
    `round-device-457618-t0.sales_growth_analysis.Sales_Transactions`\
\
WHERE\
    Order_Status = 'Completed'\
    AND EXTRACT(YEAR FROM Transaction_Date) = 2025\
    AND EXTRACT(QUARTER FROM Transaction_Date) IN (1, 2)\
    AND Region = 'South'\
    AND Product_Category = 'Office Supplies'\
\
    -- Exclude null values used in the analysis\
    AND Transaction_ID IS NOT NULL\
    AND Transaction_Date IS NOT NULL\
    AND Product_Name IS NOT NULL\
    AND Discount_Percentage IS NOT NULL\
    AND Revenue IS NOT NULL\
    AND Cost IS NOT NULL\
    AND Profit IS NOT NULL\
\
GROUP BY\
    sales_year,\
    sales_quarter,\
    Product_Name\
\
ORDER BY\
    Product_Name,\
    sales_quarter;\
\
\
\
   -- Query 7: South Office Supplies Product Profit Change Ranking (2025 Q1 vs Q2) --\
\
WITH product_quarterly AS (\
\
    SELECT\
        Product_Name,\
\
        EXTRACT(QUARTER FROM Transaction_Date) AS sales_quarter,\
\
        COUNT(DISTINCT Transaction_ID) AS completed_orders,\
\
        ROUND(AVG(Discount_Percentage), 2) AS average_discount_percentage,\
\
        ROUND(SUM(Revenue), 2) AS total_revenue,\
\
        ROUND(SUM(Cost), 2) AS total_cost,\
\
        ROUND(SUM(Profit), 2) AS total_profit,\
\
        ROUND(\
            SAFE_DIVIDE(SUM(Profit), SUM(Revenue)) * 100,\
            2\
        ) AS profit_margin_percentage\
\
    FROM\
        `round-device-457618-t0.sales_growth_analysis.Sales_Transactions`\
\
    WHERE\
        LOWER(TRIM(Order_Status)) = 'completed'\
        AND EXTRACT(YEAR FROM Transaction_Date) = 2025\
        AND EXTRACT(QUARTER FROM Transaction_Date) IN (1, 2)\
        AND TRIM(Region) = 'South'\
        AND TRIM(Product_Category) = 'Office Supplies'\
\
        -- Remove null values used in the analysis\
        AND Transaction_ID IS NOT NULL\
        AND Transaction_Date IS NOT NULL\
        AND Product_Name IS NOT NULL\
        AND Discount_Percentage IS NOT NULL\
        AND Revenue IS NOT NULL\
        AND Cost IS NOT NULL\
        AND Profit IS NOT NULL\
\
    GROUP BY\
        Product_Name,\
        sales_quarter\
),\
\
product_comparison AS (\
\
    SELECT\
        Product_Name,\
\
        MAX(IF(sales_quarter = 1, completed_orders, NULL)) AS q1_completed_orders,\
        MAX(IF(sales_quarter = 2, completed_orders, NULL)) AS q2_completed_orders,\
\
        MAX(IF(sales_quarter = 1, average_discount_percentage, NULL)) AS q1_average_discount,\
        MAX(IF(sales_quarter = 2, average_discount_percentage, NULL)) AS q2_average_discount,\
\
        MAX(IF(sales_quarter = 1, total_revenue, NULL)) AS q1_revenue,\
        MAX(IF(sales_quarter = 2, total_revenue, NULL)) AS q2_revenue,\
\
        MAX(IF(sales_quarter = 1, total_cost, NULL)) AS q1_cost,\
        MAX(IF(sales_quarter = 2, total_cost, NULL)) AS q2_cost,\
\
        MAX(IF(sales_quarter = 1, total_profit, NULL)) AS q1_profit,\
        MAX(IF(sales_quarter = 2, total_profit, NULL)) AS q2_profit,\
\
        MAX(IF(sales_quarter = 1, profit_margin_percentage, NULL)) AS q1_profit_margin,\
        MAX(IF(sales_quarter = 2, profit_margin_percentage, NULL)) AS q2_profit_margin\
\
    FROM\
        product_quarterly\
\
    GROUP BY\
        Product_Name\
)\
\
SELECT\
    Product_Name,\
\
    q1_completed_orders,\
    q2_completed_orders,\
\
    q1_average_discount,\
    q2_average_discount,\
\
    q1_revenue,\
    q2_revenue,\
\
    q1_cost,\
    q2_cost,\
\
    q1_profit,\
    q2_profit,\
\
    ROUND(q2_profit - q1_profit, 2) AS profit_change,\
\
    q1_profit_margin,\
    q2_profit_margin,\
\
    ROUND(q2_profit_margin - q1_profit_margin, 2) AS profit_margin_change\
\
FROM\
    product_comparison\
\
-- Only compare products that existed in BOTH quarters\
WHERE\
    q1_profit IS NOT NULL\
    AND q2_profit IS NOT NULL\
\
ORDER BY\
    profit_change ASC;}