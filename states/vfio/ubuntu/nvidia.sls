{# https://forum.level1techs.com/t/ubuntu-17-04-vfio-pcie-passthrough-kernel-update-4-14-rc1/119639 #}
{# Need to populate with jinja for AMD and NVIDIA and then add the templating #}
{# https://www.freesoftwareservers.com/wiki/prep-linux-os-for-gpu-passthrough-blacklist-nouveau-and-use-vfio-pci-drivers-script-24969218.html #}
{# 01:00.0 VGA - 01:00.1 - audio  | 01:00.0,01:00.1 #}

{% set IOMMU = "01:00.0,01:00.1" %}

{% if grains['virtual'] == "physical" %}
{% if grains['osfullname'] == "Ubuntu"%}

touch this file:
  file.touch:
    - name: /etc/modprobe.d/local.conf

/etc/modprobe.d/local.conf:
  file.replace:
    - pattern: None
    - repl: options vfio-pci ids={{ IOMMU }}

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

/etc/default/grub2:
  file.replace:
    - name: /etc/default/grub
    - pattern: GRUB_CMDLINE_LINUX_DEFAULT="iommu=1 intel_iommu=on"
    - repl: GRUB_CMDLINE_LINUX_DEFAULT="iommu=1 intel_iommu=on modprobe.blacklist=nouveau"

/etc/modprobe.d/blacklist.conf:
  file.append:
    - context:
      - blacklist nouveau
      - blacklist lbm-nouveau
      - options nouveau modeset=0
      - alias nouveau off
      - alias lbm-nouveau off

/etc/modprobe.d/kvm.conf
  file.append:
    - context: options kvm ignore_msrs=1

/etc/sysctl.conf:
  file.append:
    - template: jinja
    - context:
      - vm.nr_hugepages = {{ grains['mem_total'] / 2  }}
            
Apply Configs:
  cmd.run:
    - names:
      - update-initramfs -u
      - sudo update-grub

Your IOMMU test:
  test.succeed_without_changes:
    - name: {{ IOMMU }}

{% endif %}
{% endif %}
