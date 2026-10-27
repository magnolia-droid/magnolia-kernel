# MagnoliaDroid Kernel Tree & Custom Patches

Custom Kernel tree for **MagnoliaDroid OS** (Android 14 x86_64).

### Key Features & Optimizations:
- **Base**: Android-Generic Kernel 6.6 LTS (`hm/crimson`)
- **CPU Scheduler**: BoRE (Burst-Oriented Response Enhancer) Scheduler
- **Preemption**: Full Preemptive kernel model (`CONFIG_PREEMPT=y`) for minimal latency
- **Timer Frequency**: 1000Hz (`CONFIG_HZ_1000=y`)
- **Network**: BBR Congestion Control
- **Android HAL Support**: BinderFS, memfd, PSI, Ashmem compatibility

### Usage:
Run the patch script against any standard Android 6.6 kernel tree:
```bash
./scripts/apply_magnolia_patches.sh /path/to/kernel/x86/common
```
