# Task 3: Capital City Population Analysis

## Task Description
For each country, determine the percentage of its population living in its capital city, and identify the 10 countries with the smallest percentages.

## Solution Approach
The solution uses a CTE (Common Table Expression) to:
1. Join the Country and City tables to get capital city information
2. Calculate the percentage of population living in capital cities
3. Identify the 10 countries with the smallest percentages

### Query Explanation
1. **Data Joining**:
   - Joins `Country` table with `City` table using the capital city ID
   - Uses table aliases for better readability

2. **Percentage Calculation**:
   - Calculates percentage as: (Capital Population * 100.0 / Country Population)
   - Uses 100.0 to ensure floating-point division
   - Rounds results to 2 decimal places

3. **Filtering and Sorting**:
   - Excludes countries with zero population to avoid division by zero
   - Orders results by capital population percentage in ascending order
   - Limits results to top 10 countries

## Results Interpretation
The query returns a table with four columns:
1. Country name
2. Total country population
3. Capital city population
4. Percentage of population living in capital city

The results show the 10 countries where the capital city contains the smallest percentage of the country's total population.

## Technical Notes
1. **Data Quality**:
   - Excludes countries with zero population
   - Uses floating-point division for accurate percentage calculation
   - Rounds percentages to 2 decimal places for readability

2. **Performance Considerations**:
   - Uses CTE for better code organization
   - Joins tables efficiently using primary/foreign key relationship
   - Limits results to 10 rows for better performance

## Notes
- The solution assumes that the Capital field in the Country table correctly references the ID in the City table
- Results are ordered from smallest to largest percentage
- All population figures are preserved as integers, only the percentage is rounded
