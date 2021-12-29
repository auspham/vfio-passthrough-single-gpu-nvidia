#!/bin/bash
# Helpful to read output when debugging
set -x

#Stop display manager
systemctl stop gdm3.service

# Unbind VTconsoles
echo 0 > /sys/class/vtconsole/vtcon0/bind


# Unbind EFI-Framebuffer
echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Avoid a Race condition by waiting 10 seconds. This can be calibrated to be shorter or longer if required for your system
sleep 10

# unload nvidia
modprobe -r nvidia_drm
modprobe -r nvidia_uvm
modprobe -r nvidia_modeset
modprobe -r nvidia

# Load VFIO Kernel Module  
modprobe vfio
modprobe vfio-pci
modprobe vfio_iommu_type1
