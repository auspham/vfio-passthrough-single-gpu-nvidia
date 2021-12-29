# vfio-passthrough-single-gpu-nvidia

This script will fix the problem where GNOME desktop environment keeps restarting that happens to Popos 21.10: https://imgur.com/Mv7JjfL on Nvidia 470

Tested on:
- Kernel: 5.15.5-76051505-generic 
- DE: GNOME 40.5 
- WM: Mutter 
- OS: Pop!_OS 21.10 x86_64 
- RTX 3060 ti  Driver Version: 470.86  CUDA Version: 11.4 


**Note**: if your vm not launching, try to calibrate `sleep` in `vfio-startup.sh`




