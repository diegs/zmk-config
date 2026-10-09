# 36-Key Unified Layout Documentation

This document describes the unified 36-key layout used across both the **Totem** and **Toucan** keyboards.

---

## 1. Overview & Core Principles

- **Unified 36-Key Muscle Memory**: Although both keyboards use a 42-key logical matrix under ZMK, all outer-column extra keys are disabled (`&none`). Whether typing on the Totem or Toucan, your fingers hit the exact same physical keys.
- **Timeless Homerow Mods (HRM)**: Configured with `flavor = "balanced"` and `require-prior-idle-ms = <250>`. In-flow typing resolves instantly to letters on key-down (zero latency), while deliberate modifier chords fire without timer delays.
- **Sticky Shift on Left Thumb**: Tap once to capitalize the next key; hold for traditional Shift. Eliminates awkward pinky/ring finger holding during normal typing.
- **Single Shared Utility Layer**: A single layer houses all Navigation, Media controls, and the classic 10-key Numpad.
- **Dual-Thumb Layer Access**: Holding **either** the Left Outer Thumb (`Esc`) or the Right Outer Thumb (`Tab`) opens the Utility layer.
- **Chords for Symbols**: Vertical and horizontal 2-key combos provide all standard number-row and coding symbols directly from the base layer without switching layers.

---

## 2. Layer Diagrams

### Base Layer (`BASE`) — Active 36-Key QWERTY

```
       [ LEFT HAND ]                                          [ RIGHT HAND ]
Top:    [ Q ]  [ W ]  [ E ]  [ R ]  [ T ]               [ Y ]  [ U ]  [ I ]  [ O ]  [ P ]
Home:   [ A ]  [ S ]  [ D ]  [ F ]  [ G ]               [ H ]  [ J ]  [ K ]  [ L ]  [ ' ]
        (Ctrl) (Alt)  (Gui)  (Shft)                            (Shft) (Gui)  (Alt)  (Ctrl)
Bottom: [ Z ]  [ X ]  [ C ]  [ V ]  [ B ]               [ N ]  [ M ]  [ , ]  [ . ]  [ / ]
                                                                      (;)    (:)    (?)

          Left Thumbs                                             Right Thumbs
   [ ESC / UTIL ]   [ BACKSPACE ]   [ STICKY SHIFT ]       [ ENTER ]  [ SPACE ]  [ TAB / UTIL ]
    (Hold Layer 1)   (Hold repeat)     (&sk LSHFT)           (Direct)   (Direct)   (Hold Layer 2)
```

#### Smart Punctuation on Base Layer:
- **Right Pinky (`'`)**: Tap for `'` (apostrophe), Shift + Tap for `"` (double quote).
- **Comma (`,`)**: Tap for `,`, Shift + Tap for `;` (semicolon).
- **Period (`.`)**: Tap for `.`, Shift + Tap for `:` (colon).
- **Slash (`/`)**: Tap for `/`, Shift + Tap for `?` (question mark).

---

### Shared Utility Layer (`UTIL`) — Nav, Media & Numpad / Fn-Pad

*Activated by holding **either** Left Outer Thumb (`Esc`) or Right Outer Thumb (`Tab`).*

```
       [ LEFT HAND: NAV & MEDIA ]                             [ RIGHT HAND: CLASSIC NUMPAD ]
Top:    [ MUTE ] [VOL_DN] [VOL_UP] [ PREV ] [ NEXT ]        [ F11// ] [ 7/F7 ] [ 8/F8 ] [ 9/F9 ] [  *  ]
Home:   [ LEFT ] [ DOWN ] [  UP  ] [RIGHT ] [PLAY/PAUSE]    [ 0/F10 ] [ 4/F4 ] [ 5/F5 ] [ 6/F6 ] [  -  ]
Bottom: [ HOME ] [PG_DN ] [PG_UP ] [ END  ] [ DEL  ]        [ F12/= ] [ 1/F1 ] [ 2/F2 ] [ 3/F3 ] [  +  ]
Thumbs:                                                     [   .   ] [   0  ]
```

#### Numpad to Fn-Pad Transformation:
Every number key morphs into its corresponding F-key when Shift is active (via **Sticky Shift** or held Shift):
- `1` through `9` $\rightarrow$ **`F1` through `F9`**
- `0` $\rightarrow$ **`F10`**
- `/` $\rightarrow$ **`F11`**
- `=` $\rightarrow$ **`F12`**

*Example*: Tap Left Inner Thumb (`Sticky Shift`), hold Left Outer Thumb (`Esc/Util`), and tap `5` $\rightarrow$ outputs **`F5`**.

---

### System Layer (`SYS`) — Bluetooth & Hardware Controls

*Activated automatically when holding **BOTH** Left Outer Thumb (`Esc`) and Right Outer Thumb (`Tab`) simultaneously.*

```
Top:    [BT_SEL 0] [BT_SEL 1] [BT_SEL 2] [BT_SEL 3] [BT_CLR]
Bottom: [RESET   ] [BOOTLOAD] [        ] [SCR_DN  ] [SCR_UP]  ...  [RESET]
```

- **`BT_SEL 0 - 3`**: Switch Bluetooth profile.
- **`BT_CLR`**: Clear Bluetooth bond for current profile.
- **`SCR_DN / UP`** (`F23 / F24`): Adjust dongle display brightness.
- **`RESET / BOOTLOAD`**: Soft reboot or enter UF2 bootloader mode.

---

## 3. Thumb Key Assignments

Totem provides 3 physical thumb keys per half (6 total), arranged as follows:

| Hand | Position | Primary Action | Hold Action | Behavior Description |
| :--- | :--- | :--- | :--- | :--- |
| **Left** | Outer | `Esc` | Layer 1 (`UTIL`) | Hold to access Right-Hand Numpad with right hand free |
| **Left** | Middle (Resting) | `Backspace` | *(None)* | Pure tap key; hold down to rapidly repeat deletion (balances `Space` on Right Middle) |
| **Left** | Inner (Tuck) | `Sticky Shift` | `Shift` (Hold) | Tap to capitalize next stroke; hold for normal Shift |
| **Right**| Inner (Tuck) | `Enter` | *(None)* | Pure tap key for submissions and newline |
| **Right**| Middle (Resting) | `Space` | *(None)* | Pure tap key for typing flow |
| **Right**| Outer | `Tab` | Layer 2 (`UTIL`) | Hold to access Left-Hand Nav/Media with left hand free |

---

## 4. Chords & Combos Reference

Combos allow typing common symbols and control keys without leaving the base layer or reaching for symbol layers.

### Horizontal Combos (Brackets & Essentials)

| Keys Pressed | Physical Position | Output | Description |
| :--- | :--- | :---: | :--- |
| `D + K` | Left Mid + Right Mid | **`Caps Word`** | Auto-disarming caps lock |
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
