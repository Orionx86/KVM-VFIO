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
