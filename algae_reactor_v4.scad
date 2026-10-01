// ============================================================
// Chaeto Algae Reactor v4 — MOSTLY PRINTED (10 gal reef)
// Body + base = ONE PIECE, printed in translucent PETG.
// Lid = printed, 3-start coarse thread, ~1/3-turn on/off,
//       sealed by 1/8" silicone foam cord face gasket.
// Center light well = PURCHASED 25 x 200 mm borosilicate test
//       tube, hung through the lid via a 25 mm rubber grommet
//       snapped into a printed panel seat. Dry inside; LED wand
//       slides in from the top. (Printed "clear" wells don't
//       pass enough light — glass does.)
// Inlet = tangential barb on a STAND-OFF BOSS so the hose
//       ridges fully clear the curved outer wall (v3 bug: the
//       wall bulge buried the first two ridges; tubing could
//       not seat).
// NO threaded rods, NO acrylic body tube, NO glue.
// Units: mm
// ============================================================

part = "assembly"; // ["assembly","body","lid","led_wand","divider_ring","intake_prefilter","water_cavity"]

// ---------------- Body ----------------
body_od    = 80;      // outer diameter of printed tube
body_wall  = 2.5;     // translucent PETG window wall (all perimeters)
body_h     = 170;     // total height incl. base
base_t     = 7;       // solid printed floor
body_id    = body_od - 2*body_wall;

// ---------------- Neck / thread ----------------
neck_h       = 14;    // threaded region height
neck_wall    = 5.5;   // thickened wall at the neck (rim seat)
thread_lobe  = 2.2;   // thread radial depth
thread_starts= 3;
thread_twist = 130;   // deg of twist over neck_h  (~1/3 turn engage)
thread_clear = 0.45;  // female clearance (PETG)
lobe_d       = 6.5;   // thread profile roundness

// ---------------- Lid ----------------
lid_wall   = 4;
lid_top_t  = 10;
lid_skirt  = neck_h + 7;
grip_n     = 24;

// ---------------- Gasket (1/8" foam cord, face seal) ----------
rim_mid_r  = body_od/2 - neck_wall/2;   // center of the flat rim
groove_w   = 4.8;
groove_d   = 2.6;

// ---------------- Light well: PURCHASED test tube -------------
// 25 x 200 mm borosilicate test tube (~$3). Bottom rests in the
// floor cradle; top sticks ~27 mm above the lid for easy pull.
tube_od        = 25.4;  // nominal 25 mm tube + tolerance
grommet_hole_d = 32;    // panel hole the grommet snaps into
grommet_web_t  = 2.4;   // printed "panel" thickness for the grommet groove
grommet_cb_d   = 42;    // counterbore for the grommet flanges, both sides

// ---------------- Inlet barb (1/2" ID vinyl) ----------------
barb_bore    = 9.5;
barb_base_d  = 12.6;
barb_ridge_d = 15.6;
barb_len     = 26;
inlet_z      = base_t + 10;
boss_d       = 17;    // stand-off boss diameter
boss_face_y  = 36;    // barb root face distance from body axis:
                      // wall bulge at the hose's near edge is |y|=32.9,
                      // so 36 gives 3+ mm of hose clearance all the way on

// ---------------- Outlet ----------------
out_pos    = 28.5;    // radial offset of outlet. Must sit INSIDE the neck
                      // opening (r < 34.5) or the body rim blocks it and
                      // it cuts into the gasket groove (v4.3 bug: was 34),
                      // and outside the grommet counterbore (r > 21).
out_grate_d = 11;     // grate / plenum diameter under the outlet bore
out_web_t  = 1.6;     // grate web thickness at the lid ceiling
slot_w     = 2.4;

