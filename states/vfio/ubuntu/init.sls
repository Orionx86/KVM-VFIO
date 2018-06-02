{# https://forum.level1techs.com/t/ubuntu-17-04-vfio-pcie-passthrough-kernel-update-4-14-rc1/119639 #}
{# Need to populate with jinja for AMD and NVIDIA and then add the templating #}
{% if pillar.get['myGPU'] == 'AMD' %}
{% set pillar.get['myVFIO'] == '' %}

/etc/initramfs-tools/modules:
  file.append:
    - context:
      - softdep amdgpu pre: vfio vfio_pci
      - vfio
      - vfio_iommu_type1
      - vfio_virqfd
      - options vfio_pci ids=1002:699f,1002:aae0
      - vfio_pci ids=1002:699f,1002:aae0
      - vfio_pci
      - amdgpu

/etc/modules:
  file.append:
    - context:
      - vfio
      - vfio_iommu_type1
      - vfio_pci ids=1002:699f,1002:aae0

/etc/modprobe.d/amdgpu.conf:
  file.append:
    - context:
      - softdep amdgpu pre: vfio vfio_pci

/etc/modprobe.d/vfio_pci.conf:
  file.append:
    - context:
      - options vfio_pci ids=1002:699f,1002:aae0

{% endif %}
