# Mini Chaeto Reactor (10 gal reef)

All builds share the **deck plate**, the **LED tube** and the same lid design. Pick one:

| | A – acrylic tube | B – printed tube + cam-lock lid ring | **D – cam-lock both ends (newest)** | C – one-piece printed body |
|---|---|---|---|---|
| Body | purchased 3" OD x 1/8" wall clear acrylic, 190 mm | plain printed tube (`printed_tube`) on a separate base, siliconed | printed tube with lugs at both ends (`printed_tube_v2`) twisted into a socket base | tube + base printed as one piece (`printed_body`) |
| Printed parts | `base_acrylic`, `lid`, `deck_plate` | `printed_tube`, `base_sealed`, `lid_bayonet`, `bayonet_ring`, `deck_plate`, flat lid gasket (`gasket.stl`) | `printed_tube_v2`, `base_camlock`, `lid_bayonet`, `bayonet_ring`, `deck_plate`, 2 flat gaskets (`gasket_flat.stl`) | `printed_body`, `lid`, `deck_plate` |
| Lid retention | 3x M4 rods | ramped cam-lock ring, no rods | ramped cam-lock ring | 3x M4 rods |
| Tube-to-base | O-ring on plug | O-ring + silicone moat | **O-ring + cam-lock, no silicone** | one piece |
| Leak risk | low (acrylic) | low (see "Sealing") | low; fully serviceable | **known weak spot** at the wall/flange corner – kept for reference only |

Chamber: 69.85 mm ID x ~159 mm tall, ~0.5 L (about 1-2 cups of chaeto) after subtracting the LED tube.

## How it works
Water enters a side barb at the bottom, fills a plenum, and rises through the **deck plate** (2.5 mm holes), tumbling the chaeto. It leaves through the **lid screen** (2 mm holes) into an upper plenum with a 45 deg roof (prints without supports; air collects at the apex where the **vertical outlet barb** is). A 25 mm test tube stands in a socket ring on the deck plate and passes through a column in the lid, sealed with a 24 x 2 mm O-ring. The LED strip lives dry inside the test tube.

## Bill of materials
- Test tube, rimless borosilicate **25 x 200 mm**
- LED strip, 8-10 mm wide, ~185 mm x 3 (one per face of `led_spine`), 12/24 V, no need for waterproof
- Gaskets: print them in TPU (`gasket.stl`, below) or buy O-rings: **64 x 2.5 mm** x1 (Options B/C) or x2 (Option A, one each end), **24 x 2 mm** x1 for the test tube
- Options A / C only: 3x M4 threaded rod ~225 mm, 3x M4 hex nuts, 3x M4 nut + washer
- Option B only: a small tube of **aquarium-safe 100% silicone** (no mold inhibitors) for the base moat (Option D needs none)
- 2x hose, 1/2" (12 mm) ID, to a small pump (~100-300 L/h, throttled) and back
- Option A only: acrylic tube 76.2 mm OD x 3.175 mm wall, cut to 190 mm

## Option B: printed tube + cam-lock ring
Why this instead of a screw thread or a one-piece body:
- A 76 mm printed thread needs ~0.3 mm accuracy, and a 190 mm PETG tube is never that round at the top. The ring has ~1 mm clearances and three lugs, so it cannot cross-thread.
- The lug undersides are a **spiral ramp** (about 3 deg, like a hammer-union cam): turning the ring wedges it down, which squeezes a **flat gasket** between the tube rim and the lid flange from 2.0 mm to 1.4 mm. The ramp is shallow enough to be self-locking, and a stop wall ends the turn.
- The lid also has its own plug O-ring, so the flat gasket is a second seal. Do not overtighten: the stop and the gasket thickness set the clamp.
- The plain tube has continuous perimeters and **no thin-wall-to-thick-block junction**, which is where the one-piece body leaked.

