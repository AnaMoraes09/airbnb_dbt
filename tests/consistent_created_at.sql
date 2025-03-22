SELECT * FROM {{ ref('stg_listings') }} AS t1
INNER JOIN {{ ref('stg_reviews')}} AS t2 ON t1.listing_id = t2.listing_id
WHERE t1.created_at >= t2.review_date