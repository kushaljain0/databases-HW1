# Task 5: Department Employment Analysis

## Task Description
Determine how many people were employed in each department on May 01, 1999, using the employeedepartmenthistory table's StartDate and EndDate fields.

## Solution Approach
The solution uses a direct query to:
1. Join the department and employeedepartmenthistory tables
2. Filter for employees active on May 01, 1999
3. Count employees per department
4. Group and order results

### Query Explanation
1. **Date Handling**:
   - Uses BETWEEN to check if May 01, 1999 falls within an employee's department tenure
   - Handles NULL EndDate values using ISNULL (treats NULL as '9999-12-31')
   - Directly filters the date range in the WHERE clause

2. **Employee Counting**:
   - Uses INNER JOIN to connect departments with their employee history
   - Counts all employees in each department
   - Groups results by department name

3. **Results Presentation**:
   - Shows department name and employee count
   - Orders results by employee count in descending order

## Technical Implementation

### Key Features
1. **Date Range Check**:
   - Uses `BETWEEN` to check if May 01, 1999 falls within an employee's department tenure
   - Handles NULL EndDate values appropriately (current employees)

2. **Join Strategy**:
   - Uses INNER JOIN to get only departments with employees
   - Ensures accurate counting of employees per department

3. **Data Quality**:
   - Properly handles historical department assignments
   - Includes all relevant departments with their employee counts

## Results Interpretation
The query returns a table with two columns:
1. DepartmentName - The name of the department
2. EmployeeCount - Number of employees in that department on May 01, 1999

Results are ordered by:
- Employee count (highest to lowest)

## Notes
- The solution handles both current employees (NULL EndDate) and historical records
- The query uses ISNULL to handle NULL EndDate values, assuming they represent current employment
- Results show the most populated departments first
- The query is optimized for clarity and performance
