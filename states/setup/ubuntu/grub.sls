/etc/default/grub:
  file.replace:
    - pattern: GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
    - repl: GRUB_CMDLINE_LINUX_DEFAULT="iommu=1 intel_iommu=on"
