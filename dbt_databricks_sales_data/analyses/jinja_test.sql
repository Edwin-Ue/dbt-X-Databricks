{%- set var_1 = "Hello World" -%}
{{ var_1 }}

{% set list = [ "item1", "item2", "item3" ] %} {#Test loop with condition#}
{% for item in list %}
  {% if item != "item2" %}
        {{ item }}
    {% else %}
       Else condition cuz {{ item }} was found
  {% endif %}
{% endfor %}