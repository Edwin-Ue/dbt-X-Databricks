SELECT DISTINCT
    gender
FROM
    {{source('source', 'dim_customer')}}