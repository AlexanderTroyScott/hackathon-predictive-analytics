{{
    config(
        materialized='table',
        alias = 'int_2022_cleaned_data'
    )
}}
with source as (
    select * from {{ ref('stg_2022_advanced') }}
    )
select *
,log("Sold Price") as target 
from source