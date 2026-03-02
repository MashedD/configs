#!/usr/bin/env -S bash -Eeuo pipefail
cd "$(dirname -- "$(readlink -f -- "$0")")"

# Press Shift+F12 ingame to show MangoHud
export MANGOHUD_CONFIG="gpu_name,no_display,resolution"
# Use ATI Radeon RX 6500M in my laptop instead of integrated ATI Radeon 680M
export DRI_PRIME="1" MESA_VK_DEVICE_SELECT="1002:743f"

gamescope \
    -f \
    --force-grab-cursor \
    -W 1920 -H 1080 \
    -F fsr \
    -r 144 \
    -S stretch \
    --mangoapp \
    -- gamemoderun ./q2pro "$@"
