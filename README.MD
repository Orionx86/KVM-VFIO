# KVM VFIO Setup

This is the beginning of a setup to deploy KVM with the intention to automate VFIO (Virtual Function I/O) configuration for utilizing hardware without emulation in VM's. Example: KVM for Windows Gaming with a non-emulated GPU or Linux for machine learning. We will try to integrate some other projects into this as git submodules and pull in via Salt.

Main Tools Used will be Saltstack and Python.
https://www.reddit.com/r/VFIO/

# Functions Finished
Automate setup in a Ubuntu environment for KVM via Salt for Ubuntu and testing RHEL
# Functions To Build
Use file.managed templates for VFIO configuration and extrapolate the ID's for necessary devices.
(We might need to get a list of available USB Controllers for end user to figure out which one they need and then apply to config per VM)
# Setup - Run this to kick off the Install
```
sudo curl https://raw.githubusercontent.com/Orionx86/KVM-VFIO/master/setup-salt.sh | bash
```
