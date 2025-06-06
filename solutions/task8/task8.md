# Task 8: Vendor Performance Analysis

## Task Description
Investigate the correlation between vendor lead times, standard prices, and transaction amounts to understand vendor performance patterns.

## Solution Approach
The solution uses a CTE and aggregation to:
1. Calculate transaction amounts and order counts per vendor
2. Group vendors by their average lead time
3. Analyze transaction patterns and pricing across different lead time categories

### Query Explanation
1. **Data Collection**:
   - Uses a CTE (VendorTransactions) to gather vendor and transaction data
   - Joins productvendor and purchase order header tables
   - Includes key metrics:
     - Average lead time
     - Standard price
     - Total transaction amount
     - Order count
   - Preserves vendors with no transactions using LEFT JOIN

2. **Analysis**:
   - Groups results by average lead time
   - Calculates multiple metrics:
     - Number of vendors in each lead time category
     - Average standard price
     - Average, minimum, and maximum transaction amounts
     - Total transaction amount
     - Total number of orders

3. **Results Presentation**:
   - Orders results by average lead time
   - Provides comprehensive view of vendor performance

## Technical Implementation

### Key Features
1. **Data Aggregation**:
   - Uses CTE for clear data preparation
   - Implements LEFT JOIN to include all vendors
   - Groups data by lead time categories

2. **Statistical Analysis**:
   - Calculates multiple performance metrics
   - Provides both pricing and transaction insights
   - Handles NULL values appropriately

3. **Data Quality**:
   - Includes all vendors regardless of transaction history
   - Maintains data integrity through proper joins
   - Provides complete picture of vendor relationships

## Results Interpretation
The query returns a table showing for each average lead time category:
1. VendorCount - Number of vendors in this category
2. AvgStandardPrice - Average standard price for products
3. AvgTransactionAmount - Average transaction amount
4. MinTransactionAmount - Smallest transaction amount
5. MaxTransactionAmount - Largest transaction amount
6. TotalAmount - Sum of all transactions
7. TotalOrders - Total number of orders placed

This allows for analysis of:
- Distribution of vendors across lead time categories
- Relationship between lead times and standard prices
- Transaction volume patterns
- Order frequency patterns
- Potential correlations between lead time and vendor performance

## Notes
- The solution includes vendors with no transactions
- Results are ordered by average lead time for easy comparison
- The analysis provides both pricing and transaction insights
- The query is optimized for clarity and performance
- Results can be used to identify potential correlations between lead time and vendor performance
- Additional metrics like standard price and order count provide more context for analysis
