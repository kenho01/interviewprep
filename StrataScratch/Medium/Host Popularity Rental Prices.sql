WITH popularity_stats AS(
SELECT price,
    CASE
        WHEN number_of_reviews = 0 THEN 'New'
        WHEN 1 <= number_of_reviews AND number_of_reviews <= 5 THEN 'Rising'
        WHEN 6 <= number_of_reviews AND number_of_reviews <= 15 THEN 'Trending Up'
        WHEN 16 <= number_of_reviews AND number_of_reviews <= 40 THEN 'Popular'
        ELSE 'Hot'
    END AS host_popularity
FROM airbnb_host_searches )

SELECT host_popularity, MIN(price) AS min_price, AVG(price) AS avg_price, MAX(price) AS max_price
FROM popularity_stats
GROUP BY host_popularity