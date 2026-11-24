-- Question: What share of titles falls in each rating?
SELECT rating,
       COUNT(*) AS titles,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS pct_of_titles
FROM netflix
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY titles DESC;
