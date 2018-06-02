# KVM VFIO Setup

This is the beginning of a deployment method for KVM with the intention to automate VFIO (Virtual Function I/O) configuration for utilizing hardware without emulation in VM's. Example: KVM for Windows Gaming with a non-emulated GPU or Linux for machine learning. We will integrate  other projects into this as git submodules and pull in via Salt. Due to using Salt Cloud, we can also push general fixes to host and to guest. This is easily expandable.

Main Tools Used will be Saltstack, Python, Any Shell script.
https://www.reddit.com/r/VFIO/

# Setup - Run this to kick off the Install
```
sudo curl https://raw.githubusercontent.com/Orionx86/KVM-VFIO/master/setup-salt.sh | bash
```

# Functions Finished
- Automate setup in a Ubuntu environment for KVM via Salt for Ubuntu and testing RHEL
# Functions To Build
- Use file.managed templates for VFIO configuration and extrapolate the ID's for necessary devices.
- (We might need to get a list of available USB Controllers for end user to figure out which one they need and then apply to config per VM)

# Some cool ideas to keep in mind
- Because we use Salt + Salt Cloud, you have a cloud profile for your VM, installing salt on it automatically and then apply applications you would want. For example, we can have a Salt State for installing Steam + Looking Glass + NVidia/ AMD drivers automatically.
- We can apply generic fixes found throughout the community, quickly and easily for host and guest.
- Salt is easy to learn and to use. We can still use any shell script required =)

# Learning Salt
- https://docs.saltstack.com/en/getstarted/config/functions.html
- https://docs.saltstack.com/en/latest/ref/states/all/salt.states.cmd.html
- https://docs.saltstack.com/en/latest/ref/states/all/salt.states.file.html

# Salt kvm
- https://docs.saltstack.com/en/latest/topics/cloud/libvirt.html
- https://docs.saltstack.com/en/latest/ref/runners/all/salt.runners.virt.html
- https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.kmod.html
- https://docs.saltstack.com/en/latest/ref/states/all/salt.states.virt.html
- https://docs.saltstack.com/en/2017.7/ref/modules/all/salt.modules.virt.html

# Salt for Windows
- Steam Installer- https://github.com/saltstack/salt-winrepo-ng/blob/master/steam.sls
- GPU-Z Installer - https://github.com/saltstack/salt-winrepo-ng/blob/master/gpu-z.sls
- URL for latest NVidia package. We can build these packages quickly - http://us.download.nvidia.com/solaris/304.37/NVIDIA-Solaris-x86-304.37.run

# Interesting Reads
- https://hveem.no/saltvirt
- https://github.com/kholia/OSX-KVM
