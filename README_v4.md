# Chaeto Algae Reactor v4.4 — MOSTLY PRINTED (10 gal reef)

## v4.4: inlet barb + outlet fixes (reprint body and lid)

- **Outlet now actually goes through the lid.** In v4.3 the grate slots
  stopped at z = 20.9 and the plenum started at z = 23, so 2 mm of solid lid
  capped the outlet. Now the slots cut a 1.6 mm grate web at the lid ceiling
  straight into the plenum, which feeds the bore and barb in one open path.
- **Outlet moved inward: `out_pos` 34 → 28.5.** At 34 the outlet sat over
  the body rim and gasket groove (the water side is only r < 34.5), so the
  rim half-blocked it and it was a leak path. At 28.5 the bore clears the
  neck opening by ~1.2 mm and the grommet counterbore by ~2.7 mm.
  Outlet grate: 3 × 2.4 mm slots in an 11 mm circle (chaeto stays in).
- **Inlet boss blends into the wall.** The stand-off boss used to be a plain
  cylinder whose square back end stuck out of the curved wall as a
  sharp-edged half-moon. It is now a hull from the barb face back to a disc
  buried in the wall, so it grows out of the body as one smooth fairing.
  Hose clearance is unchanged (boss face still at y = 36).
- **Barb profile cleaned up (inlet and outlet):** a 45° root cone instead of
  a square step from the boss face to the shank, a 0.6 mm flat land on each
  ridge crest instead of a knife edge, and a chamfered tip so the hose
  starts on easily.


## v4.3: amphipod intake prefilter

**`v4_intake_prefilter.stl` (print 1)** — a slotted cage that press-fits over
the pump's intake stub so amphipods never get pumped into the reactor and
start grazing the crop.

- **0.6 mm vertical slots** (48 of them, ~44 mm tall): blocks adult pods and
  most juveniles while leaving ~15 cm² of open area, so face velocity at
  50–80 GPH stays ~5–8 cm/s — too low to pin pods against the screen or clog
  quickly.
- **Socket:** 16 mm bore by default with 3 crush ribs for grip —
  **MEASURE YOUR PUMP'S INTAKE STUB** and set `pf_stub_d` before printing.
  Loose fit? Zip-tie the socket. 
- **Mesh upgrade path:** two outer grooves hold rubber bands, so if juvenile
  pods still sneak through, wrap the cage in **300 µm nylon mesh** (filter
  sock material) banded into the grooves. That's full pod-proof.
- Closed floor so it doesn't vacuum detritus off the sump/tank bottom.
- Print upright, no supports. Clean the slots with a feeler gauge or card
  stock if your first layer squished them.

Maintenance: swish it during water changes — pods that collect on the outside
go back to being tank janitors, which is where you want them.

## v4.2: perforated spokes

Spokes widened to 5 mm and perforated with 3× 2.6 mm holes each (18 holes per
ring, the middle one piercing the stiffener ring), so light from the center
tube bleeds through every level instead of each ring casting spoke shadows on
the puck below. Zero structural load on these parts in water, so the holes
cost nothing.

## v4.1: divider rings

**3 printed grate rings glue onto the glass test tube** and split the chamber
into **4 tumble levels** (at z = 45 / 85 / 125 mm), so the chaeto stays as
separate pucks instead of compacting into one dense ball.

- **Ring:** 66 mm OD grate (6 spokes + a concentric stiffener ring), 2.4 mm
  thick, with a 10 mm tall glue collar. Grate slots are ~5.5 mm — water,
  light, and swirl pass through; chaeto doesn't.
- **Fit:** bore is 26.0 mm over the 25.4 mm tube = 0.3 mm glue gap per side,
  with 3 vertical glue channels in the collar so the adhesive has somewhere
  to live and the ring still seats square.
- **Glue:** reef-safe cyanoacrylate **gel** (the same stuff you frag corals
  with) or a thin bead of aquarium-safe silicone. Glass + PETG + CA gel is a
  strong bond; scuff the glass with fine sandpaper at the glue spots first.
- **Assembly order matters:** rings OD (66) clears the neck opening (69), so
  glue the rings to the tube FIRST, lower the tube+rings assembly into the
  body, then thread the lid down over the tube top and seat the grommet.
- **Harvest:** pull the whole tube straight up through the grommet — the
  rings come with it, each level's puck sitting on its ring like a kebab.
  Easiest harvest of any version.

Ring displacement is ~6 mL each, so water volume stays ~606–624 mL.

---

Same mostly-printed approach as v3, with the two fixes you asked for:

1. **Center light well is now a PURCHASED glass part** — a 25 × 200 mm
   borosilicate test tube (~$3). No printed "clear" part, because printed
   PETG never gets transparent enough to be a real light pipe. The test tube
   hangs through the lid on a **25 mm rubber grommet** that snaps into a
   printed seat; inside stays bone dry, open to air at the top. The LED wand
   slides down into it.
2. **Inlet barb moved onto a stand-off boss** so the hose ridges fully clear
   the curved outer wall. On v3 the wall bulge buried the first ~2 ridges and
   the tubing couldn't seat. Measured clearance now: **+2.4 mm** between a
   seated 1/2" hose and the wall (v3 was an actual overlap).

**In-tank water volume: 624 mL (0.165 gal)** — measured from the rendered
cavity mesh (test-tube displacement subtracted), not hand math. ~1.65% of a
10 gal system.

Overall size: **80 mm (3.15") OD × 170 mm (6.7") tall** body; the test tube
sticks ~27 mm above the lid for an easy pull.

