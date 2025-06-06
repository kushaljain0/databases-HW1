# Task 2: Population Density Analysis

## Task Description
1. Calculate the ratio of population per square mile for each country
2. Using CTE, determine the maximum, minimum, and median of these ratios
3. Present the results in a two-column format with "Metric" and "Value" columns

## Solution Approach
The solution is divided into three main parts:

### Part 1: Population Density Calculation
- Created a CTE (Common Table Expression) named `population_density`
- Converted surface area from square kilometers to square miles (1 km² = 0.386102 mi²)
- Calculated population per square mile for each country
- Excluded countries with zero or null surface area to avoid division by zero
- Results are ordered by population density in descending order

### Part 2: Statistical Analysis
- Used the same CTE to calculate:
  - Maximum population density
  - Minimum population density
  - Median population density
- The median calculation uses a subquery approach that:
  1. Orders all densities
  2. Uses LIMIT and OFFSET to find the middle value(s)
  3. Averages the middle values if there are two (for even number of countries)

### Part 3: Results Presentation
- Used UNION ALL to combine the three statistics into a single result set
- Created two columns: "Metric" and "Value"
- Ordered results as: Minimum, Median, Maximum
- Rounded all values to 2 decimal places for readability

## Technical Notes
1. **Unit Conversion**: 
   - Surface area is converted from square kilometers to square miles
   - Conversion factor: 1 km² = 0.386102 mi²

2. **Median Calculation**:
   - Handles both odd and even number of countries
   - For even number of countries, takes average of two middle values
   - For odd number of countries, takes the middle value

3. **Data Quality**:
   - Excludes countries with zero or null surface area
   - Rounds results to 2 decimal places for better readability

## Results Interpretation
The final query returns a table with three rows:
1. Minimum population density (people per square mile)
2. Median population density
3. Maximum population density

This provides a clear view of the population density distribution across all countries in the database.

## Notes
- The solution uses CTEs for better code organization and readability
- The median calculation is implemented in a way that works across different SQL dialects
- Results are ordered in a logical sequence (Min → Median → Max) for better readability
