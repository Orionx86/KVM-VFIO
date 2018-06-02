nvidia:
  latest:
    full_name: 'nvidia'
    installer: 'http://us.download.nvidia.com/solaris/304.37/NVIDIA-Solaris-x86-304.37.run'
    install_flags: '/n /s /noeula /nofinish'
    uninstaller:
      {{ [
           salt.environ.get('ProgramFiles(x86)') if salt.grains.get('cpuarch') == 'AMD64' else
           salt.environ.get('ProgramFiles'),
           'Steam',
           'uninstaller.exe'
         ]|join('\\')|yaml_encode }}
    uninstall_flags: '/S'
    reboot: False
