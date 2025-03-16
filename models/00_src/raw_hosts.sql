WITH cte_raw_hosts AS(
    SELECT * FROM {{ source('airbnb', 'raw_hosts') }}
)

SELECT
    *
FROM cte_raw_hosts