How it travels (checked in CAD): the ring drops on with the tabs in the gaps between the lugs and turns freely for about 50 deg, then the ramp engages and pulls it down over the next ~16 deg, then a 5 deg flat dwell and the stop (70.5 deg total, clockwise). There is no click or detent; it is held by the self-locking ramp and the gasket's spring. For vibration-prone setups, add a zip tie through a ring scallop and around a lug.

**Print (PETG; transparent PETG shows voids, so dry it first):**
- `printed_tube`: upright. Walls are 3.1 mm: use 8 perimeters / variable-width walls. Lug undersides are 45 deg cones, no supports.
- `base_sealed`: flange on the bed. Inlet barb is horizontal and may want a little support.
- `lid_bayonet`: as modelled (screen on the bed, barb up).
- `bayonet_ring`: as exported, lip on the bed. The tabs have 45 deg tops, no supports.
- Flat lid gasket: in `gasket.stl` (TPU, 2.0 mm). Or cut a ring from 1.5-2 mm EPDM/silicone sheet: 76.2 mm OD, 70.2 mm ID.
- `bayonet_test`: print this with `bayonet_ring` **first** (a short slice of the tube top plus a stand-in lid flange). Stack coupon, gasket, flange disc, ring. The ring should drop on, turn freely, then tighten against the gasket and stop at the end.

**Assemble:**
1. Fit the 64 x 2.5 gasket/O-ring in the plug groove (it is low on the plug, near the flange).
2. Run a bead of aquarium silicone into the moat in the flange top, then push the tube down over the plug onto the flange. Smooth a fillet of silicone up the outside of the tube. Let it cure 24-48 h before filling.
3. Drop the deck plate onto the plug rim.
4. Fit the 24 x 2 gasket in the lid column, push the test tube (LED inside) down through the lid into the deck-plate socket.
5. Lay the flat gasket on the tube rim and lower the lid onto it (its plug O-ring seals too).
6. **Before connecting hoses:** put the ring over the lid so its tabs sit in the gaps between the lugs, press down until the lip rests on the lid flange, then turn **clockwise** until it stops (about 70 deg). It will get firmer over the last ~16 deg. Counter-clockwise to remove.
7. Connect hoses, run it, bleed air by tilting, add chaeto and adjust flow until it just tumbles.

Tuning (in `params.scad`): if the ring is too stiff over the last few degrees, raise `lg_comp` (less squeeze, e.g. 1.6). If the lid still feels loose or weeps at the rim, lower `lg_comp` (more squeeze, e.g. 1.2). `lg_comp` has to stay below `lg_free` (2.0). Re-export `printed_tube` and `bayonet_ring` after changing it, because the lug height depends on it.

## Option D: cam-lock at both ends
Same idea as the lid lock, turned upside down for the base. `printed_tube_v2` has lugs at both ends. `base_camlock` has a 12 mm collar around the plug with three inward tabs. Drop the tube in with its bottom lugs in the gaps between the tabs and twist the **tube clockwise** about 70 deg: the lug ramps ride under the tabs and pull the tube down onto a flat gasket on the flange top, 2.0 mm squeezed to 1.4 mm, with the plug O-ring as the second seal. No silicone, and the tube comes off again for cleaning.

Why the tube twists instead of a second ring: a ring with a closed lip cannot be slipped onto a tube that has lugs at both ends. The socket in the base does the ring's job.

Both locks turn clockwise, so tightening the lid ring (which drags the tube a little through the gasket) tightens the base rather than loosening it. The plug O-ring groove is 3 mm higher on this base so the O-ring sits against the full-diameter bore, above the tube's lead-in chamfer.

**Print (PETG, dried):**
- `printed_tube_v2`: upright; the bottom lugs sit on the bed. Top lugs have 45 deg undersides, no supports.
- `base_camlock`: flange on the bed. The tabs inside the collar have 45 deg undersides, no supports. Inlet barb may want a touch of support.
- `lid_bayonet`, `bayonet_ring`, `deck_plate`: as for Option B.
- `gasket_flat`: two 2.0 mm TPU flat gaskets (one per end). Or cut from 1.5-2 mm EPDM/silicone sheet: 76.2 mm OD, 70.2 mm ID.
- `camlock_test_tube` + `camlock_test_base`: print these **first**, with a gasket. The tube slice should drop in, turn freely, firm up over the last ~16 deg and stop. Then `bayonet_test` + `bayonet_ring` for the top, as before.

