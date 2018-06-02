{% if grains['kernel'] == "Linux"%}
include:
  - .install
  - .services
  - .kvm
{% endif %}
