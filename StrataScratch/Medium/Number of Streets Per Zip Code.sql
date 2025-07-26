WITH extracted_street_names AS (
    SELECT
        business_postal_code,
        LOWER(
            CASE
                WHEN split_part(business_address, ' ', 1) ~ '^[0-9]+$' THEN split_part(business_address, ' ', 2)
                WHEN split_part(business_address, ' ', 2) ~ '^[0-9]+$' THEN split_part(business_address, ' ', 1)
                ELSE split_part(business_address, ' ', 1)
            END
            ) AS street_name
    FROM sf_restaurant_health_violations
    WHERE business_postal_code IS NOT NULL
)

SELECT business_postal_code, COUNT(DISTINCT street_name) AS n_streets
FROM extracted_street_names
GROUP BY business_postal_code
ORDER BY n_streets DESC, business_postal_code ASC