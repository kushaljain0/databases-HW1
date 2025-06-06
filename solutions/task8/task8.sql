-- Task 8: Vendor Performance Analysis
-- Analyze the correlation between vendor lead times and transaction amounts
WITH VendorTransactions AS (
    SELECT 
        pv.VendorID,
        pv.AverageLeadTime,
        pv.StandardPrice,
        COALESCE(SUM(poh.TotalDue), 0) AS TotalTransactionAmount,
        COUNT(DISTINCT poh.PurchaseOrderID) AS OrderCount
    FROM productvendor pv
    LEFT JOIN purchaseorderheader poh ON pv.VendorID = poh.VendorID
    GROUP BY pv.VendorID, pv.AverageLeadTime, pv.StandardPrice
)
SELECT 
    AverageLeadTime,
    COUNT(*) AS VendorCount,
    ROUND(AVG(StandardPrice), 2) AS AvgStandardPrice,
    ROUND(AVG(TotalTransactionAmount), 2) AS AvgTransactionAmount,
    ROUND(MIN(TotalTransactionAmount), 2) AS MinTransactionAmount,
    ROUND(MAX(TotalTransactionAmount), 2) AS MaxTransactionAmount,
    ROUND(SUM(TotalTransactionAmount), 2) AS TotalAmount,
    SUM(OrderCount) AS TotalOrders
FROM VendorTransactions
GROUP BY AverageLeadTime
ORDER BY AverageLeadTime;
