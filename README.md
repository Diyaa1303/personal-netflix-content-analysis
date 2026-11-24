# Netflix Content Analysis

SQL analysis of the Netflix catalogue: what kinds of titles were added, when, from where, and in which genres and ratings. Results are charted in Excel.

## Data

The data is the Kaggle dataset [Netflix Movies and TV Shows](https://www.kaggle.com/shivamb/netflix-shows) by Shivam Bansal, a snapshot of the Netflix catalogue with 8,807 titles (6,131 movies and 2,676 TV shows). The raw file is not included here, so please download it from Kaggle.

## Business questions

1. How many movies and TV shows were added each year?
2. Which countries produce the most titles?
3. What is the mix of content ratings?
4. How long after release does a title reach Netflix?
5. Which genres appear most often?

## Dashboard

![Netflix dashboard]Dashboard_SQL.png

## Queries

| File | Question | SQL skills |
|---|---|---|
| `00_clean_table.sql` | Build a clean table with proper column names | `CREATE TABLE AS`, `NULLIF`, `TRIM`, `CAST`, `SUBSTR` |
| `01_content_by_year.sql` | Movies and TV shows added per year | `CASE WHEN`, `SUM`, `GROUP BY` |
| `02_top_countries.sql` | Top 10 countries by number of titles | CTE, `INSTR`, `SUBSTR`, `LIMIT` |
| `03_rating_distribution.sql` | Share of titles by rating | window function `SUM(COUNT(*)) OVER ()` |
| `04_release_vs_added_gap.sql` | Years between release and arrival on Netflix | `AVG`, date arithmetic |
| `05_top_genres.sql` | Top 10 genres | recursive CTE |

## Findings

- **Movies outweigh TV shows:** 6,131 movies against 2,676 TV shows, and movies outnumbered TV shows in every year from 2009 onward.
- **Additions peaked in 2019** at 2,016 titles, then fell to 1,879 in 2020. 2021 shows 1,498, but that is a part year. Before 2015, Netflix added fewer than 100 titles a year in this data.
- **The United States dominates** with 3,211 titles,
