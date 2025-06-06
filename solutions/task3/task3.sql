-- Task 3: Capital City Population Analysis
WITH capital_population AS (
    SELECT 
        c.Name as Country,
        c.Population as Country_Population,
        ci.Population as Capital_Population,
        -- Calculate percentage of population living in capital
        (ci.Population * 100.0 / c.Population) as Capital_Population_Percentage
    FROM country c
    JOIN city ci ON c.Capital = ci.ID
    WHERE c.Population > 0  -- Exclude countries with zero population
)
-- Get the 10 countries with smallest capital population percentage
SELECT 
    Country,
    Country_Population,
    Capital_Population,
    ROUND(Capital_Population_Percentage, 2) as Capital_Population_Percentage
FROM capital_population
ORDER BY Capital_Population_Percentage ASC
LIMIT 10;
