-- Question: On average, how many years pass between a title's release and its arrival on Netflix?
SELECT type,
       COUNT(*) AS titles,
       ROUND(AVG(year_added - release_year), 1) AS avg_gap_years,
       MAX(year_added - release_year) AS max_gap_years
FROM netflix
WHERE year_added IS NOT NULL
GROUP BY type;