// ---------------- Divider rings (print 3) --------------------
// Glued onto the glass test tube; split the chamber into tumble
// levels. Grate disc (spokes + concentric ring) so flow and light
// pass but chaeto pucks stay per level. OD 66 < neck_id 69 so the
// tube+rings assembly drops through the neck before the lid goes on.
ring_bore  = tube_od + 0.6;  // slip fit over glass + glue gap
hub_od     = 33;             // glue collar OD
hub_h      = 10;             // glue collar height (bond area)
ring_od    = 66;             // 4.5 mm radial gap to the 75 mm wall
ring_t     = 2.4;            // grate disc thickness
rim_w      = 3;              // outer rim radial width
mid_ring_r = 23.25;          // concentric stiffener ring, center radius
mid_ring_w = 2.5;
spoke_n    = 6;
spoke_w    = 5;              // wide enough to carry the light holes
spoke_hole_d = 2.6;          // perforation holes down each spoke (light bleed)
spoke_hole_r = [18.5, 23.25, 28];  // hole radii (middle one pierces the stiffener ring)
ring_z     = [45, 85, 125];  // ring heights on the tube (from body z=0)

// ---------------- Pump intake prefilter (amphipod screen) ----
// Slotted cage that press-fits over the pump's intake stub in
// the tank/sump. 0.6 mm slots stop adult + most juvenile pods
// while keeping face velocity low (~15 cm^2 open area) so the
// screen doesn't pin pods against itself or clog fast.
// Two outer grooves hold rubber bands if you add a 300 um mesh
// sleeve for full juvie-proofing.
pf_stub_d   = 16;    // pump intake stub OD — MEASURE YOUR PUMP
pf_stub_len = 14;    // socket depth over the stub
pf_od       = 42;    // cage outer diameter
pf_len      = 60;    // cage length (slotted section + floor)
pf_wall     = 2.0;
pf_floor    = 2.4;   // closed bottom (don't vacuum the sand bed)
pf_slot_w   = 0.6;   // slot width: blocks pods, passes water
pf_slot_n   = 48;    // ribs between slots ~2.1 mm: prints clean
pf_slot_z0  = 8;     // slot band start
pf_slot_z1  = 52;    // slot band end
pf_sock_od  = pf_stub_d + 2*2.4;

// ---------------- LED wand (fits the 22 mm tube bore) --------
wand_w   = 17;        // diagonal 17.5 mm < 22 mm tube ID: slides in
wand_t   = 4;
wand_len = 185;
strip_w  = 11;
strip_d  = 1.5;

$fn = 120;

// ============================================================
// Helpers
// ============================================================
// root_d: diameter of the face the barb grows out of. A short
// 45-deg cone blends it into the shank, so there's no square
// step / sharp corner at the root.
module barb(root_d=boss_d) {
    root_h = (root_d - barb_base_d)/2;
    // root fillet cone
    cylinder(d1=root_d, d2=barb_base_d, h=root_h + 0.01);
    // shank, with a chamfered tip so the hose starts on easily
    cylinder(d=barb_base_d, h=barb_len - 1);
    translate([0,0,barb_len - 1.01])
        cylinder(d1=barb_base_d, d2=barb_base_d - 1.6, h=1.01);
    // ridges: small flat land on each crest (no knife edge to
    // nick the tubing or curl when printed), then the taper
    for (i=[0:2])
        translate([0,0,5 + i*7]) {
            cylinder(d=barb_ridge_d, h=0.6);
            translate([0,0,0.59])
                cylinder(d1=barb_ridge_d, d2=barb_base_d-0.6, h=4.41);
        }
}

// 2D profile: circle + N round lobes -> twisted = multistart thread
module thread_profile(r_base, depth, clearance=0) {
    circle(r=r_base + clearance);
    for (a=[0:360/thread_starts:359])
        rotate([0,0,a])
            translate([r_base + clearance, 0])
                scale([depth/ (lobe_d/2), 1])
                    circle(d=lobe_d + 2*clearance);
}

// male thread block (to union onto neck OD)
module thread_male(r_base) {
    linear_extrude(height=neck_h, twist=thread_twist, convexity=10)
        thread_profile(r_base, thread_lobe);
}

// female thread cavity (to subtract from lid)
module thread_female(r_base) {
    translate([0,0,-0.01])
    linear_extrude(height=neck_h + 2, twist=(neck_h+2)/neck_h*thread_twist, convexity=10)
        thread_profile(r_base, thread_lobe, thread_clear);
}

