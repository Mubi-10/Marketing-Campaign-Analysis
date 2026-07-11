/* CUSTOMER DEMOGRAPHICS*/

-- 1.AGE_ANALYSIS

-- Average Age of Customers
SELECT ROUND(AVG(Age),2) AS Avg_Age FROM customers;

-- Age Group
SELECT 
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 50 THEN 'Middle'
        ELSE 'Senior'
    END AS Age_Group, COUNT(*) AS Customers
FROM customers
GROUP BY Age_Group;


-- 2.EDUCATION_ANALYSIS

-- Which education group spends the most?
SELECT Education, ROUND(AVG(Total_Spend),2) AS Avg_Spend
FROM customers
GROUP BY Education
ORDER BY Avg_Spend DESC;

-- Which education group responds the most?
SELECT Education, ROUND(AVG(Response)*100,2) AS Response_Rate
FROM customers
GROUP BY Education
ORDER BY Response_Rate DESC;


-- 3.MARITAL_STATUS_ANALYSIS

-- Which marital status spends the most?
SELECT Marital_Status, ROUND(AVG(Total_Spend),2) AS Avg_Spend
FROM customers
GROUP BY Marital_Status
ORDER BY Avg_Spend DESC;

-- Which marital status responds best?
SELECT Marital_Status, ROUND(AVG(Response)*100,2) AS Response_Rate
FROM customers
GROUP BY Marital_Status
ORDER BY Response_Rate DESC;


-- 4.COUNTRY_ANALYSIS

-- Which country generates the highest revenue?
SELECT Country, ROUND(SUM(Total_Spend),2) AS Total_Revenue
FROM customers
GROUP BY Country
ORDER BY Total_Revenue DESC;

-- Which country has the highest response rate?
SELECT Country, ROUND(AVG(Response)*100,2) AS Response_Rate
FROM customers
GROUP BY Country
ORDER BY Response_Rate DESC;


-- 5.SPENDING_ANALYSIS

-- Average spending by country
SELECT Country, ROUND(AVG(Total_Spend),2) AS Avg_Spend
FROM customers
GROUP BY Country
ORDER BY Avg_Spend DESC;

-- Average spending by education
SELECT Education, ROUND(AVG(Total_Spend),2) AS Avg_Spend
FROM customers
GROUP BY Education
ORDER BY Avg_Spend DESC;

-- Average spending by marital status
SELECT Marital_Status, ROUND(AVG(Total_Spend),2) AS Avg_Spend
FROM customers
GROUP BY Marital_Status
ORDER BY Avg_Spend DESC;

-- Average spending by age group
SELECT 
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 50 THEN 'Middle'
        ELSE 'Senior'
    END AS Age_Group,
    ROUND(AVG(Total_Spend),2) AS Avg_Spend
FROM customers
GROUP BY Age_Group
ORDER BY Avg_Spend DESC;

-- Highest spending product category
SELECT 'Wines' AS Product, SUM(MntWines) AS Total_Spending
FROM customers
UNION ALL

SELECT 'Fruits' AS Product, SUM(MntFruits) AS Total_Spending
FROM customers
UNION ALL

SELECT 'Meat Products' AS Product, SUM(MntMeatProducts) AS Total_Spending
FROM customers
UNION ALL

SELECT 'Fish Products' AS Product, SUM(MntFishProducts) AS Total_Spending
FROM customers
UNION ALL

SELECT 'Sweet Products' AS Product, SUM(MntSweetProducts) AS Total_Spending
FROM customers
UNION ALL

SELECT 'Gold Products' AS Product, SUM(MntGoldProds) AS Total_Spending
FROM customers

ORDER BY Total_Spending DESC;


-- 6.CAMPAIGN_ANALYSIS

-- Overall response rate
SELECT ROUND(AVG(Response)*100,2) AS Overall_Response_Rate
FROM customers;

-- Which campaign perfomed the best?
SELECT 'Campaign 1' AS Campaign, ROUND(AVG(AcceptedCmp1)*100,2) AS Avg_Campaign_Response
FROM customers
UNION ALL

SELECT 'Campaign 2' AS Campaign, ROUND(AVG(AcceptedCmp2)*100,2) AS Avg_Campaign_Response
FROM customers
UNION ALL

SELECT 'Campaign 3' AS Campaign, ROUND(AVG(AcceptedCmp3)*100,2) AS Avg_Campaign_Response
FROM customers
UNION ALL

