#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$PWD"}
WIDTH=${WIDTH:-1920}
HEIGHT=${HEIGHT:-1080}
#WIDTH=${WIDTH:-800}
#HEIGHT=${HEIGHT:-600}
REFRESH=${REFRESH:-144}
cd "$GAME_PATH"

# Disable touchpad
#TOUCHPAD_NAME=${TOUCHPAD_NAME:-"ELAN0300:00 04F3:3206 Touchpad"}
#xinput disable "$TOUCHPAD_NAME"

# Press F12 ingame to show MangoHud
export MANGOHUD_CONFIG="gpu_name,no_display"
# Use ATI Radeon RX 6500M in my laptop instead of integrated ATI Radeon 660M
export DRI_PRIME="1"
export MESA_VK_DEVICE_SELECT="1002:743f"

EXEC=""
[ -n "$(command -v gamemoderun 2>/dev/null)" ] && EXEC="$EXEC gamemoderun"
[ -n "$(command -v gamescope 2>/dev/null)" ] && \
    EXEC="$EXEC gamescope -W $WIDTH -H $HEIGHT -r $REFRESH -f -S stretch --force-grab-cursor --"
[ -n "$(command -v mangohud 2>/dev/null)" ] && EXEC="$EXEC mangohud"
$EXEC ./q2pro +set homedir . "$@"

