#!/bin/bash

set -euo pipefail

echo "Tip: Use 'dfu-util --list' to find the device ID."

device=${1:?"Usage: $0 <device> <firmware_path>"}
firmware_path=${2:?"Usage: $0 <device> <firmware_path>"}

check_sudo() {
    if [[ $EUID -ne 0 ]]; then
        echo_err "Error: This script must be run with sudo"
        exit 1
    fi
}

# Run script
check_sudo

echo "sleeping 5 seconds before performing flash"
sleep 5

dfu-util \
    --alt 0 \
    --device "${device}" \
    --dfuse-address 0x08000000:leave \
    --download "${firmware_path}"
