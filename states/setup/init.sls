{% if grains['virtual'] == "physical"%}
{% if grains['osfullname'] == "Ubuntu"%}
include:
  - .ubuntu.repository
  - .ubuntu.grub
  - .ubuntu.install
  - .ubuntu.services
  - .ubuntu.kvm
{% endif %}
