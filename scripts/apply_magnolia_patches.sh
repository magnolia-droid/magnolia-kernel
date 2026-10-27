#!/usr/bin/env bash
set -e

KERNEL_DIR="$1"
if [ -z "$KERNEL_DIR" ] || [ ! -d "$KERNEL_DIR" ]; then
    echo "Usage: $0 <path_to_kernel_source>"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATCHES_DIR="${SCRIPT_DIR}/../patches"
CONFIGS_DIR="${SCRIPT_DIR}/../configs"

echo "==> Applying MagnoliaDroid kernel patches to $KERNEL_DIR..."

for patch in "${PATCHES_DIR}"/*.patch; do
    if [ -f "$patch" ]; then
        echo "--> Applying $(basename "$patch")..."
        patch -d "$KERNEL_DIR" -p1 < "$patch" || true
    fi
done

echo "==> Appending MagnoliaDroid tuning configs..."
if [ -f "$CONFIGS_DIR/magnolia_tuning.config" ]; then
    cat "$CONFIGS_DIR/magnolia_tuning.config" >> "$KERNEL_DIR/arch/x86/configs/android-x86_64_defconfig" 2>/dev/null || true
    echo "--> Tuning config appended successfully."
fi

echo "==> MagnoliaDroid Kernel preparation completed!"
