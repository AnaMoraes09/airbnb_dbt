WITH cte_stg_listings AS (
    SELECT * FROM {{ ref('scd_raw_listings') }}
)

SELECT
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    CASE 
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,
    host_id,
    REPLACE(price, '$') :: NUMBER(10,2) AS price,
    created_at,
    updated_at
FROM cte_stg_listings WHERE dbt_valid_to is null