## How it works
- **Body** is a single print: solid floor, thin translucent window wall, and
  a thick threaded neck at the top. A tangential inlet barb low on the wall
  fires water in a swirl so the chaeto tumbles — no diffuser plate. The barb
  now sits on a short stand-off boss so your tubing actually fits.
- **Lid** screws on (3-start coarse thread, ~1/3 turn on/off). Sealing is a
  dedicated foam-cord **face gasket** in the lid ceiling pressing on the body
  rim — the thread only supplies clamping force. Hand-tight; zero-pressure
  vessel.
- **Light well = glass test tube** through a grommet in the lid center. That
  grommet sits at the lid face, above the waterline, so it only holds the
  tube's weight, not water pressure. Pull the tube (and the whole LED
  assembly) straight up without opening the reactor.
- Water exits a slot grate in the lid and out a vertical barb.
- **Harvest:** 1/3 turn, lift the lid, grab half the ball, re-seat.

## Printed parts
| Part | Qty | Print orientation | Notes |
|---|---|---|---|
| `v4_body.stl` | 1 | Upright, neck up | Translucent PETG. Supports under the inlet barb/boss only. |
| `v4_lid.stl` | 1 | Top face down (barb up) | Threads print cleanest this way. Supports under the outlet barb only. |
| `v4_led_wand.stl` | 1 | Flat on the bed | Any material, stays dry. No supports. Sized to slide inside the 25 mm tube bore. |
| `v4_divider_ring.stl` | **3** | Flat on the bed | PETG. No supports. Glued to the glass tube with reef-safe CA gel. |
| `v4_intake_prefilter.stl` | 1 | Upright, floor down | PETG. No supports. Set `pf_stub_d` to your pump's intake stub OD first. |

No printed well anymore — that's the glass tube.

## Print settings (critical — this is a water vessel)
- **Material: PETG**, translucent for the body (PLA softens in warm
  saltwater).
- **No infill pattern** — the modeled wall IS the wall (2.5 mm). Set **0%
  infill** and raise **perimeter count** until the wall fills solid: at
  0.4 mm nozzle that's **6 perimeters**. Partial-fill walls weep.
- **Bottom shell: 7 mm** so the floor fully solid-fills.
- 0.2 mm layers, 215–230 °C nozzle / 70–80 °C bed, your usual PETG profile.
- Don't skip the support touchpoints under the barbs or you'll get droop.

## Buy list (BOM)
- **25 × 200 mm borosilicate test tube** (~$3) — the center light well.
- **25 mm (1") rubber grommet** to fit a ~32 mm panel hole — holds the tube
  in the lid. (Panel hole + counterbores are modeled; grommet groove web is
  2.4 mm — confirm against the grommet you buy and tweak `grommet_web_t` /
  `grommet_hole_d` if needed.)
- **1/8" (3 mm) silicone foam cord**, ~230 mm — the lid-to-body face gasket
  (one ring, superglue the ends).
- **1/2" ID vinyl tubing** + small pump, **50–80 GPH** for a 10 gal. Lazy
  tumble, not a blender.
- **LED strip**, 10 mm wide, 6500 K white or red/blue grow, ~40 cm. Reverse
  photoperiod smooths overnight pH.
- **Reef-safe CA gel** (coral frag glue) for the divider rings.
- *(optional)* **300 µm nylon mesh** + 2 rubber bands — juvie-proof sleeve
  for the intake prefilter.
- Ball of chaeto to seed it — split into 4 small pucks, one per level.
  **Rinse/shake each puck in a cup of tank-temp FRESH water for ~30 s first**:
  pods bail out of chaeto instantly in freshwater, chaeto itself shrugs off a
  short dip. Start the reactor pod-free or the screen is pointless.

## Assembly
1. Scuff the glass tube lightly at 45 / 85 / 125 mm from the bottom, glue the
   3 divider rings on (collar down) with CA gel, let cure fully.
2. Glue a ring of foam cord into the lid's gasket groove.
3. Snap the grommet into the lid's center seat.
4. Drop a chaeto puck into each level as you lower the tube+rings assembly
   into the body (bottom level first, then stack).
5. Push the tube top through the lid grommet and thread the lid down,
   hand-tight (~1/3 turn). A smear of silicone grease on the grommet helps.
6. Stick the LED strip to the wand, slide the wand into the test tube.
7. Plumb inlet (side barb, lower on the body) and outlet (top barb on lid).
8. **Leak-test in a bucket before it goes near the tank** — printed threads +
   grommet are new territory; find a weep in the bucket, not on your stand.

## Notes / trade-offs
- Glass test-tube well passes far more light than any printed part would, and
  lights the chaeto from the core out (where light normally dies in the
  middle of the ball). Still, translucent PETG walls at 6 perimeters pass
  less than clear acrylic — if the chaeto looks pale after a couple weeks,
  run a brighter/closer light.
- Barb clearance is +2.4 mm — it clears, but it's a snug reach. If you run
  thicker-walled tubing, bump `boss_face_y` a couple mm and re-render the
  body.
- Threads/grommet are mechanical connections you built — inspect the gasket
  and grommet every few months like any union fitting.

## Files
- `algae_reactor_v4.scad` — fully parametric. `part = "assembly" | "body" |
  "lid" | "led_wand" | "divider_ring" | "intake_prefilter" | "water_cavity"`
  at the top controls what renders. Key knobs: `body_od`, `body_h`, `tube_od`,
  `grommet_hole_d`, `grommet_web_t`, `boss_face_y`, `ring_z` (divider
  heights), `ring_bore`, `pf_stub_d` (pump stub OD), thread params.
- `v4_*.stl` — rendered at the dimensions above, ready to slice.
- `preview_v4.png` — render of all parts + the change notes.
