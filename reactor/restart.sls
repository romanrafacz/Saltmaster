{% set postdata = data.get('post', {}) %}

{% if postdata.secretkey == "2132" %}
restart_services:
  cmd.service.restart:
    - tgt: '{{ postdata.tgt }}' 
    - arg:
      - {{ postdata.service }} 
{% endif %}
