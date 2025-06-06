-- Task 5: Department Employment Count on May 01, 1999
-- This query counts employees in each department who were employed on May 01, 1999
-- by checking if the date falls between their StartDate and EndDate (or if EndDate is NULL)
SELECT 
    d.Name AS DepartmentName,
    COUNT(*) AS EmployeeCount
FROM employeedepartmenthistory edh
JOIN department d ON edh.DepartmentID = d.DepartmentID
WHERE '1999-05-01' BETWEEN edh.StartDate 
    AND IFNULL(edh.EndDate, '9999-12-31')
GROUP BY d.Name
ORDER BY EmployeeCount DESC;
