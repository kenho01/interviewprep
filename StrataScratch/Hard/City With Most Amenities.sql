WITH amenities_stats AS (
    SELECT city, 
    CASE
        WHEN amenities IS NULL
        OR amenities = '' THEN 0
        -- Subtract length of amenities without commas from length of amenities with commas
        -- This gives the number of amenities a listing have
        -- i.e. {TV,Wireless Internet} has 1 comma, which implies 2 amenities (+1)
        ELSE LENGTH(REPLACE(REPLACE(REPLACE(amenities, '{', ''), '}', ''), ' ', ''))
        - LENGTH (REPLACE(REPLACE(REPLACE(amenities, '{', ''), '}', ''), ',', '')) + 1
    END AS amenity_cnt
    FROM airbnb_search_details
)

SELECT city
FROM amenities_stats
GROUP BY city
ORDER BY SUM(amenity_cnt) DESC
LIMIT 1