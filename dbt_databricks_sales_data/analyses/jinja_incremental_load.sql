{% set inc_flag = 1 %}
{% set last_load = 3 %}

{# It is a initial load with pre selected columns #}
{% set imp_col = ["sales_id","date_sk","gross_amount"] %}
SELECT
    {% for col in imp_col %}
        {{col}}
        {% if not loop.last %},{% endif %}
    {% endfor %}
FROM
    {{ ref('bronze_sales') }}

{% if inc_flag == 1 %} {# Otherwise incremental load #}

WHERE
    date_sk > {{ last_load }} {# using date key column for identifying an incremental load #}

{% endif %}