SELECT 'Campaign 4' AS Campaign, ROUND(AVG(AcceptedCmp4)*100,2) AS Avg_Campaign_Response
FROM customers
UNION ALL

SELECT 'Campaign 5' AS Campaign, ROUND(AVG(AcceptedCmp5)*100,2) AS Avg_Campaign_Response
FROM customers

ORDER BY Avg_Campaign_Response DESC;

-- Which education group responds the most?
SELECT Education, COUNT(*) AS Total_Customers, 
       SUM(Response) AS Responders, ROUND(AVG(Response)*100,2) AS Response_Rate
FROM customers
GROUP BY Education
ORDER BY Response_Rate DESC;

-- Which country responds the most?
SELECT Country, COUNT(*) AS Total_Customers,
       SUM(Response) AS Responders, ROUND(AVG(Response)*100,2) AS Response_Rate
FROM customers
GROUP BY Country
ORDER BY Response_Rate DESC;

-- Which marital status responds the most?
SELECT Marital_Status, COUNT(*) AS Total_Customers,
       SUM(Response) AS Responders, ROUND(AVG(Response)*100,2) AS Response_Rate
FROM customers
GROUP BY Marital_Status
ORDER BY Response_Rate DESC;

-- Which income band responds the most?
SELECT
    CASE
        WHEN Income < 30000 THEN 'Low Income'
        WHEN Income BETWEEN 30000 AND 60000 THEN 'Medium Income'
        WHEN Income BETWEEN 60000 AND 75000 THEN 'Upper Middle'
        ELSE 'High Income'
    END AS Income_Band,
    COUNT(*) AS Customers,
    ROUND(AVG(Response)*100,2) AS Response_Rate
FROM customers
GROUP BY Income_Band
ORDER BY Response_Rate DESC;

-- Which Age group responds the most?
SELECT
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 50 THEN 'Middle'
        ELSE 'Senior'
    END AS Age_Group,
    COUNT(*) AS Customers,
    ROUND(AVG(Response)*100,2) AS Response_Rate
FROM customers
GROUP BY Age_Group
ORDER BY Response_Rate DESC;


-- 7.RESPONDERS_VS_NON_RESPONDERS

-- What are the characteristics of the customers who accepted the campaign?
SELECT Response,
       ROUND(AVG(Age),1) AS Avg_Age,
       ROUND(AVG(Income),2) AS Avg_Income,
       ROUND(AVG(Total_Spend),2) AS Avg_Spend,
       ROUND(AVG(Children),2) AS Avg_Children,
       ROUND(AVG(Recency),2) AS Avg_Recency
FROM customers
GROUP BY Response;

-- What products do campaign responders spend on?
SELECT Response,
       ROUND(AVG(MntWines),2) AS Wine,
       ROUND(AVG(MntFruits),2) AS Fruits,
       ROUND(AVG(MntMeatProducts),2) AS Meat,
       ROUND(AVG(MntFishProducts),2) AS Fish,
       ROUND(AVG(MntSweetProducts),2) AS Sweets,
       ROUND(AVG(MntGoldProds),2) AS Gold
FROM customers
GROUP BY Response;

-- # Which purchase channels are preferred by campaign responders?
SELECT Response,
       ROUND(AVG(NumDealsPurchases),2) AS Deals,
       ROUND(AVG(NumWebPurchases),2) AS Web,
       ROUND(AVG(NumCatalogPurchases),2) AS Catalog,
       ROUND(AVG(NumStorePurchases),2) AS Store,
       ROUND(AVG(NumWebVisitsMonth),2) AS Web_Visits
FROM customers
GROUP BY Response;

-- Top 10 highest spending responders
SELECT ID, Country, Education, Income, Total_Spend
FROM customers
WHERE Response = 1
ORDER BY Total_Spend DESC
LIMIT 10;

-- Campaign Accepted Summary
SELECT (AcceptedCmp1+AcceptedCmp2+AcceptedCmp3+AcceptedCmp4+AcceptedCmp5) AS Campaigns_Accepted,
       COUNT(*) AS Customers
FROM customers
GROUP BY Campaigns_Accepted
ORDER BY Campaigns_Accepted;


-- 8.CHANNEL_ANALYSIS

