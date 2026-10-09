# Chicago Stenographer (CS) Keycaps for Toucan (Choc v2 / Choc Spacing)

This folder contains pre-configured 3D printable models for the **Chicago Stenographer (CS)** ergonomic keycap profile, specifically customized for **Kailh Choc v2 (MX stem)** and **Choc spacing (18 mm × 17 mm)**.

The models in [`stl/`](./stl/) are **sprued**: the keycaps are joined together by thin 1 mm runners (like a plastic model kit). This allows JLCPCB to treat each cluster as a **single part**, avoiding per-part handling fees and reducing the total print cost from ~$60+ down to **~$15–$25**.

---

## Files & Order Quantities (36-Key Toucan Layout)

You can find the ready-to-upload files in the [`stl/`](./stl/) folder (or extract from [`chicago-steno-toucan-jlcpcb.zip`](./chicago-steno-toucan-jlcpcb.zip)):

| STL File | Description | Keys per Sprue | Qty to Order | Total Keys Received |
| :--- | :--- | :---: | :---: | :---: |
| [`r24-1u-normal-x10.stl`](./stl/r24-1u-normal-x10.stl) | Top row (R2) & Bottom row (R4) keys | 10 | **2** | 20 (exact match for 10 top + 10 bottom) |
| [`r3-1u-normal-x10.stl`](./stl/r3-1u-normal-x10.stl) | Home row (R3) regular alpha keys | 10 | **1** | 10 (8 needed + 2 spares) |
| [`r3-1u-homingbar-x2.stl`](./stl/r3-1u-homingbar-x2.stl) | Home row (R3) tactile homing-bar keys | 2 | **1** | 2 (1 left index, 1 right index) |
| [`t1-1u-normal-left-x3.stl`](./stl/t1-1u-normal-left-x3.stl) | Left thumb cluster | 3 | **1** | 3 (exact match) |
| [`t1-1u-normal-right-x3.stl`](./stl/t1-1u-normal-right-x3.stl) | Right thumb cluster | 3 | **1** | 3 (exact match) |
| **Total** | | | **6 items** | **38 keys** |

---

## How to Get Contrast-Color Thumb Keys on JLCPCB

You **do not** need to sacrifice contrast colors! Because the thumb clusters are in separate STL files, JLCPCB allows you to assign different colors or materials to individual parts in the same cart:

### Recommended Two-Tone Option (MJF PA12 with Vapor Smoothing)
1. **Alpha Rows** (`r24-1u-normal-x10.stl`, `r3-1u-normal-x10.stl`, `r3-1u-homingbar-x2.stl`):
   - **Material**: `MJF (PA12-HP Nylon)`
   - **Color**: `Dyed Black`
   - **Post-Processing / Surface Finish**: `Chemical Vapor Smoothing`
2. **Thumb Clusters** (`t1-1u-normal-left-x3.stl`, `t1-1u-normal-right-x3.stl`):
   - **Material**: `MJF (PA12-HP Nylon)`
   - **Color**: `Natural Grey` (undyed light grey/stone)
   - **Post-Processing / Surface Finish**: `Chemical Vapor Smoothing`
   - *Result*: A sleek two-tone aesthetic with jet-black alphas and contrasting light grey thumbs, all uniformly vapor-smoothed.

### Alternative Two-Tone Option (SLA Resin)
If you prefer ultra-smooth glossy/satin resin instead of nylon:
1. **Alphas**: `SLA` -> `Imagine Black Resin` (or 8001 Black).
2. **Thumbs**: `SLA` -> `White Resin (8000/9000R)` or `Transparent Frosted Resin`.

---

## Step-by-Step JLCPCB Ordering Guide

1. Go to **[jlcpcb.com/3d-printing](https://jlcpcb.com/3d-printing)**.
2. Drag and drop the 5 STL files from [`stl/`](./stl/) into the upload window.
3. For each file, configure the parameters:
   * **`r24-1u-normal-x10.stl`**: Set **Quantity = 2**.
   * **`r3-1u-normal-x10.stl`**: Set **Quantity = 1**.
   * **`r3-1u-homingbar-x2.stl`**: Set **Quantity = 1**.
   * **`t1-1u-normal-left-x3.stl`**: Set **Quantity = 1**.
   * **`t1-1u-normal-right-x3.stl`**: Set **Quantity = 1**.
4. Set the technology & material:
   * **Technology**: `MJF`
   * **Material**: `PA12-HP Nylon`
   * **Color**: `Dyed Black` (or `Natural Grey` for thumbs)
   * **Surface Finish**: Check `Chemical Vapor Smoothing`
5. Add to Cart and select your shipping method:
   * **DHL Express / FedEx IP**: ~2–4 business days delivery.
   * **Global Standard Line**: ~7–12 business days delivery.

---

## When They Arrive

1. Use a pair of flush cutters (or small nail clippers) to snip the 1 mm sprue runners attaching each keycap to the frame.
2. If there is a tiny burr left where the runner was connected, a quick pass with a fingernail emery board or fine sandpaper (400–600 grit) will make the edge completely seamless.
3. Press onto your Kailh Choc v2 switches:
   * **Top row**: `r24` keys with the slant sloping down towards home row.
   * **Home row**: `r3` keys with the `homingbar` keys on your index finger positions.
   * **Bottom row**: `r24` keys rotated 180° so the slant slopes down towards home row.
   * **Thumbs**: `t1-left` on the left half, `t1-right` on the right half.
