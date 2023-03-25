{% macro binarize_column(column, prefix) %}

WITH split_data AS (
  SELECT
    LOWER({{ column }}) AS {{ column }},
    REGEXP_SPLIT_TO_TABLE(LOWER({{ column }}), ',') AS split_column
  FROM {{ ref('int_2023_data') }}
  where {{ column }} is not NULL
),

binned_data AS (
  SELECT
    {{ column }}
    {% for row in (SELECT DISTINCT split_column
  FROM split_data
) %}
      ,CASE
        WHEN {{ row.split_column }} IS NOT NULL THEN 1
        ELSE 0
      END AS {{ prefix }}_{{ row.split_column }}
    {% endfor %}
  FROM split_data
)



SELECT * from binned_data


{% endmacro %}