// ============================================================
// BODY — one piece: floor, translucent window wall, thick neck
// with external 3-start thread, tangential inlet barb on a
// stand-off boss. Print upright, supports ONLY under boss+barb.
// ============================================================
neck_id = body_od - 2*neck_wall;   // opening at the top (69 mm)

module body() {
    neck_z = body_h - neck_h - 8;  // where the wall starts thickening inward
    bx = body_id/2 - barb_bore/2;  // barb axis x: bore kisses the inner wall
    difference() {
        union() {
            // wall + floor
            cylinder(d=body_od, h=body_h);
            // stand-off boss, flat face at y=-boss_face_y. Hulled back
            // to a disc fully BURIED in the wall at y=0 (nudged inward
            // so its outer edge stays inside r=body_od/2), so the boss
            // grows out of the wall as one smooth fairing instead of a
            // cylinder whose square back end pokes out of the curve.
            hull() {
                translate([bx, -boss_face_y, inlet_z])
                    rotate([-90,0,0]) cylinder(d=boss_d, h=0.01);
                translate([body_od/2 - boss_d/2 - 0.4, 0, inlet_z])
                    rotate([-90,0,0]) cylinder(d=boss_d, h=0.01);
            }
            // tangential inlet barb, starting at the boss face, pointing -Y
            translate([bx, 0, inlet_z])
                rotate([90,0,0])
                    translate([0,0,boss_face_y]) barb();
            // external 3-start thread on the neck
            translate([0,0,body_h - neck_h]) thread_male(body_od/2);
        }
        // main cavity, full ID up to the neck transition
        translate([0,0,base_t]) cylinder(d=body_id, h=neck_z - base_t);
        // cone transition into the thicker neck
        translate([0,0,neck_z - 0.01]) cylinder(d1=body_id, d2=neck_id, h=5);
        // neck bore
        translate([0,0,neck_z + 4.9]) cylinder(d=neck_id, h=body_h);
        // tangential inlet bore: starts inside the cavity, exits
        // through the near wall, the boss, and the barb
        translate([bx, 0, inlet_z])
            rotate([90,0,0])
                translate([0,0,5]) cylinder(d=barb_bore, h=boss_face_y + barb_len + 2 - 5);
        // thread lead-in chamfer on the rim
        translate([0,0,body_h - 1.2])
            cylinder(d1=neck_id, d2=neck_id + 3.2, h=1.3);
    }
    // interior tube cradle: 3 broken arcs on the floor to locate the
    // test tube's round bottom without blocking the swirl
    for (a=[0,120,240]) rotate([0,0,a+30])
        translate([0,0,base_t]) rotate_extrude(angle=70)
            translate([tube_od/2 + 0.8, 0]) square([3.2, 8]);
}

