{% macro binarize_column(column, prefix) %}
WITH split_data AS (
  SELECT *
    , string_to_array(hashtags, ',') as temp
  FROM (select tweet_id, lower(REPLACE({{column}}, ' ', '')) as {{column}} from {{ ref('int_2023_data') }}) as subquery
  where {{ column }} is not NULL and tweet_id between 100001 and 100010
)
select * from split_data
{% endmacro %}
