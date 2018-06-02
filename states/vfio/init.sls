{% if grains['virtual'] == "physical" %}
{% if grains['osfullname'] == "Ubuntu"%}
include:
  - .ubuntu
{% endif %}
{% endif %}
