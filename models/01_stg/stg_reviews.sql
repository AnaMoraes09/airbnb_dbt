{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}

WITH cte_stg_reviews AS(
    SELECT * FROM {{ ref('raw_reviews') }}
)

SELECT
    listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text, 
    sentiment AS review_sentiment
FROM 
    cte_stg_reviews
WHERE review_text is not null

{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}