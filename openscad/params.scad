// Chaeto reactor - shared parameters (all dimensions in mm)
// Edit the "purchased parts" block to match what you actually buy,
// then re-export the STLs (see ../Makefile).

$fn = 96;

// ---------- purchased parts ----------
tube_od    = 76.2;     // acrylic tube OD (3")
tube_wall  = 3.175;    // acrylic tube wall (1/8"). MEASURE your tube's real ID.
tube_len   = 190;      // acrylic tube cut length (also the printed body height)
tt_od      = 25;       // test tube OD (rimless 25 x 200 borosilicate)
tt_len     = 200;      // test tube length
hose_id    = 12;       // tubing ID the barbs are sized for (1/2")
rod_d      = 4;        // M4 tie rods

// ---------- derived ----------
tube_id    = tube_od - 2*tube_wall;
plug_od    = tube_id - 0.3;           // slip fit inside the tube
plug_h     = 14;
bore_d     = 62;                      // plenum / outlet cavity diameter
bore_r     = bore_d/2;

// tube-end O-ring (round cord, ID x CS)
oring_cs        = 2.5;
oring_id        = 64;                 // 64 x 2.5 mm
groove_root_r   = tube_id/2 - 0.85*oring_cs;   // ~15% squeeze against the tube ID
groove_w        = oring_cs + 0.7;

// test tube O-ring in the lid column
tt_oring_cs     = 2;                  // 24 x 2 mm
tt_bore_r       = (tt_od + 0.5)/2;
tt_groove_root_r= tt_od/2 + 0.85*tt_oring_cs;
tt_groove_w     = tt_oring_cs + 0.6;

// flanges / tie rods
flange_r   = tube_od/2 + 12;
rod_r      = tube_od/2 + 6;
rod_hole_d = rod_d + 0.5;
rod_angles = [60, 180, 300];
nut_af     = 7;                       // M4 nut across flats
nut_t      = 3.2;

// base
base_h     = 20;                      // flange thickness below tube seat
floor_t    = 5;              // thick floor: the plenum is the wettest part
deck_t     = 4;
deck_od    = tube_id - 0.4;

// lid
screen_t   = 3;
flange_t   = 6;
col_r      = tt_bore_r + 4;
roof_h     = bore_r - col_r;          // 45 deg roof, prints without supports
top_z      = roof_h + 3;
lid_barb_x = 26;

// barbs / holes
barb_len   = 32;
barb_bore  = 8;
hole_d     = 2.5;                     // deck holes (flow in)
screen_hole_d = 2.0;                  // lid screen holes (flow out)

printed_bore_tol = 0.1;               // extra clearance on the printed body ID

// ---------- cam-lock retaining ring (replaces tie rods on the printed tube) ----------
// 3 lugs on the tube top with a spiral-ramped underside, 3 tabs inside the ring.
// Drop the ring on with the tabs in the gaps, turn clockwise: the ramp wedges the ring down and
// compresses the flat lid gasket. The ramp is shallow enough (about 3 deg) to be self-locking;
// there is a 5 deg flat dwell at the stop.
bay_n        = 3;
bay_lug_arc  = 45;
bay_stop_arc = 5;
bay_tab_arc  = 24;
bay_ramp     = 1.5;                         // total ramp height over the lug (about 3 deg incline: self-locking)
bay_catch    = 0;                           // (a detent dip does not work with a rigid 24 deg tab; keep 0)
bay_lug_r0   = tube_od/2 - 0.3;             // lugs start slightly inside the wall
bay_lug_h    = 3.3;                         // 45 deg underside: 3.3 radial = 3.3 tall
bay_lug_str  = 4;                           // straight section above the chamfer
bay_bore_r   = bay_lug_r0 + bay_lug_h + 0.9;    // ring bore clears the lugs by 0.9
bay_tab_in   = tube_od/2 + 0.8;             // tab inner radius (clears the wall by 0.8)
bay_tab_h0   = 1.0;                         // tab thickness at its inner edge
ring_under   = 22;                          // ring bottom to underside of the lip
ring_lip     = 4;                           // thickness of the lip
ring_lip_r   = 34;                          // lip inner radius (clears the outlet barb)
ring_r       = bay_bore_r + 6;
lid_narrow_flange_r = tube_od/2 - 0.5;      // lid flange must fit inside the ring

// flat lid gasket between the tube rim and the lid flange
lg_free      = 2.0;                         // uncompressed thickness
lg_comp      = 1.4;                         // thickness when the ring is locked (30% squeeze)
bay_ring_z0  = flange_t + lg_comp - ring_under;     // ring bottom (relative to tube top) when locked
bay_lug_z0   = bay_ring_z0 + bay_tab_h0 - (bay_tab_in - bay_lug_r0);   // lug underside at the stop, zero gap
bay_lock_rot = 60 + bay_lug_arc/2 - bay_tab_arc/2;  // clockwise turn from the drop-on position to the stop

// ---------- sealing details ----------
moat_w       = 4;                           // sealant moat around the tube's outer corner
moat_d       = 4;
