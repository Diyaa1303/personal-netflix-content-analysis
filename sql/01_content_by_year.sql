-- Question: How many movies and TV shows were added to Netflix each year?
SELECT year_added,
       SUM(CASE WHEN type = 'Movie' THEN 1 ELSE 0 END) AS movies,
       SUM(CASE WHEN type = 'TV Show' THEN 1 ELSE 0 END) AS tv_shows,
       COUNT(*) AS total
FROM netflix
WHERE year_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;