// ============================================================
// LID — internal 3-start thread, foam-cord face gasket groove,
// outlet barb over a grate, grommet panel seat in the center
// for the 25 mm test tube.
// Print top-face DOWN (barb up) -> threads print clean, only
// the barb needs supports.
// ============================================================
module lid() {
    lid_or = body_od/2 + thread_lobe + thread_clear + lid_wall;
    web_z0 = lid_skirt + 4;                 // grommet web bottom
    difference() {
        union() {
            cylinder(r=lid_or, h=lid_skirt + lid_top_t);
            // grip flutes
            for (a=[0:360/grip_n:359]) rotate([0,0,a])
                translate([lid_or, 0, 0])
                    cylinder(d=4, h=lid_skirt + lid_top_t);
            // outlet barb on top
            translate([0, out_pos, lid_skirt + lid_top_t - 0.01]) barb(root_d=14);
        }
        // thread cavity (skirt)
        thread_female(body_od/2);
        // room above thread for the rim, with the gasket groove in
        // the ceiling that faces the rim
        translate([0,0,neck_h - 0.01])
            cylinder(r=body_od/2 + thread_clear, h=lid_skirt - neck_h);
        // gasket groove (in the ceiling over the rim)
        translate([0,0,lid_skirt - groove_d])
            difference() {
                cylinder(r=rim_mid_r + groove_w/2, h=groove_d + 0.01);
                translate([0,0,-0.5]) cylinder(r=rim_mid_r - groove_w/2, h=groove_d + 1);
            }
        // ---- center: grommet panel seat for the test tube ----
        // lower counterbore (grommet's inner flange, water side)
        translate([0,0,lid_skirt - 0.1]) cylinder(d=grommet_cb_d, h=4 + 0.1);
        // upper counterbore (grommet's outer flange, air side)
        translate([0,0,web_z0 + grommet_web_t])
            cylinder(d=grommet_cb_d, h=lid_top_t); // through the top face
        // grommet panel hole through the web
        translate([0,0,lid_skirt - 0.1])
            cylinder(d=grommet_hole_d, h=lid_top_t + 0.2);
        // ---- outlet: grate slots -> plenum -> bore, one open path ----
        // The ceiling the water touches is z = lid_skirt. The slots cut
        // the thin web from just below it up into the plenum, and the
        // plenum overlaps the bore, so water goes all the way through.
        // (v4.3 bug: slots stopped at z=20.9, plenum began at 23 -> the
        // outlet was capped by 2 mm of solid lid.)
        translate([0, out_pos, lid_skirt + out_web_t])
            cylinder(d=out_grate_d, h=3);
        translate([0, out_pos, lid_skirt + out_web_t + 2])
            cylinder(d=barb_bore, h=lid_top_t + barb_len);
        translate([0, out_pos, lid_skirt - 0.5])
            intersection() {
                cylinder(d=out_grate_d, h=out_web_t + 0.6);
                for (x=[-3.6, 0, 3.6])
                    translate([x - slot_w/2, -out_grate_d/2, 0])
                        cube([slot_w, out_grate_d, out_web_t + 0.6]);
            }
    }
}

// ============================================================
// LED WAND — slides into the dry test tube. Lengthened to 185
// so the strip lights nearly the full submerged depth.
// ============================================================
module led_wand() {
    difference() {
        union() {
            translate([-wand_w/2, 0, 0]) cube([wand_w, wand_len, wand_t]);
            translate([-wand_w/2 - 3, wand_len, 0]) cube([wand_w + 6, 8, wand_t]);
        }
        translate([-strip_w/2, 6, wand_t - strip_d]) cube([strip_w, wand_len - 14, strip_d + 1]);
        translate([-strip_w/2, 6, -1]) cube([strip_w, wand_len - 14, strip_d + 1]);
        translate([-strip_w/2, 2, -1]) cube([strip_w, 3, wand_t + 2]);
        translate([-2, wand_len + 2, -1]) cube([4, 7, wand_t + 2]);
    }
}

// ============================================================
// DIVIDER RING — print 3. Slips over the test tube, glued with
// reef-safe CA gel (or aquarium silicone). Grate openings ~5.5 mm:
// water + light pass, chaeto stays in its level.
// Print flat, no supports.
// ============================================================
module divider_ring() {
    difference() {
        union() {
            // grate disc
            linear_extrude(height=ring_t, convexity=6) difference() {
                circle(d=ring_od);
                difference() {
                    union() {
                        // inner annular slot (hub -> mid ring)
                        difference() {
                            circle(r=mid_ring_r - mid_ring_w/2);
                            circle(d=hub_od);
                        }
                        // outer annular slot (mid ring -> rim)
                        difference() {
                            circle(r=ring_od/2 - rim_w);
                            circle(r=mid_ring_r + mid_ring_w/2);
                        }
                    }
                    // spokes interrupt the slots
                    for (a=[0:360/spoke_n:359]) rotate([0,0,a])
                        translate([0,-spoke_w/2]) square([ring_od/2, spoke_w]);
                }
                // perforation holes down each spoke so light bleeds
                // between levels instead of casting spoke shadows
                for (a=[0:360/spoke_n:359], r=spoke_hole_r)
                    rotate([0,0,a]) translate([r,0]) circle(d=spoke_hole_d);
            }
            // glue collar around the tube
            cylinder(d=hub_od, h=hub_h);
        }
        // tube bore
        translate([0,0,-0.5]) cylinder(d=ring_bore, h=hub_h + 1);
        // 3 vertical glue channels in the bore: somewhere for the CA
        // gel to live + squeeze-out relief, so the ring still seats
        for (a=[0,120,240]) rotate([0,0,a])
            translate([ring_bore/2, 0, -0.5]) cylinder(d=2.4, h=hub_h + 1);
    }
}