-- Average number of purchases made through each channel
-- Which purchase channel is most commonly used?
SELECT ROUND(AVG(NumWebPurchases),2) AS Avg_Web_Purchases,
       ROUND(AVG(NumDealsPurchases),2) AS Avg_Deals_Purchases,
       ROUND(AVG(NumCatalogPurchases),2) AS Avg_Catalog_Purchases,
       ROUND(AVG(NumStorePurchases),2) AS Avg_Store_Purchases
FROM customers;

-- Overall usage of each channel
# Which channel contributes the highest number of purchases?
SELECT SUM(NumWebPurchases) AS Total_Web_Purchases,
       SUM(NumDealsPurchases) AS Total_Deals_Purchases,
       SUM(NumCatalogPurchases) AS Total_Catalog_Purchases,
       SUM(NumStorePurchases) AS Total_Store_Purchases
FROM customers;

-- Average monthly web visits
SELECT ROUND(AVG(NumWebVisitsMonth),2) AS Avg_Web_Visits
FROM customers;

-- Website visits by campaign response
-- Do campaign responders visit the website more frequently?
SELECT
    CASE
        WHEN Response = 1 THEN 'Responded'
        ELSE 'Not Responded'
    END AS Campaign_Response,
ROUND(AVG(NumWebVisitsMonth),2) AS Avg_Web_Visits
FROM customers
GROUP BY Campaign_Response;

-- Channel usage by high spenders
# Which channel is preferred by high spenders?
SELECT High_Spender AS Customer_Type, ROUND(AVG(NumWebVisitsMonth),2) AS Avg_Web,
       ROUND(AVG(NumDealsPurchases),2) AS Avg_Deals,
       ROUND(AVG(NumCatalogPurchases),2) AS Avg_Catalog,
       ROUND(AVG(NumStorePurchases),2) AS Avg_Store
FROM customers
GROUP BY Customer_Type;

-- Channel usage by income group
SELECT
    CASE
        WHEN Income < 30000 THEN 'Low Income'
        WHEN Income BETWEEN 30000 AND 60000 THEN 'Medium Income'
        WHEN Income BETWEEN 60000 AND 75000 THEN 'Upper Middle'
        ELSE 'High Income'
    END AS Income_Band,
    ROUND(AVG(NumDealsPurchases),2) AS Avg_Deals,
    ROUND(AVG(NumWebPurchases),2) AS Avg_Web,
    ROUND(AVG(NumCatalogPurchases),2) AS Avg_Catalog,
    ROUND(AVG(NumStorePurchases),2) AS Avg_Store
FROM customers
GROUP BY Income_Band;

-- Web visits by income group
SELECT
    CASE
        WHEN Income < 30000 THEN 'Low Income'
        WHEN Income BETWEEN 30000 AND 60000 THEN 'Medium Income'
        WHEN Income BETWEEN 60000 AND 75000 THEN 'Upper Middle'
        ELSE 'High Income'
    END AS Income_Band,
    ROUND(AVG(NumWebVisitsMonth),2) AS Avg_Web_Visits
FROM customers
GROUP BY Income_Band;

-- Channel usage by country
SELECT Country, ROUND(AVG(NumDealsPurchases),2) AS Avg_Deals,
       ROUND(AVG(NumWebPurchases),2) AS Avg_Web,
       ROUND(AVG(NumCatalogPurchases),2) AS Avg_Catalog,
       ROUND(AVG(NumStorePurchases),2) AS Avg_Store
FROM customers
GROUP BY Country;

-- Website visits vs spending
-- Does high website engagement lead to higher spending?
SELECT
    CASE
        WHEN High_Web_Engagement = 1 THEN 'High Web Engagement'
        ELSE 'Low Web Engagement'
    END AS Engagement,
ROUND(AVG(Total_Spend),2) AS Avg_Spending
FROM customers
GROUP BY Engagement;

-- Identifying under-served customers
-- Which customer should be targeted with personalized offers?
SELECT ID, Income, Total_Spend, NumWebVisitsMonth, Response
FROM customers
WHERE NumWebVisitsMonth > 5 AND Response = 0 AND 
      Total_Spend < (SELECT AVG(Total_Spend) FROM customers);

-- 9.SEGMENTATION

-- Income Segment
SELECT
    CASE
        WHEN Income < 30000 THEN 'Low Income'
        WHEN Income BETWEEN 30000 AND 60000 THEN 'Medium Income'
        WHEN Income BETWEEN 60000 AND 75000 THEN 'Upper Middle'
        ELSE 'High Income'
    END AS Income_Band,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Age),1) AS Avg_Age,
    ROUND(AVG(Total_Spend),2) AS Avg_Spend,
    ROUND(AVG(Response)*100,2) AS Response_Rate,
    ROUND(AVG(Total_Purchases),2) AS Avg_Purchases
