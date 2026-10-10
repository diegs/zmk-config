# ZMK Configuration & Architecture Session Notes

This document captures the design decisions, hardware configurations, and layout architecture established for this keyboard repository. Any future agent or developer can refer to this document for complete context.

---

## 1. Hardware Architecture

### Boards Supported
1. **Toucan 2 (Split 36-key with Nice!View displays & Azoteq TPS43 Trackpad)**:
   - Central: Left half (`nice_nano_v2` / `seeeduino_xiao_ble` with `nice_view_gem`).
   - Peripheral: Right half with onboard Azoteq IQS5xx capacitive trackpad over I2C.
   - Transmit power: `CONFIG_BT_CTLR_TX_PWR_PLUS_8=y`, `CONFIG_BT_CTLR_PHY_2M=n` for maximum BLE stability.
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
    - Left Outer: `&kp ESC`
    - Left Middle: `&td_shift` (Tap = Sticky Shift, Double-tap = Caps Lock)
    - Left Inner: `&smart_num 2 2` (Tap = Smart Numword, Hold = Util Layer)
    - Right Inner: `&kp RET` (Pure Enter; `Shift + Enter` preserved for chat newlines)
    - Right Middle: `&space_bspc` (Tap = Space, Hold/Shift = Backspace)
    - Right Outer: `&kp TAB`
- **Layer 1: COLEMAK**:
  - Colemak-DH mapping (`Q W F P B`, `A R S T G`, etc.) with identical HRMs and thumb behaviors.
- **Layer 2: UTILITY (Left Hand: Numpad / Fn-pad; Right Hand: Nav & Media)**:
  - Left Grid: Classic 3x3 accounting Numpad (`7 8 9 / *`, `4 5 6 -`, `1 2 3 +`, `0 =`).
    - With Shift (or sticky shift): Numpad transforms into `F1`–`F12`.
  - Right Grid: Vim HJKL navigation (`LEFT`, `DOWN`, `UP`, `RIGHT`) with `HOME`, `PGDN`, `PGUP`, `END`, and `DEL` on pinky.
  - Media controls: Volume up/down, mute, play/pause, prev/next.
  - Thumbs on Util: Decimal point `.` on Left Outer (where Esc is), `Exit / Disarm` on Left Inner (tapping util thumb exits keypad mode), and pass-through `Enter` / `Space` (auto-disarming Numword).
- **Layer 3: UTILITY (Right Trigger)**:
  - Mirrors Layer 2.
- **Layer 4: SYSTEM (Hold Both Esc + Tab Thumbs)**:
  - Left Index (`&to 0`): Instant switch to QWERTY.
  - Right Index (`&to 1`): Instant switch to Colemak-DH.
  - Bluetooth profiles (0–3), BT clear, resets, and bootloader triggers.

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

- Run `just build <target>` from repo root:
  - `just build toucan-left-central` $\rightarrow$ `firmware/toucan-left-central.uf2`
  - `just build toucan-right-peripheral` $\rightarrow$ `firmware/toucan-right-peripheral.uf2`
  - `just build totem-display-central` $\rightarrow$ `firmware/totem-display-central.uf2`
- Split central architecture:
  - All keymaps, layers, combos, and macros reside 100% on Central.
  - Reflashing peripheral is only required when changing hardware pins, trackpad settings, or power states.
