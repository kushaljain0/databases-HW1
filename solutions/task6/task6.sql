-- Task 6: Largest USD-CAD Exchange Rate Change
-- This query finds the date with the largest daily change in USD-CAD exchange rate
WITH DailyRates AS (
    SELECT 
        CurrencyRateDate,
        AverageRate,
        LAG(AverageRate) OVER (ORDER BY CurrencyRateDate) AS PreviousRate
    FROM currencyrate
    WHERE FromCurrencyCode = 'USD' 
      AND ToCurrencyCode = 'CAD'
),
RateChanges AS (
    SELECT 
        CurrencyRateDate,
        AverageRate,
        PreviousRate,
        ABS(AverageRate - PreviousRate) AS RateChange
    FROM DailyRates
    WHERE PreviousRate IS NOT NULL
)
SELECT 
    CurrencyRateDate,
    AverageRate AS CurrentRate,
    PreviousRate,
    RateChange
FROM RateChanges
ORDER BY RateChange DESC
LIMIT 1;