// ============================================================
// INTAKE PREFILTER — print 1. Press-fits over the pump intake
// stub. Print upright (floor down): slots are vertical, no
// supports anywhere. If the fit is loose, cinch a zip tie
// around the socket; if juvies still sneak through, wrap the
// cage in 300 um nylon mesh held by rubber bands in the two
// outer grooves.
// ============================================================
module intake_prefilter() {
    sock_z = pf_len + 5;               // where the stub socket bore starts
    difference() {
        union() {
            // slotted cage
            cylinder(d=pf_od, h=pf_len);
            // shoulder cone up to the socket boss
            translate([0,0,pf_len - 0.01])
                cylinder(d1=pf_od, d2=pf_sock_od, h=6);
            // socket boss over the pump stub
            translate([0,0,pf_len])
                cylinder(d=pf_sock_od, h=5 + pf_stub_len);
        }
        // cage interior
        translate([0,0,pf_floor])
            cylinder(d=pf_od - 2*pf_wall, h=pf_len - pf_floor + 0.02);
        // water path through the shoulder into the socket
        translate([0,0,pf_len - 0.02])
            cylinder(d1=pf_od - 2*pf_wall, d2=pf_stub_d - 3, h=5.04);
        // stub socket bore (slip fit; grip ribs added back below)
        translate([0,0,sock_z])
            cylinder(d=pf_stub_d + 0.4, h=pf_stub_len + 1);
        // vertical slots through the wall
        for (a=[0:360/pf_slot_n:359]) rotate([0,0,a])
            translate([pf_od/2 - pf_wall - 1, -pf_slot_w/2, pf_slot_z0])
                cube([pf_wall + 2, pf_slot_w, pf_slot_z1 - pf_slot_z0]);
        // mesh-band grooves (outside the slot band, solid wall there)
        for (zg=[3, pf_len - 5.5])
            translate([0,0,zg]) rotate_extrude(convexity=4)
                translate([pf_od/2 - 0.8, 0]) square([2, 2.5]);
    }
    // 3 vertical crush ribs inside the socket: grip the stub
    for (a=[0,120,240]) rotate([0,0,a])
        translate([pf_stub_d/2 + 0.2 - 0.45, 0, sock_z])
            cylinder(d=1.2, h=pf_stub_len - 1, $fn=16);
}

// ============================================================
// ASSEMBLY (visual) — glass tube shown as a ghost cylinder
// ============================================================
module assembly() {
    color("LightSteelBlue", 0.45) body();
    color("SteelBlue") translate([0,0,body_h - lid_skirt]) lid();
    // purchased test tube: bottom in the cradle, top out the grommet
    color("White", 0.25)
        translate([0,0,base_t + 1]) cylinder(d=tube_od, h=200);
    // 3 divider rings glued to the tube
    color("SeaGreen")
        for (z=ring_z) translate([0,0,z]) divider_ring();
}

// ============================================================
if (part=="body")          body();
else if (part=="lid")      lid();
else if (part=="led_wand") led_wand();
else if (part=="divider_ring") divider_ring();
else if (part=="intake_prefilter") intake_prefilter();
else if (part=="water_cavity") water_cavity();
else assembly();

// ---- diagnostic: water cavity = body interior minus tube displacement ----
module water_cavity() {
    neck_z = body_h - neck_h - 8;
    difference() {
        union() {
            translate([0,0,base_t]) cylinder(d=body_id, h=neck_z - base_t);
            translate([0,0,neck_z - 0.01]) cylinder(d1=body_id, d2=neck_id, h=5);
            translate([0,0,neck_z + 4.9]) cylinder(d=neck_id, h=body_h - (neck_z+4.9));
        }
        translate([0,0,base_t - 1]) cylinder(d=tube_od, h=body_h);
    }
}
