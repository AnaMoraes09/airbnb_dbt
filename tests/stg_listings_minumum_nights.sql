-- Generic test

SELECT * FROM {{ ref('stg_listings') }}
WHERE minimum_nights < 1 LIMIT 10