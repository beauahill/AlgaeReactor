# Mini Chaeto Reactor (10 gal reef)

Two builds that share the same **lid**, **deck plate** and **LED tube**:

| | Option A – acrylic tube | Option B – fully printed |
|---|---|---|
| Body | purchased 3" OD x 1/8" wall clear acrylic tube, 190 mm long | one printed piece (wall + base), 210 mm tall |
| Printed parts | `base_acrylic`, `lid`, `deck_plate` | `printed_body`, `lid`, `deck_plate` |
| See chaeto? | yes | no (opaque) |
| Seal | O-ring at each tube end | O-ring at lid; body is one piece |

Both give a ~0.5 L chaeto chamber (69.85 mm ID x ~159 mm tall, minus the LED tube) – roughly 1-2 cups of loosely packed chaeto, which is about right for a 10 gal.

## How it works
Water enters a side barb at the bottom, fills a plenum, and rises through the **deck plate** (2.5 mm holes), tumbling the chaeto. It leaves through the **lid screen** (2 mm holes) into an upper plenum with a 45 deg roof (no supports; any air collects at the apex where the **vertical outlet barb** is). A 25 mm test tube stands in a socket ring on the deck plate and passes through a column in the lid, sealed with a 24 x 2 mm O-ring. The LED strip lives dry inside the test tube.

## Bill of materials
- Test tube, rimless borosilicate **25 x 200 mm** (the LED tube)
- LED strip, 8-10 mm wide, ~185 mm x 3 (one per face of `led_spine`) – 12/24 V, no need for waterproof; use a red/blue or full-spectrum "grow" ratio
- O-rings: **64 x 2.5 mm** x2 (Option A) or x1 (Option B) – tube ends; **24 x 2 mm** x1 – test tube. Nitrile or silicone.
- 3x M4 threaded rod, ~225 mm; 3x M4 hex nuts (trapped in the base), 3x M4 nut + washer (or wing nut) on top
- 2x hose, 1/2" (12 mm) ID, to a small pump (~100-300 L/h, throttled) and back to the tank/sump
- Option A only: acrylic tube 76.2 mm OD x 3.175 mm wall, cut to 190 mm (7.5"), ends square

## Print notes
- **PETG or ASA** (PLA will creep/soften near the LEDs and in a warm room). Not tested with food-contact claims; it's a reef pump loop, so use aquarium-safe filament and rinse well.
- 0.2 mm layers, **>= 4 perimeters, 100% infill or 5+ top/bottom layers** so walls are watertight. Printed body wall is 3.2 mm (8 perimeters at 0.4).
- Orientations (all print as exported, no supports except noted):
  - `lid`: as modelled (plug down, screen on the bed, barb pointing up) – roof is 45 deg
  - `base_acrylic` / `printed_body`: flange on bed; the **horizontal inlet barb** may want a little support under it
  - `deck_plate`: flat, socket ring up
  - `led_spine`: upright, or lying down
- Printed body is **210 mm tall** – needs a >= 210 mm Z build volume. If yours is shorter, reduce `tube_len` in `params.scad` (and use a shorter test tube), or use Option A.

## Assembly
1. Seat the O-rings in the plug grooves (Option A base, lid plug).
2. Option A: push the acrylic tube over the base plug and lid plug. Option B: drop in nothing – the lid plug goes straight into the printed body.
3. Drop the deck plate onto the plug rim / printed ledge (it just rests there so you can lift it out for cleaning).
4. Fit the 24 x 2 mm O-ring in the lid column groove, then push the test tube (LED already inside) down through the lid until it sits in the deck-plate socket. It protrudes ~11 mm above the lid for the wires.
5. Thread the M4 rods through the lid and base, nuts in the base pockets, and snug the top nuts evenly. Rods only keep the lid from popping under back-pressure; do not crank them.
6. Hose: pump -> bottom barb, top barb -> back to the display or sump. Run it, bleed air by tilting, then add chaeto and adjust flow until it just tumbles.

## Things to check before you print
- **Measure your acrylic's actual ID** and set `tube_wall`/`tube_od` in `openscad/params.scad`. Extruded tube varies by a few tenths. The O-ring grooves are derived from it for ~15% squeeze.
- This design has **not been printed or leak-tested**. Print the lid first (smallest, most complex) and test-fit the tube and O-rings before committing to the tall body.
- Buoyancy of the empty test tube is roughly cancelled by glass + LED weight; the O-ring friction should hold it. If yours floats up, add a small weight inside.
- Keep LED power low (a few watts) – the strips are in air inside glass and heat is shed into the water through the tube.

## Files
- `openscad/params.scad` – every dimension you may want to change
- `openscad/*.scad` – one file per part, plus `assembly_acrylic.scad` / `assembly_printed.scad` for viewing
- `stl/` – pre-exported STLs; regenerate with `make` (needs OpenSCAD)
