# 36-Key Unified Layout Documentation

This document describes the unified 36-key layout used across both the **Totem** and **Toucan** keyboards.

---

## 1. Overview & Core Principles

- **Unified 36-Key Muscle Memory**: Although both keyboards use a 42-key logical matrix under ZMK, all outer-column extra keys are disabled (`&none`). Whether typing on the Totem or Toucan, your fingers hit the exact same physical keys.
- **Timeless Homerow Mods (HRM)**: Configured with `flavor = "balanced"`, `tapping-term-ms = <280>`, and `require-prior-idle-ms = <250>`. In-flow typing resolves instantly to letters on key-down (zero latency), while deliberate modifier chords fire without timer delays.
- **Ergonomic Thumbs & Shift Morphs**:
  - **Left Middle Thumb**: Shift & Caps Lock (`&td_shift`: Tap for Sticky Shift, Hold for Shift, Double-tap for Caps Lock).
  - **Right Middle Thumb**: Space morphing to Backspace when Shifted (`space_bspc`: `Space` $\rightarrow$ `Shift + Space = Backspace`). Same key to go forward goes backward!
  - **Right Inner Thumb**: Dedicated `Enter` key (`Shift + Enter` is preserved for newlines in chat/documents).
  - **Left Inner Thumb**: Smart Numword & Momentary Util (`&smart_num 2 2`: Tap for auto-disarming Numword, Hold for Util layer).
  - **Outer Thumbs**: Dedicated `Esc` (Left Outer) and `Tab` (Right Outer).
- **Forward Delete**: Positioned on the top-right pinky of the Util layer (`HOME`, `PGDN`, `PGUP`, `END`, `DEL`).
- **Smart Numword**: Tapping the Left Inner thumb activates the number layer. Typing numbers and operators keeps it active; typing a letter, Space, or Enter automatically disarms it.
- **Chords for Symbols**: Vertical and horizontal 2-key combos provide all standard number-row and coding symbols directly from the base layer without switching layers.
- **System Layer Combo**: Pressing both outer thumbs simultaneously (`Esc + Tab`) opens the System layer for Bluetooth and layout toggles.

---

## 2. Layer Diagrams

### Layer 0: QWERTY Base (`QWERT`)

```
       [ LEFT HAND ]                                          [ RIGHT HAND ]
Top:    [ Q ]  [ W ]  [ E ]  [ R ]  [ T ]               [ Y ]  [ U ]  [ I ]  [ O ]  [ P ]
Home:   [ A ]  [ S ]  [ D ]  [ F ]  [ G ]               [ H ]  [ J ]  [ K ]  [ L ]  [ ' ]
        (Ctrl) (Alt)  (Gui)                                           (Gui)  (Alt)  (Ctrl)
Bottom: [ Z ]  [ X ]  [ C ]  [ V ]  [ B ]               [ N ]  [ M ]  [ , ]  [ . ]  [ / ]
                                                                      (;)    (:)    (?)

          Left Thumbs                                             Right Thumbs
    [ ESC ]       [ SHIFT / CAPS ]      [ NUM / UTIL ]            [ ENTER ]       [ SPC / BSPC ]     [ TAB ]
    (Direct)   (Tap: Shift, 2x: Caps)  (Tap: Num, Hold: Util)     (Direct)        (Shift -> Bspc)   (Direct)
```

#### Smart Punctuation on QWERTY:
- **Right Pinky (`'`)**: Tap for `'` (apostrophe), Shift + Tap for `"` (double quote).
- **Comma (`,`)**: Tap for `,`, Shift + Tap for `;` (semicolon).
- **Period (`.`)**: Tap for `.`, Shift + Tap for `:` (colon).
- **Slash (`/`)**: Tap for `/`, Shift + Tap for `?` (question mark).

---

### Layer 1: Colemak-DH Base (`COLE`)

```
       [ LEFT HAND ]                                          [ RIGHT HAND ]
Top:    [ Q ]  [ W ]  [ F ]  [ P ]  [ B ]               [ J ]  [ L ]  [ U ]  [ Y ]  [ ' ]
Home:   [ A ]  [ R ]  [ S ]  [ T ]  [ G ]               [ M ]  [ N ]  [ E ]  [ I ]  [ O ]
        (Ctrl) (Alt)  (Gui)                                           (Gui)  (Alt)  (Ctrl)
Bottom: [ Z ]  [ X ]  [ C ]  [ D ]  [ V ]               [ K ]  [ H ]  [ , ]  [ . ]  [ / ]
                                                                      (;)    (:)    (?)

          Left Thumbs                                             Right Thumbs
    [ ESC ]       [ SHIFT / CAPS ]      [ NUM / UTIL ]            [ ENTER ]       [ SPC / BSPC ]     [ TAB ]
    (Direct)   (Tap: Shift, 2x: Caps)  (Tap: Num, Hold: Util)     (Direct)        (Shift -> Bspc)   (Direct)
```