**Assemble:**
1. 64 x 2.5 gasket/O-ring into the plug groove. Flat gasket onto the flange top, inside the collar.
2. Lower the tube over the plug with its bottom lugs between the tabs, press down, twist **clockwise** until it stops.
3. Deck plate onto the plug rim; 24 x 2 gasket into the lid column; test tube (LED inside) down through the lid into the deck socket.
4. Flat gasket on the tube rim, lid on, ring on with its tabs between the top lugs, press down, twist **clockwise** to the stop. Do this before connecting hoses.
5. Hoses, run, bleed air, add chaeto. To open: ring counter-clockwise; to remove the tube from the base: tube counter-clockwise.

Tuning is the same `lg_comp` as Option B (both ends share it); re-export `printed_tube_v2`, `base_camlock` and `bayonet_ring` after changing it. Checked in CAD only: the tube drops in, turns freely, wedges down over the ramp, stops at the stop wall, and clears the deck plate, lid and ring. Not yet printed.

## Sealing printed parts (Options B and C)
Printed PETG, even at 100% infill, is porous at layer joins and thin-to-thick transitions. A leak with no pressure is seepage, not a hole.
- **Epoxy-coat everything wet.** Use a two-part epoxy rated safe for fish and invertebrates (Pond Armor is the usual choice; check the label). Scuff with 220 grit, wipe with isopropyl, pour into the plenum and rotate to coat, pour out the excess, then brush the chamber floor, deck ledge and tube bore. Two coats, then cure about a week and rinse before it goes near the tank. Leak-test with plain water in a bucket first.
- **Dry the filament** (4-6 h at 60-65 C). Wet PETG leaves bubbles and voids.
- Print hotter and slower: nozzle ~240-250 C, outer walls 30-40 mm/s, flow +3-5%.
- The base has a 5 mm floor and a chamfered plenum corner so there is no sharp wet corner, the plug O-ring sits low so it is the last barrier before the base corner, and the **moat** gives silicone a mechanical key instead of relying on adhesion to PETG.

## TPU gaskets (optional)
`gasket.stl` is one plate with two 64 mm-ID tube gaskets, one 24 mm-ID test-tube gasket (same ID and section as the O-rings, rounded-square so they print flat), and the 2.0 mm flat lid gasket for Option B.
- 95A TPU, 0.2 mm layers, 100% infill, 20-30 mm/s, no supports, little or no retraction. Direct drive is much easier.
- Trim strings; reprint any that look porous. A thin smear of silicone grease helps them seat and slide.
- **Not tested for sealing.** If a printed gasket weeps, use a real O-ring; nothing else changes.

## Before you print
- **Measure your acrylic's real ID** (Option A) and set `tube_wall`/`tube_od` in `openscad/params.scad`. Grooves are derived from it for ~15% squeeze.
- Option B bore is `tube_id + printed_bore_tol` (0.1 mm). If the tube is a tight fit on the plug, raise `printed_bore_tol`.
- None of this has been fully print-tested. Print the lid first and the bayonet coupon second.
- Empty test-tube buoyancy is roughly cancelled by glass + LEDs; O-ring friction should hold it.
- Keep LED power low (a few watts).

## Files
- `openscad/params.scad` – every dimension you may want to change
- `openscad/*.scad` – one file per part, plus `assembly_acrylic.scad`, `assembly_printed.scad` (Option C), `assembly_tube.scad` (Option B) and `assembly_camlock.scad` (Option D) for viewing
- `stl/` – pre-exported STLs; regenerate with `make` (needs OpenSCAD; the lid takes a few minutes)
