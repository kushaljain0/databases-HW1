-- Task 9: Employee Pay Rate Correlation Analysis
-- Let's analyze pay rates by age, gender, and marital status
WITH EmployeeStats AS (
    SELECT 
        e.EmployeeID,
        e.Gender,
        e.MaritalStatus,
        TIMESTAMPDIFF(YEAR, e.BirthDate, CURDATE()) AS Age,
        eph.Rate,
        eph.PayFrequency
    FROM employee e
    JOIN employeepayhistory eph ON e.EmployeeID = eph.EmployeeID
    WHERE eph.RateChangeDate = (
        SELECT MAX(RateChangeDate)
        FROM employeepayhistory
        WHERE EmployeeID = e.EmployeeID
    )
)
SELECT 
    Gender,
    MaritalStatus,
    ROUND(AVG(Age), 1) AS AvgAge,
    ROUND(AVG(Rate), 2) AS AvgPayRate,
    ROUND(MIN(Rate), 2) AS MinPayRate,
    ROUND(MAX(Rate), 2) AS MaxPayRate,
    COUNT(*) AS EmployeeCount
FROM EmployeeStats
GROUP BY Gender, MaritalStatus
ORDER BY Gender, MaritalStatus;

-- Additional analysis for age correlation
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Over 50'
    END AS AgeGroup,
    ROUND(AVG(Rate), 2) AS AvgPayRate,
    COUNT(*) AS EmployeeCount
FROM EmployeeStats
GROUP BY 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Over 50'
    END
ORDER BY AgeGroup;
