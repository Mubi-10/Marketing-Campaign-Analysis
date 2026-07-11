CREATE VIEW vw_kpi_summary AS
SELECT COUNT(*) AS Total_Customers, 
       SUM(Total_Spend) AS Total_Revenue, 
       ROUND(AVG(Income),2) AS Average_Income, 
       ROUND(AVG(Total_Spend),2) AS Average_Spending, 
       ROUND(AVG(Response)*100,2) AS Response_Rate
FROM customers;



CREATE VIEW vw_country_revenue AS
SELECT Country, SUM(Total_Spend) AS Total_Revenue, 
       ROUND(AVG(Response)*100,2) AS Response_Rate
FROM customers
GROUP BY Country;



CREATE VIEW vw_campaign_summary AS
SELECT 'Campaign 1' AS Campaign, ROUND(AVG(AcceptedCmp1)*100,2) AS Response_Rate
FROM customers
UNION ALL

SELECT 'Campaign 2', ROUND(AVG(AcceptedCmp2)*100,2)
FROM customers
UNION ALL

SELECT 'Campaign 3', ROUND(AVG(AcceptedCmp3)*100,2)
FROM customers
UNION ALL

SELECT 'Campaign 4', ROUND(AVG(AcceptedCmp4)*100,2)
FROM customers
UNION ALL

SELECT 'Campaign 5', ROUND(AVG(AcceptedCmp5)*100,2)
FROM customers
UNION ALL

SELECT 'Latest Campaign', ROUND(AVG(Response)*100,2)
FROM customers;



CREATE VIEW vw_product_summary AS
SELECT 'Wines' AS Products, ROUND(SUM(MntWines),2) AS Total_Revenue
FROM customers
UNION ALL

SELECT 'Fruits', ROUND(SUM(MntFruits),2)
FROM customers
UNION ALL

SELECT 'Meat Products', ROUND(SUM(MntMeatProducts),2)
FROM customers
UNION ALL

SELECT 'Fish', ROUND(SUM(MntFishProducts),2)
FROM customers
UNION ALL

SELECT 'Sweets', ROUND(SUM(MntSweetProducts),2)
FROM customers
UNION ALL

SELECT 'Gold Products', ROUND(SUM(MntGoldProds),2)
FROM customers;



CREATE VIEW vw_channel_summary AS
SELECT 'Deals' AS Channel, ROUND(AVG(NumDealsPurchases),2) AS Avg_Purchases
FROM customers
UNION ALL

SELECT 'Web', ROUND(AVG(NumWebPurchases),2)
FROM customers
UNION ALL

SELECT 'Catalog', ROUND(AVG(NumCatalogPurchases),2)
FROM customers
UNION ALL

SELECT 'Store', ROUND(AVG(NumStorePurchases),2)
FROM customers;



CREATE VIEW vw_channel_totals AS
SELECT 'Deals' AS Channel, SUM(NumDealsPurchases) AS Total_Purchases
FROM customers
UNION ALL

SELECT 'Web', SUM(NumWebPurchases)
FROM customers
UNION ALL

SELECT 'Catalog', SUM(NumCatalogPurchases)
FROM customers
UNION ALL

SELECT 'Store', SUM(NumStorePurchases)
FROM customers;



CREATE VIEW vw_segment_summary AS
SELECT 'High Income' AS Segment, 
    COUNT(*) AS Customers,
    ROUND(AVG(Total_Spend),2) AS Avg_Spend,
    ROUND(AVG(Response)*100,2) AS Response_Rate
FROM customers
WHERE Income_Segment = 'High Income'
UNION ALL

SELECT 'Young Customer',
    COUNT(*) AS Customers,
    ROUND(AVG(Total_Spend),2),
    ROUND(AVG(Response)*100,2)
FROM customers
WHERE Young_Customer = 1
UNION ALL

SELECT 'Campaign Responder',
    COUNT(*) AS Customers,
    ROUND(AVG(Total_Spend),2),
    ROUND(AVG(Response)*100,2)
FROM customers
WHERE Response = 1
UNION ALL

SELECT 'High Web Engagement',
    COUNT(*) AS Customers,
    ROUND(AVG(Total_Spend),2),
    ROUND(AVG(Response)*100,2)
FROM customers
WHERE High_Web_Engagement = 1
UNION ALL

SELECT 'Family Customer',
    COUNT(*) AS Customers,
    ROUND(AVG(Total_Spend),2),
    ROUND(AVG(Response)*100,2)
FROM customers
WHERE Children > 0
UNION ALL

SELECT 'High Spenders',
    COUNT(*) AS Customers,
    ROUND(AVG(Total_Spend),2),
    ROUND(AVG(Response)*100,2)
FROM customers
WHERE High_Spender = 'High Spender';