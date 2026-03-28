#!/usr/bin/env -S bash -Eeuo pipefail
cd "$(dirname -- "$(readlink -f -- "$0")")"

# Use ATI Radeon RX 6500M in my laptop instead of integrated ATI Radeon 680M
export DRI_PRIME="1" MESA_VK_DEVICE_SELECT="1002:743f"

gamemoderun ./r1q2 "$@"

