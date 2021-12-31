# vfio-passthrough-single-gpu-nvidia

This script will fix the problem where GNOME desktop environment keeps restarting that happens to Popos 21.10: https://imgur.com/Mv7JjfL on Nvidia 470

Tested on:
- Kernel: 5.15.5-76051505-generic 
- DE: GNOME 40.5 
- WM: Mutter 
- OS: Pop!_OS 21.10 x86_64 
- RTX 3060 ti  Driver Version: 470.86  CUDA Version: 11.4 
- Host: XPS8940

**Note**:
- Sometimes win10 doesn't launch
- Modify `qemu` for your own usage. I disabled a few cores for my CPU pinning, feel free to remove it
- `vfio-bind` and `vfio-rebind` to passthrough my USB Host controller **which doesn't have reset**. You don't need to do this if your devices support reset.
- check reset if device supports reset using this script:
```
#!/bin/bash
for iommu_group in $(find /sys/kernel/iommu_groups/ -maxdepth 1 -mindepth 1 -type d);do echo "IOMMU group $(basename "$iommu_group")"; for device in $(\ls -1 "$iommu_group"/devices/); do if [[ -e "$iommu_group"/ devices/"$device"/reset ]]; then echo -n "[RESET]"; fi; echo -n $'\t';lspci -nns "$device"; done; done
```




