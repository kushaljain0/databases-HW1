# Task 1: Finding Missing Latin Letters in Country Codes

## Task Description
Determine which Latin letters do NOT appear in:
1. The first place of the three-letter country code
2. The second place of the three-letter country code
3. The third place of the three-letter country code

## Solution Approach
The solution uses a combination of:
1. A numbers table (generated using UNION ALL) to create all possible Latin letters (A-Z)
2. String functions (LEFT, SUBSTRING, RIGHT) to extract specific positions from country codes
3. NOT IN subqueries to find letters that don't appear in each position

### Query Explanation
For each part of the task, the query:
1. Generates all possible Latin letters (A-Z) using ASCII values
2. Compares these letters against the distinct letters found in the specified position of country codes
3. Returns only the letters that don't appear in that position

The solution uses three separate queries, one for each position:
- First position: Uses LEFT(Code, 1)
- Second position: Uses SUBSTRING(Code, 2, 1)
- Third position: Uses RIGHT(Code, 1)

## Results
To get the results, run each query separately. The queries will return:
1. Letters not appearing in the first position of country codes
2. Letters not appearing in the second position of country codes
3. Letters not appearing in the third position of country codes

Each result set will contain a single column 'letter' with the missing Latin letters for that position.

## Notes
- The solution assumes country codes are stored in uppercase
- The solution uses a numbers table to generate all possible Latin letters, which is more efficient than hardcoding the letters
- The results are ordered alphabetically for better readability
