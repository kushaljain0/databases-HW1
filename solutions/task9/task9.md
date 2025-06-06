# Task 9: Employee Pay Rate Correlation Analysis

## Task Description
Investigate the correlation between employee pay rates and demographic factors including age, gender, and marital status.

## Solution Approach
The solution uses a CTE and multiple analyses to:
1. Calculate current pay rates and demographic information
2. Analyze pay rates by gender and marital status
3. Analyze pay rates by age groups
4. Provide comprehensive statistical measures

### Query Explanation
1. **Data Preparation**:
   - Uses a CTE (EmployeeStats) to gather employee data
   - Joins employee and pay history tables
   - Calculates current age using DATEDIFF
   - Gets the most recent pay rate for each employee

2. **Gender and Marital Status Analysis**:
   - Groups employees by gender and marital status
   - Calculates:
     - Average age
     - Average, minimum, and maximum pay rates
     - Employee count per group

3. **Age Group Analysis**:
   - Categorizes employees into age groups
   - Calculates average pay rate per age group
   - Counts employees in each age group

## Technical Implementation

### Key Features
1. **Data Aggregation**:
   - Uses CTE for efficient data preparation
   - Implements proper date calculations
   - Handles current pay rates correctly

2. **Statistical Analysis**:
   - Provides multiple statistical measures
   - Groups data by different demographic factors
   - Includes both detailed and aggregate views

3. **Age Grouping**:
   - Uses CASE statements for age categorization
   - Creates meaningful age ranges
   - Enables age-based pay rate analysis

## Results Interpretation
The query provides two sets of results:

1. **Gender and Marital Status Analysis**:
   - Shows pay rate patterns across different demographic groups
   - Includes average age for context
   - Provides range of pay rates (min/max)
   - Shows distribution of employees

2. **Age Group Analysis**:
   - Breaks down pay rates by age ranges
   - Shows average pay rate per age group
   - Indicates employee distribution across age groups

This allows for analysis of:
- Pay rate differences between genders
- Impact of marital status on pay rates
- Age-based pay rate patterns
- Overall employee distribution

## Notes
- The solution uses the most recent pay rate for each employee
- Age is calculated dynamically using current date
- Results are ordered for easy comparison
- The analysis provides both detailed and aggregate views
- The query is optimized for clarity and performance
- Results can be used to identify potential correlations between demographic factors and pay rates