#### Smart Punctuation on Colemak-DH:
- **Top Right Pinky (`'`)**: Tap for `'` (apostrophe), Shift + Tap for `"` (double quote).
- **Comma (`,`)**: Tap for `,`, Shift + Tap for `;` (semicolon).
- **Period (`.`)**: Tap for `.`, Shift + Tap for `:` (colon).
- **Slash (`/`)**: Tap for `/`, Shift + Tap for `?` (question mark).

---

### Shared Utility Layers (`UTIL`) — Numpad / Fn-Pad & Nav / Media (Vim HJKL)

*Activated momentarily by **holding** Left Inner Thumb (`&smart_num`), or entered via **Smart Numword** tap.*

```
       [ LEFT HAND: CLASSIC NUMPAD ]                          [ RIGHT HAND: NAV & MEDIA (HJKL) ]
Top:    [ F11// ] [ 7/F7 ] [ 8/F8 ] [ 9/F9 ] [  *  ]        [ HOME ] [PG_DN ] [PG_UP ] [ END  ] [ DEL  ]
Home:   [ 0/F10 ] [ 4/F4 ] [ 5/F5 ] [ 6/F6 ] [  -  ]        [ LEFT ] [ DOWN ] [  UP  ] [RIGHT ] [PLAY/PAUSE]
Bottom: [ F12/= ] [ 1/F1 ] [ 2/F2 ] [ 3/F3 ] [  +  ]        [ MUTE ] [VOL_DN] [VOL_UP] [ PREV ] [ NEXT ]
Thumbs:     [   .   ]       [ Shift ] [ Exit / Disarm ]         [ Enter / Disarm ] [ Space / Disarm ]
```

#### Smart Numword Mechanics:
- **Tap Left Inner Thumb**: Activates Numword.
- **Typing numbers (`0-9`), math symbols (`* - + / =`), or decimal (`.`)** keeps Numword active.
- **Tapping Space, Enter, or any alpha key** automatically disarms Numword and returns to the base layer.
- **Left Outer Thumb on Util**: Outputs `.` (decimal point) without exiting Numword.
- **Left Inner Thumb on Util**: Tapping it again immediately disarms/exits Numword (toggle off).
- **Right Inner Thumb on Util**: Passes through `Enter`, submitting and immediately disarming Numword.
- **Right Middle Thumb on Util**: Passes through `Space`, sending a space and immediately disarming Numword.

#### Numpad to Fn-Pad Transformation:
Every number key morphs into its corresponding F-key when Shift is active (via **Sticky Shift** or held Shift):
- `1` through `9` $\rightarrow$ **`F1` through `F9`**
- `0` $\rightarrow$ **`F10`**
- `/` $\rightarrow$ **`F11`**
- `=` $\rightarrow$ **`F12`**

*Example*: Tap Left Middle Thumb (`Sticky Shift`), tap Left Inner Thumb (`Numword`), and tap `5` $\rightarrow$ outputs **`F5`**.

---

### Layer 4: System Layer (`SYS`) — Bluetooth & Layout Switching

*Activated by pressing **BOTH** Outer Thumbs (`Esc` + `Tab`, positions 36 & 41) simultaneously.*

```
Top:    [BT_SEL 0] [BT_SEL 1] [BT_SEL 2] [BT_SEL 3] [BT_CLR]
Home:                        [QWERTY]                                [COL-DH]
Bottom: [RESET   ] [BOOTLOAD] [        ] [SCR_DN  ] [SCR_UP]  ...                       [RESET]
```

- **Layout Switching**:
  - **Left Index (`F` / `T` position)**: Switch to **QWERTY** (`&to 0`).
  - **Right Index (`J` / `N` position)**: Switch to **Colemak-DH** (`&to 1`).
- **Bluetooth Controls**:
  - **`BT_SEL 0 - 3`**: Switch Bluetooth profile.
  - **`BT_CLR`**: Clear Bluetooth bond for current profile.
- **Display & Hardware**:
  - **`SCR_DN / UP`** (`F23 / F24`): Adjust dongle display brightness.
  - **`RESET / BOOTLOAD`**: Soft reboot or enter UF2 bootloader mode.

---

## 3. Thumb Key Assignments

Totem and Toucan provide 3 physical thumb keys per half (6 total), arranged as follows:

