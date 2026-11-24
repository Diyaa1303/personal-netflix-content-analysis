-- Builds a clean copy of the imported Netflix data with proper column names.
-- The raw import (netflix_titles) has the header row as data and columns c1-c12.
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix AS
SELECT c1 AS show_id,
       c2 AS type,
       c3 AS title,
       NULLIF(TRIM(c4), '') AS director,
       NULLIF(TRIM(c6), '') AS country,
       NULLIF(TRIM(c7), '') AS date_added,
       CASE WHEN NULLIF(TRIM(c7), '') IS NULL THEN NULL
            ELSE CAST(SUBSTR(TRIM(c7), -4) AS INTEGER) END AS year_added,
       CAST(c8 AS INTEGER) AS release_year,
       NULLIF(TRIM(c9), '') AS rating,
       NULLIF(TRIM(c10), '') AS duration,
       NULLIF(TRIM(c11), '') AS listed_in
FROM netflix_titles
WHERE c1 <> 'show_id';
