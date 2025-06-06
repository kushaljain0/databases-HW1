-- Task 4: Life Expectancy Analysis by Language
-- Part 1: Simple average life expectancy per language
WITH language_life_expectancy AS (
    SELECT 
        cl.Language,
        AVG(c.LifeExpectancy) as Simple_Avg_LifeExpectancy,
        COUNT(DISTINCT c.Code) as Number_of_Countries,
        -- Calculate weighted average based on population, prevent division by zero
        SUM(c.LifeExpectancy * c.Population) / NULLIF(SUM(c.Population), 0) as Weighted_Avg_LifeExpectancy,
        -- Calculate weighted average based on both population and language percentage, prevent division by zero
        SUM(c.LifeExpectancy * c.Population * cl.Percentage) / NULLIF(SUM(c.Population * cl.Percentage), 0) as Fully_Weighted_Avg_LifeExpectancy
    FROM countrylanguage cl
    JOIN country c ON cl.CountryCode = c.Code
    WHERE c.LifeExpectancy IS NOT NULL  -- Exclude countries with null life expectancy
    GROUP BY cl.Language
    HAVING COUNT(DISTINCT c.Code) > 1  -- Only include languages spoken in multiple countries
)
SELECT 
    Language,
    Number_of_Countries,
    ROUND(Simple_Avg_LifeExpectancy, 2) as Simple_Avg_LifeExpectancy,
    ROUND(Weighted_Avg_LifeExpectancy, 2) as Population_Weighted_Avg,
    ROUND(Fully_Weighted_Avg_LifeExpectancy, 2) as Fully_Weighted_Avg
FROM language_life_expectancy
ORDER BY Fully_Weighted_Avg_LifeExpectancy DESC;

-- Part 2: Detailed analysis for a few major languages
WITH language_stats AS (
    SELECT 
        cl.Language,
        c.Name as Country,
        c.LifeExpectancy,
        c.Population,
        cl.Percentage,
        -- Calculate effective population speaking this language
        c.Population * cl.Percentage / 100 as Effective_Speakers
    FROM countrylanguage cl
    JOIN country c ON cl.CountryCode = c.Code
    WHERE c.LifeExpectancy IS NOT NULL
    AND cl.Language IN ('English', 'Spanish', 'Chinese', 'Hindi', 'Arabic')  -- Major languages
)
SELECT 
    Language,
    COUNT(DISTINCT Country) as Number_of_Countries,
    ROUND(AVG(LifeExpectancy), 2) as Simple_Avg_LifeExpectancy,
    ROUND(SUM(LifeExpectancy * Effective_Speakers) / NULLIF(SUM(Effective_Speakers), 0), 2) as Weighted_Avg_LifeExpectancy,
    ROUND(MIN(LifeExpectancy), 2) as Min_LifeExpectancy,
    ROUND(MAX(LifeExpectancy), 2) as Max_LifeExpectancy,
    ROUND(SUM(Effective_Speakers), 0) as Total_Speakers
FROM language_stats
GROUP BY Language
ORDER BY Total_Speakers DESC;
