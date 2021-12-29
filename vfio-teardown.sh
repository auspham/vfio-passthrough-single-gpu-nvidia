#!/bin/bash

set -x

modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

# Reload nvidia modules

modprobe nvidia
modprobe nvidia_modeset
modprobe nvidia_uvm
modprobe nvidia_drm

# Restart Display Manager
systemctl start gdm3.service

# Rebind VT consoles
echo 1 > /sys/class/vtconsole/vtcon0/bind
