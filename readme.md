# Personal ZMK Configuration

Firmware configuration for split wireless keyboards powered by [ZMK Firmware](https://zmk.dev):
- **Totem**: 38-key ergonomic split keyboard with Seeed Studio XIAO BLE and an ST7789 display dongle.
- **Toucan**: Ergonomic split keyboard with Cirque trackpad, RGB LED widgets, and Raytac MDBT50Q-RX dongle.

Both keyboards share a unified **36-key core layout** documented in [Layout Documentation](docs/layout.md).

---

## Layout Documentation

See [docs/layout.md](docs/layout.md) for full ASCII art diagrams, layer maps, combo chords, and Home Row Mod timing details.

- **Base Layer**: 36-key QWERTY with balanced Home Row Mods and Sticky Shift thumb.
- **Shared Utility Layer**: Right-hand classic Numpad (with Shift-morph to F1–F12) and left-hand Navigation & Media controls.
- **System Layer**: Bluetooth profile cycling, screen brightness, and hardware reset.
- **Urob Chords**: Full vertical and horizontal combo suite for all symbols without requiring dedicated symbol layers.

---

## Building Firmware Locally

This repository uses a self-contained [Nix Flake](flake.nix) providing the Zephyr toolchain and SDK:

```bash
# List all available build targets
just list

# Build all Totem targets (dongle, left, right)
just build totem

# Build a single target
just build totem-dongle
just build totem-left
just build totem-right

# Build Toucan targets
just build toucan
```

Compiled `.uf2` binaries are output to the [`firmware/`](firmware/) directory.

---

## Flashing & Dongle Setup

Because the dongle acts as the **Central (master)** device:
- The keymap, layers, behaviors, and combos live and execute solely on the dongle.
- Reflashing the keymap only requires flashing **`totem-dongle.uf2`**.
- The left and right halves only need to be flashed when board definitions, radio transmission power, or hardware configurations change.
