WITH cte_stg_hosts AS (
    SELECT * FROM {{ ref('raw_hosts') }}
)
SELECT
    id AS host_id,
    CASE 
        WHEN name is not null THEN name
        ELSE 'Anonymous'
    END AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    cte_stg_hosts