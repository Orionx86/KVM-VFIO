Installs:
  pkg.installed:
  - pkgs:
    - cpu-checker
    - nano
    - qemu-kvm
    - libvirt-bin
    - ubuntu-vm-builder
    - bridge-utils
    - virt-manager
    - python-pip
    - libvirt-dev
    - hugepages
    - seabios
    - qemu-utils
    - ovmf

libvirt-python:
  pip.installed

Docker Install:
  cmd.script:
    - name: salt://states/setup/files/docker.sh

/usr/share/virtio-win/:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

Virtio Windows Drivers:
  file.managed:
    - name: /usr/share/virtio-win/virtio-win.iso
    - source: https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
    - keep_source: True
    - skip_verify: True
