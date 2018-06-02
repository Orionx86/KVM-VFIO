{# https://forum.level1techs.com/t/ubuntu-17-04-vfio-pcie-passthrough-kernel-update-4-14-rc1/119639 #}
{# Need to populate with jinja for AMD and NVIDIA and then add the templating #}
{# 01:00.0 VGA - 01:00.1 - audio  | 01:00.0,01:00.1 #}

{% set IOMMU = 01:00.0,01:00.1 %}

/etc/modprobe.d/local.conf:
  file.touch

/etc/modprobe.d/local.conf:
  file.append:
    - context:
      - options vfio-pci ids={{ IOMMU }}

/etc/initramfs-tools/modules:
  file.append:
    - context:
      - vfio
      - vfio_iommu_type1
      - vfio_pci
      - vfio_virqfd
      - vhost-net

/etc/default/grub:
  file.replace:
    - pattern: GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
    - repl: GRUB_CMDLINE_LINUX_DEFAULT="iommu=1 intel_iommu=on modprobe.blacklist=nouveau"

/etc/default/grub:
  file.replace:
    - pattern: GRUB_CMDLINE_LINUX_DEFAULT="iommu=1 intel_iommu=on"
    - repl: GRUB_CMDLINE_LINUX_DEFAULT="iommu=1 intel_iommu=on modprobe.blacklist=nouveau"

Apply Configs:
  cmd.run:
    - names:
      - update-initramfs -u
      - sudo update-grub
HugePages:
  file.append:
    - template: jinja
    - context:
      - vm.nr_hugepages = {{ grains['mem_total'] / 2  }}

{% endif %}
