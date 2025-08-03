WITH states_stats AS (
    SELECT state
    , COUNT(*) AS n_business
    , DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS state_rank
    FROM yelp_business
    WHERE stars = 5
    GROUP BY state
)

SELECT state, n_business
FROM states_stats
WHERE state_rank <= 5