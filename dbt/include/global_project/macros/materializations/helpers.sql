{% macro run_hooks(hooks) %}
  {% for hook in hooks %}
    {% call statement() %}
      {{ hook }};
    {% endcall %}
  {% endfor %}
{% endmacro %}


{% macro column_list(columns) %}
  {%- for col in columns %}
    "{{ col.name }}" {% if not loop.last %},{% endif %}
  {% endfor -%}
{% endmacro %}


{% macro column_list_for_create_table(columns) %}
  {%- for col in columns %}
    "{{ col.name }}" {{ col.data_type }} {%- if not loop.last %},{% endif %}
  {% endfor -%}
{% endmacro %}


{% macro drop_if_exists(existing, name) %}
  {% set existing_type = existing.get(name) %}
  {% if existing_type is not none %}
    {{ adapter.drop(name, existing_type) }}
  {% endif %}
{% endmacro %}
