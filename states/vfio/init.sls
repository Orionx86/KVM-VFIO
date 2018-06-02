{% if grains['osfullname'] == "Ubuntu"%}
include:
  - .ubuntu
{% endif %}
