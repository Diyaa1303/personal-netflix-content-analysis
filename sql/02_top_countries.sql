-- Question: Which countries have the most titles (counting the first-listed country)?
WITH cleaned AS (
  SELECT LTRIM(country, ', ') AS country_clean
  FROM netflix
  WHERE country IS NOT NULL
)
SELECT SUBSTR(country_clean, 1, INSTR(country_clean || ',', ',') - 1) AS primary_country,
       COUNT(*) AS titles
FROM cleaned
GROUP BY primary_country
ORDER BY titles DESC
LIMIT 10;
