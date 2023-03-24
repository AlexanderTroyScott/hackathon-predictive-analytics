CREATE TABLE my_table_binarized AS
SELECT
  *,
  {% for value in run_query("SELECT DISTINCT UNNEST(string_to_array(int_2023_data.hashtags, ',')) AS value FROM hackathons.int_2023_data") %}
    CASE WHEN my_column LIKE '%{{ value.value }}%' THEN 1 ELSE 0 END AS {{ value.value|replace(' ', '_') }}
  {% endfor %}
FROM {{ ref('int_2023_data') }};
