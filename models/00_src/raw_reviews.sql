WITH cte_raw_reviews AS(
    SELECT * FROM {{ source('airbnb', 'raw_reviews') }}
)

SELECT
    *
FROM cte_raw_reviews