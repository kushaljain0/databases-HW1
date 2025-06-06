# Task 6: Largest USD-CAD Exchange Rate Change

## Task Description
Find the date when the USD to CAD exchange rate had the largest daily change compared to the previous day.

## Solution Approach
The solution uses window functions and CTEs to:
1. Calculate daily rates for USD to CAD conversion
2. Compare each day's rate with the previous day
3. Find the date with the largest absolute change

### Query Explanation
1. **Daily Rates Calculation**:
   - Uses a CTE (DailyRates) to get the USD to CAD rates
   - Uses LAG window function to get the previous day's rate
   - Filters for USD to CAD conversion only

2. **Rate Change Calculation**:
   - Second CTE (RateChanges) calculates the absolute difference between consecutive days
   - Excludes the first day (where PreviousRate is NULL)
   - Computes the absolute change in rate

3. **Result Selection**:
   - Uses TOP 1 to get the single largest change
   - Orders by RateChange in descending order
   - Returns the date, current rate, previous rate, and the change amount

## Technical Implementation

### Key Features
1. **Window Functions**:
   - Uses LAG to access the previous day's rate
   - Enables efficient comparison of consecutive days

2. **CTEs for Clarity**:
   - DailyRates CTE handles the initial data preparation
   - RateChanges CTE focuses on change calculation
   - Makes the query more readable and maintainable

3. **Data Quality**:
   - Handles NULL values appropriately
   - Uses absolute difference to capture both increases and decreases
   - Focuses specifically on USD to CAD conversion

## Results Interpretation
The query returns a single row with:
1. CurrencyRateDate - The date of the largest change
2. CurrentRate - The exchange rate on that date
3. PreviousRate - The exchange rate from the previous day
4. RateChange - The absolute difference between the two rates

## Notes
- The solution uses absolute difference to capture the largest change regardless of direction
- The query is optimized to handle the specific USD to CAD conversion
- Results are ordered to show the most significant change first
- The use of CTEs makes the query more maintainable and easier to understand
