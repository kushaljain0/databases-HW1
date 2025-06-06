-- Task 2: Population per square mile analysis
-- Part 1: Calculate population per square mile for each country
WITH population_density AS (
    SELECT 
        Name as Country,
        Population,
        SurfaceArea,
        -- Convert surface area from square kilometers to square miles (1 km² = 0.386102 mi²)
        SurfaceArea * 0.386102 as SurfaceArea_sq_miles,
        -- Calculate population per square mile
        Population / (SurfaceArea * 0.386102) as Population_per_sq_mile
    FROM country
    WHERE SurfaceArea > 0  -- Exclude countries with zero or null surface area
)
-- Part 2: Calculate statistics using CTE
SELECT 
    Country,
    Population,
    SurfaceArea_sq_miles,
    ROUND(Population_per_sq_mile, 2) as Population_per_sq_mile
FROM population_density
ORDER BY Population_per_sq_mile DESC;

-- Part 3: Calculate and display statistics in a single result set
WITH population_density AS (
    SELECT 
        Name as Country,
        Population,
        SurfaceArea,
        SurfaceArea * 0.386102 as SurfaceArea_sq_miles,
        Population / (SurfaceArea * 0.386102) as Population_per_sq_mile
    FROM country
    WHERE SurfaceArea > 0
),
density_stats AS (
    SELECT 
        MAX(Population_per_sq_mile) as max_density,
        MIN(Population_per_sq_mile) as min_density,
        (
            SELECT AVG(Population_per_sq_mile)
            FROM (
                SELECT Population_per_sq_mile
                FROM population_density pd1
                WHERE (
                    SELECT COUNT(*)
                    FROM population_density pd2
                    WHERE pd2.Population_per_sq_mile <= pd1.Population_per_sq_mile
                ) >= (
                    SELECT COUNT(*)
                    FROM population_density
                ) / 2
                AND (
                    SELECT COUNT(*)
                    FROM population_density pd2
                    WHERE pd2.Population_per_sq_mile >= pd1.Population_per_sq_mile
                ) >= (
                    SELECT COUNT(*)
                    FROM population_density
                ) / 2
            ) as median_subquery
        ) as median_density
    FROM population_density
)
-- Challenge: Display results in two columns
SELECT 'Maximum' as Metric, ROUND(max_density, 2) as Value FROM density_stats
UNION ALL
SELECT 'Minimum', ROUND(min_density, 2) FROM density_stats
UNION ALL
SELECT 'Median', ROUND(median_density, 2) FROM density_stats
ORDER BY 
    CASE Metric 
        WHEN 'Minimum' THEN 1 
        WHEN 'Median' THEN 2 
        WHEN 'Maximum' THEN 3 
    END;
