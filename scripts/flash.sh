#!/usr/bin/env bash
set -euo pipefail

# Find repository root
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FIRMWARE_DIR="$REPO_ROOT/firmware"

TARGET="${1:-}"

if [[ -z "$TARGET" ]]; then
    echo "Usage: $0 <target-or-uf2-file>"
    echo ""
    echo "Available firmware files:"
    ls -1 "$FIRMWARE_DIR"/*.uf2 2>/dev/null | xargs -n 1 basename | sed 's/\.uf2$//' | sed 's/^/  - /'
    exit 1
fi

# Resolve UF2 file path
if [[ -f "$TARGET" ]]; then
    UF2_FILE="$TARGET"
elif [[ -f "$FIRMWARE_DIR/$TARGET.uf2" ]]; then
    UF2_FILE="$FIRMWARE_DIR/$TARGET.uf2"
elif [[ -f "$FIRMWARE_DIR/$TARGET" ]]; then
    UF2_FILE="$FIRMWARE_DIR/$TARGET"
else
    echo "❌ Error: Firmware file not found for target '$TARGET'"
    echo "Looking in: $FIRMWARE_DIR/$TARGET.uf2"
    echo ""
    echo "You can build it first with: just build $TARGET"
    exit 1
fi

UF2_NAME="$(basename "$UF2_FILE")"
FILE_SIZE="$(wc -c < "$UF2_FILE" | tr -d ' ')"
echo "📦 Target firmware: $UF2_NAME ($FILE_SIZE bytes)"

# Function to detect mounted UF2 volume
find_uf2_volume() {
    for vol in /Volumes/*; do
        if [[ -d "$vol" && -f "$vol/INFO_UF2.TXT" ]]; then
            echo "$vol"
            return 0
        fi
    done
    return 1
}

# Check if already mounted
if MOUNT_POINT="$(find_uf2_volume)"; then
    echo "🔌 Found bootloader drive already mounted at: $MOUNT_POINT"
else
    echo ""
    echo "⏳ Waiting for bootloader drive to mount in /Volumes..."
    echo "👉 Connect your keyboard via USB and DOUBLE-TAP RESET now."
    echo "   (Press Ctrl+C to cancel)"
    echo ""

    while true; do
        if MOUNT_POINT="$(find_uf2_volume)"; then
            break
        fi
        sleep 0.5
    done
    echo "🔌 Bootloader drive detected at: $MOUNT_POINT"
fi

# Extract board name if available in INFO_UF2.TXT
if [[ -f "$MOUNT_POINT/INFO_UF2.TXT" ]]; then
    BOARD_MODEL=$(grep -i "Model:" "$MOUNT_POINT/INFO_UF2.TXT" 2>/dev/null | cut -d: -f2- | xargs || true)
    if [[ -n "$BOARD_MODEL" ]]; then
        echo "📟 Board: $BOARD_MODEL"
    fi
fi

echo "🚀 Flashing $UF2_NAME to $MOUNT_POINT..."
cp "$UF2_FILE" "$MOUNT_POINT/"

echo "⏳ Waiting for keyboard to reboot..."
# Wait for drive to unmount
while [[ -d "$MOUNT_POINT" ]]; do
    sleep 0.3
done

echo "🎉 Flash complete! $UF2_NAME written and board rebooted."

# Play gentle audio notification on macOS if available
if command -v afplay >/dev/null 2>&1; then
    afplay /System/Library/Sounds/Glass.aiff >/dev/null 2>&1 &
fi
