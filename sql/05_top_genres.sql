-- Question: Which genres appear most often? (A title can belong to several genres.)
WITH RECURSIVE split(show_id, genre, rest) AS (
  SELECT show_id, '', listed_in || ','
  FROM netflix
  WHERE listed_in IS NOT NULL
  UNION ALL
  SELECT show_id,
         TRIM(SUBSTR(rest, 1, INSTR(rest, ',') - 1)),
         SUBSTR(rest, INSTR(rest, ',') + 1)
  FROM split
  WHERE rest <> ''
)
SELECT genre, COUNT(*) AS titles
FROM split
WHERE genre <> ''
GROUP BY genre
ORDER BY titles DESC
LIMIT 10;
