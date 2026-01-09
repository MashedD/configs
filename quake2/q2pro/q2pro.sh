#!/usr/bin/env -S bash -Eeuo pipefail
cd "$(dirname -- "$(readlink -f -- "$0")")"

# Press F12 ingame to show MangoHud
export MANGOHUD_CONFIG="gpu_name,no_display"
# Use ATI Radeon RX 6500M in my laptop instead of integrated ATI Radeon 680M
export DRI_PRIME="1" MESA_VK_DEVICE_SELECT="1002:743f"

gamemoderun gamescope \
    --mangoapp \
    --expose-wayland --backend wayland \
    --adaptive-sync \
    -r 144 \
    -f \
    --hide-cursor-delay 0 \
    --force-grab-cursor \
    -W 1280 -H 800 \
    -S stretch \
    -- mangohud ./q2pro +set homedir . "$@"

