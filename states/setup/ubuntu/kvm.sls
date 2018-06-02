KVM Check:
  cmd.run:
    - names:
      - egrep -c '(vmx|svm)' /proc/cpuinfo
      - kvm-ok
      - egrep -c ' lm ' /proc/cpuinfo
      - uname -m
      - virsh list --all

iommu check:
  cmd.script:
    - name: salt://states/setup/files/ls-iommu.sh

iommu scoped to just USB:
  cmd.run:
    - name: sudo sh /srv/salt/states/setup/files/ls-iommu.sh | grep USB

iommu scoped to just audio and VGA:
  cmd.run:
    - name: sudo sh /srv/salt/states/setup/files/ls-iommu.sh | grep -e Audio -e VGA
