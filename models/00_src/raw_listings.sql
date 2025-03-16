WITH cte_raw_listings AS(
    SELECT * FROM {{ source('airbnb','raw_listings')}}
)

SELECT 
    * 
FROM cte_raw_listings