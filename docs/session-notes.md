# ZMK Configuration & Architecture Session Notes

This document captures the design decisions, hardware configurations, and layout architecture established for this keyboard repository. Any future agent or developer can refer to this document for complete context.

---

## 1. Hardware Architecture

### Boards Supported
1. **Toucan 2 (Split 36-key with Nice!View displays & Azoteq TPS43 Trackpad)**:
   - Central: Left half (`nice_nano_v2` / `seeeduino_xiao_ble` with `nice_view_gem`).
   - Peripheral: Right half with onboard Azoteq IQS5xx capacitive trackpad over I2C.
   - Bluetooth Performance:
     - `CONFIG_BT_CTLR_TX_PWR_PLUS_8=y`: Maximum +8 dBm transmit power.
     - `CONFIG_BT_CTLR_PHY_2M=y`: 2M PHY enabled for 2x on-air data rate.
     - `CONFIG_ZMK_BLE_EXPERIMENTAL_CONN=y`: Low-latency 7.5ms split BLE connection intervals to eliminate trackpad jitter.
   - Power Management:
     - Idle timeout: 30 seconds (`CONFIG_ZMK_IDLE_TIMEOUT=30000`).
     - Deep sleep timeout: 5 minutes (`CONFIG_ZMK_IDLE_SLEEP_TIMEOUT=300000`) to match macOS lock screen.
     - Trackpad power states:
       - Active: 13ms report rate.
       - LP1: 80ms report rate, timeout set to ~35s total inactivity (`timeout-lp1 = <1>`), matching microcontroller idle.
       - LP2: Restored to 160ms hardware default (`report-rate-lp2 = <160>`) eliminating the sluggish 640ms wake lag.
       - Tap-drag delay: Tuned to 300ms (`hold-time = <300>`).
2. **Totem (Split 38-key)**:
   - Central: Left half with Nice!View display.
   - Peripheral: Right half.
   - Dongle support: Raytac MDBT50Q RX dongle central option.

---

## 2. Keymap & Layer Architecture

### Layers Defined in `config/shared.keymap`
- **Layer 0: BASE_QWERTY**:
  - Home-row mods: Left `GUI(A), ALT(S), CTRL(D), SHIFT(F)`; Right `SHIFT(J), CTRL(K), ALT(L), GUI(')`.
  - HRM timing: `tapping-term-ms = <210>`, `quick-tap-ms = <150>`, `require-prior-idle-ms = <150>`.
  - Dedicated thumbs:
    - Left Outer: `&lt 2 ESC` (Tap = Esc, Hold = Util Layer 2)
    - Left Middle: `&td_shift` (Tap = Sticky Shift, Double-tap = Caps Lock)
    - Left Inner: `&smart_num 2 2` (Tap = Smart Numword, Hold = Util Layer 2)
    - Right Inner: `&kp RET` (Pure Enter; `Shift + Enter` preserved for chat newlines)
    - Right Middle: `&space_bspc` (Tap = Space, Shift = Backspace)
    - Right Outer: `&lt 3 TAB` (Tap = Tab, Hold = Util Layer 3)
- **Layer 1: COLEMAK**:
  - Colemak-DH mapping (`Q W F P B`, `A R S T G`, etc.) with identical HRMs and thumb behaviors.
- **Layer 2: UTILITY (Left Hand: Numpad / Fn-pad; Right Hand: Nav & Media)**:
  - Left Grid: Classic 3x3 accounting Numpad (`7 8 9 / *`, `4 5 6 -`, `1 2 3 +`, `0 =`).
    - With Shift (or sticky shift): Numpad transforms into `F1`–`F12`.
  - Right Grid: Vim HJKL navigation (`LEFT`, `DOWN`, `UP`, `RIGHT`) with `HOME`, `PGDN`, `PGUP`, `END`, and `DEL` on pinky.
  - Media controls: Volume up/down, mute, play/pause, prev/next.
  - Thumbs on Util: Decimal point `.` on Left Inner, pass-through outer thumbs (`&trans`) for tri-layer, and pass-through `Enter` / `Space` (auto-disarming Numword).
- **Layer 3: UTILITY (Right Trigger)**:
  - Mirrors Layer 2.
- **Layer 4: SYSTEM (Hold Both Esc + Tab Thumbs)**:
  - Activated automatically via `tri_layer` whenever both outer thumbs are held simultaneously.
  - Left Index (`&to 0`): Instant switch to QWERTY.
  - Right Index (`&to 1`): Instant switch to Colemak-DH.
  - Screen brightness controls (`&kp F14` / `&kp F15` for macOS) on left bottom index/inner keys.
  - Dongle display backlight brightness (`&kp F23` / `&kp F24`) on right bottom inner/index keys.
  - Bluetooth profiles (0–3), BT clear, symmetric resets, and bootloader triggers.

### Combos & Chords
- **Vertical Chords (Number Row Symbols)**:
  - Top + Home row keys pressed with a single flat finger pad output `!` `@` `#` `$` `%` `^` `&` `*`.
- **Home + Bottom Chords (Operators & Punctuation)**:
  - Output `` ` `` `\` `=` `~` `_` `-` `/` `|`.
- **Brackets & Parentheses**:
  - Horizontal bottom chords: `<` `[` `]` `>`.
  - Home row chords: `(` `)`.

---

## 3. Build & Flash Workflows

### Compiling Firmware
- `just build toucan-left-central` $\rightarrow$ `firmware/toucan-left-central.uf2`
- `just build toucan-right-peripheral` $\rightarrow$ `firmware/toucan-right-peripheral.uf2`
- `just build totem-display-central` $\rightarrow$ `firmware/totem-display-central.uf2`

### Automated Flashing
- Run `just flash <target>` (e.g. `just flash toucan-left-central`):
  - Uses `scripts/flash.sh` to poll `/Volumes/` for a UF2 bootloader drive (`XIAO-BOOT`, `NICENANO`, etc.).
  - As soon as the board enters bootloader mode via physical reset double-tap, it copies the `.uf2` file, waits for unmount/reboot, and chimes when complete.
- Split central architecture:
  - Keymaps, layers, combos, and macros reside 100% on Central.
  - Reflashing peripheral is only required when changing hardware pins, trackpad settings, or power states.

---

## 4. Operational Rules & User Preferences

1. **Git Remote Policy**:
   - **NEVER run `git push` without explicit user permission.** Keep all commits local until the user explicitly requests a push.
2. **Mac Shortcut Ergonomics**:
   - Tab switching in Chrome, Safari, and Terminal is best executed via `Ctrl + Tab`:
     - Hold Left Pinky (`A` = `Ctrl`) + Tap Right Outer Thumb (`Tab`).
3. **Password Best Practices for 36 Keys**:
   - Use NIST Diceware passphrases (`word word word 99!`) on the base layer with space or hyphen separators.
   - Maximize Apple Watch Auto-Unlock for macOS and Touch ID / Apple Watch for 1Password master unlock.