FROM customers
GROUP BY Income_Band;

-- Age Segment
SELECT
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 50 THEN 'Middle Age'
        ELSE 'Senior'
    END AS Age_Group,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Income),2) AS Avg_Income,
    ROUND(AVG(Total_Spend),2) AS Avg_Spend,
    ROUND(AVG(Response)*100,2) AS Response_Rate,
    ROUND(AVG(Total_Purchases),2) AS Avg_Purchases
FROM customers
GROUP BY Age_Group;

-- Family Segment
SELECT
    CASE
        WHEN Children > 0 THEN 'Family Customer'
        ELSE 'No Children'
    END AS Family_Type,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Income),2) AS Avg_Income,
    ROUND(AVG(Total_Spend),2) AS Avg_Spend,
    ROUND(AVG(Response)*100,2) AS Response_Rate,
    ROUND(AVG(Total_Purchases),2) AS Avg_Purchases
FROM customers
GROUP BY Family_Type;

-- High Web Engagement
SELECT
    CASE
        WHEN High_Web_Engagement = 1 THEN 'High Web Engagement'
        ELSE 'Low Web Engagement'
    END AS Web_Engagement,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Age),1) AS Avg_Age,
    ROUND(AVG(Income),2) AS Avg_Income,
    ROUND(AVG(Total_Spend),2) AS Avg_Spend,
    ROUND(AVG(Response)*100,2) AS Response_Rate,
    ROUND(AVG(Total_Purchases),2) AS Avg_Purchases
FROM customers
GROUP BY Web_Engagement;

-- High Spender
SELECT High_Spender,
       COUNT(*) AS Total_Customers,
       ROUND(AVG(Age),1) AS Avg_Age,
       ROUND(AVG(Income),2) AS Avg_Income,
       ROUND(AVG(Total_Spend),2) AS Avg_Spend,
       ROUND(AVG(Response)*100,2) AS Response_Rate,
       ROUND(AVG(Total_Purchases),2) AS Avg_Purchases
FROM customers
GROUP BY High_Spender;

-- Campaign Responders
SELECT
    CASE
        WHEN Response = 1 THEN 'Responders'
        ELSE 'Non Responders'
    END AS Campaign_Status,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Age),1) AS Avg_Age,
    ROUND(AVG(Income),2) AS Avg_Income,
    ROUND(AVG(Total_Spend),2) AS Avg_Spend,
    ROUND(AVG(Response)*100,2) AS Response_Rate,
    ROUND(AVG(Total_Purchases),2) AS Avg_Purchases
FROM customers
GROUP BY Campaign_Status;

-- Customer Value Segmentation
SELECT 
    CASE
        WHEN Income > 75000 AND 
             Total_Spend > 1500 THEN 'Premium Customer'
        WHEN Income > 75000 THEN 'Affluent Customer'
        WHEN Total_Spend > 1500 THEN 'High Spender'
        ELSE 'Regular Customer'
    END AS Customer_Segment,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Age),1) AS Avg_Age,
    ROUND(AVG(Response)*100,2) AS Response_Rate,
    ROUND(AVG(Total_Purchases),2) AS Avg_Purchases
FROM customers
GROUP BY Customer_Segment
ORDER BY Avg_Purchases DESC;

-- Under-Served Customers
SELECT COUNT(*) AS Under_Served_Customers,
       ROUND(AVG(Age),1) AS Avg_Age,
       ROUND(AVG(Income),2) AS Avg_Income,
       ROUND(AVG(Recency),2) AS Avg_Recency
FROM customers
WHERE NumWebVisitsMonth > 5 AND
      Total_Spend < (SELECT AVG(Total_Spend) FROM Customers) AND Response = 0;

-- Ideal Target Customer Profile
SELECT
    CASE
        WHEN Response = 1 THEN 'Responder'
        ELSE 'Non Responder'
    END AS Customer_Type,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Age),1) AS Avg_Age,
    ROUND(AVG(Income),2) AS Avg_Income,
    ROUND(AVG(Total_Spend),2) AS Avg_Spend,
    ROUND(AVG(Total_Purchases),2) AS Avg_Purchases
FROM customers
GROUP BY Customer_Type;