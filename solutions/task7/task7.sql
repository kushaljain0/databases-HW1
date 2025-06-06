-- Task 7: Employee Subordination Chains
-- This recursive CTE builds employee subordination chains

WITH RECURSIVE EmployeeHierarchy (EmployeeID, ManagerID, Chain, Level) AS (
    -- Base case: top-level employees (no manager)
    SELECT 
        EmployeeID,
        ManagerID,
        CAST(EmployeeID AS CHAR(1000)) AS Chain,
        1 AS Level
    FROM employee
    WHERE ManagerID IS NULL
    UNION ALL
    -- Recursive step: attach employees to their managers
    SELECT 
        e.EmployeeID,
        e.ManagerID,
        CONCAT(eh.Chain, ' -> ', e.EmployeeID),
        eh.Level + 1
    FROM employee e
    JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT eh1.Chain
FROM EmployeeHierarchy eh1
LEFT JOIN EmployeeHierarchy eh2 
    ON eh2.Chain LIKE CONCAT(eh1.Chain, ' -> %')
WHERE eh2.Chain IS NULL
ORDER BY eh1.Level DESC, eh1.Chain;
