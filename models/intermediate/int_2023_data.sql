{{
    config(
        materialized='table',
        alias = 'int_2023_data'
    )
}}
with source as (select tweet_id as tweet_id
    ,screen_name                as screen_name
    ,created_at                 as created_at
    ,full_text                  as full_text
    ,display_text_range         as display_text_range
    ,in_reply_to_screen_name    as in_reply_to_screen_name
    ,is_quote_status            as is_quote_status
    ,includes_media             as includes_media
    ,hashtags                   as hashtags
    ,user_mentions              as user_mentions
    ,urls                       as urls
    ,engagement_count           as engagement_count
    from {{ ref('stg_2023_advanced') }}
    )
select *
from source