| Hand | Position | Primary Action | Shifted Action | Hold Action | Behavior Description |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Left** | Outer | `Esc` | `Esc` | *(None)* | Dedicated Escape key |
| **Left** | Middle (Resting) | `Sticky Shift` | *(Caps Lock on 2x)* | `Shift` | Tap for Sticky Shift, Hold for Shift, Double-tap for Caps Lock |
| **Left** | Inner (Tuck) | `Smart Numword` | *(None)* | Layer 2 (`UTIL`) | Tap to enter auto-disarming Numword; Hold for momentary Util |
| **Right**| Inner (Tuck) | `Enter` | `Shift + Enter` | *(None)* | Dedicated Enter key (`Shift + Enter` preserved for chat/newlines) |
| **Right**| Middle (Resting) | `Space` | `Backspace` | *(None)* | Space; Shift + Space sends Backspace (`space_bspc`) |
| **Right**| Outer | `Tab` | `Tab` | *(None)* | Dedicated Tab key |

---

## 4. Chords & Combos Reference

Combos allow typing common symbols and control keys without leaving the base layer or reaching for symbol layers.

### Horizontal Combos (Brackets & Essentials)

| Keys Pressed | Physical Position | Output | Description |
| :--- | :--- | :---: | :--- |
| `J + K` | Home Right (Index + Mid) | **`(`** | Left parenthesis (Shift + combo gives `<`) |
| `K + L` | Home Right (Mid + Ring) | **`)`** | Right parenthesis (Shift + combo gives `>`) |
| `N + M` | Bottom Right (Inner + Index) | **`<`** | Direct left angle bracket (great for C++) |
| `M + ,` | Bottom Right (Index + Mid) | **`[`** | Left square bracket (Shift + combo gives `{`) |
| `, + .` | Bottom Right (Mid + Ring) | **`]`** | Right square bracket (Shift + combo gives `}`) |
| `. + /` | Bottom Right (Ring + Pinky) | **`>`** | Direct right angle bracket (great for C++) |

### Vertical Combos — Top + Home (Number-Row Symbols)

Press the top and home keys of the same column simultaneously:

| Keys Pressed | Hand / Finger | Symbol | Standard Number Row Reference |
| :--- | :--- | :---: | :--- |
| `Q + A` | Left Pinky | **`!`** | Shift + `1` |
| `W + S` | Left Ring | **`@`** | Shift + `2` |
| `E + D` | Left Middle | **`#`** | Shift + `3` |
| `R + F` | Left Index | **`$`** | Shift + `4` |
| `T + G` | Left Inner | **`%`** | Shift + `5` |
| `Y + H` | Right Inner | **`^`** | Shift + `6` |
| `U + J` | Right Index | **`+`** | Math addition |
| `I + K` | Right Middle | **`*`** | Math multiplication (Shift + `8`) |
| `O + L` | Right Ring | **`&`** | Shift + `7` |

### Vertical Combos — Home + Bottom (Punctuation & Math)

Press the home and bottom keys of the same column simultaneously:

| Keys Pressed | Hand / Finger | Symbol | Mental Model |
| :--- | :--- | :---: | :--- |
| `S + X` | Left Ring | **`` ` ``** | Backtick |
| `D + C` | Left Middle | **`\`** | Backslash |
| `F + V` | Left Index | **`=`** | Equals (paired with `+` above) |
| `G + B` | Left Inner | **`~`** | Tilde |
| `H + N` | Right Inner | **`_`** | Underscore (paired with `^` above) |
| `J + M` | Right Index | **`-`** | Minus (paired with `+` above) |
| `K + ,` | Right Middle | **`/`** | Forward slash (paired with `*` above) |
| `L + .` | Right Ring | **`\|`** | Pipe |

---

## 5. Home Row Mods (HRM) Timing Rationale

- **Flavor**: `balanced`
- **`require-prior-idle-ms`**: `250ms`
- **`tapping-term-ms`**: `280ms`
- **`quick-tap-ms`**: `175ms`
- **`hold-trigger-on-release`**: enabled
- **`hold-trigger-key-positions`**: opposite hand only

#### Why `require-prior-idle-ms = 250`?
In standard HRM setups, a low idle timeout (e.g. 150ms) causes typing hesitation at relaxed or learning speeds (<50 WPM) because consecutive keypresses are spaced 200–300ms apart. When the idle check fails, ZMK delays the letter until the next key is released.

With a `250ms` window:
1. Fast or relaxed typing flows easily fall within 250ms, resolving keys like `a` in `example` **instantly on key-down**.
2. When a modifier is intended (e.g. `Cmd+C`), pausing naturally for a quarter-second before striking the chord guarantees the modifier engages cleanly.
